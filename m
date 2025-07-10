Return-Path: <linux-media+bounces-37278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606CB0000A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76FD71C87532
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 11:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472B02E7F08;
	Thu, 10 Jul 2025 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="TNey+Q/H"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1972E62D5;
	Thu, 10 Jul 2025 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752145309; cv=none; b=leXzHR8oXvjLsfoTfumDPSdaRACXVlDNT4bMfncsZByDDFglxZj2Gf988c8iTrmbvcu7cGxvirjt10fz42zA3VLx/hVzdzw6vY8gCsOwOTL1Sg0UStJdgCCsyyF5fbNKRMGTM0trW/b6N7Vwbtg5RxOH1de2wOpKN9vM44M2pcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752145309; c=relaxed/simple;
	bh=cG86iaom6ZydMcf7R7W27dUK5Wunw5WdkRno4zP99ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HB4MApaCUyHcwa0cSxHAALsQY+rLbQx5i6awCVfdVZ/rLXrnAeuA2ew0UJ76F9pasbp5W3uA2Ud1AGhxT57VT18GzXFfJxTCBRvE0hT1kIVqv+NuRUkBCg7ReKRESNb0bCokLGndgWhauI4VLV4jW3H/0yt34HwnPoL1GsQhstM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=TNey+Q/H; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=yh1oZYi5He8u6c75FxBqUjF/P8dsSkx+mSq7uRQnfpY=; b=TNey+Q/H+gvNrd/vklpz2lSgcz
	zYsU2CFvIdj8g0DjwUaA9LkCsNFvVRJAd0yqfZsM5wwI/hXk58oI2EBTvnu533uvT5XiaqNyRxfrF
	g83m2YF/9AGV5+B05cpsTVrC4kgvpJPHvuDlWPPOH8r+btbDaIDQuVrUgX2UGLWav3NRbxmlT0uW7
	dQTQBNEFCi3yhvQVLAodPh3ku8WmTcVjyZVQq8vMgKY7R7O/nTCBGvRqMZ4ZCZoAakU5Y8Bm8O6+/
	rNnEWIi775SRRakTqEIcqol6mmmSWcUfoQQ10JeuFbj8NQV9Fi6J3p8a0VMLORPwwhZd6uy89wvqJ
	4f+rKPdA==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZp20-0004He-Nb; Thu, 10 Jul 2025 13:01:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	imx@lists.linux.dev,
	~diederik/pine64-discuss@lists.sr.ht,
	Dragan Simic <dsimic@manjaro.org>,
	Ondrej Jirman <megi@xff.cz>
Subject: Re: (subset) [PATCH v4 0/4] Describe the cameras in the PinePhone Pro dts
Date: Thu, 10 Jul 2025 13:01:33 +0200
Message-ID: <175214509884.1901332.11258386296497025238.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Jun 2025 17:21:31 +0200, Olivier Benjamin wrote:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
      commit: b610dc822f38010508b54c8f556a3de28556d273
[4/4] arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro
      commit: 9259c81a185663c2a7cd6a5301df4b9645980528

So I found the binding-patched from the media-tree in linux-next now,
so picked up the dts patches.

I fixed up some issues, please double check:
- the pinctrl-handle in patch3 did not match the created one
  (which patch 4 fixed) but I adapted patch 3 instead
- sorting of the avdd regulator (alphabetical by node-name please)
- sorting of properties, broadly speaking, alphabetical too
  (caveats apply, see dt documentation)

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

