Return-Path: <linux-media+bounces-40320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB75FB2CDDD
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 22:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC5FB565063
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 20:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65563314C9;
	Tue, 19 Aug 2025 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evk13QPM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AA520B80D;
	Tue, 19 Aug 2025 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635409; cv=none; b=aDKyMW6z9aCyuzVyzfcWP44kFClRLD8GjAAKjgEn+S6F6YNt8zmkz68p8px7InIMrwxUgC8WIQYhxVqkDKu1wA11mWbQD4gX3cjPnKSLmY/Bknf2SrOUHxI5c+bYNhVuAgX1zV7o2CiE/urE5W3Ki8fuF0xcLFjYF6CIOx/F1cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635409; c=relaxed/simple;
	bh=ZR2C8Q08ABDZQ88UJtSosGwmMAl53VIxN5VzyU/juXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcYskOnYGtgcwXjvTw6THwVJdzYbbLQkJNrrjSB3iW8HO1vxqajVEpdF/YHIKQesOah5tiCw8wDYF6XFd7xlE4NRVHtJjCVdEM9NpRzSh6ZO596exuEgmJaZ6RltKKP8e9A3r5o96IqMgaQ9Ga/73bjr2lLiz7Jwr/o8zwLctG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evk13QPM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E42CC4CEF1;
	Tue, 19 Aug 2025 20:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755635408;
	bh=ZR2C8Q08ABDZQ88UJtSosGwmMAl53VIxN5VzyU/juXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evk13QPMGD+oT9KokhawGFp/+Z/Fucf/SyvYEV+8YhumHAA2weEBBUVoDt5tAdcvM
	 nVR88XBOqLRsTVhXJeEwhZf5F376YoLKPmmGxTY+XL2Yo1L2XZYgaOlIJVEkXJ42Qt
	 3uNLB/DiIZgCXR+zTJY+R68PcSkExfyNNdZdV798hpROEhq3Q5l085149ns0eHc8Tj
	 ambGWSAuR6X9ytxpfCBxxh8wDfwgIgb348eqoWqJ0CHjsnuxmmQjqOityJJVWfyVEk
	 jqOYh6XPR1hxOVJAiAPHOM8mvB+cm/KO/KGtKxAWaTxEGK2GUmYm6KeD1iX8mUGzcH
	 FaVJSYdn2jGsQ==
Date: Tue, 19 Aug 2025 15:30:07 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 17/19] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20250819203007.GA1266319-robh@kernel.org>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-18-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819121631.84280-18-clamor95@gmail.com>

On Tue, Aug 19, 2025 at 03:16:29PM +0300, Svyatoslav Ryhel wrote:
> Document CSI hw block found in Tegra20 and Tegra30 SoC.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra210-csi.yaml    | 78 +++++++++++++++----
>  1 file changed, 63 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> index fa07a40d1004..a5669447a33b 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> @@ -16,30 +16,78 @@ properties:
>  
>    compatible:
>      enum:
> +      - nvidia,tegra20-csi
> +      - nvidia,tegra30-csi
>        - nvidia,tegra210-csi
>  
>    reg:
>      maxItems: 1
>  
> -  clocks:
> -    items:
> -      - description: module clock
> -      - description: A/B lanes clock
> -      - description: C/D lanes clock
> -      - description: E lane clock
> -      - description: test pattern generator clock
> -
> -  clock-names:
> -    items:
> -      - const: csi
> -      - const: cilab
> -      - const: cilcd
> -      - const: cile
> -      - const: csi_tpg
> +  clocks: true
> +  clock-names: true
>  
>    power-domains:
>      maxItems: 1
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra20-csi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: module clock
> +
> +        clock-names:
> +          items:
> +            - const: csi
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra30-csi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: module clock
> +            - description: PAD A clock
> +            - description: PAD B clock
> +
> +        clock-names:
> +          items:
> +            - const: csi
> +            - const: csia_pad
> +            - const: csib_pad
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra210-csi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: module clock
> +            - description: A/B lanes clock
> +            - description: C/D lanes clock
> +            - description: E lane clock
> +            - description: test pattern generator clock
> +
> +        clock-names:
> +          items:
> +            - const: csi
> +            - const: cilab
> +            - const: cilcd
> +            - const: cile
> +            - const: csi_tpg
> +

This is longer that what's the same. I think this should be a separate 
schema doc.

Rob

