Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8DE729512
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 11:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241593AbjFIJ2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 05:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241531AbjFIJ2T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 05:28:19 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16CCF4204
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 02:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686302556; x=1717838556;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hl55zOfewxjLc8zmhNoVxdHQ1vkkrdvPpjSOeG813os=;
  b=bFG0moo9GGTVV/fWcvemdXbvwSQRwWTLGB1QdBSyppCEUxyGauvt20uJ
   YNUQIy18ND4f14Xc+5TVena4TYq+MSoH3MtqedK7yLrIbw/tGr+iTmq/v
   oT9DtYq0tDGY4c+9gMHpsWHfVgk6znmbTFmGT1j7vcTESv9ZWL2ZUM7sM
   RA4bfyrRKicJfkHHxrWmvJFt2ey5IU5nwCKvY/OwAN6IJ2hG09ivPnFW9
   GP+PsGngov8XG80LzZV7VUKC4zNmknMIIAyWKLKrOWV9FQjtyHOQh1Xsi
   MtfxAtIyAm6qVJb+t0uVloES2bZRG+UiQvkLrSPeYMusjagugYkQw5yUM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="360915855"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="360915855"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713442580"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="713442580"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:21:57 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D569611F9D2
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 12:21:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q7YIs-00H1xg-Di
        for linux-media@vger.kernel.org; Fri, 09 Jun 2023 12:21:06 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: i2c: Remove Shawn's and Chiranjeevi's e-mail addresses
Date:   Fri,  9 Jun 2023 12:20:56 +0300
Message-Id: <20230609092056.4059071-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove Shawn Tu's and Chiranjeevi Rapolu's e-mail addresses as they are no
longer function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/hi556.c   | 2 +-
 drivers/media/i2c/hi847.c   | 2 +-
 drivers/media/i2c/imx208.c  | 2 +-
 drivers/media/i2c/imx319.c  | 2 +-
 drivers/media/i2c/imx355.c  | 2 +-
 drivers/media/i2c/og01a1b.c | 2 +-
 drivers/media/i2c/ov08x40.c | 2 +-
 drivers/media/i2c/ov13858.c | 2 +-
 drivers/media/i2c/ov2740.c  | 2 +-
 drivers/media/i2c/ov5670.c  | 2 +-
 drivers/media/i2c/ov5675.c  | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 7daefab35cf02..da7e9c1134fd5 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1357,6 +1357,6 @@ static struct i2c_driver hi556_i2c_driver = {
 
 module_i2c_driver(hi556_i2c_driver);
 
-MODULE_AUTHOR("Shawn Tu <shawnx.tu@intel.com>");
+MODULE_AUTHOR("Shawn Tu");
 MODULE_DESCRIPTION("Hynix HI556 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index 5a82b15a9513e..401a44be9880c 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -3005,6 +3005,6 @@ static struct i2c_driver hi847_i2c_driver = {
 
 module_i2c_driver(hi847_i2c_driver);
 
-MODULE_AUTHOR("Shawn Tu <shawnx.tu@intel.com>");
+MODULE_AUTHOR("Shawn Tu");
 MODULE_DESCRIPTION("Hynix HI847 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 64c70ebf9869c..c2d449d6e1e4c 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -1109,6 +1109,6 @@ module_i2c_driver(imx208_i2c_driver);
 
 MODULE_AUTHOR("Yeh, Andy <andy.yeh@intel.com>");
 MODULE_AUTHOR("Chen, Ping-chung <ping-chung.chen@intel.com>");
-MODULE_AUTHOR("Shawn Tu <shawnx.tu@intel.com>");
+MODULE_AUTHOR("Shawn Tu");
 MODULE_DESCRIPTION("Sony IMX208 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 45b1b61b2880d..9653a59e2bc49 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2565,7 +2565,7 @@ static struct i2c_driver imx319_i2c_driver = {
 module_i2c_driver(imx319_i2c_driver);
 
 MODULE_AUTHOR("Qiu, Tianshu <tian.shu.qiu@intel.com>");
-MODULE_AUTHOR("Rapolu, Chiranjeevi <chiranjeevi.rapolu@intel.com>");
+MODULE_AUTHOR("Rapolu, Chiranjeevi");
 MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
 MODULE_AUTHOR("Yang, Hyungwoo");
 MODULE_DESCRIPTION("Sony imx319 sensor driver");
diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 25d4dbb6041ea..355a960253ee6 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1851,7 +1851,7 @@ static struct i2c_driver imx355_i2c_driver = {
 module_i2c_driver(imx355_i2c_driver);
 
 MODULE_AUTHOR("Qiu, Tianshu <tian.shu.qiu@intel.com>");
-MODULE_AUTHOR("Rapolu, Chiranjeevi <chiranjeevi.rapolu@intel.com>");
+MODULE_AUTHOR("Rapolu, Chiranjeevi");
 MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
 MODULE_AUTHOR("Yang, Hyungwoo");
 MODULE_DESCRIPTION("Sony imx355 sensor driver");
diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 35663c10fcd9f..51d3503125bc7 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -1121,6 +1121,6 @@ static struct i2c_driver og01a1b_i2c_driver = {
 
 module_i2c_driver(og01a1b_i2c_driver);
 
-MODULE_AUTHOR("Shawn Tu <shawnx.tu@intel.com>");
+MODULE_AUTHOR("Shawn Tu");
 MODULE_DESCRIPTION("OmniVision OG01A1B sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 72ae7fba94eb0..38f4649ba4d00 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -3320,6 +3320,6 @@ static struct i2c_driver ov08x40_i2c_driver = {
 module_i2c_driver(ov08x40_i2c_driver);
 
 MODULE_AUTHOR("Jason Chen <jason.z.chen@intel.com>");
-MODULE_AUTHOR("Shawn Tu <shawnx.tu@intel.com>");
+MODULE_AUTHOR("Shawn Tu");
 MODULE_DESCRIPTION("OmniVision OV08X40 sensor driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 69a7a2c590dbc..b892984463ade 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1814,7 +1814,7 @@ static struct i2c_driver ov13858_i2c_driver = {
 module_i2c_driver(ov13858_i2c_driver);
 
 MODULE_AUTHOR("Kan, Chris <chris.kan@intel.com>");
-MODULE_AUTHOR("Rapolu, Chiranjeevi <chiranjeevi.rapolu@intel.com>");
+MODULE_AUTHOR("Rapolu, Chiranjeevi");
 MODULE_AUTHOR("Yang, Hyungwoo");
 MODULE_DESCRIPTION("Omnivision ov13858 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 89d126240c345..3046358132662 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1223,7 +1223,7 @@ static struct i2c_driver ov2740_i2c_driver = {
 module_i2c_driver(ov2740_i2c_driver);
 
 MODULE_AUTHOR("Qiu, Tianshu <tian.shu.qiu@intel.com>");
-MODULE_AUTHOR("Shawn Tu <shawnx.tu@intel.com>");
+MODULE_AUTHOR("Shawn Tu");
 MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
 MODULE_DESCRIPTION("OmniVision OV2740 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index c026610d0f31f..968780ae3bb5f 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2860,7 +2860,7 @@ static struct i2c_driver ov5670_i2c_driver = {
 
 module_i2c_driver(ov5670_i2c_driver);
 
-MODULE_AUTHOR("Rapolu, Chiranjeevi <chiranjeevi.rapolu@intel.com>");
+MODULE_AUTHOR("Rapolu, Chiranjeevi");
 MODULE_AUTHOR("Yang, Hyungwoo");
 MODULE_DESCRIPTION("Omnivision ov5670 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index d55180b3b7aaa..a52a6388ba187 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1442,6 +1442,6 @@ static struct i2c_driver ov5675_i2c_driver = {
 
 module_i2c_driver(ov5675_i2c_driver);
 
-MODULE_AUTHOR("Shawn Tu <shawnx.tu@intel.com>");
+MODULE_AUTHOR("Shawn Tu");
 MODULE_DESCRIPTION("OmniVision OV5675 sensor driver");
 MODULE_LICENSE("GPL v2");
-- 
2.30.2

