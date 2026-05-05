Return-Path: <linux-media+bounces-60457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJARAGkZ+mlYJQMAu9opvQ
	(envelope-from <linux-media+bounces-60457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:23:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF224D1320
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F4FE30C1BE4
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 16:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856C148BD24;
	Tue,  5 May 2026 16:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAlq6bVm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3476A48BD31
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997754; cv=none; b=fNB7vV6gBGAW8/On/jVDZULdiXDUz/I+Dzud/tyn3jLqIOEWm+qEtsdYux4Ad54LAJXPo6VDQc5NERksa6ipx8FxfmPs2tqNgBMfAqGrZd0WGtzqlBeI7bK9nIF93MzTm4+Pcb7ZyttWmaNktRZMBfJGNwW+zOfpoTS+qr5zeYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997754; c=relaxed/simple;
	bh=DOcATmiBxnRGKjoFpcAJ5nk3hnXYfVYBXXI94JUx4Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RtYG+rJGstz3KLb/TKJJDGh5Q9BDJ/trntkSAfjfGfLaVNLAZpqUm6c9ulplEZ79zYTmkK2yME6bIwHRRot5ZhOCYVgV9xxJEwpkx5JZD1kLuGDbI6bLF9EhhzkAuoQZD8+heMImZWbvnfAgkWZPUXZYmrfUbxc5GOm2aa+GvlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAlq6bVm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso64935765e9.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 09:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997745; x=1778602545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwCwPqassmdFa5GP4LZDb8M62stClOb1kWRYWVT4ujQ=;
        b=BAlq6bVmCwVK50yS2UmyWp0kTy0toOfYXvJJoZ4MDUSYRFfM7IFM4qmvVl1acKEOYO
         RqTfcL2CQpo8NsyZE3Bz+eG9iZP3pmnA0Uyh0brnwT4Az7qvYfdjy424uMufC3Xy3h53
         u0L3EgIc9Br/5As50dAB6Ydty8VhkVl/+RcgoF70jGGg2XrHVvawxcKx0fQLbwdCFig7
         X+rOGS1s3C9n0Tx7x07YZSg50ekhs4IAxqZewB4vHP2YQnuQ0mRvsCoshGDC1tH8xIX/
         joqVcL+9RN2i89cLF/DCGm54sLI1zlMo5xZKXvK0k656rSGmQUApwiCGgY/UhEenZy9/
         WYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997745; x=1778602545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwCwPqassmdFa5GP4LZDb8M62stClOb1kWRYWVT4ujQ=;
        b=kMQJNJAHXwjBOIujnfRaffXnvztMrflN0rnryJJ7QvsadtgEou9Ax4c1CnLd6pGmo0
         9dZk7uxwyz81Tc7wqERi0H1DM9bov329Upvd1BW21lfZFiiGhDGTZp29/s5FVZQMOwJw
         a5UOPFrsepvVt8QzbgjwetsqEkzcvo479MSl+zpXOTJw8Md/EtxpotTX5/6DaBCwVTxF
         u9NBckWrjufxSw4FscCSlUKudQRTdSZSxVj7/JcCb0uJKtke6y448GpaYb8JvZCCNkWx
         xot0DPyJVjdNDiMkIf0oXHnLcJAw2hQvjOKasSA6oUJiMRPHY6ytDteqJVxuiluSeIau
         UZMw==
X-Forwarded-Encrypted: i=1; AFNElJ/3Exc3UlKNRCaTmGKf5JDTHME4Q9Z2Ps+QV5NBL3OzlgNlOkM4SfQdkUSWK/q73qT5N0ZqTEdQK3HD6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycoc/lgxIl/DGdzrUoJgnf06Lv4Ptj7PZUQVbZzi6TQ0biO+oU
	eWxgG4RnQryXUiIr8dWvLzQXJafBYlokv87AsjyWl2rpf0+QqQLEguvP
X-Gm-Gg: AeBDietDTLlcW+yAU7q06hXNm/dI3T6o/hdtz/LB/di5qFvD5GgovtXXpJwunmHhiSP
	7Z5Y44jYli+BlgvTc8kKFJ6aP+43viR8WCBr+0tHUc3d/Q9UWmWkIXCBHe3nvuaekeGW0Qqhbdd
	V2ikJgy35MvzyS/xaXIcc14dm2XEe6hB4cUOGVgX/SAFkzZwem0fnUgT9uSq427nnyhhqSH0YrT
	l4aUU7OQ11JUsJLsL5XdmX/2vK69K28XuTwmXbTlMScVwqEuStDnNrj3ak8Dp4k5tEN4vgNl2rG
	FFW16pT/41DYBqbYJ5HvMytSjs3kT5pRWo1CQOuax5dfcBJV7+BLc35xi3rAUGayus+axX7ud/c
	diIHXuTnntAJ5sqwO1Ulg4vMzayASLox6fMJCMiI1eOPu0sxXJs2dRIXTYVPkdxzi0iHKgK0ZWk
	1FpDelXXN6bWeD/4Ny4etUoHU9nZBoWcqczDYGwEp8T2r7U8mrVEXUgxWQ6JdnU/c0ZnwNetjry
	pWeIkU9hdwUv6hQG/zAOypf5kkr
X-Received: by 2002:a05:600c:3513:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48e51d6c8cfmr1051235e9.27.1777997744843;
        Tue, 05 May 2026 09:15:44 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm402657765e9.4.2026.05.05.09.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:15:44 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count
 for H6
Date: Tue, 05 May 2026 18:15:42 +0200
Message-ID: <A3ZnAVmNS1uZyanwbLT-hg@gmail.com>
In-Reply-To: <20260505134812.408316-3-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 8FF224D1320
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60457-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Dne torek, 5. maj 2026 ob 15:48:06 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> On the H6, the SRAM C region includes an alias of part of the VE SRAM
> used by the video engine. This region should also be claimed so that no
> access happens through the alias window.
>=20
> Add a second SRAM region phandle to the video engine for the H6.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-=
video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i=
=2Da10-video-engine.yaml
> index 932043d7f0cc..818d815d4732 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> @@ -48,11 +48,15 @@ properties:
> =20
>    allwinner,sram:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
>      items:
>        - items:
>            - description: phandle to SRAM
>            - description: register value for device
> -    description: Phandle to the device SRAM
> +      - items:
> +          - description: phandle to SRAM alias
> +          - description: register value for device
> +    description: Phandle to the device SRAM(s)
> =20
>    iommus:
>      minItems: 1
> @@ -101,6 +105,21 @@ allOf:
>          iommus:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun50i-h6-video-engine
> +    then:
> +      properties:
> +        allwinner,sram:
> +          minItems: 2
> +    else:
> +      properties:
> +        allwinner,sram:
> +          maxItems: 1
> +
>  additionalProperties: false
> =20
>  examples:
>=20

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



