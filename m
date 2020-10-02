Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B080D280DDC
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 09:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgJBHE6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 03:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJBHE5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 03:04:57 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EE2C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 00:04:57 -0700 (PDT)
Received: from [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa] (p200300c7cf13ec00987cfa6c93a91dfa.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6107B29AD54;
        Fri,  2 Oct 2020 08:04:55 +0100 (BST)
Subject: Re: [PATCH v3 09/10] media: rkisp1: cap: simplify the link validation
 by compering the media bus code
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-10-dafna.hirschfeld@collabora.com>
 <20200930190025.GH1516931@oden.dyn.berto.se>
 <20201001020325.GJ5689@pendragon.ideasonboard.com>
 <9724beba-21dc-63b4-5eea-90922b7f1968@collabora.com>
 <20201001224853.GF3722@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <041a7de0-5338-a227-8b3a-bd29d2862f36@collabora.com>
Date:   Fri, 2 Oct 2020 09:04:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001224853.GF3722@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,


Am 02.10.20 um 00:48 schrieb Laurent Pinchart:
> Hi Dafna,
> 
> On Thu, Oct 01, 2020 at 09:36:07PM +0200, Dafna Hirschfeld wrote:
>> Am 01.10.20 um 04:03 schrieb Laurent Pinchart:
>>> On Wed, Sep 30, 2020 at 09:00:25PM +0200, Niklas Söderlund wrote:
>>>> Hi Dafna,
>>>>
>>>> This commit is not just a simplification but a change of behavior.  The
>>>> change is for the better but it broke capture of NV12 and NV21 formats
>>>> in libcamera unexpectedly.
>>>>
>>>> The issue at hand is that libcamera when configuring the pipeline
>>>> retrieves the mbus code for the ISP (rkisp1_isp) source pad (2) and then
>>>> propagates it to the resizer (rkisp_resizer_{main,self}path) sink pad
>>>> (0) and then to the resizers source pad (1). Effectively propagating
>>>> MEDIA_BUS_FMT_YUYV8_2X8 for all formats.
>>>>
>>>> At this point if the video node (main or self) is configured with a
>>>> YUV420 format (NV12, NV21, etc) and with this change applied the link
>>>> validation will fail as MEDIA_BUS_FMT_YUYV8_1_5X8 !=
>>>> MEDIA_BUS_FMT_YUYV8_2X8. Given the nature of how link validation is
>>>> implemented it's VIDIOC_QBUF that returns a -EPIPE when it fails and
>>>> libcamera lockup the capture session.
>>>
>>> I would be very, very surprised is the hardware really used YUYV8_1_5X8.
>>> YUYV8_1X16 is a much more likely bus format between the resizer and the
>>> DMA engine, as well as between the ISP and the resizer.
>>
>> Format YUYV8_1X16 is for downsampling of 4:2:2, but the resizer has the ability
>> to downsample to 4:2:0.
>> I see there is also format YDYUYDYV8_1X16 for 4:2:0
>> maybe this is what I should set?
>>
>> Actually according to the TRM the resizer send the stream to the DMA
>> engine through two separated buses, one for luma and one for chroma.
> 
> In which document is this documented ? Is this two 8-bit buses side by
> side ?

here: https://rockchip.fr/RK3288%20TRM/rk3288-chapter-31-image-signal-processing-(isp).pdf

It is described that there is a splitter component before the
resizer. The diagram shows that those two separate streams are also
sent further to the DMA engine.

> 
> Looking at the registers, the output formats are controlled by the
> global MI_CTRL register, common to both the main and self paths, which
> should correspond to the DMA engine. I think it would make sense to
> model this at the video node level, and hardcode YUYV8_1X16 between the
> resizer and the video node.

Ok, I can change the mbus code. Is there a difference from userspace point of
view? If userspace wants to stream YUV 4:2:0, he should set the pixelformat on
the video node and should only care that the resizer and the video node agree
on the mbus code.

Thanks,
Dafna

> 
>>>> I will submit a fix for this to libcamera to bring it in sync with this
>>>> change.
>>>>
>>>> Would it be possible to ask that future changes to the rkisp1 driver be
>>>> tested with libcamera so we can track and update both the kernel and
>>>> user-space components of this driver at the same time and avoid nasty
>>>> surprises? :-)
>>>
>>> I strongly second this. Drivers that are supported in libcamera should
>>> be tested with libcamera to catch regressions, for any chance submitted
>>> to the kernel.
>>
>> I can run several 'cam' commands with different formats and dimensions to
>> find regressions. I currently have unit test only in v4l-utils.
> 
> That would be great :-) We will work on a test suite for higher-level
> tests (something similar to the Android CTS) at some point, which should
> also help catching regressions.
> 
>>>> On 2020-07-23 15:20:13 +0200, Dafna Hirschfeld wrote:
>>>>> The capture has a mapping of the mbus code needed for each pixelformat.
>>>>> This can be used to simplify the link validation by comparing the mbus
>>>>> code in the capture with the code in the resizer.
>>>>>
>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>> ---
>>>>>    drivers/staging/media/rkisp1/rkisp1-capture.c | 18 ++++--------------
>>>>>    1 file changed, 4 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>>> index 4dabd07a3da9..a5e2521577dd 100644
>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>>> @@ -1255,22 +1255,11 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>>>>>    	struct v4l2_subdev *sd =
>>>>>    		media_entity_to_v4l2_subdev(link->source->entity);
>>>>>    	struct rkisp1_capture *cap = video_get_drvdata(vdev);
>>>>> -	struct rkisp1_isp *isp = &cap->rkisp1->isp;
>>>>> -	u8 isp_pix_enc = isp->src_fmt->pixel_enc;
>>>>> -	u8 cap_pix_enc = cap->pix.info->pixel_enc;
>>>>> +	const struct rkisp1_capture_fmt_cfg *fmt =
>>>>> +		rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
>>>>>    	struct v4l2_subdev_format sd_fmt;
>>>>>    	int ret;
>>>>>    
>>>>> -	if (cap_pix_enc != isp_pix_enc &&
>>>>> -	    !(isp_pix_enc == V4L2_PIXEL_ENC_YUV &&
>>>>> -	      cap_pix_enc == V4L2_PIXEL_ENC_RGB)) {
>>>>> -		dev_err(cap->rkisp1->dev,
>>>>> -			"format type mismatch in link '%s:%d->%s:%d'\n",
>>>>> -			link->source->entity->name, link->source->index,
>>>>> -			link->sink->entity->name, link->sink->index);
>>>>> -		return -EPIPE;
>>>>> -	}
>>>>> -
>>>>>    	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>>>    	sd_fmt.pad = link->source->index;
>>>>>    	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
>>>>> @@ -1278,7 +1267,8 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>>>>>    		return ret;
>>>>>    
>>>>>    	if (sd_fmt.format.height != cap->pix.fmt.height ||
>>>>> -	    sd_fmt.format.width != cap->pix.fmt.width)
>>>>> +	    sd_fmt.format.width != cap->pix.fmt.width ||
>>>>> +	    sd_fmt.format.code != fmt->mbus)
>>>>>    		return -EPIPE;
>>>>>    
>>>>>    	return 0;
> 
