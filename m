Return-Path: <linux-media+bounces-53264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMEhJLxQnWkBOgQAu9opvQ
	(envelope-from <linux-media+bounces-53264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:18:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A0C182E5A
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45475305B447
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 07:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147E2364041;
	Tue, 24 Feb 2026 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+5HWqEZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA1113DBA0;
	Tue, 24 Feb 2026 07:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771917474; cv=none; b=POyWPd6yfCjCRIzJmEdA+RFjgvun4LrLzmzSfKOZN6fthQ+ioWGMW8EMPuXxmkg7QK3HDSqjdOjxXIS8ojM6S7nl+KPj7AMQv1afyuukCzlwuT15hBAIlM+C/BG9PJEnnnTEHpF7D490FlCGIBpQVqENmeXKEfaKPk3sfnxWG18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771917474; c=relaxed/simple;
	bh=ZMh4vpCa85zcZS/Y7zH3k8Ve9kxMakJv2iTLPBLSNo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTqT9sMPiabMCf/T05Qk3LO3S3fdgQWgiuVt5tw8T66LXw6oAsF9cB3QEd4TPpSHs20viJ2WwRi1tW8Zv17tqAHh8BLUvGc7piSA1JgsEreeYaT1sQ7WahR4ALgTl/mW5Q7H8B0DQBQtJAco9k/3QMpnx7dY/TIc4XsKorY2nz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+5HWqEZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F15FC116D0;
	Tue, 24 Feb 2026 07:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771917474;
	bh=ZMh4vpCa85zcZS/Y7zH3k8Ve9kxMakJv2iTLPBLSNo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+5HWqEZHfg0FoEnG4fHf2ZhyrpsNOUKd2qi35HYtRG8FTW5zR9XPp9BVtMs/FPhM
	 PUPFc1hpeyS8OINAhJjALN4wQgYOqAKf91SE/Hb2WFFSpQAFOCruqZSe6UNXSRM03g
	 o82U+ceElYq2mtyHxQPXbsdzz0ECoBaSAKTCLkZ+vrlvVf2CWkgnxGH/A1rm3PKFG9
	 kEfNhTBW8ryhxmhzIsaBjowEczeBLyyS3yKvNLIZTXi5l7JB3QNhBCgo3nve7Yv26D
	 iCOoKnxPXpyV28BDcK40vawyctTrnZr8zsWA10Y+Whf2sSWtNXiZQu0P6FDEepf2M5
	 RTRCdrdhAKZfA==
Date: Tue, 24 Feb 2026 08:17:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: dt-bindings: rockchip,vdec: Correct
 reg-names order for RK35{76,88}
Message-ID: <20260224-saffron-peccary-from-heaven-2d5e6e@quoll>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
 <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53264-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17A0C182E5A
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 09:49:49PM +0200, Cristian Ciocaltea wrote:
> Update 'reg-names' property to allow providing the register blocks in
> the expected address-based order for RK3576 & RK3588 video decoder and,

What? The register blocks SHOULD NOT be provided in address-based order.
There was never such coding style, never ever we gave such hint and if
you found Qcom discussions you would see me and Rob objecting to it.

> consequently, fix some DTC warnings.
> 
> Additionally, drop the 'reg' description items as the order is not fixed
> anymore, while the information they offer is not very relevant anyway.
> 
> Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings")
> Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Decoder bindings")

No, nothing to be fixed here. Describe the bug, because missing order
to address-based is for sure not a bug.

> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 809fda45b3bd..2d3164a2882b 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -28,16 +28,15 @@ properties:
>  
>    reg:
>      minItems: 1
> -    items:
> -      - description: The function configuration registers base
> -      - description: The link table configuration registers base
> -      - description: The cache configuration registers base
> +    maxItems: 3
>  
>    reg-names:
> -    items:
> +    oneOf:
>        - const: function
> -      - const: link
> -      - const: cache
> +      - items:
> +          - const: link
> +          - const: function
> +          - const: cache

No, ABI break without point.

>  
>    interrupts:
>      maxItems: 1
> 
> -- 
> 2.52.0
> 

