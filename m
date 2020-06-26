Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79C920ACC8
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 09:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgFZHH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 03:07:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45224 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgFZHH1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 03:07:27 -0400
Received: from [IPv6:2003:cb:8737:cf00:e1b4:8557:745c:a459] (p200300cb8737cf00e1b48557745ca459.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e1b4:8557:745c:a459])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E46412A5455;
        Fri, 26 Jun 2020 08:07:23 +0100 (BST)
Subject: Re: [RFC v4 5/8] media: staging: rkisp1: allow quantization
 conversion from userspace for isp source pad
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de
References: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
 <20200605172625.19777-6-dafna.hirschfeld@collabora.com>
 <0d9ad195-f60b-0cac-c426-0f9ecf80846c@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <76e417fd-d897-a641-cfc2-a1d2c845968f@collabora.com>
Date:   Fri, 26 Jun 2020 09:07:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0d9ad195-f60b-0cac-c426-0f9ecf80846c@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 26.06.20 01:52, Helen Koike wrote:
> Hi Dafna,
> 
> Thanks for the patch,
> 
> On 6/5/20 2:26 PM, Dafna Hirschfeld wrote:
>> The isp entity has a hardware support to force full range quantization
>> for YUV formats. Use the CSC API to allow userspace to set the
>> quantization for YUV formats on the isp, resizer and capture entities.
>>
>> - The flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION is set on
>> YUV formats during enumeration of the resizer and isp formats.
>> - The flag V4L2_FMT_FLAG_CSC_QUANTIZATION is set on the YUV formats
>> during enumeration of the capture formats.
>> - The full quantization is set on YUV formats if userspace ask it
>> on the entities using the flag V4L2_MBUS_FRAMEFMT_SET_CSC
>> for subdevices and the flag V4L2_PIX_FMT_FLAG_SET_CSC on for
>> the capture entity.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 23 ++++++++++++-------
>>   drivers/staging/media/rkisp1/rkisp1-isp.c     | 22 ++++++++++++++----
>>   drivers/staging/media/rkisp1/rkisp1-resizer.c | 22 ++++++++++++++++++
>>   3 files changed, 55 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index f69235f82c45..66856d5eb576 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -1085,8 +1085,6 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>>   			   const struct v4l2_format_info **fmt_info)
>>   {
>>   	const struct rkisp1_capture_config *config = cap->config;
>> -	struct rkisp1_capture *other_cap =
>> -			&cap->rkisp1->capture_devs[cap->id ^ 1];
>>   	const struct rkisp1_capture_fmt_cfg *fmt;
>>   	const struct v4l2_format_info *info;
>>   	const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
>> @@ -1108,16 +1106,21 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>>   	pixm->field = V4L2_FIELD_NONE;
>>   	pixm->colorspace = V4L2_COLORSPACE_DEFAULT;
> 
> Shouldn't the driver set colorspace instead of leaving as default?
> In this case it's V4L2_COLORSPACE_SRGB for BT.601 specification.
> 
>>   	pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	pixm->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>>   
>>   	info = rkisp1_fill_pixfmt(pixm, cap->id);
>>   
>> -	/* can not change quantization when stream-on */
>> -	if (other_cap->is_streaming)
>> -		pixm->quantization = other_cap->pix.fmt.quantization;
> 
> We need to investigate why we had this in the original driver.
> Can we have different quantization values for each capture streaming at the same time?

With this patchset, both captures need to have the same quantization
as the isp entity in order to stream, so checking the values of the other
capture is not needed anymore.

Thanks,
Dafna

> 
>> -	/* output full range by default, take effect in params */
>> -	else if (!pixm->quantization ||
>> -		 pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
>> +	/*
>> +	 * isp has a feature to select between limited and full range for YUV
>> +	 * formats.
>> +	 * So we should also support it in the capture using the CSC API
>> +	 */
>> +	if (pixm->flags & V4L2_PIX_FMT_FLAG_SET_CSC &&
>> +	    pixm->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
>> +	    v4l2_is_format_yuv(info))
>>   		pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>> +	else
>> +		pixm->quantization = V4L2_QUANTIZATION_DEFAULT;
>>   
>>   	if (fmt_cfg)
>>   		*fmt_cfg = fmt;
>> @@ -1152,12 +1155,16 @@ static int rkisp1_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
>>   {
>>   	struct rkisp1_capture *cap = video_drvdata(file);
>>   	const struct rkisp1_capture_fmt_cfg *fmt = NULL;
>> +	const struct v4l2_format_info *info;
>>   
>>   	if (f->index >= cap->config->fmt_size)
>>   		return -EINVAL;
>>   
>>   	fmt = &cap->config->fmts[f->index];
>>   	f->pixelformat = fmt->fourcc;
>> +	info = v4l2_format_info(f->pixelformat);
>> +	if (v4l2_is_format_yuv(info))
>> +		f->flags = V4L2_FMT_FLAG_CSC_QUANTIZATION;
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
>> index e66e87d6ea8b..28e0a3c594aa 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
>> @@ -591,6 +591,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>>   
>>   		if (code->index == pos - 1) {
>>   			code->code = fmt->mbus_code;
>> +			if (fmt->pixel_enc == V4L2_PIXEL_ENC_YUV &&
>> +			    dir == RKISP1_DIR_SRC)
>> +				code->flags =
>> +					V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
>>   			return 0;
>>   		}
>>   	}
>> @@ -622,7 +626,6 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>>   					     RKISP1_ISP_PAD_SOURCE_VIDEO);
>>   	*src_fmt = *sink_fmt;
>>   	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
>> -	src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>   
>>   	src_crop = v4l2_subdev_get_try_crop(sd, cfg,
>>   					    RKISP1_ISP_PAD_SOURCE_VIDEO);
>> @@ -665,10 +668,21 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>>   		isp->src_fmt = mbus_info;
>>   	src_fmt->width  = src_crop->width;
>>   	src_fmt->height = src_crop->height;
>> -	src_fmt->quantization = format->quantization;
>> -	/* full range by default */
>> -	if (!src_fmt->quantization)
>> +
>> +	src_fmt->colorspace = V4L2_COLORSPACE_DEFAULT;
> 
> Shouldn't this be V4L2_COLORSPACE_SRGB ? Same comment for other places using V4L2_COLORSPACE_DEFAULT
> 
> Regards,
> Helen
> 
>> +	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	src_fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +
>> +	/*
>> +	 * The CSC API is used to allow userspace to force full
>> +	 * quantization on YUV formats.
>> +	 */
>> +	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
>> +	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
>> +	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
>>   		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>> +	else
>> +		src_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
>>   
>>   	*format = *src_fmt;
>>   }
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> index fa28f4bd65c0..237cce9183f7 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>> @@ -549,8 +549,30 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>>   	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
>>   		rsz->pixel_enc = mbus_info->pixel_enc;
>>   
>> +	sink_fmt->colorspace = V4L2_COLORSPACE_DEFAULT;
>> +	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	sink_fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +
>> +	/*
>> +	 * isp has a feature to select between limited and full range for
>> +	 * YUV formats.
>> +	 * so we should support it in the resizer using the CSC API
>> +	 */
>> +
>> +	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
>> +	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
>> +	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
>> +		sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>> +	else
>> +		sink_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
>> +
>>   	/* Propagete to source pad */
>>   	src_fmt->code = sink_fmt->code;
>> +	src_fmt->field = sink_fmt->field;
>> +	src_fmt->colorspace = sink_fmt->colorspace;
>> +	src_fmt->ycbcr_enc = sink_fmt->ycbcr_enc;
>> +	src_fmt->xfer_func = sink_fmt->xfer_func;
>> +	src_fmt->quantization = sink_fmt->quantization;
>>   
>>   	sink_fmt->width = clamp_t(u32, format->width,
>>   				  rsz->config->min_rsz_width,
>>
