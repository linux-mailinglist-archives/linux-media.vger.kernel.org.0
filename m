Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C021F8D38
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 07:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgFOFSj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 01:18:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:35750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726063AbgFOFSj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 01:18:39 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8480420663;
        Mon, 15 Jun 2020 05:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592198318;
        bh=UnL9KL9b2XMzYtnzbspqLQfUce0Hy1L0UeRJFdn9BmQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tBXfdTbhDqk5/pmUcfl9NIKk6Pv4KIVsyYuKWVIsZTsTt3tIv+BWJ4KkGLce7p8oX
         YNFbN8tf8MCq3B19zzvVTLI7Lrkh0GZfYuKdHR+4mIQepGc0rG7UUJMFURNzBmDcEj
         M2zt/PeSd51E9s9pbeCN1fk9oFsL/Vv52uqD+4Jg=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jkhW0-009bpq-9C; Mon, 15 Jun 2020 07:18:36 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: atomisp: replace old ---help--- tags by just help
Date:   Mon, 15 Jun 2020 07:18:34 +0200
Message-Id: <849016f49273cd245401cc2d7d454d3a12330658.1592198305.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d94e7bff13e8a361353360e4cdbf637bfb701bed.1592198305.git.mchehab+huawei@kernel.org>
References: <d94e7bff13e8a361353360e4cdbf637bfb701bed.1592198305.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several places on this file using the deprecated
---help--- tag.

Replaces them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/i2c/Kconfig        | 14 +++++++-------
 drivers/staging/media/atomisp/i2c/ov5693/Kconfig | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index 69f325c9a724..038de895ce40 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -9,7 +9,7 @@ config VIDEO_ATOMISP_OV2722
        tristate "OVT ov2722 sensor support"
 	depends on ACPI
        depends on I2C && VIDEO_V4L2
-       ---help---
+       help
 	 This is a Video4Linux2 sensor-level driver for the OVT
 	 OV2722 raw camera.
 
@@ -21,7 +21,7 @@ config VIDEO_ATOMISP_GC2235
        tristate "Galaxy gc2235 sensor support"
 	depends on ACPI
        depends on I2C && VIDEO_V4L2
-       ---help---
+       help
 	 This is a Video4Linux2 sensor-level driver for the OVT
 	 GC2235 raw camera.
 
@@ -32,7 +32,7 @@ config VIDEO_ATOMISP_GC2235
 config VIDEO_ATOMISP_MSRLIST_HELPER
        tristate "Helper library to load, parse and apply large register lists."
        depends on I2C
-       ---help---
+       help
 	 This is a helper library to be used from a sensor driver to load, parse
 	 and apply large register lists.
 
@@ -43,7 +43,7 @@ config VIDEO_ATOMISP_MT9M114
        tristate "Aptina mt9m114 sensor support"
 	depends on ACPI
        depends on I2C && VIDEO_V4L2
-       ---help---
+       help
 	 This is a Video4Linux2 sensor-level driver for the Micron
 	 mt9m114 1.3 Mpixel camera.
 
@@ -55,7 +55,7 @@ config VIDEO_ATOMISP_GC0310
 	tristate "GC0310 sensor support"
 	depends on ACPI
 	depends on I2C && VIDEO_V4L2
-	---help---
+	help
 	  This is a Video4Linux2 sensor-level driver for the Galaxycore
 	  GC0310 0.3MP sensor.
 
@@ -63,7 +63,7 @@ config VIDEO_ATOMISP_OV2680
        tristate "Omnivision OV2680 sensor support"
 	depends on ACPI
        depends on I2C && VIDEO_V4L2
-       ---help---
+       help
 	 This is a Video4Linux2 sensor-level driver for the Omnivision
 	 OV2680 raw camera.
 
@@ -79,7 +79,7 @@ config VIDEO_ATOMISP_LM3554
        tristate "LM3554 flash light driver"
 	depends on ACPI
        depends on VIDEO_V4L2 && I2C
-       ---help---
+       help
 	 This is a Video4Linux2 sub-dev driver for the LM3554
 	 flash light driver.
 
diff --git a/drivers/staging/media/atomisp/i2c/ov5693/Kconfig b/drivers/staging/media/atomisp/i2c/ov5693/Kconfig
index c6ee90b2d13f..536a731dba50 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/ov5693/Kconfig
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_ATOMISP_OV5693
-       tristate "Omnivision ov5693 sensor support"
+	tristate "Omnivision ov5693 sensor support"
 	depends on ACPI
-       depends on I2C && VIDEO_V4L2
-       ---help---
-	 This is a Video4Linux2 sensor-level driver for the Micron
-	 ov5693 5 Mpixel camera.
+	depends on I2C && VIDEO_V4L2
+	help
+	  This is a Video4Linux2 sensor-level driver for the Micron
+	  ov5693 5 Mpixel camera.
 
-	 ov5693 is video camera sensor.
+	  ov5693 is video camera sensor.
 
-	 It currently only works with the atomisp driver.
+	  It currently only works with the atomisp driver.
-- 
2.26.2

