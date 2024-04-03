Return-Path: <linux-media+bounces-8540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D73897394
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 17:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD1261F22BBB
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 15:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF4714EC48;
	Wed,  3 Apr 2024 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="BsF40tDW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta113.mxroute.com (mail-108-mta113.mxroute.com [136.175.108.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2093414BF82
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712156941; cv=none; b=b/ODccySz8bpedMI1eLoXWqlmfdEvNpw2dlbc1I/wKcMWn4br3+lX3cWt/x1lJdw71m2xcCt6RK/1Spm96AQhIL7LUwim1M40wMGy39D9CCFsLZzUyy4I53GYrEPqx0armSNtliiSCL8F0w+opy5Yysx5T+GuqwT6aondkRBjDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712156941; c=relaxed/simple;
	bh=0jE//HJz1xD6oEwMFqvK/Pa++yl5s3cJ3Z7S/AY1DqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3QtJN7KSOxTUm9inP7sfXYZjzsHHtidEg/aShio6AcsbGKswtTMKvv3UjPcTNWGIZAgcdofFs22JO5FFM6rABs4T1WOWW2kpkDyg7VSQkUsuLm2EvrvVSUxm+n1yyb6U86JmCuDWbTciT2/rSoGzx4bcxBLSjApv9yQ56WByNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=BsF40tDW; arc=none smtp.client-ip=136.175.108.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta113.mxroute.com (ZoneMTA) with ESMTPSA id 18ea4808e990003bea.012
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:07:52 +0000
X-Zone-Loop: c73f4090fa37b5a0a6d589fe756d8a05ee221b5c2c4d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oBFF6QVe/lpCGu+E2vjs00/Iw1NaooEs+k0vBn8Hy3Y=; b=BsF40tDWZuQoZayFXP4sDxe1sk
	l3bM1ChEF5QdYv74KE4ucKV9qZ2ElJeu8e39dajwgcPUa1/i99xQmMZRdo/Gc3laO6thHfeR2yeGn
	Hwo86rX/GMiXYWWSZOmkIfPNhBYIclDuwVrddyG3PRdpb1M3Agosy+NRhvqbK51aG9ymR3El2fCrZ
	Dp5ATjjxhH9R+4nCigDm5c+YZqIjpharUWi3/UrROXU+Zd8AtmlcX5UWoAfzP+4M0x1worQo0gRy2
	V3YBKdxA9mNSPNHOYKD1RkZ9BX4TP3/GeYQKxegvngzAc0JUouoPG2U1KZHdIHDejSqIiucWLo0rn
	+lIxSqJw==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v3 17/25] dt-bindings: media: imx258: Rename to include vendor prefix
Date: Wed,  3 Apr 2024 09:03:46 -0600
Message-ID: <20240403150355.189229-18-git@luigi311.com>
In-Reply-To: <20240403150355.189229-1-git@luigi311.com>
References: <20240403150355.189229-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

imx258.yaml doesn't include the vendor prefix of sony, so
rename to add it.
Update the id entry and MAINTAINERS to match.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 .../bindings/media/i2c/{imx258.yaml => sony,imx258.yaml}        | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml => sony,imx258.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/media/i2c/imx258.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index 80d24220baa0..bee61a443b23 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
+$id: http://devicetree.org/schemas/media/i2c/sony,imx258.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
diff --git a/MAINTAINERS b/MAINTAINERS
index 8ceb49f1b630..a8c3a531ad39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20489,7 +20489,7 @@ M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/imx258.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
 F:	drivers/media/i2c/imx258.c
 
 SONY IMX274 SENSOR DRIVER
-- 
2.42.0


