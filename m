Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC01154760
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 16:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgBFPLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 10:11:52 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:37548 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727571AbgBFPLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 10:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=+bwf//vDBvqjr5cwu4b/E26nZhdac2zEgMzywyTguNo=; b=FcpLACjgCSk+nj4hG4qvuT7Ott
        9oyJ/MZ7C8qKojATgpw6x5o4GfIaTLtmhEI0LsgY1Ed3mpwjcZ/Oev71Hfq6ThmOyGSl90V9M2GsW
        YsmTrqd6oA6hOOq54UZfNQk7jYRhPM2idV1j8CIiLBzwwPkWKeG+IK3UPHgWpN92Fw/0h93sbwHJO
        v10LRBsPeQrW2lhQ9hBMG+Ta7caMb8ixVAJP+eAPdNvuGQQIyiX4ErcSfqzQMOisL/UdRmkxTJJ3w
        GZXwQ5FCgSKzBRstgGukKm5rKfQvHW5s4sPjfnUkdEuoWQZah2A35MWmjXTwcAu2gNREKLxj8Pgvo
        JmRaJctw==;
Received: from [179.95.15.160] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iziod-00043B-Fh; Thu, 06 Feb 2020 15:11:42 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1izioW-002oNV-1u; Thu, 06 Feb 2020 16:11:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 10/11] docs: misc-devices/bh1770glc.txt: convert to ReST
Date:   Thu,  6 Feb 2020 16:11:29 +0100
Message-Id: <0855ce8c4b5ff82fad98b2c95c7ba273a58aa86b.1581001737.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581001737.git.mchehab+huawei@kernel.org>
References: <cover.1581001737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Adjust document title markup;
- use list markups;
- Adjust identations to display properly at ReST output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{bh1770glc.txt => bh1770glc.rst}          | 45 +++++++++++++------
 Documentation/misc-devices/index.rst          |  1 +
 2 files changed, 33 insertions(+), 13 deletions(-)
 rename Documentation/misc-devices/{bh1770glc.txt => bh1770glc.rst} (83%)

diff --git a/Documentation/misc-devices/bh1770glc.txt b/Documentation/misc-devices/bh1770glc.rst
similarity index 83%
rename from Documentation/misc-devices/bh1770glc.txt
rename to Documentation/misc-devices/bh1770glc.rst
index 7d64c014dc70..ea5ca58bb958 100644
--- a/Documentation/misc-devices/bh1770glc.txt
+++ b/Documentation/misc-devices/bh1770glc.rst
@@ -1,9 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
 Kernel driver bh1770glc
 =======================
 
 Supported chips:
-ROHM BH1770GLC
-OSRAM SFH7770
+
+- ROHM BH1770GLC
+- OSRAM SFH7770
 
 Data sheet:
 Not freely available
@@ -48,12 +52,16 @@ chip_id
 	RO - shows detected chip type and version
 
 power_state
-	RW - enable / disable chip. Uses counting logic
-	     1 enables the chip
-	     0 disables the chip
+	RW - enable / disable chip
+
+	Uses counting logic
+
+	     - 1 enables the chip
+	     - 0 disables the chip
 
 lux0_input
 	RO - measured lux value
+
 	     sysfs_notify called when threshold interrupt occurs
 
 lux0_sensor_range
@@ -66,16 +74,22 @@ lux0_rate_avail
 	RO - supported measurement rates
 
 lux0_thresh_above_value
-	RW - HI level threshold value. All results above the value
+	RW - HI level threshold value
+
+	     All results above the value
 	     trigs an interrupt. 65535 (i.e. sensor_range) disables the above
 	     interrupt.
 
 lux0_thresh_below_value
-	RW - LO level threshold value. All results below the value
+	RW - LO level threshold value
+
+	     All results below the value
 	     trigs an interrupt. 0 disables the below interrupt.
 
 lux0_calibscale
-	RW - calibration value. Set to neutral value by default.
+	RW - calibration value
+
+	     Set to neutral value by default.
 	     Output results are multiplied with calibscale / calibscale_default
 	     value.
 
@@ -84,32 +98,37 @@ lux0_calibscale_default
 
 prox0_raw
 	RO - measured proximity value
+
 	     sysfs_notify called when threshold interrupt occurs
 
 prox0_sensor_range
 	RO - prox0_raw max value
 
 prox0_raw_en
-	RW - enable / disable proximity - uses counting logic
-	     1 enables the proximity
-	     0 disables the proximity
+	RW - enable / disable proximity
+
+	     Uses counting logic
+
+	     - 1 enables the proximity
+	     - 0 disables the proximity
 
 prox0_thresh_above_count
 	RW - number of proximity interrupts needed before triggering the event
 
 prox0_rate_above
 	RW - Measurement rate (in Hz) when the level is above threshold
-	     i.e. when proximity on has been reported.
+	i.e. when proximity on has been reported.
 
 prox0_rate_below
 	RW - Measurement rate (in Hz) when the level is below threshold
-	     i.e. when proximity off has been reported.
+	i.e. when proximity off has been reported.
 
 prox0_rate_avail
 	RO - Supported proximity measurement rates in Hz
 
 prox0_thresh_above0_value
 	RW - threshold level which trigs proximity events.
+
 	     Filtered by persistence filter (prox0_thresh_above_count)
 
 prox0_thresh_above1_value
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index c2e880d78734..40a4c104e7a2 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -15,6 +15,7 @@ fit into other categories.
    :maxdepth: 2
 
    ad525x_dpot
+   bh1770glc
    eeprom
    c2port
    ibmvmc
-- 
2.24.1

