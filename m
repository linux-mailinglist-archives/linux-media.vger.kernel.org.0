Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9608A1F1D73
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 18:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbgFHQe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 12:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730383AbgFHQe5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 12:34:57 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 858F9C08C5C2
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 09:34:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 14A4E2A0A5F
Subject: Re: [RFC v4 7/8] media: vivid: Add support to the CSC API
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de
References: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
 <20200605172625.19777-8-dafna.hirschfeld@collabora.com>
 <faedc5f3-d872-ef5c-b503-26de899be09e@xs4all.nl>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <096f746c-2470-e591-2e79-d3dd21c943f6@collabora.com>
Date:   Mon, 8 Jun 2020 18:34:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <faedc5f3-d872-ef5c-b503-26de899be09e@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 08.06.20 12:10, Hans Verkuil wrote:
> On 05/06/2020 19:26, Dafna Hirschfeld wrote:
>> The CSC API (Colorspace conversion) allows userspace to try
>> to configure the ycbcr/hsv_enc function and the quantization
>> for capture devices. This patch adds support to the CSC API
>> in vivid.
>> Using the CSC API, userspace is allowed to do the following:
>>
>> 1. Set the ycbcr_enc function for YUV formats.
>> 2. Set the hsv_enc function for HSV formats
>> 3. Set the quantization for YUV and RGB formats.
> 
> I just realized something. We excluded colorspace and xfer_func from the CSC API
> for now since there are no drivers that support those conversions. But actually,
> that's not true since vivid *does* support this unless it is in loopback mode
> (then no CSC conversion is supported).

But shouldn't there be at least one real hardware device that support it in order
to justify it in the API?

Thanks,
Dafna

> 
> So if dev->loop_video is true, then disable CSC conversion in vivid.
> 
> Otherwise CSC can be fully enabled for all four colorimetry fields.
> 
> So I think we should add flags to signal this for colorspace and xfer_func as well
> and implement this in vivid.
> 
> Sorry about this, I should have realized this (much) earlier.
> 
> Regards,
> 
> 	Hans
> 
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   .../media/test-drivers/vivid/vivid-vid-cap.c  | 49 +++++++++++++++++--
>>   .../test-drivers/vivid/vivid-vid-common.c     | 20 ++++++++
>>   2 files changed, 65 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> index e94beef008c8..8a43d7ebe53f 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> @@ -549,6 +549,29 @@ int vivid_g_fmt_vid_cap(struct file *file, void *priv,
>>   	return 0;
>>   }
>>   
>> +static bool vivid_is_hsv_enc_valid(__u8 hsv_enc)
>> +{
>> +	if (hsv_enc == V4L2_HSV_ENC_180 || hsv_enc == V4L2_HSV_ENC_256)
>> +		return true;
>> +	return false;
>> +}
>> +
>> +static bool vivid_is_ycbcr_enc_valid(__u8 ycbcr_enc)
>> +{
>> +	/* V4L2_YCBCR_ENC_SMPTE240M is the last ycbcr_enc enum */
>> +	if (ycbcr_enc && ycbcr_enc <= V4L2_YCBCR_ENC_SMPTE240M)
>> +		return true;
>> +	return false;
>> +}
>> +
>> +static bool vivid_is_quant_valid(__u8 quantization)
>> +{
>> +	if (quantization == V4L2_QUANTIZATION_FULL_RANGE ||
>> +	    quantization == V4L2_QUANTIZATION_LIM_RANGE)
>> +		return true;
>> +	return false;
>> +}
>> +
>>   int vivid_try_fmt_vid_cap(struct file *file, void *priv,
>>   			struct v4l2_format *f)
>>   {
>> @@ -560,6 +583,7 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
>>   	unsigned factor = 1;
>>   	unsigned w, h;
>>   	unsigned p;
>> +	bool user_set_csc = !!(mp->flags & V4L2_PIX_FMT_FLAG_SET_CSC);
>>   
>>   	fmt = vivid_get_format(dev, mp->pixelformat);
>>   	if (!fmt) {
>> @@ -634,12 +658,23 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
>>   			(fmt->bit_depth[0] / fmt->vdownsampling[0]);
>>   
>>   	mp->colorspace = vivid_colorspace_cap(dev);
>> -	if (fmt->color_enc == TGP_COLOR_ENC_HSV)
>> -		mp->hsv_enc = vivid_hsv_enc_cap(dev);
>> -	else
>> +	if (fmt->color_enc == TGP_COLOR_ENC_HSV) {
>> +		if (!user_set_csc || !vivid_is_hsv_enc_valid(mp->hsv_enc))
>> +			mp->hsv_enc = vivid_hsv_enc_cap(dev);
>> +	} else if (fmt->color_enc == TGP_COLOR_ENC_YCBCR) {
>> +		if (!user_set_csc || !vivid_is_ycbcr_enc_valid(mp->ycbcr_enc))
>> +			mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
>> +	} else {
>>   		mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
>> +	}
>>   	mp->xfer_func = vivid_xfer_func_cap(dev);
>> -	mp->quantization = vivid_quantization_cap(dev);
>> +	if (fmt->color_enc == TGP_COLOR_ENC_YCBCR ||
>> +	    fmt->color_enc == TGP_COLOR_ENC_RGB) {
>> +		if (!user_set_csc || !vivid_is_quant_valid(mp->quantization))
>> +			mp->quantization = vivid_quantization_cap(dev);
>> +	} else {
>> +		mp->quantization = vivid_quantization_cap(dev);
>> +	}
>>   	memset(mp->reserved, 0, sizeof(mp->reserved));
>>   	return 0;
>>   }
>> @@ -769,6 +804,12 @@ int vivid_s_fmt_vid_cap(struct file *file, void *priv,
>>   	if (vivid_is_sdtv_cap(dev))
>>   		dev->tv_field_cap = mp->field;
>>   	tpg_update_mv_step(&dev->tpg);
>> +	dev->tpg.quantization = mp->quantization;
>> +	if (dev->fmt_cap->color_enc == TGP_COLOR_ENC_YCBCR)
>> +		dev->tpg.ycbcr_enc = mp->ycbcr_enc;
>> +	else
>> +		dev->tpg.hsv_enc = mp->hsv_enc;
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
>> index 76b0be670ebb..19aacb180e67 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
>> @@ -920,6 +920,26 @@ int vivid_enum_fmt_vid(struct file *file, void  *priv,
>>   	fmt = &vivid_formats[f->index];
>>   
>>   	f->pixelformat = fmt->fourcc;
>> +
>> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
>> +	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>> +		return 0;
>> +	/*
>> +	 * For capture devices, we support the CSC API.
>> +	 * We allow userspace to:
>> +	 * 1. set the ycbcr_enc on yuv format
>> +	 * 2. set the hsv_enc on hsv format
>> +	 * 3. set the quantization on yuv and rgb formats
>> +	 */
>> +	if (fmt->color_enc == TGP_COLOR_ENC_YCBCR) {
>> +		f->flags |= V4L2_FMT_FLAG_CSC_YCBCR_ENC;
>> +		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION;
>> +	} else if (fmt->color_enc == TGP_COLOR_ENC_HSV) {
>> +		f->flags |= V4L2_FMT_FLAG_CSC_HSV_ENC;
>> +	} else if (fmt->color_enc == TGP_COLOR_ENC_RGB) {
>> +		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION;
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>>
> 
