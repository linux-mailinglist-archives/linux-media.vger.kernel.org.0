Return-Path: <linux-media+bounces-41919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C394DB47A19
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 11:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81EE517F509
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 09:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0A121C166;
	Sun,  7 Sep 2025 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3f13eRG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157F21E0E08;
	Sun,  7 Sep 2025 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757237666; cv=none; b=mTMUm1VuTlS9hY1mfeXIm4fnWNELqSYkZ4VbotHSZhIG3K4Y+e7rEWCdkS6PZcpzhDOuKgMUXY5YTQONOnZGgH932jlwfDR8ZXKWeVkvS5/Vi7+vSTRqPCe3GX5XdVpyDcZb6dA8LlmzRB4s8zxOAMITE3dr54yB8+zJd/6D9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757237666; c=relaxed/simple;
	bh=cTNJvTaQR5rsTZCwNQVxZGskkL+S1GYnFsvsI7XSLbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThVwJcZ4/O+sOwpX6vHBHYARgmZP3y8hJhJSJCcjGSUqSVREAbvu0Tp7v/6GyUn6DCHcKhx+fpj94ocqqRLdP65RcLzJboXMRt/GAYD/qdtzHBpu5dnWuNNTU2SF7DDN6xReCS3Cc1dlh21Wjq5oqmzvZw6VOsuJljiPCXICcMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3f13eRG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01CCC4CEF0;
	Sun,  7 Sep 2025 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757237665;
	bh=cTNJvTaQR5rsTZCwNQVxZGskkL+S1GYnFsvsI7XSLbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K3f13eRG2O4rA8PbNf/SO+UCluTEqSyo948VS10WjA7Okpz2v4rK13blezNsXzfgR
	 dHHbjP68SjFFDwWzayno8FDptVHwYUySS7RC1XhYQSZnkDRsZGvR8uO46vrjyJy49y
	 DCAfrMG+XJTcOilz8o8ol+9YTEQrmru6ZTZihJ0thh7qEVVLUYpz1iA9Kuzqg8ONBI
	 3pf232/YQ1Scc2pDzk9pmRvxsKONmN42Tth6W3EYjeXayMXANINWw9kfxD3ygcDlBI
	 s/aLCpS35on2GYxoCw21l0nJehnntEaNh4GNPqMlNJbRYeW4J3XZrSzYAi303BRBaL
	 QmFe203OTEobQ==
Date: Sun, 7 Sep 2025 11:34:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Thierry Reding <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 02/23] dt-bindings: clock: tegra30: Add IDs for CSI
 pad clocks
Message-ID: <20250907-arboreal-aquatic-gopher-686643@kuoka>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250906135345.241229-3-clamor95@gmail.com>

On Sat, Sep 06, 2025 at 04:53:23PM +0300, Svyatoslav Ryhel wrote:
> Tegra30 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
> Add ids for these clocks. Additionally, move TEGRA30_CLK_CLK_MAX into
> clk-tegra30 source.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra30.c         | 1 +
>  include/dt-bindings/clock/tegra30-car.h | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index ca367184e185..ca738bc64615 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -53,6 +53,7 @@
>  #define SYSTEM_CLK_RATE 0x030
>  
>  #define TEGRA30_CLK_PERIPH_BANKS	5
> +#define TEGRA30_CLK_CLK_MAX		311

Unused define drop.

Also, don't mix bindings and drivers. You cannot create such
dependencies.

Best regards,
Krzysztof


