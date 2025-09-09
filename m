Return-Path: <linux-media+bounces-42047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A61D2B49E54
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 02:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B88CF189CE89
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 00:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FA321255A;
	Tue,  9 Sep 2025 00:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEjAnFvV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF2317A5BE;
	Tue,  9 Sep 2025 00:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757378980; cv=none; b=Aicfk04SuAnK5/JT7D1SdB4xEw9eKGXmvctcJ5tNVcP68G/RXN2aGrf2Z4JUL4LvBQwUaqYMZXXpLhQuLwmgM5zSNrzt+Dwjyzs6hjarp1EZauJCeIffWd5vNekhUW+Ur4NP+R+7AZQ6whfUm/xYdt0muKh+qGpz9+xLFm9Uv8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757378980; c=relaxed/simple;
	bh=LQdIjGA0RNJfpAshsgQiaTl641ej9IcHvJemsA2HaVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Du1ByzObNKYgNJjUJsZB6HJCns1UL0waQWuNtw6ZXh56ayE3tJ7GdwWaAjEkjtQhHFx/S0q2ecvb5u/bvO0c37+SGzB5fEw7DK1erwWYTxgIjXsTVWAx+eAp5E9L5Z8V6f69YdwfGpepbJVrJICAD35lVxrP4+qvoSzxj6PoOz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEjAnFvV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BB6C4CEF1;
	Tue,  9 Sep 2025 00:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757378980;
	bh=LQdIjGA0RNJfpAshsgQiaTl641ej9IcHvJemsA2HaVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEjAnFvVJV70t+cqG1zPZc4VDEw9jZdRlv2CZ/TQ7EMJDgLhMY9aOixn3O9fXn3pg
	 rxycI98+T+nYtMg+ZZcx+/AystCGSWx24HU1WlQb1tgtlPEKHxiJTq97+cTueyysPI
	 5I3TZeQ/YUoGGJP1cjGO9re3wn7pcxjoJijO/4W9AHJRT0IstYHGHVStUDW/F7L70Y
	 43Htj9vxSPdhFgAvtbCuER+ORqS0ywMiOsa3qtsUeVpIUkf0FdGXvEmzSGJzCY7dro
	 l7qzALqD3DkbHZFA9YC/b+vjGjpxZNOzYK9HOs7QRkFsqNV4e5bF9+o3MNWAmvHhaL
	 J3UbkZ9LK/L5g==
Date: Mon, 8 Sep 2025 19:49:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-staging@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-tegra@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Dmitry Osipenko <digetx@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Thierry Reding <treding@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>
Subject: Re: [PATCH v2 12/23] dt-bindings: display: tegra: move
 avdd-dsi-csi-supply from VI to CSI
Message-ID: <175737897848.2324392.4970104076561451474.robh@kernel.org>
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


On Sat, 06 Sep 2025 16:53:33 +0300, Svyatoslav Ryhel wrote:
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>


