Return-Path: <linux-media+bounces-62993-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IE4LavNGGpjnggAu9opvQ
	(envelope-from <linux-media+bounces-62993-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:20:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3041E5FB5A9
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 852C130DC1E9
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 23:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0649371CF1;
	Thu, 28 May 2026 23:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0tVZwKT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE33736F91D;
	Thu, 28 May 2026 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780010170; cv=none; b=j5vLsrLo9Fx6oJ4LBzl18zI/9AoHM9dPzT6ZrnfdK3svBQ/JZkEHI1fgQPHelc6RVEGP/3LAvFYvrI1264cdmg/HyGKU/F25trwJ+yS+zXN5Bgzg8z4bPkM32hFzaIEu9ZIKmMOTQLVY1tCZthPKiZVyi/oZd18eoK/4seUU1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780010170; c=relaxed/simple;
	bh=Y4yC2cJXsAW117xlMYbe6HSIDdWUAsaQE9HmItYt0ds=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ZZ264NOh0CxUQxxyoKya40cczt0czzsaC7aRxyOKEVcPTWMl+PhILVcDIJdanBE2Usr98rRsKJTVhib6EUQiuIFcix55HeUMUtkFS8Nr+tt9PIsxnW8kwPWVRt2T8i9C7Jpp9x0F2B/Z93a6ZNUR3+eigVJ6+mKch8Z586JIStg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0tVZwKT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24B61F00A3A;
	Thu, 28 May 2026 23:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780010168;
	bh=vtWSlz05mwN/OppBwdY6wKRfOcrYi2X3b6estq5JAq4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=c0tVZwKTk9kOm5BqRZYABwrdP1ve2jykaduIKa0oMyZCK9OZnpJXj16MgyOXiNBFK
	 Q+EqcXJXAx4spC+eBR8fbKGMATLZVTzCdQ+n1n/h9Jjc8nQWwC9lINCgWfVNQoz6fh
	 WxkEjOH5UELLHNU8QzR68OmozlXxOzSebgBp2/iPCpAMYo3sxszWG2Gi96r4dVcx3R
	 xkt9+u+MLZsKMQhbbvJkA2EnbKUixUy0usDy4PTBkRVHKGL9ZLcIik9dJPvmFJAzSp
	 DjYtRxqTrT/1nwx42S2yEuE0/NKrbdN/JmMAUzjW9U5+x+ZH2ACDeZFbl6+xBuHkNJ
	 anKz3BXo+Dlqw==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 5/5] media: qcom: camss: vfe-340: Support for PIX
 client
From: bod@kernel.org
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com, 
 dmitry.baryshkov@oss.qualcomm.com
In-Reply-To: <20260414185202.2714019-6-loic.poulain@oss.qualcomm.com>
References: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
 <20260414185202.2714019-6-loic.poulain@oss.qualcomm.com>
Date: Fri, 29 May 2026 00:16:03 +0100
Message-Id: <178001016320.17898.16333899791163571417.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=7170; i=bod@kernel.org;
 h=from:subject:message-id; bh=Y4yC2cJXsAW117xlMYbe6HSIDdWUAsaQE9HmItYt0ds=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGMy1WeE7KYDp5vCW6DL2J0wX0f2DzeIy5k+nn
 +alLCU2vk6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahjMtQAKCRAicTuzoY3I
 OnmcD/4+rM2nPtzLVmYlcez/YaADPuNTN9jvO/256OASBhZoYG2GJklxfsX9oRTGOK7qcgKEb+C
 5Q3HiGl8FPHyk/Jk+uHcceJwVHa53y6aubUhFJYLzeE7s/t9vRR6Ed1FHN7o31cXoG347mXcaJ9
 ldfGGj41QHMyArJLW9RA89HVpPn6SFlF041Qe52AQjvyVWUMy6IeDh4nwmIsXqJvf2XjQSOdqdz
 ePtS5msANPpc0HrZtV+daMgezJdFKs/qkXO6Q0i+HYHFtLQA8FiTEBnUEY5HA1qXBPT9yq9abAn
 mv22O12NhN8J/XgazBnFIpnMLiGeCq9nqkrK8FWXq2ti1ntuMa6QaGZ9ckRtkQfKtM4i69uiv5W
 5OFI8u3IJDl+1m3S2Em82KL/o4zvcqm46AM50EDIEafVo4xbKMroftRSUN5eGT53rahyrLqBJKm
 p9TENLtJkSGOj8KMOEY26tcoxrCzh6+jJYH1RJ7EmJHwJ3oBzfLnl+Jh9uLsSIP5ebwzr3IQ1S2
 oX9Q2a8bEBpGFRbKj69wZ645kMAYlfsIIhTz3hlEHA/IQPkC72NhLXWO43Wu7GPIhNDhl1h5fL1
 D613vjmrLuFQxrSedDqsQhJKn23fl9k8XlxhhPvl6FA05SASMnpaTRIDa5k18UVFK2j6BDrkMHx
 ist9L6psVVroZWw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62993-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 3041E5FB5A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-14 20:52 +0200, Loic Poulain wrote:
> Add support for the vfe-340 PIX write engine, enabling frame capture
> through the PIX video device (e.g. msm_vfe0_pix). The PIX path requires
> a separate configuration flow from RDI, including cropping setup, line-
> based write engine configuration, and the correct packer format based
> on the input pixel format.
> 
> In contrast to RDI, the PIX interface embeds a lightweight processing
> engine we can use for cropping, configuring custom stride/alignment,
> and, in the future, extracting frame statistics.
> 
> The functionality has been validated on Arduino-Uno-Q with:
> media-ctl -d /dev/media0 --reset
> media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
> media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SRGGB8_1X8/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB8_1X8/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB8_1X8/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB8_1X8/640x480 field:none]'
> yavta -B capture-mplane --capture=3 -n 3 -f SRGGB8 -s 640x480 /dev/video3
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/camss/camss-vfe-340.c | 82 ++++++++++++++++---
>  1 file changed, 72 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> index d129b0d3a6ed..a01b78c805cd 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -54,6 +54,7 @@
>  
>  #define TFE_BUS_CLIENT_CFG(c)				BUS_REG(0x200 + (c) * 0x100)
>  #define		TFE_BUS_CLIENT_CFG_EN		BIT(0)
> +#define		TFE_BUS_CLIENT_CFG_AUTORECOVER	BIT(4)
>  #define		TFE_BUS_CLIENT_CFG_MODE_FRAME	BIT(16)
>  #define TFE_BUS_IMAGE_ADDR(c)				BUS_REG(0x204 + (c) * 0x100)
>  #define TFE_BUS_FRAME_INCR(c)				BUS_REG(0x208 + (c) * 0x100)
> @@ -63,12 +64,23 @@
>  #define TFE_BUS_IMAGE_CFG_2(c)				BUS_REG(0x214 + (c) * 0x100)
>  #define		TFE_BUS_IMAGE_CFG_2_DEFAULT	0xffff
>  #define TFE_BUS_PACKER_CFG(c)				BUS_REG(0x218 + (c) * 0x100)
> +#define		TFE_BUS_PACKER_CFG_FMT_PLAIN8	0x1
>  #define		TFE_BUS_PACKER_CFG_FMT_PLAIN64	0xa
> +#define		TFE_BUS_PACKER_CFG_FMT_MIPI10	0xc
> +#define		TFE_BUS_PACKER_CFG_FMT_MIPI12	0xd
>  #define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)			BUS_REG(0x230 + (c) * 0x100)
>  #define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)			BUS_REG(0x234 + (c) * 0x100)
>  #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
>  #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
>  
> +#define PP_CROP_REG(a)					(0x2800 + (a))
> +#define TFE_PP_CROP_CFG					PP_CROP_REG(0x60)
> +#define		TFE_PP_CROP_CFG_EN	(BIT(0) | BIT(9))
> +#define	TFE_PP_CROP_LINE_CFG				PP_CROP_REG(0x68)
> +#define		TFE_PP_CROP_FIRST	GENMASK(29, 16)
> +#define		TFE_PP_CROP_LAST	GENMASK(13, 0)
> +#define	TFE_PP_CROP_PIX_CFG				PP_CROP_REG(0x6C)
> +
>  enum tfe_client {
>  	TFE_CLI_BAYER,
>  	TFE_CLI_IDEAL_RAW,
> @@ -245,18 +257,69 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>  	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
>  }
>  
> +static u32 vfe_packer_format(struct vfe_device *vfe, u32 pixelformat)
> +{
> +	const struct camss_formats *fmt = vfe->res->formats_rdi;
> +	unsigned int bpp = 0;
> +	int i;
> +
> +	for (i = 0; i < fmt->nformats; i++) {
> +		if (fmt->formats[i].pixelformat == pixelformat) {
> +			bpp = fmt->formats[i].mbus_bpp;
> +			break;
> +		}
> +	}
> +
> +	switch (fmt->formats[i].mbus_bpp) {
> +	case 10:
> +		return TFE_BUS_PACKER_CFG_FMT_MIPI10;
> +	case 12:
> +		return TFE_BUS_PACKER_CFG_FMT_MIPI12;
> +	default:
> +		return TFE_BUS_PACKER_CFG_FMT_PLAIN8;
> +	}
> +}
> +
>  static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>  {
>  	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
>  	u32 stride = pix->plane_fmt[0].bytesperline;
>  	u8 client = tfe_wm_client_map[wm];
> -
> -	/* Configuration for plain RDI frames */
> -	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> -	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> -	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> -	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
> -	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
> +	u32 cfg = TFE_BUS_CLIENT_CFG_EN;
> +
> +	if (client == TFE_CLI_BAYER) { /* PIX - Line based */
> +		struct v4l2_rect *crop = &line->crop;
> +
> +		/* Cropping */
> +		writel_relaxed(TFE_PP_CROP_CFG_EN, vfe->base + TFE_PP_CROP_CFG);
> +		writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->top) |
> +			       FIELD_PREP(TFE_PP_CROP_LAST, crop->top + crop->height - 1),
> +			       vfe->base + TFE_PP_CROP_LINE_CFG);
> +		writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->left) |
> +			       FIELD_PREP(TFE_PP_CROP_LAST, crop->left + crop->width - 1),
> +			       vfe->base + TFE_PP_CROP_PIX_CFG);
> +
> +		/* Write Engine */
> +		writel_relaxed(pix->width | (pix->height << 16),
> +			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> +		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> +		writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> +		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
> +		writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
> +			       vfe->base + TFE_BUS_PACKER_CFG(client));
> +
> +		cfg |= TFE_BUS_CLIENT_CFG_AUTORECOVER;
> +	} else { /* RDI - Frame based */
> +		writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
> +			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> +		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> +		writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT,
> +			       vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> +		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
> +		writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64,
> +			       vfe->base + TFE_BUS_PACKER_CFG(client));
> +		cfg |= TFE_BUS_CLIENT_CFG_MODE_FRAME;
> +	}
>  
>  	/* No dropped frames, one irq per frame */
>  	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
> @@ -266,11 +329,10 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>  
>  	vfe_enable_irq(vfe);
>  
> -	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
> -	       vfe->base + TFE_BUS_CLIENT_CFG(client));
> +	writel(cfg, vfe->base + TFE_BUS_CLIENT_CFG(client));
>  
>  	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
> -		vfe->id, client, pix->width, pix->height, client);
> +		vfe->id, client, pix->width, pix->height, stride);
>  }
>  
>  static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
> -- 
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


