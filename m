Return-Path: <linux-media+bounces-33307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EA9AC2E60
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04EB44A2F37
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 09:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D53B1991CB;
	Sat, 24 May 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbkwFYrH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E24A01;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748078083; cv=none; b=DRnGjSG22hrFtEO9ASDSlNz4/BS04r6g7RetZnyA4bSxSIWtkBoKCTFJTUqnEUgxDpeMU5mQc977YQW9tXWNguV0EzsNx+12b5flonlibHci00W5eWjXnE15DFTmtANA8sbEav06wC1gLxBajTDD4mIXeA9gZFYcO+vjf1JaywE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748078083; c=relaxed/simple;
	bh=CitvJ9lBuFBmvOFYluWUYT8ZBS/Uz4ur42/Hat5GQ4A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hc2hH8zl6YeSLorS9VlRbFydS7R4hUZZYCd1c7sBAu5R8ZUx9FUZM/lbgnQG95C90CtIl7KBDFCfEjcOX09WqPzH8swP8VsDyiqN0GOURRTNvBZXTlXgZhvK38hr0dmpzzDCIbFk3ToFZM/CXAbcStO0ixKiYStyhGKDViQ+b48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbkwFYrH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9463C4CEE4;
	Sat, 24 May 2025 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748078082;
	bh=CitvJ9lBuFBmvOFYluWUYT8ZBS/Uz4ur42/Hat5GQ4A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hbkwFYrH8MSPiHj7J93++UbWQVp2UTdvzicU5GIFgcJkV6HwlTezTEdFHRu1dQt4N
	 p0Z0XBUDwJ8gR0lCeuWfNwRBWleGGdm21sakTiXEGSn73AvAB9slZqjQfxB+9fizNe
	 rbeSn2xot6v+JgEIYLMfq3drmsZzdLT0CxdsbKL6ou6OiQENJrRqBlZe2uYHJdAToS
	 oOPBbUHnxws9qAwdKmdM1vHSqISUNqn4z8fy11Cz1YaWMAV37cS+creqIKKb2nYPNt
	 8lc+xEFajGAtghgDNN1skZPGm+ervN5YdppBaKjsjhPi6PUGRe14dFMnJsNyXleHRG
	 Uo/ijjg/WF0YQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE115C54F2E;
	Sat, 24 May 2025 09:14:42 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v4 0/5] media: i2c: imx214: Add support for more clock
 frequencies
Date: Sat, 24 May 2025 11:14:35 +0200
Message-Id: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPuNMWgC/2XM3wqCMBTH8VeJXbfYzjatrnqPCJnbWQ5MxZlY4
 rs3JeiPnKvvgd9nJAFbj4EcNyNpsffB11UMud0QU+jqitTb2AQYKCZZQv1tAC4zY0LWlCVFqdE
 yPKASQOKoadH5YQHPl9iFD13dPha/5/P3TXH1T/WcMmqFTVO5R+Vye9KN757BFDu8kxnr4QPEW
 wEQARdtBSzhzvE1IL4A4CtARCB3udSQK2G5/AWmaXoBeiUP6DABAAA=
X-Change-ID: 20250406-imx214_ccs_pll-e4aed0e9e532
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078081; l=2067;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=CitvJ9lBuFBmvOFYluWUYT8ZBS/Uz4ur42/Hat5GQ4A=;
 b=BQwSNDVlkAXpO8nEP96coicinOVWn6M8dZiuEuOgTvIVnL0Fy1e+8oQOoovx3aIJOm1bleNd8
 or9MrHm8VCbBCG5To0hdUEKHIbdfu7Yui+3MBu//z78Wl5fl/aUKX8F
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

The imx214 driver currently supports only a 24 MHz external clock. But
there are devices, like Qualcomm-MSM8916-based phones, which cannot
provide this frequency. To make the sensor usable by those devices, add
support for additional clock frequencies.

This series supersedes
https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu/

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v4:
- Add missing colon to error message
- Add A-b, R-b tags
- Link to v3: https://lore.kernel.org/r/20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu

Changes in v3:
- Limit range of pll_ip_clk_freq_hz (Sakari)
- Drop unneeded 'ret'
- Use pll.pixel_rate_csi for bit rate calculation
- Add patch that deprecates the clock-frequency property
- Link to v2: https://lore.kernel.org/r/20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu

Changes in v2:
- Add A-b tags
- Switch to v4l2_ctrl_s_ctrl_int64() to acquire the control handler mutex
- Add error handling for v4l2_ctrl_s_ctrl_int64() and
  imx214_pll_update()
- Replace "read clock frequency from dt" patch by "remove hard-coded
  external clock frequency" patch
- Link to v1:
  https://lore.kernel.org/r/20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu

---
André Apitzsch (5):
      media: i2c: imx214: Reorder imx214_parse_fwnode call
      media: i2c: imx214: Prepare for variable clock frequency
      media: i2c: imx214: Make use of CCS PLL calculator
      media: dt-bindings: sony,imx214: Deprecate property clock-frequency
      media: i2c: imx214: Remove hard-coded external clock frequency

 .../devicetree/bindings/media/i2c/sony,imx214.yaml |  29 ++-
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/imx214.c                         | 263 ++++++++++++++++-----
 3 files changed, 217 insertions(+), 76 deletions(-)
---
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250406-imx214_ccs_pll-e4aed0e9e532

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



