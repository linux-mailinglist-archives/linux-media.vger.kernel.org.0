Return-Path: <linux-media+bounces-53103-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNjvJ3oxl2kcvgIAu9opvQ
	(envelope-from <linux-media+bounces-53103-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:51:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 123AE160620
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD6913040188
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 15:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F7234A3DA;
	Thu, 19 Feb 2026 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7mrMAFJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76850341ACA
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516029; cv=none; b=aOcqXEHNLvadcykEWodFzjzKENOCAz3PIc0ouMcJJAsO3gEg2WjRdlEtVDv4mRg3/sytnZ/63awJR6LfGotVy8qn+8SdrKBwl8+wAEB5U+Iw2qYCL+ZsvhtYSv3GOb4NuKLW3Q0lCFBVRmb/W8oxM5b6oj688H6CsEL+SieHgJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516029; c=relaxed/simple;
	bh=TzHq7yZav8bCw98c2j+ZEsSou8N6PSuWdtv9PXDbB7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVI/d/eP2bHKul90Sa7MVPOR18z0+aZlRsU5b5aVd8mHpz0AJIUJv6j3CZfv9pTZMXpuLqh2TGOTMxNdqiTAhQ2QPmdp8HGZ9ufuaUj8OuoKuMXg+QodJFPQJbm4PT01SKKNw+g8umLiXa4ppniGyALVcqyJt1WlHQ/C71Apz5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7mrMAFJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48336a6e932so7637305e9.3
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 07:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771516025; x=1772120825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/WXokARy7ojyMrrntZZoQPMIh+cmGhr9QHx5QEScEM=;
        b=F7mrMAFJDGbXIGRGb4RotiYBsFsl5GB0tn1W3SD0W8j0+wgRb2UJVNrCzzuX2KjQ+u
         XQDLzwh/uJ+1Kwj7js7qBWwvpx3v2UWN6E2vFJa3JRyeE3qFrMm5iUGp5P6Z20oJg8Ya
         7hCg8z95nxb0qzB6UeaA7rKd5JinAdEl6HjJOnPgc57vcKh4kO43Il+iJIwTntxgKvdg
         E7iv8DyRNlqeWtyMnLBOcErjkuK8pAJvKXle0SixvKiv4aMiUThtvBB37NPhOP3j6bq6
         TU2ITz7RaDBLzi754VuiWr43EjnX0wN/D2JuX3VVj1yoo5TcTtsYmtaiH9gPXe99PdkZ
         TLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516025; x=1772120825;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/WXokARy7ojyMrrntZZoQPMIh+cmGhr9QHx5QEScEM=;
        b=NibvqTDjaAtf7slC1WcUXta3Cj/+LARxneonr8hXgU7PR7pp2pHYnjsuz+92sL897O
         1LZ95dI2voh103ExD5mKyJasMOBzV42mJ7/hFMQLGATNUqi6r+K5FjuLzD+9vRjSYorW
         JRaOUt0Y8X5YQaHDsFUGntxdFq0VOu344E+ZR9XexWU8bQdpsB/9lAX7tIrq5wVY4tGv
         eSTUip6y/H/8K2KvMb9FKKJSybWeLp48dNPG7LF++cgnuusw6nEXMaaFbYAuhLM0C+6b
         8B+GJKJEO+6xj2mFOG1Zc3ZMVu6bQc8ZlbbYP55Gfdjf9MQTFP8iWhOLYNd6cik5ME2+
         n8xQ==
X-Gm-Message-State: AOJu0Ywoi1xGYskvmLuEWYDGqCseapZTsE3Ebg4F15ToFRtAvKDcG1mf
	0A1paX7vCrg1QNvvUQkjEbRkXZh4SBNUZZGrQJpm3HS6mQ2NPmpdpHUEbItPbTr/gDY=
X-Gm-Gg: AZuq6aLssoeGgJCLfjPS83ca6KD2lX6uWp+k/B4Lc2nhgsJMrjnu7zxigpBDunZnTry
	f0IaX8z6cVjaT5L5qSANRN1xY4LB8whXFCd9O+Nz+DQwg30/DsdZqvnR6gkSFHmxW352dksZzCl
	xlS4ElF/h1AcBmus0N7ee5MqckZrz3Kx2MwGNtDL3hZNnclyzjA/qJFSiQFBOqs/Y4KkYENqptv
	VvK9LjB8deoqUyYL6lsQJbxKqskRytTh9WadhgpnhEPxdPzFXFccv89wEtbDu0j2SomzHXBQS+f
	lB4SP9k1hMS5mbe6EBjnp8oVSDHbgHshLd+lu6+gEi6EtG/80/zMHQUqxfZAwmaNsR4CEkuAxq/
	sWWPhH6vZwpN4cAXHy+9zr12uNp2nND0HKh1J/k4/hstSkYggtX3Z0tcHMUpvbwuFo0T6J4Pd4w
	/1KvbC5P1dc0QOSf/9xVqce9JsHAP2YN5+8k8K5Mpmd6ANAQ5RDcooISfTCGag7lUC
X-Received: by 2002:a05:600c:8119:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-48379be8248mr307196845e9.18.1771516024632;
        Thu, 19 Feb 2026 07:47:04 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f9835f9sm18636785e9.19.2026.02.19.07.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 07:47:04 -0800 (PST)
Message-ID: <e286c232-f307-42b3-8b3b-c25b62389c90@linaro.org>
Date: Thu, 19 Feb 2026 15:47:01 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe-340: Proper client handling
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
 johannes.goede@oss.qualcomm.com
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-2-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260219152737.728106-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-53103-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 123AE160620
X-Rspamd-Action: no action

On 19/02/2026 15:27, Loic Poulain wrote:
> We need to properly map camss WM index to our internal WM client
> instance. Today we're only support RDI interfaces with the RDI_WM
> macro, introduce a __wm_to_client helper to support any interface.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../media/platform/qcom/camss/camss-vfe-340.c | 94 +++++++++++--------
>   1 file changed, 53 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> index 30d7630b3e8b..c6ea8b6216c2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -69,24 +69,19 @@
>   #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
>   #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
>   
> -/*
> - * TODO: differentiate the port id based on requested type of RDI, BHIST etc
> - *
> - * TFE write master IDs (clients)
> - *
> - * BAYER		0
> - * IDEAL_RAW		1
> - * STATS_TINTLESS_BG	2
> - * STATS_BHIST		3
> - * STATS_AWB_BG		4
> - * STATS_AEC_BG		5
> - * STATS_BAF		6
> - * RDI0			7
> - * RDI1			8
> - * RDI2			9
> - */
> -#define RDI_WM(n)		(7 + (n))
> -#define TFE_WM_NUM		10
> +enum tfe_client {
> +	TFE_CLI_BAYER,
> +	TFE_CLI_IDEAL_RAW,
> +	TFE_CLI_STATS_TINTLESS_BG,
> +	TFE_CLI_STATS_BHIST,
> +	TFE_CLI_STATS_AWB_BG,
> +	TFE_CLI_STATS_AEC_BG,
> +	TFE_CLI_STATS_BAF,
> +	TFE_CLI_RDI0,
> +	TFE_CLI_RDI1,
> +	TFE_CLI_RDI2,
> +	TFE_CLI_NUM
> +};
>   
>   enum tfe_iface {
>   	TFE_IFACE_PIX,
> @@ -108,6 +103,13 @@ enum tfe_subgroups {
>   	TFE_SUBGROUP_NUM
>   };
>   
> +static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
> +	[VFE_LINE_RDI0] = TFE_CLI_RDI0,
> +	[VFE_LINE_RDI1] = TFE_CLI_RDI1,
> +	[VFE_LINE_RDI2] = TFE_CLI_RDI2,
> +	[VFE_LINE_PIX] = TFE_CLI_BAYER,
> +};
> +
>   static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
>   	[VFE_LINE_RDI0] = TFE_IFACE_RDI0,
>   	[VFE_LINE_RDI1] = TFE_IFACE_RDI1,
> @@ -126,6 +128,16 @@ static enum vfe_line_id tfe_subgroup_line_map[TFE_SUBGROUP_NUM] = {
>   	[TFE_SUBGROUP_RDI2] = VFE_LINE_RDI2,
>   };
>   
> +static inline enum tfe_client  __wm_to_client(u8 wm)
redundant space

> +{
> +	if (wm >= ARRAY_SIZE(tfe_wm_client_map)) {
> +		pr_warn("VFE: Invalid WM%u\n", wm);
> +		return TFE_CLI_RDI0;
> +	}

Why or how would this happen ?

> +
> +	return tfe_wm_client_map[wm];
> +}
> +
>   static inline enum tfe_iface  __line_to_iface(enum vfe_line_id line_id)
>   {
>   	if (line_id <= VFE_LINE_NONE || line_id >= VFE_LINE_NUM_MAX) {
> @@ -209,10 +221,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>   	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
>   	if (status) {
>   		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
> -		for (i = 0; i < TFE_WM_NUM; i++) {
> +		for (i = 0; i < TFE_CLI_NUM; i++) {
>   			if (status & BIT(i))
>   				dev_err_ratelimited(vfe->camss->dev,
> -						    "VFE%u: bus overflow for wm %u\n",
> +						    "VFE%u: bus overflow for client %u\n",
>   						    vfe->id, i);
>   		}
>   	}
> @@ -235,49 +247,49 @@ static void vfe_enable_irq(struct vfe_device *vfe)
>   	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
>   }
>   
> -static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>   			  struct vfe_line *line)
>   {
> -	u8 wm = RDI_WM(rdi);
> +	u8 client = __wm_to_client(wm);
>   
> -	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
> +	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
>   }
>   
> -static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>   {
>   	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
>   	u32 stride = pix->plane_fmt[0].bytesperline;
> -	u8 wm = RDI_WM(rdi);
> +	u8 client = __wm_to_client(wm);
>   
>   	/* Configuration for plain RDI frames */
> -	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(wm));
> -	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
> -	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(wm));
> -	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(wm));
> -	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(wm));
> +	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> +	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> +	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> +	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
> +	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
>   
>   	/* No dropped frames, one irq per frame */
> -	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
> -	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
> -	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
> -	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
> +	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
> +	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
> +	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client));
> +	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client));
>   
>   	vfe_enable_irq(vfe);
>   
>   	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
> -	       vfe->base + TFE_BUS_CLIENT_CFG(wm));
> +	       vfe->base + TFE_BUS_CLIENT_CFG(client));
>   
> -	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
> -		vfe->id, rdi, pix->width, pix->height, stride);
> +	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
> +		vfe->id, client, pix->width, pix->height, client);
>   }
>   
> -static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
>   {
> -	u8 wm = RDI_WM(rdi);
> +	u8 client = __wm_to_client(wm);
>   
> -	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
> +	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
>   
> -	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
> +	dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, client);
>   }
>   
>   static const struct camss_video_ops vfe_video_ops_520 = {

Otherwise seems fine.

Your series title got mangled somewhere BTW.

---
bod


