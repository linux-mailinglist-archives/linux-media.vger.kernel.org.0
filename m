Return-Path: <linux-media+bounces-16867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A600A9601C7
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 08:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CDA12842B5
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 06:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E3E1552E4;
	Tue, 27 Aug 2024 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dv987gXD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9500152787;
	Tue, 27 Aug 2024 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724740286; cv=none; b=MhyGv7A8/+y/dkDTHEBih/38pKamqDXoQR1Px82X78iBhXNLDDUw3qG6TPIrt8Ub2TzBT1/LJ26E6QG8D52nyAeDNRfOX7DKD29AFtMu8VZwRpegdAnw5E+ikWcy+zKvYIJmEnc/4pm/yu/6MwzXsbj2yS8QzYKccFfytRbVeDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724740286; c=relaxed/simple;
	bh=JDD472vH1aWj6IRC09WaZCcUphUwREC+cC1JsXTfktQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krNwKxMzHfg31v9TY4r5JZ9KZ0sCHSPolMc8DBqaSoPtDmar+AB+J3//YpTME4qyf9i2gOSf0DkdC3G3nS8C5mMYSUpn5Xtoj/FTU+AjPng5OeVI8VejRhFX6GnpOXp6eX8ygVRhl55Bw2itqb0AbFGTkBKiKzr4y7b0YtIruRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dv987gXD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08ADC582BB;
	Tue, 27 Aug 2024 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724740286;
	bh=JDD472vH1aWj6IRC09WaZCcUphUwREC+cC1JsXTfktQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dv987gXDI2tuZFnl0FSgOc0b8Q23ycjMQsLkNqqtWsnh4/tJUA9ljxMqZmtSoNsjo
	 ZhiPNI/+luZFve3nEof64kE6JOIkppepWG6a+sRTXwHc7LH4b6gSSJBFKYg7DjsF5b
	 o5rWC6tPGqdch4byATnhpUQ6s8MdwbaCTYboKCXFcguLp3QTNqT9u3+WOHoxgoEkOh
	 Dfh7PTSQO2GXDmPbCfzPvZkDYkHH2LZcMoH3xC0ny+AlcdJP/KQWPEem+T8w68RZvb
	 jSDtReGhdtI7DssQudaFmK+6nglWTpN6whH0YWTjM8PRuyx/2E5zlrVl70CTOSRowN
	 H7J+gsZTJu7aQ==
Date: Tue, 27 Aug 2024 08:31:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: media: renesas,isp: Add Gen4 family
 fallback
Message-ID: <cnca2gdh6c3kg5ybb4dxzlca5c7jsvz4tomibpkf746syejvmf@ndbq4qkykume>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>

On Mon, Aug 26, 2024 at 04:43:47PM +0200, Niklas S=C3=B6derlund wrote:
> The ISP Channel Selector IP is the same for all current Gen4 devices.
> This was not known when adding support for V3U and V4H and a single SoC
> specific compatible was used.
>=20
> Before adding more SoC specific bindings for V4M add a family compatible
> fallback for Gen4. That way the driver only needs to be updated once for
> Gen4, and we still have the option to fix any problems in the driver if
> any testable differences between the SoCs are found.
>=20
> There are already DTS files using the V3U and V4H compatibles which
> needs to be updated to not produce a warning for DTS checks. The driver
> also needs to kept the compatible values to be backward compatible , but
> for new Gen4 SoCs such as V4M we can avoid this.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - New in v2.
> ---
>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,isp.yaml
> index 33650a1ea034..730c86f2d7b1 100644
> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> @@ -22,6 +22,7 @@ properties:
>        - enum:
>            - renesas,r8a779a0-isp # V3U
>            - renesas,r8a779g0-isp # V4H
> +      - const: renesas,rcar-gen4-isp # Generic R-Car Gen4

Adding generic fallback post-factum is odd, does not feel reliable.
Instead use specific compatibles as fallbacks.

Best regards,
Krzysztof


