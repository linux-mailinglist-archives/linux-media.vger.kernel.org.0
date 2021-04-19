Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1E436420B
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 14:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239104AbhDSMuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 08:50:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47390 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233302AbhDSMuh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 08:50:37 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 049AC499;
        Mon, 19 Apr 2021 14:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618836606;
        bh=jTNGOCsR3aMDUoIhPFDh+NdDGMobANVegbj0xW4w1SE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=D0kIrYu5HQfmejS7VPPbrlh/3V59jsh51MFiIKx6yi2zTIgN5V3DBPw28/eBrWJU+
         0auqIaOPkP6ujA+JTUUbptorGJlDTaClevqUDEfR2bhc4HjT61+0uWr8VpjghKT6BO
         T5Ff81hJVCaYySo89PWdn3Z7Jtr8mydtu8ZQe2k0=
Subject: Re: [PATCH 24/28] media: ti-vpe: cal: add mbus_code support to
 cal_mc_enum_fmt_vid_cap
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-25-tomi.valkeinen@ideasonboard.com>
 <YHwxasJRMDprsHpx@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <2e56b7ff-071c-521d-51b7-57fb2f3cb908@ideasonboard.com>
Date:   Mon, 19 Apr 2021 15:50:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwxasJRMDprsHpx@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 16:17, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:53PM +0300, Tomi Valkeinen wrote:
>> Commit e5b6b07a1b45dd9d19bec1fa1d60750b0fcf2fb0 ("media: v4l2: Extend
> 
> You can abbreviate that to 12 characters if desired.
> 
>> VIDIOC_ENUM_FMT to support MC-centric devices") added support to
>> enumerate formats based in mbus-code.
>>
>> Add this feature to cal driver.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal-video.c | 21 ++++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
>> index ea9b13c16a06..1d9c0fce4b03 100644
>> --- a/drivers/media/platform/ti-vpe/cal-video.c
>> +++ b/drivers/media/platform/ti-vpe/cal-video.c
>> @@ -437,13 +437,28 @@ static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
>>   static int cal_mc_enum_fmt_vid_cap(struct file *file, void  *priv,
>>   				   struct v4l2_fmtdesc *f)
>>   {
>> +	unsigned int i;
>> +	unsigned int idx;
>> +
>>   	if (f->index >= cal_num_formats)
>>   		return -EINVAL;
>>   
>> -	f->pixelformat = cal_formats[f->index].fourcc;
>> -	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> 
> As a shortcut, you could have
> 
> 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> 
> 	if (!f->mbus_code) {
> 		f->pixelformat = cal_formats[f->index].fourcc;
> 		return 0;
> 	}
> 
>> +	idx = 0;
>>   
>> -	return 0;
>> +	for (i = 0; i < cal_num_formats; ++i) {
>> +		if (f->mbus_code && cal_formats[i].code != f->mbus_code)
> 
> And drop the first condition here, as well as f->type below. Up to you.

True, but in a patch that adds metadata support (not posted) I add also 
metadata formats into the cal_formats array, and I need to iterate and 
skip the possible metadata-formats even for !f->mbus_code case.

I'm not sure if that approach is good or not (I also tried separate 
metadata format array but that just caused mess elsewhere), but for the 
time being I'd rather keep this as it is to easily allow adding the 
metadata formats.

  Tomi
