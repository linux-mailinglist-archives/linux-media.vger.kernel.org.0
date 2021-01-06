Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8824C2EC10C
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 17:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbhAFQWT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 11:22:19 -0500
Received: from impout004aa.msg.chrl.nc.charter.net ([47.43.20.28]:43882 "EHLO
        impout004.msg.chrl.nc.charter.net" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727022AbhAFQWS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Jan 2021 11:22:18 -0500
X-Greylist: delayed 305 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Jan 2021 11:22:18 EST
Received: from voodoo.tomdaley.org ([47.5.104.88])
        by cmsmtp with ESMTPA
        id xBU7kEIBBxxx6xBU8kjsk7; Wed, 06 Jan 2021 16:16:32 +0000
Authentication-Results: tomdaley.org; none
X-Authority-Analysis: v=2.3 cv=TK7xtGta c=1 sm=1 tr=0
 a=Uohp5j5pIXpt+qzAizrV8Q==:117 a=Uohp5j5pIXpt+qzAizrV8Q==:17
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=EmqxpYm9HcoA:10
 a=gwqHzDkt3I5nPAiPXjoA:9 a=CjuIK1q_8ugA:10
Received: from localhost ([::1] helo=webmail.tomdaley.org)
        by voodoo.tomdaley.org with esmtpa (Exim 4.92)
        (envelope-from <tom@tomdaley.org>)
        id 1kxBU7-0007Xn-40; Wed, 06 Jan 2021 09:16:31 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 06 Jan 2021 09:16:31 -0700
From:   tom@tomdaley.org
To:     linux-media@vger.kernel.org
Cc:     sean@mess.org
Subject: lirc serial_ir homebrew breakage
Message-ID: <4d2b514731852e392be29048ff2e2cf3@tomdaley.org>
X-Sender: tom@tomdaley.org
User-Agent: Roundcube Webmail/1.3.16
X-CMAE-Envelope: MS4wfK/JYUxbeNZgNdZkxByh9yndv+WWGJuGaYP42fsCWMGk9rXLPo53QbtGn6ha6x+Pn3yHNK1MMrrbFteDKJ+QcCLIcPNozudz7mkWTciEtxty9mI2N02r
 FRaFMEmz14HdRq0fi3zEvJ/blXjdDxvUTihXvWLWA8jKB+1zjBzhaUlmMOo+l033Qv4ou3SpPCoEkB4gKiUJK+PdMMIVomkh+sQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

An upgrade from linux-5.9.16 to linux-5.10.4 results in lirc not working 
with my homebrew IR receiver.  Running mode2 and pressing the same 
button on the IR remote shows timing differences:

5.9.16 works, first few lines of output:

pulse 2676
space 371
pulse 1429
space 371
pulse 827
space 372
pulse 1426
space 372
pulse 1425
space 376
pulse 1424
space 374

5.10.4 fail
pulse 2670
space 380
pulse 1428
space 372
pulse 827
pulse 125391  <---
space 127128  <---
pulse 1406
space 394
pulse 1407
pulse 125394  <---
space 126726  <---
pulse 1400
space 398
pulse 1406
space 394
pulse 801

The reporting of two pulses in a row as well as the large time reported 
make it so the button presses are not recognized.

Is this a known issue?
I am a software developer and would be happy to help in any way.  I can 
gather more data or attempt to fix it myself.

Thanks, Tom Daley


