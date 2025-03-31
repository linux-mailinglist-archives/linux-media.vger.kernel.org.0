Return-Path: <linux-media+bounces-29033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA3DA76166
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51D5E3A7876
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FE71D9663;
	Mon, 31 Mar 2025 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMxOopYx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E260156237;
	Mon, 31 Mar 2025 08:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409324; cv=none; b=lkWIOQLdcka3CUXFnvH1BRUTP8b//hu5QvmoSqKudHhep55h11OgT76FlUgqFCxqBXWGsDimDSE0H6poyV2Eoe12byRxC/h3iDlYeylzSNvm07Fe1h6jJIvPR4zaL6okNZakvrXUZ7SPD7gJG9hhv6TfCi9rBtkGyGPsFvKhLFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409324; c=relaxed/simple;
	bh=MWVjrIBlTej9T8symaIg5s2lPrrfvJCfKyZBNUS1gTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOZwLCi0mTInDo8FcWunFBQie2CfyShp6MCNN+dFdX5+XFyWAB4Fel9ZiogMSMzEVA+YY8dOM2Flsi8PJFtam6KSwgT3XlfMDEd2rdss7we9ywPqtLBrrsZwDYKK2494RwHk23TlRnhJrUXjFKxGlpbqS8XYLC68OvO0vQeasxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMxOopYx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145DBC4CEE5;
	Mon, 31 Mar 2025 08:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743409323;
	bh=MWVjrIBlTej9T8symaIg5s2lPrrfvJCfKyZBNUS1gTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iMxOopYxw01saXSK01yN9wtVj069LF6kPwXgDVC923F8qkzDlZa2I6tXAuwhixZro
	 jLSvpVCFxI92dBx0zh4HbJCtPVX3WjfvE5qbHh8yKwFlQZQ/adSXBp/3k3dGO5iMqY
	 FZIkcdwgFPBLMUJb2KsWjEkFsCQpgu6IFnLomePCclP62qt00c5xBnmCDmLo/15Gi5
	 ntp6Utg2rmL/OwlR6X/t9bLyLxEfi653I2gCayGUV2nuo44QlPMS42cHKxz48QTv4d
	 h1m8cQg3iHuomoNMczG4KiUUbpWHxrCump888oajDJozSaSoYQp0BhRJD9lCrFQymM
	 vxnxBLr+KVS0g==
Date: Mon, 31 Mar 2025 10:22:00 +0200
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
Subject: Re: [PATCH 04/17] media: dt-bindings: media: renesas,fcp: Document
 RZ/V2H(P) SoC
Message-ID: <20250331-ebony-taipan-from-uranus-a832a9@krzk-bin>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330210717.46080-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Sun, Mar 30, 2025 at 10:07:00PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The FCPVD block on the RZ/V2H(P) SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/V2H(P) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


