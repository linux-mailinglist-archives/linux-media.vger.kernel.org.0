Return-Path: <linux-media+bounces-63175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDgWCHAYHGo+JwkAu9opvQ
	(envelope-from <linux-media+bounces-63175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 13:16:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E09615BDF
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 13:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BB14300CC38
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 11:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9070F3839BD;
	Sun, 31 May 2026 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZVFGm3n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA083839A7;
	Sun, 31 May 2026 11:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780226151; cv=none; b=qA6/Fez31xf+AEahWMtIOXpR3/iH3xkkR4ikKjqs0Txv+MqISCiXZ+Ut48jbS7BU4aZh7NTTfTH7uCq9fGG8fGN/ZWAHQxI5coXkcpbyKC9/LLVCbBGr8uTbmYcwdS+CPKadVtZO1KVWCwY22zu0MKHFx9Q/XH3gsEYxxrO/0j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780226151; c=relaxed/simple;
	bh=+AOKjE4PtFEzn10iFvjOLMkW2RSIqfpcoQwMnM66Mbg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=JUzrRn4ZuGT3K0k/Sx2lNDSCWNOU7VzdVMDWnYMOucZ/ir9J3JEw8ErBO1g8V2EGM7wLhGQ9UBDQLkhpxAVrvvtBUW346syJ2K1wWizthi7BZWu79KV75NT5j7+Oc7jJx4aYZsVViteE0wL8FjiXpZoup/JZCg3XV4CDpoKywFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZVFGm3n; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C69B1F00893;
	Sun, 31 May 2026 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780226148;
	bh=MmP6eMpNgWpOghHNBzUcCjRFl36x07LkIghuAUOYnNU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=KZVFGm3nLyedz47sTDn9OUj507dJQPrTjnZvpDOr/nSIrX/TM22Np8sZ0Lskc8PVN
	 XNo7EKsDWFbN28uhnCg7+l6WlyXbqsFA6FTehcqDssj4sAEravh+L0yXTdQawCbyv1
	 F4QpWcBTiYS3+XeZuS4TpIQFx0a+lLj99VRQmw4EJ6g8Y25rf2LLmRG45cpwHQOLrd
	 wqhVIp8Jr6kEsHZsmfboFCmxAF2nS13lUOJyt8kHUstDIaqDG7A3No0ATu1aBd2d8+
	 wFf3umXlvjjcBdfFa9l81u1x/loWlHHgREpcIZ3vVnG8g5C0vTnbUpQnxUbBvMLFPI
	 XYQPBvKNoaJXA==
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
Date: Sun, 31 May 2026 12:15:44 +0100
Message-Id: <178022614455.4008.17510287169443435896.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3966; i=bod@kernel.org;
 h=from:subject:message-id; bh=+AOKjE4PtFEzn10iFvjOLMkW2RSIqfpcoQwMnM66Mbg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqHBhiifeIX757nxzx8evWRdVHYcAPisUQrQWL2
 UYziwGBu4KJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahwYYgAKCRAicTuzoY3I
 Ot71D/9RR+aV3JHmmAI23cjDzuM4em1aiIUGo3EzeslqGpib1X2+PyUjAc52BgUEuoa3BdpY16Y
 dMXJJLZTHsbKCZ3Zt972mPotf/HCJSlYficO6wVEhdIfrJFktb/eeVBwg224xeicTDq8PSMS8fQ
 jHFu6wcqjGdIm7ynOeQ97/56uktY5MTuhIqiLlE8Mj/esSg2VrqQyp1DqckOrhP/idRC/7nsEkd
 vArUc37M+9+hvEcGCnL5AXdf/HmiUokirOigfg5fIxvTYEcoY8lblU7uVbRiVQGxbUVpFkV/l4S
 lPQiHlmuItlcZINbprNZ/R4fCIgATmRu5WInrNBf0y4zqLctAa30iUQUwGQgDqERz3UR7uaGJqD
 KtqYdVurwjtKEA5N67fE9vCIE137lFL97ktzj+SIslO+RIqtn3kkErfufvkXE1A6rvWMikQAz+p
 yHTN1W51Y4eKnXDqpSDvX63cD5APpQ4jQ1R/iBspLcChNSZu/+dp3/McIWerAIjcDtBQb8v9NmO
 iSItUs9ZtDLy2/cXw/qmp9FZsCgYShko8NJpTlUkhltJUV440Vd6aq5UTL9gBD2pRJjD+UEETmV
 6By+D0unSQ29Tohrjdn4vBCGFn5BJu6/fw62zGJSlFy0m2ildwbudTBU/UToNPmXzysEEwTSots
 JUtRWDCTdP7UjfA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63175-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: B5E09615BDF
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

Do you mean to switch on bpp or mbus_bpp here ? bpp probably.

ci flagged bpp was set but never used and now that I look at it it seems to
me your intention is switch (bpp)

Anyway please confirm and I can fix this up for you.

---
bod


