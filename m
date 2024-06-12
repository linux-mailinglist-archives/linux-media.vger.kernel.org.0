Return-Path: <linux-media+bounces-13009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E66904E10
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 10:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CFC11F27FD5
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 08:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C32016D4C8;
	Wed, 12 Jun 2024 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="5ztkh6O4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1742616C847;
	Wed, 12 Jun 2024 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718180591; cv=none; b=KwAGYS645I8l2HCy9sQChct1b3uKE6/OwFedG9xBoGqABQepRRZRA6Iej2nNGs8eiIWVP+EImMcri9ZwPyV10dwRj9shiIxSMh8qPhypaYKAFYwsoRy4l+yIJ+5sTVakh6fh+2V8uTn7SVWy0rVg/VGQJacAUlTCY2i8LROh85E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718180591; c=relaxed/simple;
	bh=9N3OweDQgcGJyws9SM6sqrkHn9fTMjWjILZBLGP8XK8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MDAOu6SO0XqVAvM06DqX/+/NK20ckY7Trum2dVEEzuxl8H+6skTMoyRsZ42pKnqAquQ79NnhijU1AZwsKheCdAjoP9EaWRg/0e/2FgcXhS0SN76tPg6hwp8CjWrOyAlCfyQoYEkiO/lHuj9fMMwGQVStTIlVLF57dggF9YU21+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=5ztkh6O4; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C6GZ02015552;
	Wed, 12 Jun 2024 10:22:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=sQynSTz9r90PygX8PsR9BB
	DC55tTFZGRrls4Q247R6I=; b=5ztkh6O4h2I4N3LzISQoI96ZThMJgS6gOZvB61
	rjKt3iSU4Ns5HE8BlpOG7F3kT+/yoaRC4mqrF0jEYcgGO2SI4FviAlK9BahNmHHQ
	Dsw2ph1B4HkJoMcyy5ze8qgwIf9AsL6I/yeWaPar+MzKEi6D9iHInUU9xVwdcFf/
	SvCkfshNh2HNkk0dIJxzw243sajNbHtRE8ZERptrk7+4b64HPR+TDvwakBGuGEZs
	fwaAxOywHGJn8p3OPkMb7xMUSyAoV//McpxRjc4Ig+T3g4q/oCsZbMQpIufLXv2J
	LZi3fSxT+nIqMtzBvZNOZeX7/3SihzDVkXC6Fmb99qaVrh3g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypub3aax8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:22:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 17AE54002D;
	Wed, 12 Jun 2024 10:22:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 913B820F56F;
	Wed, 12 Jun 2024 10:21:32 +0200 (CEST)
Received: from localhost (10.130.72.241) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 12 Jun
 2024 10:21:32 +0200
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
Subject: [PATCH v2] media: i2c: vgxy61: Fix device name
Date: Wed, 12 Jun 2024 10:21:14 +0200
Message-ID: <20240612082114.43125-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
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
 definitions=2024-06-12_04,2024-06-11_01,2024-05-17_01

Rename 'st-vgxy61' to 'vgxy61', dropping the vendor prefix to follow the
same naming scheme as the vast majority of device drivers.
The device tree binding does not fall into binding rename exceptions and
therefore must not be changed. Keep its legacy name.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 Documentation/userspace-api/media/drivers/index.rst         | 2 +-
 .../media/drivers/{st-vgxy61.rst => vgxy61.rst}             | 0
 MAINTAINERS                                                 | 6 +++---
 drivers/media/i2c/Kconfig                                   | 2 +-
 drivers/media/i2c/Makefile                                  | 2 +-
 drivers/media/i2c/{st-vgxy61.c => vgxy61.c}                 | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)
 rename Documentation/userspace-api/media/drivers/{st-vgxy61.rst => vgxy61.rst} (100%)
 rename drivers/media/i2c/{st-vgxy61.c => vgxy61.c} (99%)

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
index ef6be9d95143..33ee4d5e7f0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20892,8 +20892,8 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
-F:	Documentation/userspace-api/media/drivers/st-vgxy61.rst
-F:	drivers/media/i2c/st-vgxy61.c
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


