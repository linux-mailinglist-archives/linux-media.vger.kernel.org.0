Return-Path: <linux-media+bounces-40765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DADB31AA3
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F415A1184
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A3C3054F7;
	Fri, 22 Aug 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oql5owlm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610AB3043AB;
	Fri, 22 Aug 2025 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755871188; cv=none; b=Q8Wla9+wN4yi8x7+/nvPYY9nCUPaddDJx7ztJHCdYtR4/fyhEzgqabJ/idwNF/VtplfPtNEeOmvv7yr8+s9fAsqfvS3AAol1VhnwO+TpMkKugJ5ddPpjW+LfMN7zwTolNRbfWnyKsUBZL3KBGYZHSbuWeAXOw/QBNFfViyBUaUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755871188; c=relaxed/simple;
	bh=vF6UXEx1CvSqyULo0+SKbfNfqLebuAIYDBy0BZCSBqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+rmtxJFvs6oc7ZRLjks/h4zkisjdNVXlyOTeQxfgiAqwwV1YQWztNHYsG5o0BW+Z3YVdHGZlNyttSNOfzu7TBT1UcnIJsX6ssMV8gJi6NemyvH29+3GP4pbWsQJPWBikpJOqmenLzr5S8HL1TLkeVLEJ8r59vT7WfTeAkrNTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oql5owlm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60790C4CEED;
	Fri, 22 Aug 2025 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755871187;
	bh=vF6UXEx1CvSqyULo0+SKbfNfqLebuAIYDBy0BZCSBqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oql5owlmcyx+BtwqvAi5GNGg9qm9vBnVSEn2f0jRS26a3SeZj0JBsp/LnJVG4zlS6
	 cV0IHBQXod3IyCSnjpNp52TnugZ0Ae/TxQIHeIplpjtOs16hCMfKO4SuD+ZWO0wxdk
	 M2jtnZRCZ1KPeMFE+g3u7ZUdhtm4/KQwwvB7gn8AFpb/ccYscIMCfgCVt5w+7MyjXL
	 rWWB0No9Hij2ezNybwvWiU05oWck6fGhUR0MQCuk5vDAXgetXpgcYVzepFC4mN17ol
	 A+8tKbYl3umXuDh6elee9tD+PTZ6h+dmmGAjseozWjwYll97fZtAIfeNV0sXYRM7vg
	 924cqC0pf792g==
Date: Fri, 22 Aug 2025 08:59:46 -0500
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
Subject: Re: [PATCH v1 02/19] dt-bindings: clock: tegra20: Add IDs for CSI
 PAD clocks
Message-ID: <20250822135946.GA3492270-robh@kernel.org>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819121631.84280-3-clamor95@gmail.com>

On Tue, Aug 19, 2025 at 03:16:14PM +0300, Svyatoslav Ryhel wrote:
> Tegra30 has CSI PAD clock enable bits embedded into PLLD/PLLD2 registers.
> Add ids for these clocks.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  include/dt-bindings/clock/tegra30-car.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
> index f193663e6f28..14b83e90a0fc 100644
> --- a/include/dt-bindings/clock/tegra30-car.h
> +++ b/include/dt-bindings/clock/tegra30-car.h
> @@ -271,6 +271,8 @@
>  #define TEGRA30_CLK_AUDIO3_MUX 306
>  #define TEGRA30_CLK_AUDIO4_MUX 307
>  #define TEGRA30_CLK_SPDIF_MUX 308
> -#define TEGRA30_CLK_CLK_MAX 309
> +#define TEGRA30_CLK_CSIA_PAD 309
> +#define TEGRA30_CLK_CSIB_PAD 310
> +#define TEGRA30_CLK_CLK_MAX 311

Please drop the MAX. This header is ABI and if a define can change, then 
it's not ABI.

Rob

