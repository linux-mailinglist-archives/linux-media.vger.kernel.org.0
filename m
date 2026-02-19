Return-Path: <linux-media+bounces-53104-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFrrJXkxl2kcvgIAu9opvQ
	(envelope-from <linux-media+bounces-53104-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:51:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB39160619
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFDEB3016269
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 15:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6058734A76E;
	Thu, 19 Feb 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x1eCrl4H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875F34A3D9
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516278; cv=none; b=BfimTjlytooxLaUsmRTRJPkWPFgCxKvCmTLdKHbONgrXQkfrqcd29ztnhVwqJKHu+HyBZ9MmRWwdbO/4JWV01Q0g3vDUUo5Wa0N7YQkQqpLtKuEHHyyPRpzyHciiTH3JaHwNepy8PLAC2CtmkUuRnv+gRmrhmwiRWxOR9lwgdf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516278; c=relaxed/simple;
	bh=ODFwwXoRVjbg5ASiqI3JvCuqjJsJcoTjporBqEvLB54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArIh5eJavHBOjla97rCDZX/qrwGf+S9/dUn7fDAVBJ8lwd8oeGuwu5u0B9wB9orRyMc1TeS9ElaTaYIJyhgXVOrzxF2tDTN9uK+nqWW+4Yk/5rnBR2yICRCl4Yf/j2sX7xM3nUAwhciNVzKKaUWMsGrPT7ScgE0OP6FxbUnMTtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x1eCrl4H; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483a233819aso6315135e9.3
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 07:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771516275; x=1772121075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6bmYmrM1uJ1f/mzBWOAIkHYrJfIo9TYZxvrZO7Xg+M=;
        b=x1eCrl4HKdsL0U/WDYJRvtF39HI5enhrfUr+2g47FPlr48ZvEL1rIcn7xF/ejJQKAb
         pEuC/qm50Cub65Mzqzlrh3xlS1IMx/ocB7fKXVqoMhPL1rF4eyont565qeHvzEgzigJ/
         E/qRzX04rMDA3fHXWguvsekeCtPnfnIjx9aSRniZoIwURnggzw0Kh3/Y1F96UlJQttED
         EH8rlNwjjx1k+nY1jRz/MphLmYKSVx7LOfwY0bl8d7ldUaXMjxaHOirX/ZkAlpckRwxy
         ClawJ6uJLZIyKFliRRcsbgiuIzE/GLjepJ6zJ2XZiC4XIg7OIKWapIj/zHooSn7mEYM6
         LlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516275; x=1772121075;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6bmYmrM1uJ1f/mzBWOAIkHYrJfIo9TYZxvrZO7Xg+M=;
        b=b41GSmovKoQBXM293LjYN3EzsdNatDzoeY2u3jEZUWsPl2IKo3XlZwdM2+9Fw6rlHm
         4aFGtwGEgCA8i9RvRsoqQpB580FjIjkckzzXScq2tK+4eZ5tt8PjMCLvOU/tna+wJnpP
         woF9Xt2r3A0UXUHJOSSx69t4khBUNq1g4K8QaGnxyPGKsSaEJ87zND/P1Jkz9Ehc4bwQ
         afxtpPcAp1N+hOLIdaHBPi/0GEuBXvWOl8yTYfGXfFCDQDzwljZedAAH1CLueZPLvWhq
         1qFNk5AQkM/ezLR2Ot3AUTJwBKgXsFbpPQxeWkDBI9IRxNVJxPysN7kcWgGDQi8QOqTG
         5V1Q==
X-Gm-Message-State: AOJu0YwCIl9uUtxxv1BBeruVJsrzS7HANuYY2TEebOpX4XPl71eAV6t+
	eaJk+LaJTxABBewcnxq/h0qXsheR06GTiQt3DBXGkK/Khv/rsi3xQMZcZT9z+tTc+jQ=
X-Gm-Gg: AZuq6aJUJQY4oKEx8kG3fJSToFN39ogQWn4oX/xHcWdBPsvDxH1aD3mFUjrQkTtLc6Z
	ddrsh4UCi3sRytwNjQJcFH131nV9aM/EGzCVcKQ5oxvUFQDGHt58dxCK8KPZlPBxjeTrB3Y+Tjv
	FZi+PxbO+bECbgVYhrqr+s3uJteV8Nn8m9TxEuxf67rlpPCfemsAprG1+JbjbwBDe6LvF8a21O6
	ZKM9h5yJdyIVgLQm4D0riG/oc2T2ygoAfQa/Bk1iEiLXY0LvKrx6mYbHhncEbxd/AIYrtoBQlhZ
	Kpp3uF27IXm2CSAIHD8y75X5Up1LTGuFvwTBCMZ8skGDSMxhTu+C2nRcl3rCZjT6D1kBGwfq6nr
	2hEh1+7m6CjkSV/jJvzh4+hRwCBsSHxbOq26HOpo4Xgl7N9tq+jGh5Rx8j0/iNxOUJp8Ysw7bSu
	VfiPTav3T6kghHv2rLeo1x0sTcz+3jBKyQ8JoNMNgCVRxZsH+K38qrHm4eAhOkizXiZDwfGSglF
	L0=
X-Received: by 2002:a05:600c:3b01:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-48398a678e6mr97258585e9.3.1771516274692;
        Thu, 19 Feb 2026 07:51:14 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31bc068sm9361445e9.4.2026.02.19.07.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 07:51:14 -0800 (PST)
Message-ID: <708b6179-90b9-4fe9-9c0c-738fc1c82c2e@linaro.org>
Date: Thu, 19 Feb 2026 15:51:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: csid-340: Enable PIX path support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
 johannes.goede@oss.qualcomm.com
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-3-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260219152737.728106-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-53104-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 0DB39160619
X-Rspamd-Action: no action

On 19/02/2026 15:27, Loic Poulain wrote:
> Add support for CSID to PIX interface.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../platform/qcom/camss/camss-csid-340.c      | 85 ++++++++++++-------
>   1 file changed, 55 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index 2b50f9b96a34..f7b4cb054c55 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -41,19 +41,24 @@
>   #define		CSI2_RX_CFG1_MISR_EN			BIT(6)
>   #define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
>   
> -#define CSID_RDI_CFG0(rdi)					(0x300 + 0x100 * (rdi))
> -#define		CSID_RDI_CFG0_BYTE_CNTR_EN		BIT(0)
> -#define		CSID_RDI_CFG0_TIMESTAMP_EN		BIT(1)
> -#define		CSID_RDI_CFG0_DECODE_FORMAT_MASK	GENMASK(15, 12)
> -#define		CSID_RDI_CFG0_DECODE_FORMAT_NOP		CSID_RDI_CFG0_DECODE_FORMAT_MASK
> -#define		CSID_RDI_CFG0_DT_MASK			GENMASK(21, 16)
> -#define		CSID_RDI_CFG0_VC_MASK			GENMASK(23, 22)
> -#define		CSID_RDI_CFG0_DTID_MASK			GENMASK(28, 27)
> -#define		CSID_RDI_CFG0_ENABLE			BIT(31)
> -
> -#define CSID_RDI_CTRL(rdi)					(0x308 + 0x100 * (rdi))
> -#define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
> -#define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
> +#define CSID_CFG0(iface)					(0x300 + 0x100 * (iface))
> +#define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
> +#define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
> +#define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
> +#define		CSID_CFG0_DECODE_FORMAT_NOP		CSID_CFG0_DECODE_FORMAT_MASK
> +#define		CSID_CFG0_DT_MASK			GENMASK(21, 16)
> +#define		CSID_CFG0_VC_MASK			GENMASK(23, 22)
> +#define		CSID_CFG0_DTID_MASK			GENMASK(28, 27)
> +#define		CSID_CFG0_ENABLE			BIT(31)
> +
> +#define CSID_CTRL(iface)					(0x308 + 0x100 * (iface))
> +#define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
> +#define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
> +
> +#define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
> +#define CSID_PIX_SRC_STREAMS		CSID_MAX_RDI_SRC_STREAMS

This I think is fairly common - PIX is ~ always the last one of four - 
should probably be in the shared csid.h
> +
> +#define CSID_IFACE_PIX	-1

-1 ?

>   
>   static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
>   {
> @@ -69,11 +74,6 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
>   	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
>   }
>   
> -static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
> -{
> -	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
> -}
> -
>   static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
>   {
>   	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
> @@ -88,7 +88,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	 * the four least significant bits of the five bit VC
>   	 * bitfield to generate an internal CID value.
>   	 *
> -	 * CSID_RDI_CFG0(vc)
> +	 * CSID_CFG0(vc)
>   	 * DT_ID : 28:27
>   	 * VC    : 26:22
>   	 * DT    : 21:16
> @@ -97,18 +97,40 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	 */
>   	dt_id = vc & 0x03;
>   
> -	val = CSID_RDI_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
> -	val |= FIELD_PREP(CSID_RDI_CFG0_DT_MASK, format->data_type);
> -	val |= FIELD_PREP(CSID_RDI_CFG0_VC_MASK, vc);
> -	val |= FIELD_PREP(CSID_RDI_CFG0_DTID_MASK, dt_id);
> +	val = CSID_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
> +	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
> +	val |= FIELD_PREP(CSID_CFG0_VC_MASK, vc);
> +	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, dt_id);
>   
>   	if (enable)
> -		val |= CSID_RDI_CFG0_ENABLE;
> +		val |= CSID_CFG0_ENABLE;
>   
> -	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
> +	dev_dbg(csid->camss->dev, "CSID%u: Stream %s RDI (dt:0x%x vc=%u)\n",
>   		csid->id, enable ? "enable" : "disable", format->data_type, vc);
>   
> -	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +	writel_relaxed(val, csid->base + CSID_CFG0(vc));
> +	writel_relaxed(!!enable, csid->base + CSID_CTRL(vc));
> +}
> +
> +static void __csid_configure_pix_stream(struct csid_device *csid, u8 enable)
> +{
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PADS_NUM - 1];
> +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +	u32 val;
> +
> +	val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
> +	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
> +
> +	if (enable)
> +		val |= CSID_CFG0_ENABLE;
> +
> +	dev_dbg(csid->camss->dev, "CSID%u: Stream %s PIX (dt=0x%x df=0x%x)\n",
> +		csid->id, enable ? "enable" : "disable", format->data_type, format->decode_format);
> +
> +	writel_relaxed(val, csid->base + CSID_CFG0(CSID_IFACE_PIX));
> +	writel_relaxed(!!enable, csid->base + CSID_CTRL(CSID_IFACE_PIX));
>   }
>   
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
> @@ -117,12 +139,15 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   
>   	__csid_configure_rx(csid, &csid->phy);
>   
> -	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> -		if (csid->phy.en_vc & BIT(i)) {
> +	/* RDIs */
> +	for (i = 0; i < CSID_MAX_RDI_SRC_STREAMS; i++) {
> +		if (csid->phy.en_vc & BIT(i))
>   			__csid_configure_rdi_stream(csid, enable, i);
> -			__csid_ctrl_rdi(csid, enable, i);
> -		}
>   	}
> +
> +	/* PIX */
> +	if (csid->phy.en_vc & BIT(CSID_PIX_SRC_STREAMS))
> +		__csid_configure_pix_stream(csid, enable);
>   }
>   
>   static int csid_reset(struct csid_device *csid)


