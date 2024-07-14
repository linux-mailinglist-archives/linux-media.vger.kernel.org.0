Return-Path: <linux-media+bounces-14996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31985930A65
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2024 16:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C2CE1C20B26
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2024 14:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D5E1384B3;
	Sun, 14 Jul 2024 14:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="HyiOnRgk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8E26296
	for <linux-media@vger.kernel.org>; Sun, 14 Jul 2024 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720967654; cv=none; b=Z9taaeFKWOiSffkLm3yF35OD5cOiphPd2Da90N8uw6jaB4lGB9a1ZzqOfgxkJ7DliNOaQxoij3JBxwv0VGEQOGniLpjrd8KB5BENdzSoQa/8l7WabELCXUv9PckiVEEVhoKACM7u/SzFVaxiDwxz4/z4N3xfSBsMYQqrk66FWwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720967654; c=relaxed/simple;
	bh=NTEPt30ll/hOLMUSnBfgxjULOiujnyZ5urK831BnNjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0dEVuIBk9MmYfae2boBaGoePocppAgE2vgVBbDO9ORupluxXQ6TKG+6l+Cvap0VuHou9AP+GWTZPr5sNygdIB6YyXJcMFHEyN59gnHRk3Lda7ytamKTufvknhXJfoUMIqzXta+0KGbibeewTH6cHwFpFZJuqaSGhE49E65Of/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=HyiOnRgk; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 196BB1F9F9;
	Sun, 14 Jul 2024 16:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1720967641;
	bh=4t/ucJXxpr9icvZJVKnQgiXULQ1u3OAPDduTz8l9UVs=; h=From:To:Subject;
	b=HyiOnRgkjI0qWxYp2mkIRRP8v4MM4x9D41MEMc/deQvfAagw+gRPb7dvSCjkeilu0
	 yvptXWaHcXj0AefVF5z12NJ1N14gJZOgyUX9k9XCm7UFW2yDI+v9gqXBYk+0V0x3d8
	 Ltlb0iPCZ8yUvuzn09SR77B+jn5HI1eq9t5gQNUkprf4pLsVY2zFFt+SCVX4rdvrp4
	 Q/LxJmRJ4gMjuaWi9P46QCSBieIoBsFdnEIvfZ5PaD20WIu7pnbVOTHc1yBwtjDnB7
	 Cr38KXbD0FNTY2Rk31dUNvPwRzenE8pCjIeRYc+Fq2jcyZPrxGLUXzyshEbtT7e6Sx
	 1DlYug+qW4pZg==
Date: Sun, 14 Jul 2024 16:33:57 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 3/3] media: i2c: isl7998x: Implement get_mbus_config
Message-ID: <20240714143357.GA9013@francesco-nb>
References: <20240713154242.107903-1-marex@denx.de>
 <20240713154242.107903-3-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240713154242.107903-3-marex@denx.de>

Hello Marek,

On Sat, Jul 13, 2024 at 05:41:56PM +0200, Marek Vasut wrote:
> This is used e.g. by imx6-mipi-csi2.c to determine the CSI2 lane count.
> Implement the callback in isl7998x driver so it can be used with i.MX6
> CSI2 receiver.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

We had a similar need and we did send a similar patch for ov5640 [1],
however it was rejected. I did not follow-up if anything changed that
makes this patch not required, or maybe I am misunderstanding all of it?
Any comment?

Francesco

[1] https://lore.kernel.org/all/20230306063649.7387-1-marcel@ziswiler.com/

