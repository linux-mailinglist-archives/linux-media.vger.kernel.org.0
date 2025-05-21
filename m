Return-Path: <linux-media+bounces-33057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E096CABFD6D
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 21:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95BD14E469E
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 19:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2260E28FFF7;
	Wed, 21 May 2025 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2GoH/v7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8EB23183D;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747856151; cv=none; b=Md2qx0wK8ulb8sy/YQmG51b4cPjhn7atDT135/NOZmtWCwd3POYEO30OuKwlW3Kxm8H6s+uVZzCC8JH4pPu90ulU5PDn09oKVq3PqKfj7mGeJpWx/esJJyaPsrNpLBcY+pCuI/f8rgrfK9pEd9IXfGEIvBsQ0FLQT4wdLiHeLUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747856151; c=relaxed/simple;
	bh=YCdymVDth/prPqkIK7W4QDnBSw+ChQ0vJvm38czsFpg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=js7EvzI4EgvC/3Xg3yXEhBMz1aD2eBH+AM94Mos23q28wcsodXqZ9cY98JYlHMqhmii4nYil7HnVh1tXhUO3LxDmr0C8b6dvYcayN3CbR+r3q0jrxY8immijG8i05JbBBE9fUIuMLvWocCcog8Yz4bZ7v5kuiTPhCFw1nm4ebdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2GoH/v7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00428C4CEE4;
	Wed, 21 May 2025 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747856151;
	bh=YCdymVDth/prPqkIK7W4QDnBSw+ChQ0vJvm38czsFpg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=a2GoH/v7NCUwJStHohhcwr7SDmdK+nqKj00Ld255vw6AaGS7s2evcP2kdLUZ/05SL
	 2g20KNGo37e6VbYkYB8+46wQLYBrmvwRYRgISjAdK9QIWeB1RBluxINAWT9FOpiPUY
	 kRjkkFJrwjzJHhgV3ecyN1rt1LnPgR5+YEQharZlZqTIuEqvy0JEdq5VgKS8bDW8m3
	 8dBIuQQHgdFjnPZ08lcAqhEzv8dDOZTzmLdJG/HX8F00S0t0uENuDlxDe4r5jAWz9n
	 itthYIeR1peS47wUKaIaftFlSc5D60TnvetGhfh9pjCzprCVbNPWXb7xlasEzHFSf5
	 23F8xhPYlCSfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E08C54E90;
	Wed, 21 May 2025 19:35:50 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v3 0/5] media: i2c: imx214: Add support for more clock
 frequencies
Date: Wed, 21 May 2025 21:34:23 +0200
Message-Id: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL8qLmgC/2XM0QqCMBTG8VeRXbfY5qbVVe8RIbad5QHTsdmwx
 HdvShAV5+p/4PtNJIBHCOSQTcRDxIB9lyLfZEQ3dXcFiiY1EUwoJllB8TYKLiutQ+XaloKswTD
 Yg8oFSSPnweK4gqdz6gbD0PvH6ke+fN8UV79U5JRRk5uylDtQ9mKOtcPhGXSzhTtZsCg+QLo/Q
 CTAJlsJVnBr+Tcwz/MLkEYpUO8AAAA=
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
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747856148; l=1895;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=YCdymVDth/prPqkIK7W4QDnBSw+ChQ0vJvm38czsFpg=;
 b=syVQLuePuGfp3dACqYgN2W+Ayfo4zcFv5KgkcjstEAWtm0hlQX+CxxZbPIZe6GwMN6KyO86Ns
 /0lOZW8RTyTAklCrce5sVjlA8tuwqb/AzmNUrP5MyZOt5LtV/+4+vuG
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
base-commit: ae0384b772a260975af192746d900c328392e525
change-id: 20250406-imx214_ccs_pll-e4aed0e9e532

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



