Return-Path: <linux-media+bounces-35497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AAAAE1E72
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 17:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F39803B2674
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 15:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B252D191E;
	Fri, 20 Jun 2025 15:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fcG0fTot"
X-Original-To: linux-media@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B22C3275;
	Fri, 20 Jun 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432907; cv=none; b=nHhkepBHeIdnm6OWrknGTAxZmW3VlhsAS8DKukQW0ejx/PLKaFj3M+nyCIUJ5szUUQDQiN8Hkk8k9gfoH8PAan3373kWpi1ehFNDhovFr7u2Fi0IhVZCleCUF0fPvvJbBA4BYnYhWA3vWuAGrniS4+Bc+Z49jcyXcn5OACJWyMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432907; c=relaxed/simple;
	bh=1iz7mciR4S3YtTkd03g9kECW2fd2PI+JECbSb6pESr8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VGo78ZJJGgwqrGDWZgJiOSOH0rjAb9Gl6J6TX0umhFBvR/rY2xv7ZaXkSW4IHYqYU/QxPudyzHjY+6h2uVnyAEqDfqJ9BX+QKVScoBlZ/Z5ww15qz1crHld6d0gmrwQBiT+rZDleZ4LkepHNNPwbp6jDwdYUGBKCldxEU4Rg6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fcG0fTot; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33C6341D11;
	Fri, 20 Jun 2025 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750432902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x/e6LiudPsu/XWNdoyPtUaZGCXB8UHcl+kvG7URbQ38=;
	b=fcG0fTotkaaUETz5PQGBGmcF+EgyyrdJoD/gngd1tBFBfBxo6aUk04Z9jj+6AExPr1R4ks
	Mfbu9VG3zGWPLHXCSimpgrzIoVUjmj3NVxukVhqMZfumZHRuipddhgxwhzqbVa0s7/0cY5
	WSFqq9HTeWoDcw0hFn7Zs3gLv5xftkHppIqSnnkV9l5g0uMc1STg0DxWEOZLXa3u6X1Vfk
	9GblIIfz3q7M82xmcGtN0n8ClRewGXiHAcqksnK3uQsB5wjTBzafuO0zv95u0LfOieGyjU
	VSv2mu6oTKUj7DDgmGuAavDVVRXRaGNVtSK6wDFwnP1iyk5PMtcEISAc9XAO0g==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Subject: [PATCH v4 0/4] Describe the cameras in the PinePhone Pro dts
Date: Fri, 20 Jun 2025 17:21:31 +0200
Message-Id: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHt8VWgC/2XO0Q6CIBiG4VtxHEeDHwzpqPtoHQBCsqU0cKzmv
 PfQA13z8PvH844JJRu9TehaTSja7JMPQxn8VCHTqeFpsW/LRkCgJgANNqq3UWGhGsm1dcopgcr
 jd7TOf9bQ/VF259MY4nftZrpcD4lMMcGmps1FOsmtFDcdwvjyw9mEHi2RDDtkBDYIBTIKmnPNy
 z/MEbId1kRukBXYKg1CQAsg1T+c5/kHIAPIUBABAAA=
X-Change-ID: 20250228-camera-7a894befafa7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 imx@lists.linux.dev, Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 ~diederik/pine64-discuss@lists.sr.ht, Dragan Simic <dsimic@manjaro.org>, 
 Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtudehfeeutdffjeeviefgjeetieeuleefkeefgfevfedvlefgiefhheejueejvdenucffohhmrghinheptghouggvsggvrhhgrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopeimughivgguvghrihhksdhpihhnvgeigedqughishgtuhhssheslhhishhtshdrshhrrdhhthdprhgtphhtthhopehrohgshhesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitghhohhlrghssehrohhthhgvmhgrihhlrdhnvghtpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: olivier.benjamin@bootlin.com

This series adds support for the Pine64 PinePhone Pro's rear and front
cameras in Device Tree.
This is based on some of Ondrej Jirman's patches hosted in his tree at
https://codeberg.org/megi/linux, but I have also fully reviewed and
re-written the code from the RK3399 datasheet, the PinePhone Pro
schematic, and the IMX258-0AQH5 software reference manual.

I have tested these changes on my PinePhone Pro and am able to take
photos from both cameras using libcamera's cam.

This series has raised a question about the proper label name for the
front/user camera and rear/world camera for phones.
This series is using "ucam" and "wcam", which is used in a few other
Rockship DTBs:
 - arch/arm64/boot/dts/rockchip/px30-evb.dts
 - rk3399-gru-scarlet.dtsi

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
Changes in v4:
- Dropped "clock-names" property from IM258 as it is absent from the binding.
- Renamed pinctrl definitions to match the names in the PinePhone Pro datasheet.
- Collected Rob Herring's acked-by for patches 1 and 2
- Link to v3: https://lore.kernel.org/r/20250509-camera-v3-0-dab2772d229a@bootlin.com

Changes in v3:
- Fixed new DTB warnings reported by Rob Herring's bot
- Link to v2: https://lore.kernel.org/r/20250302-camera-v2-0-312b44b4a89c@bootlin.com

Changes in v2:
- Rebase on mainline
- Change patch subject to arm64: dts: rockchip
- Rename new regulators to fit preferred form for fixed regulators
- Link to v1: https://lore.kernel.org/r/20250228-camera-v1-0-c51869f94e97@bootlin.com

---
Olivier Benjamin (4):
      dt-bindings: media: ov8858: inherit video-interface-devices properties
      dt-bindings: media: imx258: inherit video-interface-devices properties
      arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
      arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro

 .../devicetree/bindings/media/i2c/ovti,ov8858.yaml |   4 +-
 .../devicetree/bindings/media/i2c/sony,imx258.yaml |   4 +-
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 138 +++++++++++++++++++++
 3 files changed, 144 insertions(+), 2 deletions(-)
---
-- 
Olivier Benjamin <olivier.benjamin@bootlin.com>


