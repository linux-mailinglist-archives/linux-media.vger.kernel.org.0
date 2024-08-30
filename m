Return-Path: <linux-media+bounces-17193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C533965767
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C30341F248F5
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECCC152E17;
	Fri, 30 Aug 2024 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GaaKR42r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1256481DB;
	Fri, 30 Aug 2024 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724998332; cv=none; b=AT+1qwvPWx4FkYFa3NSTwFrmXHAqzTb75/eBFydCxLBF0bxZE14fQ07lB5G4RlP9JDh1bmjFh1flj5HOm2o84IJs2v/11JGz1AYyVGFYlW6QhsFJSQo27hcZUSN9IBTsaryDvW57u4ixWHkxV5vXNocenuTCruwhJYTgu8U8Fwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724998332; c=relaxed/simple;
	bh=LSNxO6sFebrhQiVeGhHLcgjRgxU3KR/BCfC7qN5Q08I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jZ/E9OWnNzMWjbKFXBbxFZSaH+mOS2HXGCTVXHbeMrDmyweVqfsBu2U6mgXcEKPNE8m+wcmMbA9/fqF9d6xhsETQIIo4aPgafwlF3gQAF2kTij9pmkgjlvnVYT6ua/hkSXKKKw6vYiGinmBJ6zMvBaPeQBXAGWfi8Tg7qmcyUjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GaaKR42r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.29.25] (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CF40229;
	Fri, 30 Aug 2024 08:10:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724998258;
	bh=LSNxO6sFebrhQiVeGhHLcgjRgxU3KR/BCfC7qN5Q08I=;
	h=From:Subject:Date:To:Cc:From;
	b=GaaKR42rgLf2d1olXsyWhoIrkCGJ3DZjMNO7y21HdEXrzZFomF5orEaLxSADCmZVU
	 5HrQzKev/j5hXk7rPuM9MRTZxObbvRAGCpjwJ46VaP3jQkn9sJ4F/qVRwRJhUUL22K
	 KfWbUvQUJ62NyO6a1Dws6WyzV1uIxbvSRd8nIC7E=
From: Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v4 0/2] media: imx335: Fix reset-gpio handling
Date: Fri, 30 Aug 2024 11:41:50 +0530
Message-Id: <20240830-imx335-vflip-v4-0-cb9f20fc7b87@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKZi0WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIxMDC2MD3czcCmNjU92ytJzMAl3zNNMUkySTFAODtFQloJaCotS0zAqwcdG
 xtbUA5YvHAV4AAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Martina Krasteva <martinax.krasteva@intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724998323; l=1475;
 i=umang.jain@ideasonboard.com; s=20240731; h=from:subject:message-id;
 bh=LSNxO6sFebrhQiVeGhHLcgjRgxU3KR/BCfC7qN5Q08I=;
 b=9vlxnyuGZ/VzIRIJKJ/rr/w8RNFAHS7Pjh3PKKSi5XXtvYXkHOp4NJBSthjHbb7ENuqATsM4v
 EzieYwWZJXCCpeThAgn71733n5+CuoG42Mi4ywTU4SANAox3kEzfbel
X-Developer-Key: i=umang.jain@ideasonboard.com; a=ed25519;
 pk=7pvnIBNsDpFUMiph0Vlhrr01+rAn5fSIn/QtDeLeXL0=

These couple of patches intends to fix the reset-gpio handling
for imx335 driver.

Patch 1/2 mentions reset-gpio polarity in DT binding example.

Patch 2/2 fixes the logical value of reset-gpio during
power-on/power-off sequence.

--
Changes in v4:
- rework 2/2 commit message
- Explain conclusions for 2/2 patch, in the '---' section.

Changes in v3:
- Rework 1/2 commit message
- Fix gpio include in DT example in 1/2
- Remove not-so-informative XCLR comment in 2/2

Changes in v2:
- Also include reset-gpio polarity, mention in DT binding
- Add Fixes tag in 2/2
- Set the reset line to high during init time in 2/2

Link to v2:
https://lore.kernel.org/linux-media/20240729110437.199428-1-umang.jain@ideasonboard.com/

Link to v1:
https://lore.kernel.org/linux-media/tyo5etjwsfznuk6vzwqmcphbu4pz4lskrg3fjieojq5qc3mg6s@6jbwavmapwmf/T/#m189ccfa77ddceda6c3b29be3306f1a27ed0934d6

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
Umang Jain (2):
      dt-bindings: media: imx335: Add reset-gpios to the DT example
      media: imx335: Fix reset-gpio handling

 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 4 ++++
 drivers/media/i2c/imx335.c                                   | 9 ++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)
---
base-commit: 393556c9f56ced8d9776c32ce99f34913cfd904e
change-id: 20240830-imx335-vflip-7f5d4b4d00fe

Best regards,
-- 
Umang Jain <umang.jain@ideasonboard.com>


