Return-Path: <linux-media+bounces-50280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFE1D09ACF
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 13:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 546653016200
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 12:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2CA35A940;
	Fri,  9 Jan 2026 12:18:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF82359713
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961139; cv=none; b=irNjfOYiu4F6HgOVBPQfdOfJ1JHorRniVxZ+bSTj0VR6IH2nHbzJhA9Afc0M8RAWoIjsY8LaXFMqQtCpw/B7SA9aa98EeTzI0wbVQNgKQAuBOaQ4T1A/BjNn77s9eVX6UNIj9DYfRmx9tYtIDnk4+l93wWLIwPrVaDcQ86Fy2kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961139; c=relaxed/simple;
	bh=/tiERx8rE15fRtVW1yTKJ5qhoiHNDMU5y0D9UOigCSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+r3WYEGCAhrAqGyNlRzDf4DiI840X87kWAVkFM3PiAxVgMbSWwynLRdvMBONz7BgZeMS3hZDauKGUX4O6USnpP+p6594Ra3LkqUN/VQlt+Del7VEawYlb7vlKIbqWJw9YeM9SJF9QrpOmhsbkid5ANIH1AddZiPEEBt38o13A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1veBRz-0000SF-A4; Fri, 09 Jan 2026 13:18:43 +0100
Message-ID: <03fd04f7-629c-48cd-b498-0a1ebb67690d@pengutronix.de>
Date: Fri, 9 Jan 2026 13:18:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/22] media: rockchip: rga: check scaling factor
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
 <20251203-spu-rga3-v2-11-989a67947f71@pengutronix.de>
 <02ac025c0ecf17354377c7f2c2fc83b40a3a41e1.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <02ac025c0ecf17354377c7f2c2fc83b40a3a41e1.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On 12/24/25 4:39 PM, Nicolas Dufresne wrote:

> Le mercredi 03 décembre 2025 à 16:52 +0100, Sven Püschel a écrit :
>> Check the scaling factor to avoid potential problems. This is relevant
>> for the upcoming RGA3 support, as it can hang when the scaling factor
>> is exceeded.
>>
>> There are two relevant scenarios that have to be considered to protect
>> against invalid scaling values:
>>
>> When the output or capture is already streaming, setting the format on
>> the other side should consider the max scaling factor and clamp it
>> accordingly. This is only done in the streaming case, as it otherwise
>> may unintentionally clamp the value when the application sets the first
>> format (due to a default format on the other side).
>>
>> When the format is set on both sides first, then the format won't be
>> corrected by above means. Therefore the second streamon call has to
>> check the scaling factor and fail otherwise.
> In codec specifications, we resolve this issue by resetting the capture format
> every-time the output format is set. But without specification for color
> transforms, its impossible to say if this is right or wrong, and I don't expect
> perfect interroperability between drivers until someone make the effort to
> specify this type of hardware.
>
> What you describe is fine of course, but its a bit off nature of the way format
> is normally being fixed by the driver to stay valid.

thanks for the info. Given the missing spec, I'd keep it at the current 
unusual implementation unless I'd need to adjust it for the try_fmt 
state issue.

>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>> ---
>>   drivers/media/platform/rockchip/rga/rga-hw.c |  1 +
>>   drivers/media/platform/rockchip/rga/rga-hw.h |  1 +
>>   drivers/media/platform/rockchip/rga/rga.c    | 60 +++++++++++++++++++++++++---
>>   drivers/media/platform/rockchip/rga/rga.h    |  1 +
>>   4 files changed, 58 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
>> index 8cdfe089fd636..2ed4f22a999d5 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>> @@ -624,6 +624,7 @@ const struct rga_hw rga2_hw = {
>>   	.max_width = MAX_WIDTH,
>>   	.min_height = MIN_HEIGHT,
>>   	.max_height = MAX_HEIGHT,
>> +	.max_scaling_factor = MAX_SCALING_FACTOR,
>>   	.stride_alignment = 4,
>>   
>>   	.setup_cmdbuf = rga_hw_setup_cmdbuf,
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
>> index f4752aa823051..fffcab0131225 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
>> @@ -14,6 +14,7 @@
>>   
>>   #define MIN_WIDTH 34
>>   #define MIN_HEIGHT 34
>> +#define MAX_SCALING_FACTOR 16
>>   
>>   #define RGA_TIMEOUT 500
>>   
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
>> index f02ae02de26ca..46dc94db6f85e 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -346,18 +346,47 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>>   static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>>   {
>>   	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
>> -	struct rockchip_rga *rga = video_drvdata(file);
>> +	struct rga_ctx *ctx = file_to_rga_ctx(file);
>> +	struct rockchip_rga *rga = ctx->rga;
>>   	const struct rga_hw *hw = rga->hw;
>>   	struct rga_fmt *fmt;
>> +	u32 min_width = hw->min_width;
>> +	u32 max_width = hw->max_width;
>> +	u32 min_height = hw->min_height;
>> +	u32 max_height = hw->max_height;
>>   
>>   	fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
>>   	if (!fmt)
>>   		fmt = &hw->formats[0];
>>   
>> -	pix_fmt->width = clamp(pix_fmt->width,
>> -			       hw->min_width, hw->max_width);
>> -	pix_fmt->height = clamp(pix_fmt->height,
>> -				hw->min_height, hw->max_height);
>> +	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
>> +	    v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming) {
> What if userspace wanted to get the buffer size computed, so it can allocate
> externally before it calls streamoff ? Hans did mention recently that try
> function should only be state aware if specified.

My plan is to move the try logic into a separate helper function with an 
additional boolean parameter depending on which I do the state aware 
adjustments. And then call this helper with false for try_fmt and true 
for set_fmt.

Or is this also problematic as it violates the contract that try_fmt is 
equivalent to set_fmt?

>
> I'd like other reviewers feedback on what should be done here, of course writing
> a spec would be ideal.
>
> Nicolas
>
>> +		min_width =
>> +			MAX(min_width, DIV_ROUND_UP(ctx->out.pix.width,
>> +						    hw->max_scaling_factor));
>> +		max_width = MIN(max_width,
>> +				ctx->out.pix.width * hw->max_scaling_factor);
>> +		min_height =
>> +			MAX(min_height, DIV_ROUND_UP(ctx->out.pix.height,
>> +						     hw->max_scaling_factor));
>> +		max_height = MIN(max_height,
>> +				 ctx->out.pix.height * hw->max_scaling_factor);
>> +	} else if (V4L2_TYPE_IS_CAPTURE(f->type) &&
>> +		   v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming) {
>> +		min_width =
>> +			MAX(min_width, DIV_ROUND_UP(ctx->in.pix.width,
>> +						    hw->max_scaling_factor));
>> +		max_width = MIN(max_width,
>> +				ctx->in.pix.width * hw->max_scaling_factor);
>> +		min_height =
>> +			MAX(min_height, DIV_ROUND_UP(ctx->in.pix.height,
>> +						     hw->max_scaling_factor));
>> +		max_height = MIN(max_height,
>> +				 ctx->in.pix.height * hw->max_scaling_factor);
>> +	}
>> +
>> +	pix_fmt->width = clamp(pix_fmt->width, min_width, max_width);
>> +	pix_fmt->height = clamp(pix_fmt->height, min_height, max_height);
>>   
>>   	v4l2_fill_pixfmt_mp_aligned(pix_fmt, pix_fmt->pixelformat,
>>   				    pix_fmt->width, pix_fmt->height, hw->stride_alignment);
>> @@ -523,12 +552,33 @@ static int vidioc_s_selection(struct file *file, void *priv,
>>   	return ret;
>>   }
>>   
>> +static bool check_scaling(const struct rga_hw *hw, u32 src_size, u32 dst_size)
>> +{
>> +	if (src_size < dst_size)
>> +		return src_size * hw->max_scaling_factor >= dst_size;
>> +	else
>> +		return dst_size * hw->max_scaling_factor >= src_size;
>> +}
>> +
>>   static int vidioc_streamon(struct file *file, void *priv,
>>   			   enum v4l2_buf_type type)
>>   {
>>   	struct rga_ctx *ctx = file_to_rga_ctx(file);
>>   	const struct rga_hw *hw = ctx->rga->hw;
>>   
>> +	if ((V4L2_TYPE_IS_OUTPUT(type) &&
>> +	     v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming) ||
>> +	    (V4L2_TYPE_IS_CAPTURE(type) &&
>> +	     v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)) {
>> +		/*
>> +		 * As the other side is already streaming,
>> +		 * check that the max scaling factor isn't exceeded.
>> +		 */
>> +		if (!check_scaling(hw, ctx->in.pix.width, ctx->out.pix.width) ||
>> +		    !check_scaling(hw, ctx->in.pix.height, ctx->out.pix.height))
>> +			return -EINVAL;
>> +	}
>> +
>>   	hw->setup_cmdbuf(ctx);
>>   
>>   	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
>> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
>> index 93162b118d069..d02d5730b4e3b 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.h
>> +++ b/drivers/media/platform/rockchip/rga/rga.h
>> @@ -152,6 +152,7 @@ struct rga_hw {
>>   	size_t cmdbuf_size;
>>   	u32 min_width, min_height;
>>   	u32 max_width, max_height;
>> +	u8 max_scaling_factor;
>>   	u8 stride_alignment;
>>   
>>   	void (*setup_cmdbuf)(struct rga_ctx *ctx);

