Return-Path: <linux-media+bounces-29315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21455A7A230
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 13:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF0C03B4AD9
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 11:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F255624C081;
	Thu,  3 Apr 2025 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wl9TvV97"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BDF3597B;
	Thu,  3 Apr 2025 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681127; cv=none; b=qMIb2SqIazupD8DgOQVPFcuS85oox3Q8Hmqt40RBMoKwolFd4rW9ZttZQSS5tDvjT9O9DX6/qcyBe7F2YLdsdOIudQixksCyfjYUUnMssYq6rXWCvM+m4JLolcK1wj6PN0o/evf8g18BCUOQtdPkCy8wOEaxXg6N41UB/IGJGBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681127; c=relaxed/simple;
	bh=1v9o/eYae1l9oDDnFj+Krp0jgYRK2JYUcGfai2r3zF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MHFE3j5g60mkPZLPWEI0/Hml3cIBtG+3qtLUraA8UUVYMhhOQDZiOgaXUdqthcBfF9LNtA7jheBPWGXZ8ymbauihPo44NxSaEcfODjyc/ff4Z4d9KTKISbOCeu2xlvjQzIkqXxQyZW6wW0ORtdfxbNCuAU/QQCFWCVdGzeEYaKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wl9TvV97; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA6F68FA;
	Thu,  3 Apr 2025 13:50:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743681009;
	bh=1v9o/eYae1l9oDDnFj+Krp0jgYRK2JYUcGfai2r3zF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wl9TvV97WTKEJGdxIhMGL7RJlHBWycINq5RLlKQHhdpxSFog5sYNJUPp4zy4x3PH9
	 AUVcnP5x4PiCWnOid129ErNDV8Va8yKMRYZcMqSwLxSNC5DVbc9cNtwgp3GXO9uHAu
	 qfK4cJ3i1Yaeo8Cw9mYYJRZQx4u7hUK/1MWHBLbA=
Message-ID: <49b12329-87d8-4f6f-8498-0ff7430e31e6@ideasonboard.com>
Date: Thu, 3 Apr 2025 14:51:58 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] Add support for DU and DSI on the Renesas RZ/V2H(P)
 SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/03/2025 00:06, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series adds support for the Display Unit (DU) and MIPI DSI
> interface on the Renesas RZ/V2H(P) SoC. The inital patches add PLLDSI
> clocks and reset entries for the DSI and LCDC and the later patches add
> support for the DU and DSI drivers. The DU block is similar to the
> RZ/G2L SoC, but the DSI interface is slightly different. The patches
> include updates to the device tree bindings, clock and reset
> controllers, and the DU driver to accommodate these changes.
> 
> Note, my initail intention was to split the clock patches and the DU/DSI
> driver patches into two separate series. However, I found that sending
> them together will make it easier for the reviewers to understand clock
> related changes.
> 
> Note, the clock patches aplly on top of the following patch series:
> - https://lore.kernel.org/all/20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> - https://lore.kernel.org/all/20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

This is missing dri-devel list from the to/cc. Did you use 
scripts/get_maintainer.pl?

  Tomi

> Cheers,
> Prabhakar
> 
> Lad Prabhakar (17):
>    clk: renesas: rzv2h-cpg: Add support for DSI clocks
>    clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
>    media: dt-bindings: media: renesas,vsp1: Document RZ/V2H(P)
>    media: dt-bindings: media: renesas,fcp: Document RZ/V2H(P) SoC
>    dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
>    dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P)
>      SoC
>    drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
>    drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
>    drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
>    drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
>    drm: renesas: rz-du: mipi_dsi: Add OF data support
>    drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency
>      calculations
>    drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
>    drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for
>      RZ/V2H(P)
>    drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring
>      VCLK and mode validation
>    drm: renesas: rz-du: mipi_dsi: Add support for LPCLK handling
>    drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> 
>   .../bindings/display/bridge/renesas,dsi.yaml  | 117 +++-
>   .../bindings/display/renesas,rzg2l-du.yaml    |  28 +-
>   .../bindings/media/renesas,fcp.yaml           |   2 +
>   .../bindings/media/renesas,vsp1.yaml          |   1 +
>   drivers/clk/renesas/r9a09g057-cpg.c           |  63 ++
>   drivers/clk/renesas/rzv2h-cpg.c               | 284 ++++++++
>   drivers/clk/renesas/rzv2h-cpg.h               |  17 +
>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 +
>   .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 607 +++++++++++++++++-
>   .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  42 +-
>   include/linux/clk/renesas-rzv2h-dsi.h         | 207 ++++++
>   11 files changed, 1309 insertions(+), 70 deletions(-)
>   create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h
> 


