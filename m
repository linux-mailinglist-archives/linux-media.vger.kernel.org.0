Return-Path: <linux-media+bounces-30191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCBEA88BFE
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 21:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C881179930
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 19:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4431F28DEF7;
	Mon, 14 Apr 2025 19:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwOXZP9o"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8720328A1DA;
	Mon, 14 Apr 2025 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744657950; cv=none; b=oqEOVLDVUCQiDCBEr0RVtTtPRGg0W4anxait3cLTDsb2eyMy3u6Han8oJA5N+EWYxmb+HxPKSZfUBFQuBHgrq552p0e9idZb1RU29IHddqmHsc8dgEbjP+T0gpmIISsRep/UYoelmJZARhIzzkE8CkV6HF1nv3tFV3oRXSCI2wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744657950; c=relaxed/simple;
	bh=6BqgelGhI6z4Y+nuFdm2UZwyVMhVkDOkptQV5GFW2ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WP0094AQNYqk0i3CDuxelz/KqfU7b+EIkaoglE9bjo1PIB8V0kPaMNfVT0FCOGemeK5YhzwTCua+2ah7pIril1fOLDCtPsS61ih17/tXHIbAVSS46p2QVvCvPoxJvFWu1VIWs7iTZiXq2iEOL0JUmjiTYQtf2zyMOlZjVeUdCRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwOXZP9o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58162C4CEE2;
	Mon, 14 Apr 2025 19:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744657950;
	bh=6BqgelGhI6z4Y+nuFdm2UZwyVMhVkDOkptQV5GFW2ww=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=YwOXZP9oUQrIkjckCiga6ktjbWj+V3K4nTVJSiXpj0ITpu5PwNRPa7PtvDkuemePW
	 pqMleumOZ238lUV9p0/sPTbrHGZOox1NFM/xBwvvxB2EKbIrPQscZP1xUiB4FCs5nE
	 V/LFZ09oZnYRgEcAp1rP6mNJdfOUM8RKeFb3JT/AVFPCzDiYY874oC9NNYJayO8NHc
	 l9tvqv62kSaIsbYacxghFhs4ByVuY9TNm5crSYMFwVr4pSvZEhNRfdePO40Eh1R57a
	 ELhXmaZ8WAojKYKL+oDikCJTWF4v4YwnKG6MQKqAu3UicttAnKGO62dtrzxrrhahXR
	 oE0wrpOCBaBmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4926BC369B2;
	Mon, 14 Apr 2025 19:12:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 14 Apr 2025 21:12:29 +0200
Subject: [PATCH v2] media: dt-bindings: media: i2c: align filenames format
 with standard
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250414-media-i2c-align-filenames-v2-1-e133749e0d45@ixit.cz>
X-B4-Tracking: v=1; b=H4sIABxe/WcC/43OQQqDMBCF4atI1h1JgiHaVe9RXAxm1AGNJQliK
 9690U23Xf6L9/F2ESkwRXEvdhFo5ciLz6FvhehG9AMBu9xCS21kpSqYyTEC6w5w4sFDzxN5nCm
 CrZ0iiw4NaZH3r0A9b5f9bHP3YZkhjYHwJ2rZqMYYZUtV1VZKUOBwZffgjVPZfU5n5JiW8L4ur
 urU/ty2x3F8ARqwiV/hAAAA
X-Change-ID: 20250414-media-i2c-align-filenames-78d1e7ada5e2
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Ramesh Shanmugasundaram <rashanmu@gmail.com>, 
 Tim Harvey <tharvey@gateworks.com>, Akinobu Mita <akinobu.mita@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14828; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=mHA4VTRSwJqrHD9O7Hk/y42cNsbaTKLbs1trwGNiN7s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn/V4dI1Uqb5A2eVfK55PAo3SrBDt0/GSIzl/Ko
 eow13167vCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ/1eHQAKCRBgAj/E00kg
 cprOD/9STCZP+f4B2Gk/JAq0OtZXl4f79OQCKH7JBc60tXtqV0c2hPRAPo0eQ7dabxfOLad9la+
 uMu4QKvLrGO5iumZDEEgtwL6iXGjfy81A565o4/6iyfXJLTGRmycma+nwq2OdKJXF+HhieTYt+M
 hBzD8ZVn/nkQFe/KaNEq4qHKF6i0L5gLCK1IFaD2RhK/vGR2vPCBnf2+v3sqTSpX9Uh3M2PZC/l
 nS2iuzpKQ4heCsX7bHYCy0CTWmL9R7ZZeWEXEgQlVOsm1mK8CN8LzH50pw6U0o5ijsPLaPCli66
 v6gIxKDgrzfEAk8aRSc2N/bopsa+UtGMDKDk25dtloI9uuf5CaKeHA0MLPnR4QwekHiYhtKdPgC
 wHTJRjYTLfp2RxXnNOs315BIMB0XcxUcgMeW6/i6i9YIH9is+pAXfjT7R7ohXkrC4CNWqlFNz+H
 q5wToEqXWoRtwOcuuAprxxfwFqRl9t/ZcLIYkx6Xgp2z1pCeIR9pZnIvVUmQIDAVsgGOP7LRsCr
 RKW69UvxjRgXIdn/lmyP1JRX2MsgXkAmSp6mr+r4LH+Vu+Qp/ese05VWPTubW7E4A5/FnmtZlz2
 hyGFaDVa362I0WwYG6hfXpgr6wzkmOjq0Kaqta2tg3HAE1LXWj6ieT/kfU8gBb5C5a7T7W6oOtp
 vTgqt6gE0BWikDQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Append missing vendor and align with other sony definitions.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Omit touching ad5820.txt which is being converted to YAML by another
  patch in parallel.
- Link to v1: https://lore.kernel.org/r/20250209195517.148700-1-david@ixit.cz
---
 .../media/i2c/{adp1653.txt => adi,adp1653.txt}      |  0
 .../media/i2c/{adv7180.yaml => adi,adv7180.yaml}    |  2 +-
 .../media/i2c/{adv7343.txt => adi,adv7343.txt}      |  0
 .../media/i2c/{adv748x.yaml => adi,adv748x.yaml}    |  2 +-
 .../media/i2c/{adv7604.yaml => adi,adv7604.yaml}    |  2 +-
 .../media/i2c/{mt9v032.txt => aptina,mt9v032.txt}   |  0
 .../media/i2c/{max2175.txt => maxim,max2175.txt}    |  0
 .../media/i2c/{mt9m111.txt => micron,mt9m111.txt}   |  0
 .../media/i2c/{tda1997x.txt => nxp,tda1997x.txt}    |  0
 .../media/i2c/{mt9m001.txt => onnn,mt9m001.txt}     |  0
 .../media/i2c/{ov2640.txt => ovti,ov2640.txt}       |  0
 .../media/i2c/{ov2659.txt => ovti,ov2659.txt}       |  0
 .../media/i2c/{ov7670.txt => ovti,ov7670.txt}       |  0
 .../media/i2c/{ov7740.txt => ovti,ov7740.txt}       |  0
 .../media/i2c/{ov9650.txt => ovti,ov9650.txt}       |  0
 .../media/i2c/{imx219.yaml => sony,imx219.yaml}     |  2 +-
 .../media/i2c/{ths8200.txt => ti,ths8200.txt}       |  0
 .../media/i2c/{tvp514x.txt => ti,tvp514x.txt}       |  0
 .../media/i2c/{tvp5150.txt => ti,tvp5150.txt}       |  0
 .../media/i2c/{tvp7002.txt => ti,tvp7002.txt}       |  0
 .../i2c/{tc358743.txt => toshiba,tc358743.txt}      |  0
 MAINTAINERS                                         | 21 ++++++++++++---------
 22 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adp1653.txt b/Documentation/devicetree/bindings/media/i2c/adi,adp1653.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/adp1653.txt
rename to Documentation/devicetree/bindings/media/i2c/adi,adp1653.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/media/i2c/adv7180.yaml
rename to Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
index 9ee1483775f60905d300fe909f10052a00183fbe..dee8ce7cb7ba2e9e8c3d6018c164f63bb612ad1b 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/adv7180.yaml#
+$id: http://devicetree.org/schemas/media/i2c/adi,adv7180.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Analog Devices ADV7180 analog video decoder family
diff --git a/Documentation/devicetree/bindings/media/i2c/adv7343.txt b/Documentation/devicetree/bindings/media/i2c/adi,adv7343.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/adv7343.txt
rename to Documentation/devicetree/bindings/media/i2c/adi,adv7343.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/media/i2c/adv748x.yaml
rename to Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
index d6353081402bed849467e2cd003d80fe0e9d2734..254987350321bcff7ef255d2b4decdf5fa26bce7 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/adv748x.yaml#
+$id: http://devicetree.org/schemas/media/i2c/adi,adv748x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Analog Devices ADV748X video decoder with HDMI receiver
diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/media/i2c/adv7604.yaml
rename to Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
index 7589d377c686450bb0065de94091f9f6678b9413..6c403003cdda1ea0ac33a2b6be6d7477fb5fd44a 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/adv7604.yaml#
+$id: http://devicetree.org/schemas/media/i2c/adi,adv7604.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Analog Devices ADV7604/10/11/12 video decoder with HDMI receiver
diff --git a/Documentation/devicetree/bindings/media/i2c/mt9v032.txt b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v032.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/mt9v032.txt
rename to Documentation/devicetree/bindings/media/i2c/aptina,mt9v032.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/max2175.txt b/Documentation/devicetree/bindings/media/i2c/maxim,max2175.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/max2175.txt
rename to Documentation/devicetree/bindings/media/i2c/maxim,max2175.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/mt9m111.txt b/Documentation/devicetree/bindings/media/i2c/micron,mt9m111.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/mt9m111.txt
rename to Documentation/devicetree/bindings/media/i2c/micron,mt9m111.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/tda1997x.txt b/Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/tda1997x.txt
rename to Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/mt9m001.txt b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m001.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/mt9m001.txt
rename to Documentation/devicetree/bindings/media/i2c/onnn,mt9m001.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/ov2640.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov2640.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov2640.txt
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov2640.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov2659.txt
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/ov7670.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov7670.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov7670.txt
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov7670.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/ov7740.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov7740.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov7740.txt
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov7740.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/ov9650.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov9650.txt
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/media/i2c/imx219.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
index 07d088cf66e0bde362b12d3494e5c91a1dd96bf3..8b23e5fc6a24f5ce55986b44218f82b8281875bc 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
+$id: http://devicetree.org/schemas/media/i2c/sony,imx219.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
diff --git a/Documentation/devicetree/bindings/media/i2c/ths8200.txt b/Documentation/devicetree/bindings/media/i2c/ti,ths8200.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ths8200.txt
rename to Documentation/devicetree/bindings/media/i2c/ti,ths8200.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/tvp514x.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/tvp514x.txt
rename to Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/tvp5150.txt
rename to Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/tvp7002.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp7002.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/tvp7002.txt
rename to Documentation/devicetree/bindings/media/i2c/ti,tvp7002.txt
diff --git a/Documentation/devicetree/bindings/media/i2c/tc358743.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/tc358743.txt
rename to Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index af3537005de35dfd0ded11bdc2b9c63e10c70e93..aed17acd8845f24ebbe99b5a12763ae8cbf4623d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -528,6 +528,7 @@ ADP1653 FLASH CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/adi,adp1653.txt
 F:	drivers/media/i2c/adp1653.c
 F:	include/media/i2c/adp1653.h
 
@@ -1596,14 +1597,14 @@ M:	Lars-Peter Clausen <lars@metafoo.de>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
-F:	Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+F:	Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
 F:	drivers/media/i2c/adv7180.c
 
 ANALOG DEVICES INC ADV748X DRIVER
 M:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/adv748x.yaml
+F:	Documentation/devicetree/bindings/media/i2c/adi,adv748x.yaml
 F:	drivers/media/i2c/adv748x/*
 
 ANALOG DEVICES INC ADV7511 DRIVER
@@ -1616,7 +1617,7 @@ ANALOG DEVICES INC ADV7604 DRIVER
 M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/adv7604.yaml
+F:	Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
 F:	drivers/media/i2c/adv7604*
 
 ANALOG DEVICES INC ADV7842 DRIVER
@@ -14480,7 +14481,7 @@ M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/max2175.txt
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max2175.txt
 F:	Documentation/userspace-api/media/drivers/max2175.rst
 F:	drivers/media/i2c/max2175*
 F:	include/uapi/linux/max2175.h
@@ -16553,7 +16554,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/mt9v032.txt
+F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v032.txt
 F:	drivers/media/i2c/mt9v032.c
 F:	include/media/i2c/mt9v032.h
 
@@ -18007,7 +18008,7 @@ OMNIVISION OV7740 SENSOR DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/ov7740.txt
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov7740.txt
 F:	drivers/media/i2c/ov7740.c
 
 OMNIVISION OV8856 SENSOR DRIVER
@@ -18048,7 +18049,7 @@ R:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/ov9650.txt
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
 F:	drivers/media/i2c/ov9650.c
 
 OMNIVISION OV9734 SENSOR DRIVER
@@ -18253,6 +18254,7 @@ S:	Maintained
 W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/mhadli/v4l-dvb-davinci_devices.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
 F:	drivers/media/i2c/ov2659.c
 F:	include/media/i2c/ov2659.h
 
@@ -22554,7 +22556,7 @@ M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
 F:	drivers/media/i2c/imx219.c
 
 SONY IMX258 SENSOR DRIVER
@@ -23686,6 +23688,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
+F:	Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
 F:	drivers/media/i2c/tda1997x.*
 
 TDA827x MEDIA DRIVER
@@ -24523,7 +24526,7 @@ TOSHIBA TC358743 DRIVER
 M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/tc358743.txt
+F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 

---
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20250414-media-i2c-align-filenames-78d1e7ada5e2

Best regards,
-- 
David Heidelberg <david@ixit.cz>



