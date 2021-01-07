Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32992ED2FD
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 15:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbhAGOrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 09:47:46 -0500
Received: from impout003aa.msg.chrl.nc.charter.net ([47.43.20.27]:52107 "EHLO
        impout003.msg.chrl.nc.charter.net" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725965AbhAGOrq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 09:47:46 -0500
Received: from voodoo.tomdaley.org ([47.5.104.88])
        by cmsmtp with ESMTPA
        id xWZ5kd9Frr76UxWZ5k7y62; Thu, 07 Jan 2021 14:47:04 +0000
Authentication-Results: tomdaley.org; none
X-Authority-Analysis: v=2.3 cv=dotv9Go4 c=1 sm=1 tr=0
 a=Uohp5j5pIXpt+qzAizrV8Q==:117 a=Uohp5j5pIXpt+qzAizrV8Q==:17
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=EmqxpYm9HcoA:10 a=7zKikSB_AAAA:8
 a=VwQbUJbxAAAA:8 a=xq3W2uTSAAAA:8 a=EDLF81dCAAAA:8 a=6ir5WShY_YkCChFZm6wA:9
 a=CjuIK1q_8ugA:10 a=fenj-cUWjmncKvz_9n8k:22 a=AjGcO6oz07-iQ99wixmX:22
 a=P5L7wpMTXyg1GfFA3Gwx:22 a=Q3gGPzbJhzamX8w4ir7p:22
Received: from localhost ([::1] helo=webmail.tomdaley.org)
        by voodoo.tomdaley.org with esmtpa (Exim 4.92)
        (envelope-from <tom@tomdaley.org>)
        id 1kxWZ4-0000zy-V5; Thu, 07 Jan 2021 07:47:02 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 07 Jan 2021 07:47:02 -0700
From:   tom@tomdaley.org
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: lirc serial_ir homebrew breakage
In-Reply-To: <20210107102557.GA16279@gofer.mess.org>
References: <4d2b514731852e392be29048ff2e2cf3@tomdaley.org>
 <20210107102557.GA16279@gofer.mess.org>
Message-ID: <3449ade8bbd996a34b2b73f57cd2757b@tomdaley.org>
X-Sender: tom@tomdaley.org
User-Agent: Roundcube Webmail/1.3.16
X-CMAE-Envelope: MS4wfIIuh6GOFu5NGk5RyfromnmQAc7O7DqWKRRXd/icMwUwjfD2mMe87UghEoA7n3gzophE75McetKWvbsxA6gJ28PcwjJMcP9xG/LNm373A8OJl2pJJGOE
 cwuK5ELY3fuGJ54rcQbxnIJnTfGEHWblgd/krDedVO14W5kganPzf3FmhBDysMvjewEFgGEZxzvS66uyo5oXy+BdcK6m/WB07cw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-01-07 03:25, Sean Young wrote:
> Hi Tom,
> 
> On Wed, Jan 06, 2021 at 09:16:31AM -0700, tom@tomdaley.org wrote:
>> Hi,
>> 
>> An upgrade from linux-5.9.16 to linux-5.10.4 results in lirc not 
>> working
>> with my homebrew IR receiver.  Running mode2 and pressing the same 
>> button on
>> the IR remote shows timing differences:
>> 
>> 5.9.16 works, first few lines of output:
>> 
>> pulse 2676
>> space 371
>> pulse 1429
>> space 371
>> pulse 827
>> space 372
>> pulse 1426
>> space 372
>> pulse 1425
>> space 376
>> pulse 1424
>> space 374
>> 
>> 5.10.4 fail
>> pulse 2670
>> space 380
>> pulse 1428
>> space 372
>> pulse 827
>> pulse 125391  <---
>> space 127128  <---
>> pulse 1406
>> space 394
>> pulse 1407
>> pulse 125394  <---
>> space 126726  <---
>> pulse 1400
>> space 398
>> pulse 1406
>> space 394
>> pulse 801
>> 
>> The reporting of two pulses in a row as well as the large time 
>> reported make
>> it so the button presses are not recognized.
>> 
>> Is this a known issue?
> 
> No, this is not known issue.
> 
>> I am a software developer and would be happy to help in any way.  I 
>> can
>> gather more data or attempt to fix it myself.
> 
> Thanks for your bug report. In 5.10, there was a change which converted
> the processing from nanoseconds to microsecondes, see:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=528222d853f9283110f0118dd71d9f0ad686d586
> 
> One issue has already been found in this change, which hasn't been 
> upstreamed
> yet:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20210105093023.5212-1-hias@horus.com/
> 
> Would you mind testing this patch out please?
> 
> Admittedly I'm not convinced that this is the problem though. I'm not 
> sure
> what is; the function frbwrite() contains two if statements to filter 
> out
> noise, maybe something is wrong there. You could try by commenting 
> those
> two if statements out and see if there is a problem there.
> 
> Your help is appreciated!
> 
> Thanks,
> 
> Sean

Hi Sean,

The patch fixes the problem I was seeing.  I have tested both receive 
and transmit on my homebrew IR, both are working.

Thanks, Tom

