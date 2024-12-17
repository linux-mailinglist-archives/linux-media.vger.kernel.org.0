Return-Path: <linux-media+bounces-23522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9309F40ED
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 03:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E44E1188E2A4
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 02:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE931459E0;
	Tue, 17 Dec 2024 02:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="Ya3k+FNL"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA784E1C;
	Tue, 17 Dec 2024 02:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734403350; cv=none; b=mhzmBnez9IveX20nE9tCx+uixTcw03GvzrHH/qqtcdHgBX7wWlwmlUlU8nWH8iQbu5r4cYrL9AhvfOcyC+3uPZtjoHys3B6d9Ff9rlICna7Zlm20evvbC4BMQYSgbG6gAnrVFMHbQZF7vXEeT8xUgDLGh7Wot/wEPOWuEnpOJ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734403350; c=relaxed/simple;
	bh=ZaW8jX56lhsA3mvxJABfmr0Sl4etpErYZC7vDB9jGkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qifs9MTpAOj+VttHnLBqV+DJFLBvjubE6Y9P8anUJ/ZB2K8dujzcFTqNjmTE8tDu12nRGmPjw12q71Qt232sxmLzIdoXCqKCtV6E5jAdp4+iMrTgiG6OvUDMNJn8MpzrgKQgF5hJOPth2wGf+UT4hbWBGn/VGUv9bm0oLVLKS0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=Ya3k+FNL; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.lan (99-158-29-91.lightspeed.miamfl.sbcglobal.net [99.158.29.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 8316F160E15;
	Tue, 17 Dec 2024 03:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1734403337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hiGqN27tDAV5FzljGhw0omCZAMqhmOG3k/Hy3TcNcVQ=;
	b=Ya3k+FNLuQ/rfXYftJ0HcaO2J7yOnwSEdVqwRZYaxKfufAiTB4HqfXOV7rMlvd64vZkCQh
	pY1DL4jgthkHbO1JXxsIMOvu/JJwXXvLQfgl/OtdCFrEDqEscGOFAvkFM+qzERolzOSOK2
	UeXP5HXFl4xBS4OGdrvgn6vMJ73e5+I=
From: David Heidelberg <david@ixit.cz>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: imx219: Rename to include vendor prefix
Date: Mon, 16 Dec 2024 21:41:50 -0500
Message-ID: <20241217024206.1700170-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx219.yaml doesn't include the vendor prefix of sony,
so rename to add it.

Update the id entry and MAINTAINERS to match.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/media/i2c/{imx219.yaml => sony,imx219.yaml}        | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (97%)

diff --git ./Documentation/devicetree/bindings/media/i2c/imx219.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/media/i2c/imx219.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
index 07d088cf66e0..8b23e5fc6a24 100644
--- ./Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
+$id: http://devicetree.org/schemas/media/i2c/sony,imx219.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
diff --git ./MAINTAINERS ./MAINTAINERS
index 453ba75fce3b..32a4d057a559 100644
--- ./MAINTAINERS
+++ ./MAINTAINERS
@@ -21796,7 +21796,7 @@ M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
 F:	drivers/media/i2c/imx219.c
 
 SONY IMX258 SENSOR DRIVER
-- 
2.45.2


