Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7404D4DF31
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2019 04:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfFUCur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 22:50:47 -0400
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.230]:38641 "EHLO
        cdptpa-cmomta03.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725911AbfFUCur (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 22:50:47 -0400
Received: from [192.168.2.97] ([72.182.16.184])
        by cmsmtp with ESMTP
        id e9dThjSeVNkgMe9dVhoaPW; Fri, 21 Jun 2019 02:50:45 +0000
Subject: Re: hdpvr mutex deadlock on kernel 5.1.x
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <14d31c83-f48f-319d-6b3a-0753ea9d2c02@austin.rr.com>
 <8e18508d-7c36-ead7-4c92-7335813895d0@xs4all.nl>
 <1aa17133-342a-45e3-453d-896a1062ea21@austin.rr.com>
 <857b40ad-d474-5a4c-e65b-99035fa1a50b@xs4all.nl>
 <15f3c149-4597-2f45-06af-a668db4c694b@austin.rr.com>
 <1c20ac29-d1d7-42b5-ad44-ae505be3ea3b@xs4all.nl>
From:   Keith Pyle <kpyle@austin.rr.com>
Message-ID: <5b031481-c751-c1d5-d65b-5a3d1d964c14@austin.rr.com>
Date:   Thu, 20 Jun 2019 21:50:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <1c20ac29-d1d7-42b5-ad44-ae505be3ea3b@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfDm4VdolWY9+MBY8R7gCi2fGAfkd3Y42M0H/e1+crLdOiRyl5g/fzkyCy02dvCcTmVwKSGin4wthThvkPujmK31vdPVYyyob2DQAm8fvhMSuQ/JUXOkL
 TmGegeJi65MXc+x3xB42p/gUcoUQ5c9OUNMgIMMUhKSEFzvO9jueFvXny9Jy4UhTxJ/j06Ac/On0UvUBiT2HvX1ZI3Fq/arL8Uc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/20/19 06:33, Hans Verkuil wrote:
> On 6/19/19 4:29 AM, Keith Pyle wrote:
>> On 06/18/19 02:16, Hans Verkuil wrote:
>>> Hi Keith,
>>>
>>> On 6/18/19 6:17 AM, Keith Pyle wrote:
>>>> We made the suggested change, compiled, installed, and rebooted. There was some progress - test 2 (turning the HD-PVR off) no longer produces a splat.  Test 1 (start capture) and test 3 (run capture
>>>> and trigger HD-PVR to stop streaming) both still produce a traceback (see below).  Test 3 also still results in the unkillable process.
>>> Try the following patch. Test 2 was caused by locking when it shouldn't, test 3 was caused by not
>>> locking when it should :-) and I think test 1 was caused by locking when it is not allowed.
>>>
>>> Let me know if this works!
>>>
>>> Regards,
>>>
>>>      Hans
>> Good news!  With these patches, lockdep does not report any of the prior problems and the capture process does not deadlock for my test3.
>>
>> There is one item I noted: hdpvr_read has the line
>>
>> msec_to_jiffies(4000);
> Oops!
>
>> that doesn't really do anything.  This should be a 4 second sleep, based on our discussion back in 2014 (https://www.mail-archive.com/linux-media@vger.kernel.org/msg75163.html), since the restart will
>> certainly fail unless the HD-PVR is given at least 3 seconds to reset after the stop.
> I think a msleep(4000) at that point is solving only one use-case. I assume
> the same problem will occur if you read() from the video device, then close()
> it, re-open it and read() again, all within 4 seconds.
>
> The real fix would be to store a timestamp (jiffies) when you stop streaming,
> and in start_streaming check if there are less than 4 seconds between the last
> stop and new start, and then sleep until 4 seconds have passed.
>
> Is this something you can work on and provide a patch?
>
> For now I'll post a patch fixing the deadlocks etc. so you can develop your
> patch for this on top.
>
> Regards,
>
> 	Hans
>
I agree with your analysis that it would be better to have every 
start_streaming make the check and sleep if needed.  Yes, I can work on it.

Keith

