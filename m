Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40FC3701FE
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 22:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbhD3UVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 16:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbhD3UVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 16:21:24 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26E3C06174A;
        Fri, 30 Apr 2021 13:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=VtFuUV5P3I20auvm78zEd3vddwhW5Lv4cq5mTLMfwWU=; b=OMO+mMxveLr00PN6kB9yK+SXjQ
        2C0RULdgOxCq2ZoX4akdcfuNoSN2q7ppuntxVgnGWu/BhckkEUW+9QcADRMWDC+EDonaxEKfkAk1N
        Yk/BNSUvGD5ZGb1GElcRelelvYfkYI9ipN/cU/fyL39WW4etib1AQY2+oBMl7liq7dd/PopUxtgnt
        kGlgvb6qlsvJuaQU0oQ/eQD5wWWeFD3Hr0mTB1xATKSlyWcyExLWFQg1QoI8Bls2GphgVRJihNAPv
        KuwXewR2Q55N4FH2Wc4B09OhWOfGfm3CntO/SAVfWjZVEzdZv6hXu4OxmZRpvYCBUFMeKGCmpgQ8x
        FqZoH5SQ==;
Received: from [2601:1c0:6280:3f0::df68] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lcZcG-00BUX2-QY; Fri, 30 Apr 2021 20:20:09 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        linux-media@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH] media: I2C: change 'RST' to "RSET" to fix multiple build errors
Date:   Fri, 30 Apr 2021 13:19:55 -0700
Message-Id: <20210430201955.21309-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The use of an enum named 'RST' conflicts with a #define macro
named 'RST' in arch/mips/include/asm/mach-rc32434/rb.h.

The MIPS use of RST was there first (AFAICT), so change the
media/i2c/ uses of RST to be named 'RSET'.
'git grep -w RSET' does not report any naming conflicts with the
new name.

This fixes multiple build errors:

arch/mips/include/asm/mach-rc32434/rb.h:15:14: error: expected identifier before '(' token
   15 | #define RST  (1 << 15)
      |              ^
drivers/media/i2c/s5c73m3/s5c73m3.h:356:2: note: in expansion of macro 'RST'
  356 |  RST,
      |  ^~~

../arch/mips/include/asm/mach-rc32434/rb.h:15:14: error: expected identifier before '(' token
   15 | #define RST  (1 << 15)
      |              ^
../drivers/media/i2c/s5k6aa.c:180:2: note: in expansion of macro 'RST'
  180 |  RST,
      |  ^~~

../arch/mips/include/asm/mach-rc32434/rb.h:15:14: error: expected identifier before '(' token
   15 | #define RST  (1 << 15)
      |              ^
../drivers/media/i2c/s5k5baf.c:238:2: note: in expansion of macro 'RST'
  238 |  RST,
      |  ^~~

and some others that I have trimmed.

Fixes: cac47f1822fc ("[media] V4L: Add S5C73M3 camera driver")
Fixes: 8b99312b7214 ("[media] Add v4l2 subdev driver for S5K4ECGX sensor")
Fixes: 7d459937dc09 ("[media] Add driver for Samsung S5K5BAF camera sensor")
Fixes: bfa8dd3a0524 ("[media] v4l: Add v4l2 subdev driver for S5K6AAFX sensor")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-media@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Sangwook Lee <sangwook.lee@linaro.org>
---
 drivers/media/i2c/s5c73m3/s5c73m3-core.c |    6 +++---
 drivers/media/i2c/s5c73m3/s5c73m3.h      |    2 +-
 drivers/media/i2c/s5k4ecgx.c             |   10 +++++-----
 drivers/media/i2c/s5k5baf.c              |    6 +++---
 drivers/media/i2c/s5k6aa.c               |   10 +++++-----
 5 files changed, 17 insertions(+), 17 deletions(-)

--- linux-next-20210430.orig/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ linux-next-20210430/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1386,7 +1386,7 @@ static int __s5c73m3_power_on(struct s5c
 	s5c73m3_gpio_deassert(state, STBY);
 	usleep_range(100, 200);
 
-	s5c73m3_gpio_deassert(state, RST);
+	s5c73m3_gpio_deassert(state, RSET);
 	usleep_range(50, 100);
 
 	return 0;
@@ -1401,7 +1401,7 @@ static int __s5c73m3_power_off(struct s5
 {
 	int i, ret;
 
-	if (s5c73m3_gpio_assert(state, RST))
+	if (s5c73m3_gpio_assert(state, RSET))
 		usleep_range(10, 50);
 
 	if (s5c73m3_gpio_assert(state, STBY))
@@ -1606,7 +1606,7 @@ static int s5c73m3_get_platform_data(str
 
 		state->mclk_frequency = pdata->mclk_frequency;
 		state->gpio[STBY] = pdata->gpio_stby;
-		state->gpio[RST] = pdata->gpio_reset;
+		state->gpio[RSET] = pdata->gpio_reset;
 		return 0;
 	}
 
--- linux-next-20210430.orig/drivers/media/i2c/s5c73m3/s5c73m3.h
+++ linux-next-20210430/drivers/media/i2c/s5c73m3/s5c73m3.h
@@ -353,7 +353,7 @@ struct s5c73m3_ctrls {
 
 enum s5c73m3_gpio_id {
 	STBY,
-	RST,
+	RSET,
 	GPIO_NUM,
 };
 
--- linux-next-20210430.orig/drivers/media/i2c/s5k4ecgx.c
+++ linux-next-20210430/drivers/media/i2c/s5k4ecgx.c
@@ -173,7 +173,7 @@ static const char * const s5k4ecgx_suppl
 
 enum s5k4ecgx_gpio_id {
 	STBY,
-	RST,
+	RSET,
 	GPIO_NUM,
 };
 
@@ -476,7 +476,7 @@ static int __s5k4ecgx_power_on(struct s5
 	if (s5k4ecgx_gpio_set_value(priv, STBY, priv->gpio[STBY].level))
 		usleep_range(30, 50);
 
-	if (s5k4ecgx_gpio_set_value(priv, RST, priv->gpio[RST].level))
+	if (s5k4ecgx_gpio_set_value(priv, RSET, priv->gpio[RSET].level))
 		usleep_range(30, 50);
 
 	return 0;
@@ -484,7 +484,7 @@ static int __s5k4ecgx_power_on(struct s5
 
 static int __s5k4ecgx_power_off(struct s5k4ecgx *priv)
 {
-	if (s5k4ecgx_gpio_set_value(priv, RST, !priv->gpio[RST].level))
+	if (s5k4ecgx_gpio_set_value(priv, RSET, !priv->gpio[RSET].level))
 		usleep_range(30, 50);
 
 	if (s5k4ecgx_gpio_set_value(priv, STBY, !priv->gpio[STBY].level))
@@ -872,7 +872,7 @@ static int s5k4ecgx_config_gpios(struct
 	int ret;
 
 	priv->gpio[STBY].gpio = -EINVAL;
-	priv->gpio[RST].gpio  = -EINVAL;
+	priv->gpio[RSET].gpio  = -EINVAL;
 
 	ret = s5k4ecgx_config_gpio(gpio->gpio, gpio->level, "S5K4ECGX_STBY");
 
@@ -891,7 +891,7 @@ static int s5k4ecgx_config_gpios(struct
 		s5k4ecgx_free_gpios(priv);
 		return ret;
 	}
-	priv->gpio[RST] = *gpio;
+	priv->gpio[RSET] = *gpio;
 	if (gpio_is_valid(gpio->gpio))
 		gpio_set_value(gpio->gpio, 0);
 
--- linux-next-20210430.orig/drivers/media/i2c/s5k5baf.c
+++ linux-next-20210430/drivers/media/i2c/s5k5baf.c
@@ -235,7 +235,7 @@ struct s5k5baf_gpio {
 
 enum s5k5baf_gpio_id {
 	STBY,
-	RST,
+	RSET,
 	NUM_GPIOS,
 };
 
@@ -969,7 +969,7 @@ static int s5k5baf_power_on(struct s5k5b
 
 	s5k5baf_gpio_deassert(state, STBY);
 	usleep_range(50, 100);
-	s5k5baf_gpio_deassert(state, RST);
+	s5k5baf_gpio_deassert(state, RSET);
 	return 0;
 
 err_reg_dis:
@@ -987,7 +987,7 @@ static int s5k5baf_power_off(struct s5k5
 	state->apply_cfg = 0;
 	state->apply_crop = 0;
 
-	s5k5baf_gpio_assert(state, RST);
+	s5k5baf_gpio_assert(state, RSET);
 	s5k5baf_gpio_assert(state, STBY);
 
 	if (!IS_ERR(state->clock))
--- linux-next-20210430.orig/drivers/media/i2c/s5k6aa.c
+++ linux-next-20210430/drivers/media/i2c/s5k6aa.c
@@ -177,7 +177,7 @@ static const char * const s5k6aa_supply_
 
 enum s5k6aa_gpio_id {
 	STBY,
-	RST,
+	RSET,
 	GPIO_NUM,
 };
 
@@ -841,7 +841,7 @@ static int __s5k6aa_power_on(struct s5k6
 		ret = s5k6aa->s_power(1);
 	usleep_range(4000, 5000);
 
-	if (s5k6aa_gpio_deassert(s5k6aa, RST))
+	if (s5k6aa_gpio_deassert(s5k6aa, RSET))
 		msleep(20);
 
 	return ret;
@@ -851,7 +851,7 @@ static int __s5k6aa_power_off(struct s5k
 {
 	int ret;
 
-	if (s5k6aa_gpio_assert(s5k6aa, RST))
+	if (s5k6aa_gpio_assert(s5k6aa, RSET))
 		usleep_range(100, 150);
 
 	if (s5k6aa->s_power) {
@@ -1510,7 +1510,7 @@ static int s5k6aa_configure_gpios(struct
 	int ret;
 
 	s5k6aa->gpio[STBY].gpio = -EINVAL;
-	s5k6aa->gpio[RST].gpio  = -EINVAL;
+	s5k6aa->gpio[RSET].gpio  = -EINVAL;
 
 	gpio = &pdata->gpio_stby;
 	if (gpio_is_valid(gpio->gpio)) {
@@ -1533,7 +1533,7 @@ static int s5k6aa_configure_gpios(struct
 		if (ret < 0)
 			return ret;
 
-		s5k6aa->gpio[RST] = *gpio;
+		s5k6aa->gpio[RSET] = *gpio;
 	}
 
 	return 0;
