Return-Path: <linux-media+bounces-20334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB279B0C0A
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 19:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFB351C20DA9
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 17:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9752C18CC10;
	Fri, 25 Oct 2024 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fPjvJ3ny"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BCB70832;
	Fri, 25 Oct 2024 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729878352; cv=none; b=cVqVjECkIOsmyu+jDHpdYIBtIZuIv0WMWlj0w1sCmoN6s66DCv7BrWLSoM1nT4j44IeehjHy5wfk7R+1cRVpjZv7hG9lABte1MjRlCqZOYbFRZZyIsyDetjRasBquguPRcn2HsAsEpBqfqoxODHS/CRyZdpadHp0U6viffuGJek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729878352; c=relaxed/simple;
	bh=bNv4jIyQDliGcVawBrOSvkpb5zpdi3jBSjsJjCPEVEc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rsRgD8OM7ME59gTGqDNUdg8X4yfbpjHvzTH2OZ8YRdYLum5E9z/p+BIBWEgqBY6IZ+xucaXp7FWudcCSbQLvPuwpEHMjg4YCyOHp4KmpcndumUuAic/2ZkIn6iCyz+wsJCFlcd+U7SCFobIjaCO52fCq1yOOQIKhVjaN/cEv8Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fPjvJ3ny; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729878347;
	bh=bNv4jIyQDliGcVawBrOSvkpb5zpdi3jBSjsJjCPEVEc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fPjvJ3nynAedGwttLkqjAiCTDRn+hUKvfZQus61FeEwQ0GY2Y5FKcxwZavucLuRzx
	 ztn6IijoH7PBYy771wY6qh4jCZNekkzLBiLIPGGILnx5DTa/LWJst3LCKEjeSlfZ1Y
	 ESX5UeKFwCSKHZjW1UhUyq1mHd47dNsArvETkwUQNa4YjzEz6T7upKB3MKrF3mh8SW
	 jDtkxMLiqIPQP3NG+hSOkhkCOfoTHXgxa6QqK6IIwrOyf+cUp31FcVe1ll86CazEdA
	 N+SaFGcOoZksv5691roGUlw6kcRzcMeZ7iossAFHqywgGGfoGXA8bYXITqnGH7AtK5
	 tROwehnxYQdMw==
Received: from nicolas-tpx395.lan (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9667F17E36B5;
	Fri, 25 Oct 2024 19:45:45 +0200 (CEST)
Message-ID: <8e6f209cbc2c33e445b544d13b06374338910d78.camel@collabora.com>
Subject: Re: [PATCH v6 10/11] media: rkvdec: h264: Support High 10 and 4:2:2
 profiles
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Bee <knaerzche@gmail.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Christopher
 Obbard <chris.obbard@collabora.com>
Date: Fri, 25 Oct 2024 13:45:44 -0400
In-Reply-To: <20240909192522.1076704-11-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
	 <20240909192522.1076704-11-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 09 septembre 2024 à 19:25 +0000, Jonas Karlman a écrit :
> Add support and enable decoding of H264 High 10 and 4:2:2 profiles.
> 
> Decoded CAPTURE buffer width is aligned to 64 pixels to accommodate HW
> requirement of 10-bit format buffers, fixes decoding of:
> 
> - Hi422FR13_SONY_A
> - Hi422FR14_SONY_A
> - Hi422FR15_SONY_A
> - Hi422FR6_SONY_A
> - Hi422FR7_SONY_A
> - Hi422FR8_SONY_A
> - Hi422FR9_SONY_A
> - Hi422FREXT18_SONY_A
> 
> The get_image_fmt() ops is implemented to select an image format
> required for the provided SPS control.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> ---
> v6:
> - No change
> 
> v5:
> - Move buffer align from rkvdec_fill_decoded_pixfmt to min/step_width
> - Use correct profiles for V4L2_CID_MPEG_VIDEO_H264_PROFILE
> - Collect t-b tags
> 
> v4:
> - Change to use get_image_fmt() ops
> 
> v3:
> - Add get_fmt_opaque ops, the expected pixelformat is used as opaque
> - Add new valid_fmt ops that validate pixelformat matches opaque
> - Update H264_PROFILE control max value
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 37 +++++++++++++++-----
>  drivers/staging/media/rkvdec/rkvdec.c      | 40 ++++++++++++++++------
>  drivers/staging/media/rkvdec/rkvdec.h      |  3 ++
>  3 files changed, 61 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index 8bce8902b8dd..d14b4d173448 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -1027,24 +1027,42 @@ static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
>  	return 0;
>  }
>  
> +static enum rkvdec_image_fmt rkvdec_h264_get_image_fmt(struct rkvdec_ctx *ctx,
> +						       struct v4l2_ctrl *ctrl)
> +{
> +	const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
> +
> +	if (ctrl->id != V4L2_CID_STATELESS_H264_SPS)
> +		return RKVDEC_IMG_FMT_ANY;
> +
> +	if (sps->bit_depth_luma_minus8 == 0) {
> +		if (sps->chroma_format_idc == 2)
> +			return RKVDEC_IMG_FMT_422_8BIT;
> +		else
> +			return RKVDEC_IMG_FMT_420_8BIT;
> +	} else if (sps->bit_depth_luma_minus8 == 2) {
> +		if (sps->chroma_format_idc == 2)
> +			return RKVDEC_IMG_FMT_422_10BIT;
> +		else
> +			return RKVDEC_IMG_FMT_420_10BIT;
> +	}
> +
> +	return RKVDEC_IMG_FMT_ANY;
> +}
> +
>  static int rkvdec_h264_validate_sps(struct rkvdec_ctx *ctx,
>  				    const struct v4l2_ctrl_h264_sps *sps)
>  {
>  	unsigned int width, height;
>  
> -	/*
> -	 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
> -	 * but it's currently broken in the driver.
> -	 * Reject them for now, until it's fixed.
> -	 */
> -	if (sps->chroma_format_idc > 1)
> -		/* Only 4:0:0 and 4:2:0 are supported */
> +	if (sps->chroma_format_idc > 2)
> +		/* Only 4:0:0, 4:2:0 and 4:2:2 are supported */
>  		return -EINVAL;
>  	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
>  		/* Luma and chroma bit depth mismatch */
>  		return -EINVAL;
> -	if (sps->bit_depth_luma_minus8 != 0)
> -		/* Only 8-bit is supported */
> +	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
> +		/* Only 8-bit and 10-bit is supported */
>  		return -EINVAL;
>  
>  	width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
> @@ -1190,4 +1208,5 @@ const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops = {
>  	.stop = rkvdec_h264_stop,
>  	.run = rkvdec_h264_run,
>  	.try_ctrl = rkvdec_h264_try_ctrl,
> +	.get_image_fmt = rkvdec_h264_get_image_fmt,
>  };
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 8df49ee12820..c8c14f35ac44 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -195,10 +195,11 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>  	},
>  	{
>  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> -		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> -		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE,

The change from BASELINE to CONSTRAINED_BASELINE is correct, but it bugs me a
little to hide it into this patch. Do you mind splitting it out ?

Note that these days, since we have no software fallback for it, GStreamer, and
probably FFMPEG too, still try out contrained-baseline decoders for baseline
content, as very often the bitstream does not actually uses FMO and ASO
features. So perhaps we can just edit this one out to help with merging this
set?

With one of these two fix:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA,
>  		.cfg.menu_skip_mask =
> -			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE),
>  		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
>  	},
>  	{
> @@ -213,11 +214,23 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
>  	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
>  };
>  
> -static const struct rkvdec_decoded_fmt_desc rkvdec_h264_vp9_decoded_fmts[] = {
> +static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12,
>  		.image_fmt = RKVDEC_IMG_FMT_420_8BIT,
>  	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV15,
> +		.image_fmt = RKVDEC_IMG_FMT_420_10BIT,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV16,
> +		.image_fmt = RKVDEC_IMG_FMT_422_8BIT,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV20,
> +		.image_fmt = RKVDEC_IMG_FMT_422_10BIT,
> +	},
>  };
>  
>  static const struct rkvdec_ctrl_desc rkvdec_vp9_ctrl_descs[] = {
> @@ -240,21 +253,28 @@ static const struct rkvdec_ctrls rkvdec_vp9_ctrls = {
>  	.num_ctrls = ARRAY_SIZE(rkvdec_vp9_ctrl_descs),
>  };
>  
> +static const struct rkvdec_decoded_fmt_desc rkvdec_vp9_decoded_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12,
> +		.image_fmt = RKVDEC_IMG_FMT_420_8BIT,
> +	},
> +};
> +
>  static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_H264_SLICE,
>  		.frmsize = {
> -			.min_width = 48,
> +			.min_width = 64,
>  			.max_width = 4096,
> -			.step_width = 16,
> +			.step_width = 64,
>  			.min_height = 48,
>  			.max_height = 2560,
>  			.step_height = 16,
>  		},
>  		.ctrls = &rkvdec_h264_ctrls,
>  		.ops = &rkvdec_h264_fmt_ops,
> -		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_vp9_decoded_fmts),
> -		.decoded_fmts = rkvdec_h264_vp9_decoded_fmts,
> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts = rkvdec_h264_decoded_fmts,
>  		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>  	},
>  	{
> @@ -269,8 +289,8 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>  		},
>  		.ctrls = &rkvdec_vp9_ctrls,
>  		.ops = &rkvdec_vp9_fmt_ops,
> -		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_vp9_decoded_fmts),
> -		.decoded_fmts = rkvdec_h264_vp9_decoded_fmts,
> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
> +		.decoded_fmts = rkvdec_vp9_decoded_fmts,
>  	}
>  };
>  
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index e466a2753ccf..9a9f4fced7a1 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -80,6 +80,9 @@ struct rkvdec_coded_fmt_ops {
>  enum rkvdec_image_fmt {
>  	RKVDEC_IMG_FMT_ANY = 0,
>  	RKVDEC_IMG_FMT_420_8BIT,
> +	RKVDEC_IMG_FMT_420_10BIT,
> +	RKVDEC_IMG_FMT_422_8BIT,
> +	RKVDEC_IMG_FMT_422_10BIT,
>  };
>  
>  struct rkvdec_decoded_fmt_desc {


