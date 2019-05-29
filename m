Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 327E02E33D
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 19:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfE2R3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 13:29:22 -0400
Received: from mga09.intel.com ([134.134.136.24]:54330 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbfE2R3V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 13:29:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 10:29:21 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.254.17.80]) ([10.254.17.80])
  by orsmga004.jf.intel.com with ESMTP; 29 May 2019 10:29:20 -0700
Subject: Re: [PATCH v2 11/11] media: aspeed: add a workaround to fix a silicon
 bug
To:     Eddie James <eajames@linux.vnet.ibm.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
 <20190524231725.12320-12-jae.hyun.yoo@linux.intel.com>
 <03a3cf74-3fd3-982e-ec37-014ed4a13b47@linux.vnet.ibm.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <cd1814db-4892-bba0-027a-9f51cd49b9b5@linux.intel.com>
Date:   Wed, 29 May 2019 10:29:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <03a3cf74-3fd3-982e-ec37-014ed4a13b47@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/29/2019 7:07 AM, Eddie James wrote:
> 
> On 5/24/19 6:17 PM, Jae Hyun Yoo wrote:
>> AST2500 silicon revision A1 and A2 have a silicon bug which causes
>> extremly long capturing time on specific resolutions (1680 width).
>> To fix the bug, this commit adjusts the capturing window register
>> setting to 1728 if detected width is 1680. The compression window
>> register setting will be kept as the original width so output
>> result will be the same.
> 
> 
> This is a bit curious, why 1728 in particular? And what is the behavior 
> of the VE when the capture window is larger than the actual source 
> resolution?

For an example, if resolution is 1680x1050, capturing operation takes
very long time because VE has the silicon bug. So this patch adjusts
the 'Capture Window' register slightly larger than 1680 to avoid the
issue. As a result, source buffer will copy 1728x1050 frames from the
original screen buffer but the image is still has valid information.
As the next step in compression phase, it will set the 'Compression
Window' register as '1680x1050' so it will compress using the original
image resolution which is a cropped image from the '1728x1050' source
buffer.

You can compare results using these shell commands in Ubuntu GUI
desktop.

$ xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 1240  1050 
1053 1059 1089 -hsync +vsync
$ xrandr --addmode VGA-1 1680x1050_60.00
$ xrandr --output VGA-1 --mode 1680x1050_60.00

I'm also curious about why that is 1728. Actually, this workaround was
provided from the chip vendor, Aspeed, and they use this in their SDK
code too. Let's check it to Ryan.


Hi Ryan,

Can you please explain why that is 1728 in particular.

Thanks,
Jae

> 
> Thanks,
> 
> Eddie
> 
> 
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>> v1 -> v2:
>>   New.
>>
>>   drivers/media/platform/aspeed-video.c | 26 +++++++++++++++++++-------
>>   1 file changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c 
>> b/drivers/media/platform/aspeed-video.c
>> index b05b073b63bc..f93989f532d6 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -824,8 +824,27 @@ static void aspeed_video_set_resolution(struct 
>> aspeed_video *video)
>>       struct v4l2_bt_timings *act = &video->active_timings;
>>       unsigned int size = act->width * act->height;
>> +    /* Set capture/compression frame sizes */
>>       aspeed_video_calc_compressed_size(video, size);
>> +    if (video->active_timings.width == 1680) {
>> +        /*
>> +         * This is a workaround to fix a silicon bug on A1 and A2
>> +         * revisions. Since it doesn't break capturing operation on A0
>> +         * revision, use it for all revisions without checking the
>> +         * revision ID.
>> +         */
>> +        aspeed_video_write(video, VE_CAP_WINDOW,
>> +                   1728 << 16 | act->height);
>> +        size += (1728 - 1680) * video->active_timings.height;
>> +    } else {
>> +        aspeed_video_write(video, VE_CAP_WINDOW,
>> +                   act->width << 16 | act->height);
>> +    }
>> +    aspeed_video_write(video, VE_COMP_WINDOW,
>> +               act->width << 16 | act->height);
>> +    aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
>> +
>>       /* Don't use direct mode below 1024 x 768 (irqs don't fire) */
>>       if (size < DIRECT_FETCH_THRESHOLD) {
>>           aspeed_video_write(video, VE_TGS_0,
>> @@ -842,13 +861,6 @@ static void aspeed_video_set_resolution(struct 
>> aspeed_video *video)
>>           aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
>>       }
>> -    /* Set capture/compression frame sizes */
>> -    aspeed_video_write(video, VE_CAP_WINDOW,
>> -               act->width << 16 | act->height);
>> -    aspeed_video_write(video, VE_COMP_WINDOW,
>> -               act->width << 16 | act->height);
>> -    aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
>> -
>>       size *= 4;
>>       if (size == video->srcs[0].size / 2) {
> 
> 
