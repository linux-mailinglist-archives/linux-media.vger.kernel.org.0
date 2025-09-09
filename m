Return-Path: <linux-media+bounces-42048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A3AB49E65
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 02:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78B6D17DB5C
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 00:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D76219A7D;
	Tue,  9 Sep 2025 00:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7cgbs8V"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B71172A;
	Tue,  9 Sep 2025 00:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757379451; cv=none; b=VIrJ+Pg+16ciX10C/I1MkZpunTxwNc5vGoESk6WK9tPPhq8ivLnyF6KIyOg9jd3e08ZN/B/nSslrCD5M53rqen7Id1kymseb2e4SPY6VJz9SdMrNHlUourXx3yAQhUIUzeWDrRILkhuVu8l8H5BSgAIPbupp96iPX4+gWHulOPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757379451; c=relaxed/simple;
	bh=PjNOvGE6PkHjCvw20rHybUKZIXuJkJvMK2PCMpSEbq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGEOXJPai+E9IlcT1M/5doN4rwISByxLaxahcArXWPk0zMEnnVPLMxshaQ3i3UIOhwtUgqzuVdo6konrnrPUokltrHfzmeksAwKP39i1Ha7pc7dETxM7jlK6rf2xxTsfYSinomh4Uer8W/AKAbMW9n12aXQVvLx1ROvqAYbCNKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7cgbs8V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D55EC4CEF1;
	Tue,  9 Sep 2025 00:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757379450;
	bh=PjNOvGE6PkHjCvw20rHybUKZIXuJkJvMK2PCMpSEbq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7cgbs8VJW5Kfmg6zCzZFs1Yk866LLUqXEQf4OmD4Qjd78Cr3RouhpMNLgfKAtFi3
	 GnAI3dl8KFwCxJe2EDdP02mYcyKwH0+pM+wFkYVv+DZ+WvrkdpIYo1Lgub4EhYMRaA
	 eScbRZTPDTPiR16D4xoQmNm81uk8mn+cV3V+5qKKFpsMObI1EWrcvSQTQv0CxLwOr3
	 t+UYtftF9wPK7/L2Q253k660f/RfuGNeq3cnHN29KZ0HD37L9f2nU27HTceMFNXWSS
	 HaHYpru1/gZGnUSPwu64pddgH0cCQvDXf8JrOIS93vON9BV3TZsflECmAudO0Bm4c1
	 iASGiZZE/L2vQ==
Date: Mon, 8 Sep 2025 19:57:29 -0500
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
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 12/23] dt-bindings: display: tegra: move
 avdd-dsi-csi-supply from VI to CSI
Message-ID: <20250909005729.GA2330015-robh@kernel.org>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-13-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906135345.241229-13-clamor95@gmail.com>

On Sat, Sep 06, 2025 at 04:53:33PM +0300, Svyatoslav Ryhel wrote:
> The avdd-dsi-csi-supply is CSI power supply, it has nothing to do with VI,
> like same supply is used with DSI and has nothing to do with DC. Move it
> to correct place.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml   | 3 ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> index dd67d4162884..bb138277d5e8 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> @@ -75,9 +75,6 @@ properties:
>    ranges:
>      maxItems: 1
>  
> -  avdd-dsi-csi-supply:
> -    description: DSI/CSI power supply. Must supply 1.2 V.
> -
>    vip:
>      $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
>  
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> index fa07a40d1004..37f6129c9c92 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> @@ -37,6 +37,9 @@ properties:
>        - const: cile
>        - const: csi_tpg
>  
> +  avdd-dsi-csi-supply:
> +    description: DSI/CSI power supply. Must supply 1.2 V.

On further thought, why does this have 'dsi' in the name at all. If it 
happens to be the same supply for DSI and CSI, that's an SoC integration 
detail. The name here should be local to the module. Perhaps 
'avdd-supply' is enough? Fine to rename it as you are breaking the ABI 
moving it anyways.

Rob

