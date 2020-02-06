Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D66154742
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 16:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbgBFPLn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 10:11:43 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:37522 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727481AbgBFPLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 10:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=+zWwoxB/GlzqIdYKTQ20K+hSDuhycL4nJOvIJEmXBXA=; b=Dcw/UGCWunTHr9oVLWmCEjFwML
        vDzET1yIhKZpZczSi8xBuwe3qwRBhWgqG677kIZ+WCUHdrTAbRyGy2k4D/gc+QKucHTtyWGEyz4Pc
        JMUMLoQw5BAOU21jXhjg8Z0rJcs0r9ra4cDEB3vIdZ+3VZ+danWJRiu7ubDANkZ7tqGP1enCzk3OE
        AJ9VTkSVKu2LnV1SEC9TR/UasmF0anFkX7Ta0qe8nMzGpvJdd0BlYmYlwfZ6yrODsnQ4r5dMEkQ3B
        WZ3KbqyVoV41mbbhyi1D1WRfvAD4Rm18NpqhOsbqFtC2XDbeCTt0Ip6PW5ioprVfdoilKA8cy2V4T
        nnKw3H7A==;
Received: from [179.95.15.160] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iziod-000439-6m; Thu, 06 Feb 2020 15:11:42 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1izioW-002oNa-2s; Thu, 06 Feb 2020 16:11:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 11/11] docs: misc-devices/apds990x.txt: convert to ReST format
Date:   Thu,  6 Feb 2020 16:11:30 +0100
Message-Id: <c75bb62b507c06ebe5bb6bf35291b27c074ffa1f.1581001737.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581001737.git.mchehab+huawei@kernel.org>
References: <cover.1581001737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Adjust title markup;
- Adjust identation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{apds990x.txt => apds990x.rst}            | 31 ++++++++++++++-----
 Documentation/misc-devices/index.rst          |  1 +
 2 files changed, 25 insertions(+), 7 deletions(-)
 rename Documentation/misc-devices/{apds990x.txt => apds990x.rst} (86%)

diff --git a/Documentation/misc-devices/apds990x.txt b/Documentation/misc-devices/apds990x.rst
similarity index 86%
rename from Documentation/misc-devices/apds990x.txt
rename to Documentation/misc-devices/apds990x.rst
index 454d95d623b3..e2f75577f731 100644
--- a/Documentation/misc-devices/apds990x.txt
+++ b/Documentation/misc-devices/apds990x.rst
@@ -1,3 +1,6 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
 Kernel driver apds990x
 ======================
 
@@ -50,14 +53,18 @@ chip_id
 
 power_state
 	RW - enable / disable chip. Uses counting logic
+
 	     1 enables the chip
 	     0 disables the chip
 lux0_input
 	RO - measured lux value
+
 	     sysfs_notify called when threshold interrupt occurs
 
 lux0_sensor_range
-	RO - lux0_input max value. Actually never reaches since sensor tends
+	RO - lux0_input max value.
+
+	     Actually never reaches since sensor tends
 	     to saturate much before that. Real max value varies depending
 	     on the light spectrum etc.
 
@@ -68,7 +75,9 @@ lux0_rate_avail
 	RO - supported measurement rates
 
 lux0_calibscale
-	RW - calibration value. Set to neutral value by default.
+	RW - calibration value.
+
+	     Set to neutral value by default.
 	     Output results are multiplied with calibscale / calibscale_default
 	     value.
 
@@ -76,16 +85,21 @@ lux0_calibscale_default
 	RO - neutral calibration value
 
 lux0_thresh_above_value
-	RW - HI level threshold value. All results above the value
+	RW - HI level threshold value.
+
+	     All results above the value
 	     trigs an interrupt. 65535 (i.e. sensor_range) disables the above
 	     interrupt.
 
 lux0_thresh_below_value
-	RW - LO level threshold value. All results below the value
+	RW - LO level threshold value.
+
+	     All results below the value
 	     trigs an interrupt. 0 disables the below interrupt.
 
 prox0_raw
 	RO - measured proximity value
+
 	     sysfs_notify called when threshold interrupt occurs
 
 prox0_sensor_range
@@ -93,11 +107,14 @@ prox0_sensor_range
 
 prox0_raw_en
 	RW - enable / disable proximity - uses counting logic
-	     1 enables the proximity
-	     0 disables the proximity
+
+	     - 1 enables the proximity
+	     - 0 disables the proximity
 
 prox0_reporting_mode
-	RW - trigger / periodic. In "trigger" mode the driver tells two possible
+	RW - trigger / periodic.
+
+	     In "trigger" mode the driver tells two possible
 	     values: 0 or prox0_sensor_range value. 0 means no proximity,
 	     1023 means proximity. This causes minimal number of interrupts.
 	     In "periodic" mode the driver reports all values above
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 40a4c104e7a2..16973310d32e 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -15,6 +15,7 @@ fit into other categories.
    :maxdepth: 2
 
    ad525x_dpot
+   apds990x
    bh1770glc
    eeprom
    c2port
-- 
2.24.1

