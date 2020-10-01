Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BFE2807D4
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 21:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732864AbgJATgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 15:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729990AbgJATgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 15:36:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F498C0613D0
        for <linux-media@vger.kernel.org>; Thu,  1 Oct 2020 12:36:15 -0700 (PDT)
Received: from [IPv6:2003:c7:cf13:ec00:ede2:3562:961a:3b51] (p200300c7cf13ec00ede23562961a3b51.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:ede2:3562:961a:3b51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 59F3D29D70C;
        Thu,  1 Oct 2020 20:36:13 +0100 (BST)
Subject: Re: [PATCH v3 09/10] media: rkisp1: cap: simplify the link validation
 by compering the media bus code
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-10-dafna.hirschfeld@collabora.com>
 <20200930190025.GH1516931@oden.dyn.berto.se>
 <20201001020325.GJ5689@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <9724beba-21dc-63b4-5eea-90922b7f1968@collabora.com>
Date:   Thu, 1 Oct 2020 21:36:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001020325.GJ5689@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 01.10.20 um 04:03 schrieb Laurent Pinchart:
> Hello,
> 
> On Wed, Sep 30, 2020 at 09:00:25PM +0200, Niklas Söderlund wrote:
>> Hi Dafna,
>>
>> This commit is not just a simplification but a change of behavior.  The
>> change is for the better but it broke capture of NV12 and NV21 formats
>> in libcamera unexpectedly.
>>
>> The issue at hand is that libcamera when configuring the pipeline
>> retrieves the mbus code for the ISP (rkisp1_isp) source pad (2) and then
>> propagates it to the resizer (rkisp_resizer_{main,self}path) sink pad
>> (0) and then to the resizers source pad (1). Effectively propagating
>> MEDIA_BUS_FMT_YUYV8_2X8 for all formats.
>>
>> At this point if the video node (main or self) is configured with a
>> YUV420 format (NV12, NV21, etc) and with this change applied the link
>> validation will fail as MEDIA_BUS_FMT_YUYV8_1_5X8 !=
>> MEDIA_BUS_FMT_YUYV8_2X8. Given the nature of how link validation is
>> implemented it's VIDIOC_QBUF that returns a -EPIPE when it fails and
>> libcamera lockup the capture session.
> 
> I would be very, very surprised is the hardware really used YUYV8_1_5X8.
> YUYV8_1X16 is a much more likely bus format between the resizer and the
> DMA engine, as well as between the ISP and the resizer.

Format YUYV8_1X16 is for downsampling of 4:2:2, but the resizer has the ability
to downsample to 4:2:0.
I see there is also format YDYUYDYV8_1X16 for 4:2:0
maybe this is what I should set?

Actually according to the TRM the resizer send the stream to the DMA
engine through two separated buses, one for luma and one for chroma.

> 
>> I will submit a fix for this to libcamera to bring it in sync with this
>> change.
>>
>> Would it be possible to ask that future changes to the rkisp1 driver be
>> tested with libcamera so we can track and update both the kernel and
>> user-space components of this driver at the same time and avoid nasty
>> surprises? :-)
> 
> I strongly second this. Drivers that are supported in libcamera should
> be tested with libcamera to catch regressions, for any chance submitted
> to the kernel.

I can run several 'cam' commands with different formats and dimensions to
find regressions. I currently have unit test only in v4l-utils.

Thanks,
Dafna

> 
>> On 2020-07-23 15:20:13 +0200, Dafna Hirschfeld wrote:
>>> The capture has a mapping of the mbus code needed for each pixelformat.
>>> This can be used to simplify the link validation by comparing the mbus
>>> code in the capture with the code in the resizer.
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 18 ++++--------------
>>>   1 file changed, 4 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> index 4dabd07a3da9..a5e2521577dd 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> @@ -1255,22 +1255,11 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>>>   	struct v4l2_subdev *sd =
>>>   		media_entity_to_v4l2_subdev(link->source->entity);
>>>   	struct rkisp1_capture *cap = video_get_drvdata(vdev);
>>> -	struct rkisp1_isp *isp = &cap->rkisp1->isp;
>>> -	u8 isp_pix_enc = isp->src_fmt->pixel_enc;
>>> -	u8 cap_pix_enc = cap->pix.info->pixel_enc;
>>> +	const struct rkisp1_capture_fmt_cfg *fmt =
>>> +		rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
>>>   	struct v4l2_subdev_format sd_fmt;
>>>   	int ret;
>>>   
>>> -	if (cap_pix_enc != isp_pix_enc &&
>>> -	    !(isp_pix_enc == V4L2_PIXEL_ENC_YUV &&
>>> -	      cap_pix_enc == V4L2_PIXEL_ENC_RGB)) {
>>> -		dev_err(cap->rkisp1->dev,
>>> -			"format type mismatch in link '%s:%d->%s:%d'\n",
>>> -			link->source->entity->name, link->source->index,
>>> -			link->sink->entity->name, link->sink->index);
>>> -		return -EPIPE;
>>> -	}
>>> -
>>>   	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>   	sd_fmt.pad = link->source->index;
>>>   	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
>>> @@ -1278,7 +1267,8 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>>>   		return ret;
>>>   
>>>   	if (sd_fmt.format.height != cap->pix.fmt.height ||
>>> -	    sd_fmt.format.width != cap->pix.fmt.width)
>>> +	    sd_fmt.format.width != cap->pix.fmt.width ||
>>> +	    sd_fmt.format.code != fmt->mbus)
>>>   		return -EPIPE;
>>>   
>>>   	return 0;
> 
