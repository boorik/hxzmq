/**
 * (c) 2011 Richard J Smith
 *
 * This file is part of hxzmq
 *
 * hxzmq is free software; you can redistribute it and/or modify it under
 * the terms of the Lesser GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * hxzmq is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * Lesser GNU General Public License for more details.
 *
 * You should have received a copy of the Lesser GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package org.zeromq.test;

import org.zeromq.ZMQ;
import org.zeromq.ZMQException;

class TestError extends BaseTest
{

	public function testStrError() {
		
		var iter = new IntIter(1, 10);
		for (i in iter) {
			var s = ZMQ.strError(i);
			assertTrue(Std.is(s, String));
		}
	}
	
	public function testZMQException() {
		
		var e:ZMQException = new ZMQException(EINVAL);
		assertTrue(e.errNo == ZMQ.errorTypeToErrNo(EINVAL));
		assertTrue(e.str() == ZMQ.strError(ZMQ.errorTypeToErrNo(EINVAL)));
		
		assertTrue(ZMQ.errNoToErrorType(ZMQ.errorTypeToErrNo(EINVAL)) == EINVAL);
		
	}
	public override function setup():Void {
		// No setup needed for these tests
	}
	
	public override function tearDown():Void {
		// No tearDown needed for these tests
	}
	
}