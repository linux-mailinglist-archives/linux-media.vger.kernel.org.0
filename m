Return-Path: <linux-media+bounces-47170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5850EC60DDA
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 00:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9D9F420CA1
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 23:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB2E274669;
	Sat, 15 Nov 2025 23:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="T7W1X8/V"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C9726ED54;
	Sat, 15 Nov 2025 23:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763250226; cv=none; b=PcH1ldwnHWyHXO1dNOpRqRdVTnBCCgV9Wpe+eEsJAZKsfzRB+QvkM75hbVzfREXlMYWAkQbFpX9U7QvTbg7JYFY9xsTG1b9Bxqal/7wCUjucvjNMb+MGwU+x9U58pHSGIrw/ghwp0ajm1nQX8PDEh+ew5PVYoDgPdp4ga3vDEoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763250226; c=relaxed/simple;
	bh=llN6Cn3B/kgh4ulN0MEBNKdXAxOmngqsyPmwW/2bxxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQR5c6uVXtFdxeB1jRGMujAZsNc9/52RfzamdcsOWLukMKjUcmRyDcvh4OCLwJPcU5wmVCYuoFtCHgaqEZqMAMizGQhArCI3vn1c8PqcyNFwn5aU4FzlZ/u4eoHE6EvnuABTR720oOOcvsmvVxRS5573RixJQXFKO5g7LCulXoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=T7W1X8/V; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=p2QaOkO8NjOGntm2KfoOJ04f8p6YfbVqlV+eGAe/YQo=; b=T7W1X8/VKMuVlBltXAxej69Ttz
	RuhoComjszRwtfM2WRLudijqxYx8+iDpYVKRkjzAOeJ2+dzp/hIgsO4ouvdKVfdGyFNXNp/m6voi8
	y712OG3Hn2bhgRTkA3m/P+ycUcJYGV3Z6f3S1VKon4otCRK35wNF7STP5wQTTx3aJETYob8/p8rOc
	8++Wjxfe0mDHh/kpUpJd3V+HDyNTNZcB7h9xuTpi4weeY7h6j7ilSzsyEscPgANMx9D2hnoRotmfV
	lAyrMTxiua92KOdCj7nX41M+MAE994s8pN348Eocq9pi3S48mS+rJeSjDKpbDmadqS+/+x77ZvwzF
	5XyTT/Tw==;
Received: from i53875bd0.versanet.de ([83.135.91.208] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vKPvO-00022c-4Q; Sun, 16 Nov 2025 00:43:22 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v15 00/14] media: rockchip: add a driver for the rockchip camera interface
Date: Sun, 16 Nov 2025 00:43:19 +0100
Message-ID: <176325011672.721648.2323929668705434904.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
References: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Nov 2025 16:20:11 +0100, Michael Riesch wrote:
> Habidere,
> 
> This series introduces support for the Rockchip Camera Interface (CIF),
> which is featured in many Rockchip SoCs in different variations.
> The series has now been around for a while and has received many comments
> and reviews. Thus, it should be ready for mainline by now.
> 
> [...]

Applied, thanks!

[11/14] arm64: defconfig: enable rockchip camera interface
        commit: 60705b039f960378bb2a0a844f9378646bc0c6c8
[12/14] arm64: dts: rockchip: add the vip node to px30
        commit: d2da7e98c0bf7f75433809ad875c6e1ae57f0cea
[13/14] arm64: dts: rockchip: add vicap node to rk356x
        commit: 78f316e90906d54c8aa6029e5c19ae83e420e56a


Not applied 
    arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander

because of
Lexical error: ../arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso:149.18-45 Unexpected 'MEDIA_PCLK_SAMPLE_DUAL_EDGE'
FATAL ERROR: Syntax error parsing input tree

This likely will only work after the next merge window.

So if you can live with that please resubmit that last patch individually.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

