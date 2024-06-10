Return-Path: <linux-media+bounces-12868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B5E902518
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 17:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFFF1B22DD0
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 15:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A75313A89A;
	Mon, 10 Jun 2024 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="3TpDE/EA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CBD1E4A0;
	Mon, 10 Jun 2024 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032360; cv=none; b=iKFl/mj7x1hrucVcBi0sL3yQcT13OiD/SN0PhsCkwUYDAjY+6qaX3WZpQNQb40Mjxk3PhlM5glQSVsJUEFiUMnpwzvR+oZDD+q0v3Ka92wmIUEu086SVGZqfg+1Z6O/AQmKa5GGpbqSG5tLd4Rm1vdF9Wn70I17gBsxYyBvAWR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032360; c=relaxed/simple;
	bh=NXhLBTrkEXqWWfEvWJJd5wwdw3tralarTH5HfE/ofXA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9dgIiAJUISQlEVVVsNQhrNaOrIfZSws0SfCE8AGatUXRzW9r7VhB0MsagYzBMgM0lPvP2iA2qHH0xSN3Iv+OmjAxj5V+d880OcSLKpcXOUUCWydDn7avcNYph9PUAhpAaz2zoi/YZ05WrP+H1vaBjSriE9S+mwXNCKxbro5WTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=3TpDE/EA; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ACQgw0001003;
	Mon, 10 Jun 2024 17:12:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VC08VaT4tFI3RtxM08z5UVskQdzS+uTSHqkCNm3Oxbk=; b=3TpDE/EA8eC53Ix3
	HG9sOKXdEG6aFprQloCSQkInhc3wA8oqQ/HW29IzbK7iM1JrMfSoPkl2kfYVeL0Q
	qBAwlrzDTSFhzVuzLO+HZX6q4SgX+bfk/vGycH6IPZBvUjJME+KybPSFVRsWfkzq
	7S9G1Bd6Bdo+hS8yXIIqamHLOsxxqAFH4BpEnetItbJC77qCfo83drvquMidq3Jf
	7v+3FGunLAjrxiQDye8YUa1yUT7aiAz9SL2sA8bHSN3UafLDXXGLfP/M9hNuN8NX
	98i8TokAAMMn/CnaiAFpmhtYEaUBZUcUBv6ts2BhMCKWrWi5L9fn01L9S6AC8r8c
	+MBA4g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yn28hw81n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 17:12:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 46F644002D;
	Mon, 10 Jun 2024 17:12:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 772AB21B537;
	Mon, 10 Jun 2024 17:11:47 +0200 (CEST)
Received: from localhost (10.130.72.241) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 17:11:47 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>
Subject: [PATCH 1/3] media: vgxy61: Fix driver name
Date: Mon, 10 Jun 2024 17:08:13 +0200
Message-ID: <20240610150815.228790-2-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01

From 'st-vgxy61' to 'vgxy61'.
Align with other drivers to not use the vendor prefix.
Also the vendor prefix is already mentioned in the device tree
compatible string, being 'st,vgxy61', and does not need to be expressed twice.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 .../media/i2c/{st,st-vgxy61.yaml => st,vgxy61.yaml}       | 6 +++---
 Documentation/userspace-api/media/drivers/index.rst       | 2 +-
 .../media/drivers/{st-vgxy61.rst => vgxy61.rst}           | 0
 MAINTAINERS                                               | 8 ++++----
 drivers/media/i2c/Kconfig                                 | 2 +-
 drivers/media/i2c/Makefile                                | 2 +-
 drivers/media/i2c/{st-vgxy61.c => vgxy61.c}               | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{st,st-vgxy61.yaml => st,vgxy61.yaml} (95%)
 rename Documentation/userspace-api/media/drivers/{st-vgxy61.rst => vgxy61.rst} (100%)
 rename drivers/media/i2c/{st-vgxy61.c => vgxy61.c} (99%)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,vgxy61.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
rename to Documentation/devicetree/bindings/media/i2c/st,vgxy61.yaml
index 8c28848b226a..4e4c2c7ad168 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vgxy61.yaml
@@ -2,7 +2,7 @@
 # Copyright (c) 2022 STMicroelectronics SA.
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/st,st-vgxy61.yaml#
+$id: http://devicetree.org/schemas/media/i2c/st,vgxy61.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: STMicroelectronics VGxy61 HDR Global Shutter Sensor Family
@@ -23,7 +23,7 @@ description: |-
 
 properties:
   compatible:
-    const: st,st-vgxy61
+    const: st,vgxy61
 
   reg:
     maxItems: 1
@@ -95,7 +95,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         vgxy61: csi2tx@10 {
-            compatible = "st,st-vgxy61";
+            compatible = "st,vgxy61";
             reg = <0x10>;
             clocks = <&clk_ext_camera>;
             VCORE-supply = <&v1v2>;
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 2252063593bf..d706cb47b112 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -35,6 +35,6 @@ For more details see the file COPYING in the source distribution of Linux.
 	max2175
 	npcm-video
 	omap3isp-uapi
-	st-vgxy61
 	thp7312
 	uvcvideo
+	vgxy61
diff --git a/Documentation/userspace-api/media/drivers/st-vgxy61.rst b/Documentation/userspace-api/media/drivers/vgxy61.rst
similarity index 100%
rename from Documentation/userspace-api/media/drivers/st-vgxy61.rst
rename to Documentation/userspace-api/media/drivers/vgxy61.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index ef6be9d95143..3838f2ad77ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20891,9 +20891,9 @@ M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
-F:	Documentation/userspace-api/media/drivers/st-vgxy61.rst
-F:	drivers/media/i2c/st-vgxy61.c
+F:	Documentation/devicetree/bindings/media/i2c/st,vgxy61.yaml
+F:	Documentation/userspace-api/media/drivers/vgxy61.rst
+F:	drivers/media/i2c/vgxy61.c
 
 ST VL53L0X ToF RANGER(I2C) IIO DRIVER
 M:	Song Qiang <songqiang1304521@gmail.com>
@@ -23210,7 +23210,7 @@ F:	drivers/media/i2c/mt*
 F:	drivers/media/i2c/og*
 F:	drivers/media/i2c/ov*
 F:	drivers/media/i2c/s5*
-F:	drivers/media/i2c/st-vgxy61.c
+F:	drivers/media/i2c/vgxy61.c
 
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c6d3ee472d81..25619d5e29c4 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -659,7 +659,7 @@ config VIDEO_S5K6A3
 	  This is a V4L2 sensor driver for Samsung S5K6A3 raw
 	  camera sensor.
 
-config VIDEO_ST_VGXY61
+config VIDEO_VGXY61
 	tristate "ST VGXY61 sensor support"
 	select V4L2_CCI_I2C
 	depends on OF && GPIOLIB
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index dfbe6448b549..d322ba161da5 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -124,7 +124,6 @@ obj-$(CONFIG_VIDEO_SAA717X) += saa717x.o
 obj-$(CONFIG_VIDEO_SAA7185) += saa7185.o
 obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
-obj-$(CONFIG_VIDEO_ST_VGXY61) += st-vgxy61.o
 obj-$(CONFIG_VIDEO_TC358743) += tc358743.o
 obj-$(CONFIG_VIDEO_TC358746) += tc358746.o
 obj-$(CONFIG_VIDEO_TDA1997X) += tda1997x.o
@@ -148,6 +147,7 @@ obj-$(CONFIG_VIDEO_TW9910) += tw9910.o
 obj-$(CONFIG_VIDEO_UDA1342) += uda1342.o
 obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
 obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
+obj-$(CONFIG_VIDEO_VGXY61) += vgxy61.o
 obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
 obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
 obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/vgxy61.c
similarity index 99%
rename from drivers/media/i2c/st-vgxy61.c
rename to drivers/media/i2c/vgxy61.c
index b9e7c57027b1..30378e962016 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -1878,7 +1878,7 @@ static const struct dev_pm_ops vgxy61_pm_ops = {
 
 static struct i2c_driver vgxy61_i2c_driver = {
 	.driver = {
-		.name  = "st-vgxy61",
+		.name  = "vgxy61",
 		.of_match_table = vgxy61_dt_ids,
 		.pm = &vgxy61_pm_ops,
 	},
-- 
2.25.1


