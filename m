Return-Path: <linux-media+bounces-29979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D222A84D8D
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 21:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AD204C4529
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 19:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A37290BAC;
	Thu, 10 Apr 2025 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jqis39RA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A97D1AA786;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314798; cv=none; b=K57yrC0IWCWllWnHYaZu8dTusZlkS/XAciiQJkebNjcji/3/R4/QFBEQuEDI8eSZXjZwTpEc5agj07K0xR+VxdlRwexT0afV+J19rawcpP/eIH2uSQXa0pX4ZPuYcMv/bvklPciYovGzV1ca8M1LhC6XwsG1rYqHPmrJMrTpwUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314798; c=relaxed/simple;
	bh=wU0YYPKmNyGtaBsxlvQY8hwwBm3RGBaYo0XjCB2cudU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PS7mb4BP46s9PzsQCuyDaSLQO6z1E2Y5FJC50UwJzp49Zv+XgstfQ8jk8fUqYzUyKf7DR/6ninh8jZhMrWtEL8OnVuA6pzuG/9PLxiA71Iao35Qywjc97nE9qxyELaHf/4R13mKmimAZ2vz5tJxpSW8wJ4QVqXM0twqv7nY5DMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jqis39RA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81392C4CEE9;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744314797;
	bh=wU0YYPKmNyGtaBsxlvQY8hwwBm3RGBaYo0XjCB2cudU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Jqis39RAJUIwHpzOmErzfNTw0nMNApG8ObsZbhGN9MzIqK63Ash5Lhh5299DW2V1x
	 KIVUtGDMkUwrE0Ke7idmAVCCPCXx3+Ao7J2O/U8jMVWseO6ap010W4icyd7X6njJZQ
	 B4dJzmf4ejkyC2o0I/2z1mZsfNYKNZx0UYTVkJwP9ExSlHAdE2Ofe70WwalY0JewLv
	 TcR4IpIuB81EC6JDeZmyblNZs2fgw+3A/gid/SO9tV0VDe/ixYjLULUDQQY867yUMA
	 Xg3qjmjo8aHagA84Pxt5fF8JqcWT0VF1x7tHTlQ2te19XUx13dzAzCeERZOu9+Nzr5
	 vCosSqFaIWkBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70035C369A2;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Thu, 10 Apr 2025 21:41:32 +0200
Subject: [PATCH 3/3] media: dt-bindings: sony,imx415: update maintainer
 e-mail address
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-maintainer-mriesch-v1-3-cdc5c6c68238@collabora.com>
References: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
In-Reply-To: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744314122; l=1515;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=xr1ihcFoc0yPTwxBHQ/xwE7MT3EXhuIWkXBlu34zX7Y=;
 b=Or2MDjLm15qmFgm2NdavJqYIiJs0q4ObG6CAZMRqnCXmyh3ZVWR9zx4ry92uishm80J5AC2Ym
 8cMzmp9bw/uCtk99fkkoYmlX7FyXhjmDdcL4DhWaCx4GMuKG8M91VWD
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

I recently left WolfVision but would like to continue to maintain the
Sony IMX415 image sensor driver. Update my e-mail address.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml | 2 +-
 MAINTAINERS                                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
index 34962c5c7006..7c11e871dca6 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Sony IMX415 CMOS Image Sensor
 
 maintainers:
-  - Michael Riesch <michael.riesch@wolfvision.net>
+  - Michael Riesch <michael.riesch@collabora.com>
 
 description: |-
   The Sony IMX415 is a diagonal 6.4 mm (Type 1/2.8) CMOS active pixel type
diff --git a/MAINTAINERS b/MAINTAINERS
index c87b26eada7b..f02a895e5cb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22563,7 +22563,7 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
 F:	drivers/media/i2c/imx412.c
 
 SONY IMX415 SENSOR DRIVER
-M:	Michael Riesch <michael.riesch@wolfvision.net>
+M:	Michael Riesch <michael.riesch@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git

-- 
2.39.5



