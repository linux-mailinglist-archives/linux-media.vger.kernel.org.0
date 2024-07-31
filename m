Return-Path: <linux-media+bounces-15608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA6D942746
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39210B22ADF
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E28F1A4B56;
	Wed, 31 Jul 2024 07:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VTqvPk1u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347391A4B4A;
	Wed, 31 Jul 2024 07:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722409382; cv=none; b=KRQKxQ3NQLhMNoDzYhsd6+DE1d4NKt+UdUWvpVajziCo86dTB18i+yvHQ4W7rC+ch/+QXyM4P78GeShjZowb0VBByeEoUD2J7B6TxLzpSjeHX542Hju/oTEVMKT7K7+OGmNq4fNqQ6jR00HC9Q3G6MC8qLeNj/FGLr7ZV/Hm9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722409382; c=relaxed/simple;
	bh=liF0sXKHqjDKpx94oIxqmUf1lDsy3nU2IMMBID62o+E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i2Msxk+4jriTcGilc4gG6mupLX8fXtYz22JakHnGqbJXmqnGG/ElxNmqtjksqZwOgGxBtMHYInjrsUmcNF+awF0qdJp+3G98RdvLZbrDHqmykz0VQs/VpCHAdpQXKKXwkSffKYgomG5PLcTUgg7TAMaHUg231Cik39orSXCmpZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VTqvPk1u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.29.25] (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43CB6842;
	Wed, 31 Jul 2024 09:02:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722409331;
	bh=liF0sXKHqjDKpx94oIxqmUf1lDsy3nU2IMMBID62o+E=;
	h=From:Subject:Date:To:Cc:From;
	b=VTqvPk1usTRwO6vA8uspqkmnqJPEC+ZokX+w4D/B8DAg5/0wvBaz/D9LVL3KWsa2r
	 3ECkq3C6m8U917kFyRUU35oZlwbMjoqo4+gnqbd1lHU0ZyDzPCeBqzoDWJnYBgPa92
	 ozOS3KxDwWwABAJyU9LkqjP7Nj74HRvbTR6FdVxw=
From: Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 0/2] media: imx335: Fix reset-gpio handling
Date: Wed, 31 Jul 2024 12:32:40 +0530
Message-Id: <20240731-imx335-gpio-v3-0-443bfa6ce864@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJDhqWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc2ND3czcCmNjU930gsx8XQtDixRzY7M0SyNLUyWgjoKi1LTMCrBp0bG
 1tQDrVJMCXQAAAA==
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
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722409375; l=1367;
 i=umang.jain@ideasonboard.com; s=20240731; h=from:subject:message-id;
 bh=liF0sXKHqjDKpx94oIxqmUf1lDsy3nU2IMMBID62o+E=;
 b=vuOEomY0cQDyzahht6nf3VDWeVkMWHOG1+/Px1nw7idTbw0BNwniKEzHLG+Hz80zUztxlFMxh
 VOIRJoDKonYBogAwvaO9JfsrEeJh4sLWI6Z56PHBY5VPD5AJDT4Hfso
X-Developer-Key: i=umang.jain@ideasonboard.com; a=ed25519;
 pk=7pvnIBNsDpFUMiph0Vlhrr01+rAn5fSIn/QtDeLeXL0=

These couple of patches intends to fix the reset-gpio handling
for imx335 driver.

Patch 1/2 mentions reset-gpio polarity in DT binding example.

Patch 2/2 fixes the logical value of reset-gpio during
power-on/power-off sequence.

--
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
base-commit: f3d2b941adafcdfba9ef63d9ca5bb2d9b263e2af
change-id: 20240731-imx335-gpio-818d736f9295

Best regards,
-- 
Umang Jain <umang.jain@ideasonboard.com>


