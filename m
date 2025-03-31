Return-Path: <linux-media+bounces-29037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A78A761FD
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB05D3A56F1
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234B31EDA02;
	Mon, 31 Mar 2025 08:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WP+q0ABs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEC31DE3D6;
	Mon, 31 Mar 2025 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409465; cv=none; b=duU+o99ObVR3ppUTWKydaxCdl4KB3e0ArDaH9Y6ZjeAupyR8LmbB4qsmeGvtXzJ0YmU9VAqjcpbHykhmXFTtFipOPiDIb0w5EXbCRUA6pe2SvRFMjOfzaBAdSWIVw2N/N6UmhJfiOeGuzM20+RIAXv4r13lTdx8YrkLJ80ih54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409465; c=relaxed/simple;
	bh=fh801EUr5W0nJg6lJwAd46r4+NeqMdqOyfLq8d9tPGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVIpHDf0dMkebtI9TWp1cmPX8S733D7Wyo9TEWYqHxiyNbucsrYu9j/1gIuUQX85+4AG0cp2q17Py0HMzW7BosfvgWf2EU9iQLzUGlhkyHaljEn1GAtXw/rYsxYffFO8FqUq4jsYEyaVJrvzOe5l3rQbMBmggxE7NsY+CxH1ImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WP+q0ABs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025D6C4CEE3;
	Mon, 31 Mar 2025 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743409464;
	bh=fh801EUr5W0nJg6lJwAd46r4+NeqMdqOyfLq8d9tPGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WP+q0ABswBFIiTCRSuWtBFHeO9HmjDQj4SJWl4GwU+P6PGWcvr44g9Fvfu2DwFkfU
	 yM9uQtKEKJTS1lN2zOIxlnnRpNnX2kkqKuE+1bPGcFCkN7tl6QLziiWYep6iwO1Nqa
	 8ZYQnrnZpiliDNBoWgNORNeNzAynUPdq1mPT45Q4o4s6H2VzIV5GH7mXYpE34e+/mf
	 k8rDcPLEVG0qpQ4xk0izblYshJxywPy9a9bQBm28E+nyMB+coSZBSDoN9ZmWAyCjN2
	 8vBGz0vOsZqOiSwvVDWrx9POVETUCNqJTsIo/0SNpW+J7NgfiYwwSrMmHhr5BQVfLu
	 yVfwlukDc3FHQ==
Date: Mon, 31 Mar 2025 10:24:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 05/17] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/V2H(P) SoC
Message-ID: <20250331-magic-buzzard-from-valhalla-af88e3@krzk-bin>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330210717.46080-6-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Sun, Mar 30, 2025 at 10:07:01PM +0100, Prabhakar wrote:
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g044-du

This goes probably after the if: block for renesas,r9a07g043u-du to keep
sorting (if I get numbers correctly).

> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1:
> +              description: DPI
> +
> +          required:
> +            - port@0
> +            - port@1
>    - if:
>        properties:
>          compatible:
> @@ -101,18 +119,20 @@ allOf:
>  
>            required:
>              - port@0
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-du
> +    then:
>        properties:
>          ports:
>            properties:
>              port@0:
>                description: DSI

port@1: false

Best regards,
Krzysztof


