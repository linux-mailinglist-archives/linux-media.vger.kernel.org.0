Return-Path: <linux-media+bounces-32184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69CAB1F62
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 23:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DCEDA03B88
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 21:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639A92609D5;
	Fri,  9 May 2025 21:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YdTG/lBL"
X-Original-To: linux-media@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B6E2609CB;
	Fri,  9 May 2025 21:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827511; cv=none; b=jPlpOwjHTfNMXiDv9FR6F5HaBzaPfHWPhysRrbQLmW7OlvjJJ2cS/hndtuKnf4tZPW+ZIw7jBkH3snZvb7mbLnqfcsIYexWMI4i3HIlurDqIp8NKoXxxSbNATIDmY3KK8t6ojBLjjHvBRLEYd36PYLAv7ayE/dhVP+5Lmg5o+lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827511; c=relaxed/simple;
	bh=f9Q7oZzAD3nVBbCeFbQ5MfukDb6SqnYSXJSBVfzsRMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d/60Y3O7zQyx1lqdYZvWRR9tQSFk9PeU/Q9WN35W4elqE9izeXUKJypDtbca87hkuFT1xRP+rBQwLyw8J87RHsnDHFhCQPvtMu36VnlgAfhHnP04AVOzp5W77/TZPPAUmV5YOoClupOPz+2qUJTtQkVojVJ2IfrfZs7oMtLhc7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YdTG/lBL; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 938881FCE8;
	Fri,  9 May 2025 21:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746827507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3ybU8O60AFFwP7YDQiZRFLzyAUOwV85K224Agh85zF0=;
	b=YdTG/lBLqsugAmiwZTWnq6AeEi93etuaS35Q7flJL2B+hpTTc9PkVY3qgnxbOwAHG2GRrl
	O92c0r5S+mCaPJ7rqhc6yJWAIf9E5Bx8EE4Vp6Z+u38Ozjo02E+kxxmdS1H/lqyVdU2TT8
	nGXVOjPoqZCpWcesJnyj5GXxVccfK7Y+bJsO832Mk84drlVfMWkjQP5hLPNWQL1r9wOiYM
	m+KIPg+wsYWilRSpctPT8lLI4Y4rlrk2EpZZAYOjcVjGNs0HXGqhsdpkjC2Reoa6LB4+GP
	4+y/GL1Xq5Owm011apG+TLAawqecn4oeookjSGmeHF1BfjlcLsdkPA+ORJONzw==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Subject: [PATCH v3 0/4] Describe the cameras in the PinePhone Pro dts
Date: Fri, 09 May 2025 23:51:36 +0200
Message-Id: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOh4HmgC/2WOQQ7CIBBFr9LMWgxMqS2uvIdxAThYElsMNETT9
 O7SLjTG5fuZ9zIzJIqeEhyrGSJln3wYC9S7Cmyvxxsxfy0MyLHhiB2zeqCoWas7JQ057XQL5fg
 RyfnnFjpfCvc+TSG+tm4W6/qXyIJxZhvRHZRTklR7MiFMdz/ubRhgjWT8ijXHj4hFrAUaKY0sf
 9hfcVmWN9ek20HXAAAA
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
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtudehfeeutdffjeeviefgjeetieeuleefkeefgfevfedvlefgiefhheejueejvdenucffohhmrghinheptghouggvsggvrhhgrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvv
 hdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegushhimhhitgesmhgrnhhjrghrohdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com

This series adds support for the Pine64 PinePhone Pro's rear and front
cameras in Device Tree.
This is based on some of Ondrej Jirman's patches hosted in his tree at
https://codeberg.org/megi/linux, but I have also fully reviewed and
re-written the code from the RK3399 datasheet, the PinePhone Pro
schematic, and the IMX258-0AQH5 software reference manual.

I have tested these changes on my PinePhone Pro and am able to take
photos from both cameras using libcamera's cam.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
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
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 139 +++++++++++++++++++++
 3 files changed, 145 insertions(+), 2 deletions(-)
---
-- 
Olivier Benjamin <olivier.benjamin@bootlin.com>


