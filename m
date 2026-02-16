Return-Path: <linux-media+bounces-52838-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHmBNw3WkmnKywEAu9opvQ
	(envelope-from <linux-media+bounces-52838-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:32:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4870B14193F
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D375B300B078
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 08:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084483033C5;
	Mon, 16 Feb 2026 08:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ak0S/KE8"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E091E571;
	Mon, 16 Feb 2026 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230719; cv=none; b=QGWZWA2ZN4KfvyLJLJcpxOomUFfpjR6Zcnxd8vMlBKZQDXa2gcbMOuxHguOeMP6H1LoLU91mNFxAu0Kw3cfN1HKUUYKGJdbqQS9TDyjoGIFWBVdMZcjNCKKCGqSvFF3/di+sQYlmwwggSG6o3mrnHVLFI0+uD0iy+rdhA0Q2StI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230719; c=relaxed/simple;
	bh=zvPq4jlfh3VNCROQ2VkniA1/03qI9AL0DJJ2/xDeY50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnckG9k3WgGPHxPsP4QeJlfl/Ll57t7LP+Uxw8QVAud2JYlYEmlFUMXAamDQ7rslbcNpW7KKh3mTAYbRcq2YfTyOWEQ0x6c4+EcBbWRFulqsh3N3LFr72/XhNUcJTe89pfhA3btqtfTa79jVJlzITCMKcU5DAlPywfc8SF0M9XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ak0S/KE8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771230716;
	bh=zvPq4jlfh3VNCROQ2VkniA1/03qI9AL0DJJ2/xDeY50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ak0S/KE8SKgSWfXRVBAO0+gmG/XzwbvM2br9aBpk9SbT3N7XtZ21hmMXRlbs3a2KM
	 pl+eAW7Z/mX2Na9bKf09R2ztSczSHTgzpxYgcbZBsCV4CKug8GTSKbnaGVyg/irOOk
	 jfGjbdgUhwn5LpKpyKzqVz1m++x2Vr5PBX0uOLdOaxSz3qsakQQlgSOnTIkiLh4QNf
	 oDZveDImKviSAxGL+S/NlLBrkHJsS3L4bW060LLFEv3LP26HqeynFcrWZ8YkA3qPkg
	 HF5pwkbptjO/93nT4VsRFMeu9FVWZgbb3U3xEYnLssfpTifyMqqIzH6y3EqzD8r3f4
	 gyPAAFRLrhycQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3301017E00A3;
	Mon, 16 Feb 2026 09:31:56 +0100 (CET)
Message-ID: <50a82e17-1666-4ef6-ab6e-c0be3c780a0d@collabora.com>
Date: Mon, 16 Feb 2026 09:31:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: dt-bindings: add NXP i.MX93 compatible
 string
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
 <20260213-imx93-dw-csi2-v2-5-8be6039f44c6@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-5-8be6039f44c6@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52838-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 4870B14193F
X-Rspamd-Action: no action

Hi Frank,

On 2/13/26 21:25, Frank Li wrote:
> The i.MX93 uses the DW CSI-2 RX controller, which is similar to the
> Rockchip RK3568 implementation.
> 
> The i.MX93 variant provides one IRQ, two clocks, and no resets. Add the
> "fsl,imx93-mipi-csi2" compatible string and keep the same constraints for
> rk3568.

RK3568.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

With that cosmetic fix,

Acked-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael


> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 47 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> index 2c2bd87582eb8bfdd13720edd62a5f00dda958ba..4ac4a3b6f406408b9524c795e6cdeb117d3353da 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> @@ -17,6 +17,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - fsl,imx93-mipi-csi2
>        - rockchip,rk3568-mipi-csi2
>  
>    reg:
> @@ -26,14 +27,23 @@ properties:
>      items:
>        - description: Interrupt that signals changes in CSI2HOST_ERR1.
>        - description: Interrupt that signals changes in CSI2HOST_ERR2.
> +    minItems: 1
>  
>    interrupt-names:
>      items:
>        - const: err1
>        - const: err2
> +    minItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: per
> +      - const: pixel
> +    minItems: 1
>  
>    phys:
>      maxItems: 1
> @@ -88,10 +98,43 @@ required:
>    - phys
>    - ports
>    - power-domains
> -  - resets
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-mipi-csi2
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +        interrupt-names:
> +          minItems: 2
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +      required:
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx93-mipi-csi2
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        interrupt-names: false
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/rk3568-cru.h>
> 


