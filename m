Return-Path: <linux-media+bounces-29038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC59FA76250
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6FCC1887972
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8521D90C8;
	Mon, 31 Mar 2025 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MP4E4HdU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CF21D63E1;
	Mon, 31 Mar 2025 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409563; cv=none; b=rx/xbWB0QwSMohweiqUh3VPqmMSIO2FmTBmjMhPCcnvetoiNx2BYhMBPSP1dhWsVtNw0HBswR+buhMfMo3kDdYemDH47UORbuW/TpbJb0rFq2VVJ6TY5y7iCOYNHnnmLuwGHRcZ3IR1O8ZvV5DGMg3stLat6PLBJ1jLNcMzw028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409563; c=relaxed/simple;
	bh=8Cy8YmM0NqtDt9ezgKqrLsWXyVFzNFmpG9efPfz1U5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kgo+9BOyCtcSqoGze9JVGlvuMvycOrON6phfi+b3z+OStWSkqP1DselzpIKu3LvsiohQ8y1WmtlBQAGFDXF8VtwHgFA3f2PW4vQFMLVqd/gQdxHDLseLRwwF85aSP0bGSmSXyonyw7hC/bSc+fLGs0WoZG9GesoycS2tUjne8hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MP4E4HdU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C283C4CEE3;
	Mon, 31 Mar 2025 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743409563;
	bh=8Cy8YmM0NqtDt9ezgKqrLsWXyVFzNFmpG9efPfz1U5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MP4E4HdUHu3Rlasq4UF1FfFak+GWBnYNX0tnPDFr57qy7cICyj36aJPslZDmPSWlt
	 3RQjRg8OguOM0CN1r720k2HrtoHYLi8Q+IREJkCjTrlkYtnslQEZaZueCP2mYh7Fr9
	 3RcXlcpUFiz+txRWtkOS1SKs+AQT/bM0vaNw7qvrDr3s1ycH3OASKhf0kVEbojyQn0
	 cVBIfSvGpwqfn/oHrcb+RjdjWLW/jAqG8s+it/sTKn6gcZIHb9l7w19lfZCX/I0IGC
	 DPS64vFqal0joZUZ/A0VtA1JsNMp+6HopG5hQmZsrFP0jLJvzgtmXI0oTn+SywKK/S
	 zyZW+jzNCGQZg==
Date: Mon, 31 Mar 2025 10:25:59 +0200
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
Subject: Re: [PATCH 06/17] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/V2H(P) SoC
Message-ID: <20250331-unselfish-spiffy-cobra-a36c7f@krzk-bin>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330210717.46080-7-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Sun, Mar 30, 2025 at 10:07:02PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to that of
> the RZ/G2L SoC. While the LINK registers are the same for both SoCs, the
> D-PHY registers differ. Additionally, the number of resets for DSI on
> RZ/V2H(P) is two compared to three on the RZ/G2L.
> 
> To accommodate these differences, a SoC-specific
> `renesas,r9a09g057-mipi-dsi` compatible string has been added for the
> RZ/V2H(P) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 117 +++++++++++++-----
>  1 file changed, 87 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> index e08c24633926..501239f7adab 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -14,16 +14,16 @@ description: |
>    RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
>    up to four data lanes.
>  
> -allOf:
> -  - $ref: /schemas/display/dsi-controller.yaml#
> -
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> -          - renesas,r9a07g054-mipi-dsi # RZ/V2L
> -      - const: renesas,rzg2l-mipi-dsi
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> +              - renesas,r9a07g054-mipi-dsi # RZ/V2L
> +          - const: renesas,rzg2l-mipi-dsi
> +
> +      - const: renesas,r9a09g057-mipi-dsi # RZ/V2H(P)

I guess this will grow, so just use enum here. Otherwise people keep
adding const every time they add new model.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


