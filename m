Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C41974CCF3
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 13:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730596AbfFTLde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 07:33:34 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45903 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726404AbfFTLde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 07:33:34 -0400
Received: from [IPv6:2001:983:e9a7:1:4588:eede:a2a7:f8e] ([IPv6:2001:983:e9a7:1:4588:eede:a2a7:f8e])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dvJrha3pTSfvXdvJthud75; Thu, 20 Jun 2019 13:33:33 +0200
Subject: Re: hdpvr mutex deadlock on kernel 5.1.x
To:     Keith Pyle <kpyle@austin.rr.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <14d31c83-f48f-319d-6b3a-0753ea9d2c02@austin.rr.com>
 <8e18508d-7c36-ead7-4c92-7335813895d0@xs4all.nl>
 <1aa17133-342a-45e3-453d-896a1062ea21@austin.rr.com>
 <857b40ad-d474-5a4c-e65b-99035fa1a50b@xs4all.nl>
 <15f3c149-4597-2f45-06af-a668db4c694b@austin.rr.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1c20ac29-d1d7-42b5-ad44-ae505be3ea3b@xs4all.nl>
Date:   Thu, 20 Jun 2019 13:33:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <15f3c149-4597-2f45-06af-a668db4c694b@austin.rr.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFoKpJIgyjZHbiK53XlKaJFOKPEmSuf2DRjbiRqkiaUceb/vkgcx/A8xMHdRcp+u5H0qD37Mme36gcQt2lW0noZdLNtySwltyT3lb2B8d3aBabO0d260
 zge0cOg4H29o4ZK49dz5jY6Z2vHB4y837qLyrN70pMzYly4ucCpgb8X7AtvQB/qyGu6cKInTfrhLshAIhEbrQEX5WXhXRdUqGyvY7pgN+wt7FUelBT7s5m9Q
 kXTwusjRXqLaw5+CAX/iApxi0LaoNRNe5uLTHu3W87RqrSOMvAuT8TPRvQTzUekhUkWaG6qvcmZuUaV7HcJZpw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/19/19 4:29 AM, Keith Pyle wrote:
> On 06/18/19 02:16, Hans Verkuil wrote:
>> Hi Keith,
>>
>> On 6/18/19 6:17 AM, Keith Pyle wrote:
>>> We made the suggested change, compiled, installed, and rebooted. There was some progress - test 2 (turning the HD-PVR off) no longer produces a splat.  Test 1 (start capture) and test 3 (run capture
>>> and trigger HD-PVR to stop streaming) both still produce a traceback (see below).  Test 3 also still results in the unkillable process.
>> Try the following patch. Test 2 was caused by locking when it shouldn't, test 3 was caused by not
>> locking when it should :-) and I think test 1 was caused by locking when it is not allowed.
>>
>> Let me know if this works!
>>
>> Regards,
>>
>>     Hans
> Good news!  With these patches, lockdep does not report any of the prior problems and the capture process does not deadlock for my test3.
> 
> There is one item I noted: hdpvr_read has the line
> 
> msec_to_jiffies(4000);

Oops!

> 
> that doesn't really do anything.  This should be a 4 second sleep, based on our discussion back in 2014 (https://www.mail-archive.com/linux-media@vger.kernel.org/msg75163.html), since the restart will
> certainly fail unless the HD-PVR is given at least 3 seconds to reset after the stop.

I think a msleep(4000) at that point is solving only one use-case. I assume
the same problem will occur if you read() from the video device, then close()
it, re-open it and read() again, all within 4 seconds.

The real fix would be to store a timestamp (jiffies) when you stop streaming,
and in start_streaming check if there are less than 4 seconds between the last
stop and new start, and then sleep until 4 seconds have passed.

Is this something you can work on and provide a patch?

For now I'll post a patch fixing the deadlocks etc. so you can develop your
patch for this on top.

Regards,

	Hans
