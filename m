Return-Path: <linux-media+bounces-63052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uTpfBcW5GWp/yggAu9opvQ
	(envelope-from <linux-media+bounces-63052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 18:07:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82281605482
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 18:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8509230830BA
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 15:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B683233B6DB;
	Fri, 29 May 2026 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgLKXNYz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DAE303A37;
	Fri, 29 May 2026 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068016; cv=none; b=oDPZtHRVYUvaXhw7RYdlRLyP46CWdlLxlDykyL1QUpjIIpEy7LMuy1Rd96siGCFkpRvl1RalfMJ4p3JqLmlIKoTQebytQeoxCv2N74gEncKG3qGm3EKRW1Tfobz9kSkEXz/E8OC4UDCePODvChSkG7gNjCtre2zyfgqcQFtd3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068016; c=relaxed/simple;
	bh=KUuFwnpCCH2IwllVfzCHujNyPhKDHYYS2DCZ4mJeAyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LiiNRUPQQsl6TZhSKSnuZOeb/q/WXjLrKBJci8ZTK8iTPKgSXXFObTS/dKKLOpULI2Ss51oR3Z2nJHQkTknBfx67D79txtaJdfoYCAEEf8QLRDter6vUn/gAUvwvbXz0ZajywIgJCKMCJUVO/8JbTnc+w4wum5im2JTsYRtmFuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgLKXNYz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F151F00893;
	Fri, 29 May 2026 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780068014;
	bh=/snPN3A+Dc1Yw/0QuFMZriZn7tGyTD2ZUgC8FKj/gk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bgLKXNYzQtv1Ag4flEMBZbnFnBsxIMTZlStpOoBvKRMb2WYKwf2Ie0uwXQI+Efxwn
	 woS3LuuxcPYstfONQs26h5aPIIUDFTJZ9usWz3s2fMuitBX6i/9wixWoegliaIJCC+
	 QTMExLig8D4xfXUwuk3RlMBRD3bw8KndA+idFXENUX1PcjY+aQDS83zAetvKFMWUwj
	 IoR/reU9M0GgemnCJU/Dl3AxD4A6yMlC/NhOswUhr33wWNjDReu2yEnLNAMw7FAeiH
	 /cScW87hKCCmFUgfHOEQk+f0NtOsqg1KVAd9Y80sXJQm5AFHG/yPKGCU1DVJvO7xJ2
	 yMYa/b+sb13xA==
Message-ID: <22758c71-0dc9-4091-b5b7-201bb154c136@kernel.org>
Date: Fri, 29 May 2026 18:20:10 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] media: microchip-isc: add SAMA7G5 hue and
 saturation controls
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 stable@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
 <20260527-microchip-isc-fixes-v5-9-b0ec1bb954be@microchip.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260527-microchip-isc-fixes-v5-9-b0ec1bb954be@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63052-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email]
X-Rspamd-Queue-Id: 82281605482
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/27/26 14:07, Balakrishnan Sambath wrote:
> The CBHS (Contrast/Brightness/Hue/Saturation) block on SAMA7G5
> operates in YCbCr space; expose hue and saturation as V4L2 controls
> for the YUV/RGB output paths only. The SAMA5D2 has only the CBC
> block (no hue/saturation), so the controls are gated on a new
> has_cbhs flag.
> 
> Saturation uses the Q4 fixed-point range 0..127 with default 16
> (1.0x) directly matching the CBHS_SAT register field. The control
> state is initialised to neutral at probe so the first config_cbc()
> write after streaming starts does not produce a grayscale image.
> 
> Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  .../media/platform/microchip/microchip-isc-base.c  | 75 ++++++++++++++++++++++
>  .../media/platform/microchip/microchip-isc-regs.h  | 11 ++--
>  drivers/media/platform/microchip/microchip-isc.h   |  3 +
>  .../platform/microchip/microchip-sama7g5-isc.c     |  6 +-
>  4 files changed, 88 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
> index 04187127070d..cb338133d03f 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -859,6 +859,56 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
>  	return 0;
>  }
>  
> +static bool isc_format_has_chroma(u32 fourcc)
> +{
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_YUV420:
> +	case V4L2_PIX_FMT_YUV422P:
> +	case V4L2_PIX_FMT_YUYV:
> +	case V4L2_PIX_FMT_UYVY:
> +	case V4L2_PIX_FMT_VYUY:
> +		return true;
RGB565 doesn't have chroma for example ?

> +	default:
> +		return false;
> +	}
> +}
> +
> +/*
> + * isc_update_cbc_ctrl_activity() - Activate/deactivate CBC controls

What is the purpose of 'activity' in the name ? is a bit misleading for me.
> + *
> + * Called from isc_set_fmt(), isc_link_validate(), and isc_ctrl_init().
> + * At isc_ctrl_init() time isc->config.bits_pipeline is zero (no format
> + * has been negotiated yet), so all CBC controls are initially marked
> + * inactive.  They become active once a format that includes CBHS in the
> + * pipeline is configured via VIDIOC_S_FMT or link validation.
> + */
> +static void isc_update_cbc_ctrl_activity(struct isc_device *isc)
> +{
> +	struct v4l2_ctrl_handler *hdl = &isc->ctrls.handler;
> +	struct v4l2_ctrl *brightness;
> +	struct v4l2_ctrl *contrast;
> +	struct v4l2_ctrl *hue;
> +	struct v4l2_ctrl *saturation;
> +	bool cbc_active = isc->config.bits_pipeline & CBHS_ENABLE;
> +	bool chroma_active = cbc_active && isc_format_has_chroma(isc->config.fourcc);
> +
> +	brightness = v4l2_ctrl_find(hdl, V4L2_CID_BRIGHTNESS);
> +	if (brightness)
> +		v4l2_ctrl_activate(brightness, cbc_active);
> +
> +	contrast = v4l2_ctrl_find(hdl, V4L2_CID_CONTRAST);
> +	if (contrast)
> +		v4l2_ctrl_activate(contrast, cbc_active);
> +
> +	hue = v4l2_ctrl_find(hdl, V4L2_CID_HUE);
> +	if (hue)
> +		v4l2_ctrl_activate(hue, chroma_active);
> +
> +	saturation = v4l2_ctrl_find(hdl, V4L2_CID_SATURATION);
> +	if (saturation)
> +		v4l2_ctrl_activate(saturation, chroma_active);

Usage of v4l2_ctrl_find is a bit odd, don't you have the ctrls already
in the isc struct ? e.g. isc->ctrls.brightness, etc.

> +}
> +
>  static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
> @@ -902,6 +952,7 @@ static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
>  	/* make the try configuration active */
>  	isc->config = isc->try_config;
>  	isc->fmt = isc->try_fmt;
> +	isc_update_cbc_ctrl_activity(isc);
>  
>  	dev_dbg(isc->dev, "ISC set_fmt to %.4s @%dx%d\n",
>  		(char *)&f->fmt.pix.pixelformat,
> @@ -989,6 +1040,7 @@ static int isc_link_validate(struct media_link *link)
>  		return ret;
>  
>  	isc->config = isc->try_config;
> +	isc_update_cbc_ctrl_activity(isc);
>  
>  	dev_dbg(isc->dev, "New ISC configuration in place\n");
>  
> @@ -1457,6 +1509,14 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_CONTRAST:
>  		ctrls->contrast = ctrl->val & ISC_CBC_CONTRAST_MASK;
>  		break;
> +	case V4L2_CID_HUE:
> +		if (isc->has_cbhs)
> +			ctrls->hue = ctrl->val & ISC_CBHS_HUE_MASK;
> +		break;
> +	case V4L2_CID_SATURATION:
> +		if (isc->has_cbhs)
> +			ctrls->saturation = ctrl->val & ISC_CBHS_SAT_MASK;
> +		break;
>  	case V4L2_CID_GAMMA:
>  		ctrls->gamma_index = ctrl->val;
>  		break;
> @@ -1464,6 +1524,7 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
>  		return -EINVAL;
>  	}
>  
> +	/* config_cbc() flushes ctrls to hardware at stream start. */

What's the meaning of this comment here . s_ctrl configures multiple
controls, including gamma, etc, so why mention config_cbc() ?

>  	return 0;
>  }
>  
> @@ -1647,6 +1708,19 @@ static int isc_ctrl_init(struct isc_device *isc)
>  	ctrls->brightness = 0;
>  
>  	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
> +	if (isc->has_cbhs) {
> +		/*
> +		 * CBHS_HUE is a signed 9-bit value in degrees.
> +		 * CBHS_SAT is Q4 unsigned 7-bit, 16 = 1.0x.
> +		 * Initialize the kernel-side state to neutral here so the
> +		 * first config_cbc() call after streaming starts does not
> +		 * write zero (grayscale) to the hardware.
> +		 */
> +		ctrls->hue = 0;
> +		ctrls->saturation = 16;
> +		v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HUE, -180, 180, 1, 0);
> +		v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION, 0, 127, 1, 16);
> +	}
>  	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1,
>  			  isc->gamma_default);
>  	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
> @@ -1665,6 +1739,7 @@ static int isc_ctrl_init(struct isc_device *isc)
>  	}
>  
>  	v4l2_ctrl_activate(isc->do_wb_ctrl, false);
> +	isc_update_cbc_ctrl_activity(isc);
>  
>  	isc->r_gain_ctrl = v4l2_ctrl_new_custom(hdl, &isc_r_gain_ctrl, NULL);
>  	isc->b_gain_ctrl = v4l2_ctrl_new_custom(hdl, &isc_b_gain_ctrl, NULL);
> diff --git a/drivers/media/platform/microchip/microchip-isc-regs.h b/drivers/media/platform/microchip/microchip-isc-regs.h
> index e77e1d9a1db8..7f5c2e50e74b 100644
> --- a/drivers/media/platform/microchip/microchip-isc-regs.h
> +++ b/drivers/media/platform/microchip/microchip-isc-regs.h
> @@ -268,10 +268,13 @@
>  #define ISC_CBC_CONTRAST	0x000003c0
>  #define ISC_CBC_CONTRAST_MASK	GENMASK(11, 0)
>  
> -/* Hue Register */
> -#define ISC_CBCHS_HUE	0x4e0
> -/* Saturation Register */
> -#define ISC_CBCHS_SAT	0x4e4
> +/* Hue Register: signed 9-bit two's complement, covers -180 to +180 degrees */
> +#define ISC_CBHS_HUE		0x4e0
> +#define ISC_CBHS_HUE_MASK	GENMASK(8, 0)
> +
> +/* Saturation Register: unsigned Q4 fixed-point (1.0 = 16, V4L2 range 0..127) */
> +#define ISC_CBHS_SAT		0x4e4
> +#define ISC_CBHS_SAT_MASK	GENMASK(6, 0)
>  
>  /* Offset for SUB422 register specific to sama5d2 product */
>  #define ISC_SAMA5D2_SUB422_OFFSET	0
> diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
> index 2282ef7dd596..36a9c0cb241f 100644
> --- a/drivers/media/platform/microchip/microchip-isc.h
> +++ b/drivers/media/platform/microchip/microchip-isc.h
> @@ -139,6 +139,8 @@ struct isc_ctrls {
>  
>  	u32 brightness;
>  	u32 contrast;
> +	u32 hue;
> +	u32 saturation;
>  	u8 gamma_index;
>  #define ISC_WB_NONE	0
>  #define ISC_WB_AUTO	1
> @@ -343,6 +345,7 @@ struct isc_device {
>  	const u32	(*gamma_table)[GAMMA_ENTRIES];
>  	u32		gamma_max;
>  	u32		gamma_default;
> +	bool		has_cbhs;
>  
>  	u32		max_width;
>  	u32		max_height;
> diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> index 06aa801b88f9..f51c7cac25df 100644
> --- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> @@ -257,9 +257,8 @@ static void isc_sama7g5_config_cbc(struct isc_device *isc)
>  	/* Configure what is set via v4l2 ctrls */
>  	regmap_write(regmap, ISC_CBC_BRIGHT + isc->offsets.cbc, isc->ctrls.brightness);
>  	regmap_write(regmap, ISC_CBC_CONTRAST + isc->offsets.cbc, isc->ctrls.contrast);
> -	/* Configure Hue and Saturation as neutral midpoint */
> -	regmap_write(regmap, ISC_CBCHS_HUE, 0);
> -	regmap_write(regmap, ISC_CBCHS_SAT, (1 << 4));
> +	regmap_write(regmap, ISC_CBHS_HUE, isc->ctrls.hue);
> +	regmap_write(regmap, ISC_CBHS_SAT, isc->ctrls.saturation);
>  }
>  
>  static void isc_sama7g5_config_cc(struct isc_device *isc)
> @@ -463,6 +462,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
>  	isc->gamma_max = 2;
>  	/* Index 1 in the SAMA7G5 table is gamma 1/2.2 (sRGB). */
>  	isc->gamma_default = 1;
> +	isc->has_cbhs = true;
>  
>  	if (of_machine_is_compatible("microchip,sam9x7")) {
>  		isc->max_width = ISC_SAM9X7_MAX_SUPPORT_WIDTH;
> 


