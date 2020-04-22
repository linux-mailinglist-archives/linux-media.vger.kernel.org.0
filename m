Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FFF1B46C9
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 16:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgDVOFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 10:05:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgDVOFI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 10:05:08 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7AB32077D;
        Wed, 22 Apr 2020 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587564308;
        bh=4+Uin2zWwVkSHhzOGv2H3C+2oIyVFrAzXcyJei2lVBU=;
        h=From:To:Cc:Subject:Date:From;
        b=gbOfOF3WEYeoHn5sVXH2/Cv93uVcqNa+uQJSmHNGUW6LTwQGVP+6Y0hdCf0BmGUu6
         uMEYy4bmaTASbNOYBDK1/69K/ZTlEWrQzogLnC7AZzdM+teqHc4SETyZbaQFs/VjmZ
         mgN2zUizk4+Fj+oCjkuyTek9HutIAiorpr9VzZg0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jRFzt-00E6SH-Js; Wed, 22 Apr 2020 16:05:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johan Jonker <jbx6244@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] MAINTAINERS: reorder media attributes
Date:   Wed, 22 Apr 2020 16:05:01 +0200
Message-Id: <5c98639814988647e6da17cf0d9ad905077219c4.1587564297.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some media entry attributes got out of the order after the
bug was split into 3. Also, as reported by Johan, the
Rockchip VPU entry also had their attributes at the wrong
order.

As those entries weren't merged yet upstream, let's reorder
them with:

	./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS --order

Reported-by: Johan Jonker <jbx6244@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c03e6a2ad27..d633a131dcd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5125,14 +5125,14 @@ F:	scripts/documentation-file-ref-check
 F:	scripts/kernel-doc
 F:	scripts/sphinx-pre-install
 X:	Documentation/ABI/
+X:	Documentation/admin-guide/media/
 X:	Documentation/devicetree/
+X:	Documentation/driver-api/media/
 X:	Documentation/firmware-guide/acpi/
 X:	Documentation/i2c/
-X:	Documentation/admin-guide/media/
-X:	Documentation/userspace-api/media/
-X:	Documentation/driver-api/media/
 X:	Documentation/power/
 X:	Documentation/spi/
+X:	Documentation/userspace-api/media/
 
 DOCUMENTATION SCRIPTS
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
@@ -8654,9 +8654,9 @@ INTEL IPU3 CSI-2 IMGU DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
 F:	Documentation/admin-guide/media/ipu3.rst
 F:	Documentation/admin-guide/media/ipu3_rcb.svg
+F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
 F:	drivers/staging/media/ipu3/
 
 INTEL IXP4XX QMGR, NPE, ETHERNET and HSS SUPPORT
@@ -10453,8 +10453,8 @@ M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/imx.txt
 F:	Documentation/admin-guide/media/imx.rst
+F:	Documentation/devicetree/bindings/media/imx.txt
 F:	drivers/staging/media/imx/
 F:	include/linux/imx-media.h
 F:	include/media/imx.h
@@ -10464,9 +10464,9 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/admin-guide/media/imx7.rst
 F:	Documentation/devicetree/bindings/media/imx7-csi.txt
 F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
-F:	Documentation/admin-guide/media/imx7.rst
 F:	drivers/staging/media/imx/imx7-media-csi.c
 F:	drivers/staging/media/imx/imx7-mipi-csis.c
 
@@ -10612,10 +10612,10 @@ S:	Maintained
 W:	https://linuxtv.org
 Q:	http://patchwork.kernel.org/project/linux-media/list/
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/admin-guide/media/
 F:	Documentation/devicetree/bindings/media/
-X:	Documentation/admin-guide/media/
-F:	Documentation/userspace-api/media/
 F:	Documentation/driver-api/media/
+F:	Documentation/userspace-api/media/
 F:	drivers/media/
 F:	drivers/staging/media/
 F:	include/linux/platform_data/media/
@@ -13962,8 +13962,8 @@ QUALCOMM CAMERA SUBSYSTEM DRIVER
 M:	Todor Tomov <todor.too@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/qcom,camss.txt
 F:	Documentation/admin-guide/media/qcom_camss.rst
+F:	Documentation/devicetree/bindings/media/qcom,camss.txt
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
@@ -14485,8 +14485,8 @@ M:	Ezequiel Garcia <ezequiel@collabora.com>
 L:	linux-media@vger.kernel.org
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
-F:	drivers/staging/media/rkvdec/
 F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+F:	drivers/staging/media/rkvdec/
 
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
-- 
2.25.2

