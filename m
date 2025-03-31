Return-Path: <linux-media+bounces-29032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99460A7615F
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4860918895DB
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDE81D7E52;
	Mon, 31 Mar 2025 08:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BotlAn2F"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763301D5AD4;
	Mon, 31 Mar 2025 08:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409310; cv=none; b=tHiWTfs8wGys8K8B7g4P6I0egpwrDzIop03vQ1wdGKmiNh4r8KTMiV2mbd1QLmNzTEhn1KKlEcA+L8fcKer+p7V5i0uicN61tc6xbX5NTqVFghMC7kwZjSCzuj8641IHLzmqwSSUYHP/L6KEbCNXATxQ4lf8aIiGBRb8MXbYapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409310; c=relaxed/simple;
	bh=ah4KmPy0RZMMsogFgHBmWlyZmt3sywOv58ogYopNERw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZ7fhNwf9uNAHYpdlrdZEwnyG+v39jhdLAikEaLKqxbtNwSrdzU659W+0Cn+9+9LMXOESGwwLRtlf8Kb1I0QEUHV+rKebZyDfnNXyPKElg7yKwe3rBLsrwTL9z/APdyW7LUsWseisC1bxu6j/4lS9NHF+i8TcVNP6YHHWb9QD3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BotlAn2F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0874EC4CEE5;
	Mon, 31 Mar 2025 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743409309;
	bh=ah4KmPy0RZMMsogFgHBmWlyZmt3sywOv58ogYopNERw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BotlAn2Fd2Z6GumlrZXYY4Utujm6OhrfDN5dH6CfR7HwhNrEeyRrjqRJN1t8HgJ6k
	 g9nXJJ2tgsvK5eo21ts4asYdpF04Cb0Afribza/96Qzojb1Phu7VJWhkt/tPKrCnGb
	 08hHFXGHWK6C3s4fCSKQ/Pg8evbhO5mpTzVJZe44G6xw0KJWIdVRDHx20oefMQUOhv
	 KEQfVApxlhTlPKu0BNYZpmXwXjsg2aV12ldTx2d8MtaMzVtzZjOWZFn4MMqBpbcOSJ
	 DUEM1xao0JO/RYRgt7HVUYKHlemx+Q2x6cu/MYLRCJXMo2cVME3Tt1sXjHyAhKMsWO
	 oDP9Il4YhYNbQ==
Date: Mon, 31 Mar 2025 10:21:46 +0200
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
Subject: Re: [PATCH 03/17] media: dt-bindings: media: renesas,vsp1: Document
 RZ/V2H(P)
Message-ID: <20250331-sweet-fluffy-bear-e0ec4c@krzk-bin>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330210717.46080-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Sun, Mar 30, 2025 at 10:06:59PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The VSPD block on the RZ/V2H(P) SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/V2H(P) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


