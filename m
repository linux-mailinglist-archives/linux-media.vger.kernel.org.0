Return-Path: <linux-media+bounces-57506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCnMKl4EyWmitQUAu9opvQ
	(envelope-from <linux-media+bounces-57506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 12:52:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EED5351A5E
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 12:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C31863043031
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 10:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236133101A9;
	Sun, 29 Mar 2026 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sTSAdpEv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454E431326B
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781408; cv=none; b=FSLRegCDKZQd8TQKPiEgeOihf97ZnuZ5DnG7KtlU2/ySAP0lZzE3ZiPlXPwnLo2DD5Fudf0Sf+UAYTpl3f4WJVUhl2wlpj4RYyyzuKl4E+KxZJGS7FAMX1UouuWvYtA1/wi+WtICs2pzjN+21V9WUUhpq9Hg8hAsI1jCpbEp1So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781408; c=relaxed/simple;
	bh=AN3sAmNNbiKJ+teL8SK8CEwRWwNKJ7V7rnfz21Xg/mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6gqxWoUlnpo8OdmVqwzcBdXJFovP2vtfdQIWs2JRSNQer+Sk8zXuOixidyNWXr0RXNfJX6mxcdWz124NxM/IH5pddDXH9TROU2QghuWZ1ZrsEiK3fAjoe5vRmyb0++Yni6tPf97x8AQKQ7PKDExolW6VzDyjBzt0SO02GsrVDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sTSAdpEv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48541edecf9so45458055e9.1
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774781406; x=1775386206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6bGthsA/HluNEiySMbkmvPrYIWTtWk+w9iiN/h8liA=;
        b=sTSAdpEvxP48+BtUWa8Tk67MPUP6piXG68+YEOjtiqFMVBfBeHbCS7flR8F8KNFrsf
         SsW0FcsjXO0Yc5Xiz42EzcejOuSfZsDhV4HkvFMuum5l1XwIyLjk5sI4n3tEJXBvXZkT
         tPDBPz+/cdmR8Ew5IIUOPDqJYFkPmBEDUVuUudpfC2y37HL+RmTrR5JVjZ3ePlnxky/j
         0GHaZdDoX7sLFvkW1Fva96s+k5qkK+y+qzqKf+Wx9Pu0q6THbDVg34TUhILr1pzehnvX
         YIZCBcQltEy3BZXpCN0qJnBLXD/vKdOC4RPtZnLdAqJn8LkpJeemh4h0SIjDRZUBrBAt
         m0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781406; x=1775386206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6bGthsA/HluNEiySMbkmvPrYIWTtWk+w9iiN/h8liA=;
        b=Zz9zft6HL07fwYE8Es3kX2mvlaWzzjeJao29HVljfrGCFEe7b9X+JYamz5gMehHJUN
         ZKR00NXmMCi2HGfYv4OkDRBz9AnMkCYtu5lDEh9ZFtMX0nHMiAs0lqDUrRpRmxJi56NH
         D00nk9V8TK7+WkOBmlR40dYzYPEb7zSUVxQWWgO9UEcnQYcAOWX5PptIXqR7T4oMEX9Y
         M0/TX70xTgUVPbIV40+/9+la/q9NpWqX8bbLJMO0OwT/uY9/93mCfEzx5GaGamkpQE56
         mrkTbEVA/PqFKOWX6AgYav00D3QDREs2/0ys8E9st903gCkDu6BZIG7Zg1XIJeYk4IAg
         vYjA==
X-Gm-Message-State: AOJu0Yy5VLe8szZpGw0XXV3e6DjLXilRkb+ITEyD8B9u2yBY/lBg1bkS
	WpuTrk7W+xDWyGeFGFmudZRjQOaqQ4qz7w2VaVKcjpYoxLSMs1OJ2EX8zx7tb5qFyCM=
X-Gm-Gg: ATEYQzzkbqZTWPAYBIQNFwqTr7Kj4q5KcuOs/wowmIELBdsLM1m9BuW03IYMVRCYhOv
	HEo+YVS4N9kAD7MIR1RvO5KXZ/h2I05tfunex/9WO5jFm3LPHpjNsd8jVU/4f2uCA3v0yOA0Fpt
	hyPmmUnKbXJonWuKdMZlVP3PJ7QAlXXcAMu2bqZFdKBLaXkyP5ziCaW5RcMaR5RGc8NkUTjJnMp
	j74vPY28eYt0foZEwoeBEo6yIyxfZ3FZdfExu/H8YGY9Oi2ALMfZWcYWy9GTEEGvIN6yElQz31G
	+R3Sd4Vgnc8LvM5n/2Ej4GOMQtBK3LfomktFU+j20VZyuT1SjUbracAlRQ2hHqIkpnHR0ghoqBm
	7MS17Ls68aeQe2fXS9a8RSzDaGk96K5mcVIRf5ofdQEFHPZ73Q0eppxAUeQMMn2Ic8JKmSajG1Q
	wjyakxtKOxDFHGZJmFrjMenJH+UmZ7d7k=
X-Received: by 2002:a05:600c:4e08:b0:485:363b:fafe with SMTP id 5b1f17b1804b1-48727d5e971mr156579715e9.1.1774781405588;
        Sun, 29 Mar 2026 03:50:05 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.41.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48730688605sm165034965e9.10.2026.03.29.03.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 03:50:05 -0700 (PDT)
Message-ID: <5589dc50-49a5-4165-bc4b-580e1a03d4ca@linaro.org>
Date: Sun, 29 Mar 2026 11:50:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] media: qcom: camss: csid-340: Enable PIX interface
 routing
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
 <20260313131750.187518-4-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313131750.187518-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57506-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EED5351A5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 13:17, Loic Poulain wrote:
> Add PIX path support to the CSID-340 driver. The hardware exposes a
> dedicated PIX interface in addition to the existing RDI paths, but
> the driver only supported RDI stream configuration so far.
> 
> Implements a dedicated __csid_configure_pix_stream() helper. The
> PIX path is configured similarly to RDI but uses the primary stream
> (VC0/DT0) and the appropriate CSID_CFG0/CSID_CTRL registers. Stream
> selection logic is also updated so RDI and PIX paths are configured
> independently.
> 
> The PIX pipeline can subsequently perform further processing,
> including scaling, cropping, and statistics.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../platform/qcom/camss/camss-csid-340.c      | 34 ++++++++++++++++++-
>   1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index ef13c4c50ab2..094fdd3697ad 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -56,6 +56,8 @@
>   #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
>   
>   #define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
> +#define CSID_PIX_SRC_STREAM		CSID_MAX_RDI_SRC_STREAMS
> +#define CSID_PIX_SRC_PAD		(MSM_CSID_PAD_FIRST_SRC + CSID_PIX_SRC_STREAM)
>   
>   enum csid_iface {
>   	CSID_IFACE_PIX,
> @@ -64,10 +66,11 @@ enum csid_iface {
>   	CSID_IFACE_RDI2,
>   };
>   
> -static enum csid_iface csid_vc_iface_map[CSID_MAX_RDI_SRC_STREAMS] = {
> +static enum csid_iface csid_vc_iface_map[MSM_CSID_MAX_SRC_STREAMS] = {
>   	[0] = CSID_IFACE_RDI0,
>   	[1] = CSID_IFACE_RDI1,
>   	[2] = CSID_IFACE_RDI2,
> +	[3] = CSID_IFACE_PIX,
>   };
>   
>   static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
> @@ -123,6 +126,31 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, bool enable, u
>   	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
>   }
>   
> +static void __csid_configure_pix_stream(struct csid_device *csid, bool enable)
> +{
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[CSID_PIX_SRC_PAD];
> +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +	u32 val;
> +
> +	val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
> +	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
> +
> +	/* For PIX we use the same VC/DTID as RDI0 (0) to capture the main stream */
> +	val |= FIELD_PREP(CSID_CFG0_VC_MASK, 0);
> +	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, 0);
> +
> +	if (enable)
> +		val |= CSID_CFG0_ENABLE;
> +
> +	dev_dbg(csid->camss->dev, "CSID%u: Stream %sable PIX (dt:0x%x df:0x%x)\n",
> +		csid->id, enable ? "en" : "dis", format->data_type, format->decode_format);
> +
> +	writel_relaxed(val, csid->base + CSID_CFG0(CSID_IFACE_PIX));
> +	writel_relaxed(enable, csid->base + CSID_CTRL(CSID_IFACE_PIX));
> +}
> +
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   {
>   	int i;
> @@ -134,6 +162,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   		if (csid->phy.en_vc & BIT(i))
>   			__csid_configure_rdi_stream(csid, !!enable, i);
>   	}
> +
> +	/* PIX */
> +	if (csid->phy.en_vc & BIT(CSID_PIX_SRC_STREAM))
> +		__csid_configure_pix_stream(csid, !!enable);
>   }
>   
>   static int csid_reset(struct csid_device *csid)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

