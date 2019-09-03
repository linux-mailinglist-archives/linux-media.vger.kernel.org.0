Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9184A6190
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 08:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfICGgE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 02:36:04 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39133 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725878AbfICGgE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Sep 2019 02:36:04 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 52Q2iFExixNy052Q6ic8nA; Tue, 03 Sep 2019 08:36:02 +0200
Subject: Re: hdpvr.ko kernel 5.3-rc6
To:     Scott Doty <scott@ponzo.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <7530b881-c7d0-74fd-dfeb-5e001d8b2266@ponzo.net>
 <5a6ab1fe-9776-961d-970b-5b3dbea12da1@xs4all.nl>
 <839e8ded-dfe5-9fc9-1573-2d64aa547e1c@ponzo.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <00b89589-5558-f8a1-3fb7-c631002e11bd@xs4all.nl>
Date:   Tue, 3 Sep 2019 08:35:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <839e8ded-dfe5-9fc9-1573-2d64aa547e1c@ponzo.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGqT8JT7rzwhgV69fK/YSwMn/zimsUd8hZdwFfaltFQ/Ctcwkmsrq8QNJ1ShtFDUKqwT9YuE4F7Bnvk4q8XwjX0VLkHBuVGIgNVEsNX36z61Mn1eXY2O
 9jQKD4q+96Fkc+9TpPIJr0+NGCMfq7Q/LmRaeCv5ZcJnGashn3mQZ4FugZYDTCaa4EzJUYy3c8udxQzLCpqLcnidAn1C4s3y/EA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/3/19 5:45 AM, Scott Doty wrote:
> On 9/2/19 12:31 AM, Hans Verkuil wrote:
>> Hi Scott,
> 
> Hi Hans!  Thank you for the speedy reply. :)
> 
>> The only non-trivial change in hdpvr in 5.3 is this commit:
>>
>> commit 6bc5a4a1927556ff9adce1aa95ea408c95453225
>> Author: Hans Verkuil <hverkuil@xs4all.nl>
>> Date:   Thu Jun 20 07:43:41 2019 -0400
>>
>>     media: hdpvr: fix locking and a missing msleep
>>
>> Try reverting it and see if it makes a difference.
> 
> I should mention that I haven't tried this driver for over a year,
> so it's not just the change to 5.3 that we would be talking about.
> 
> Tried reverting the commit and built Linux 5.3-rc7+ -- alas, it didn't
> change anything.
> 
>>
>> Also test with 'v4l2-ctl -d /dev/videoX --stream-mmap' and see if it
>> keeps streaming buffers or if it also stalls.
> 
> That doesn't seem to work:
> 
> $ v4l2-ctl -d /dev/video2 --stream-mmap
> New timings found
> VIDIOC_REQBUFS: failed: Inappropriate ioctl for device

That's weird. I'll dig out my hdpvr later this week and test as well.

> 
> I suspect I might have to do a git bisect to find where the problem started.

That would certainly help.

Regards,

	Hans
