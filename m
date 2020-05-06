Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99CDD1C6FDB
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 14:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgEFMDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 08:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727804AbgEFMDI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 08:03:08 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6DEC061A0F
        for <linux-media@vger.kernel.org>; Wed,  6 May 2020 05:03:07 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by andre.telenet-ops.be with bizsmtp
        id bQ352200w3ZRV0X01Q35Mv; Wed, 06 May 2020 14:03:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWIlV-0008Qf-PW; Wed, 06 May 2020 14:03:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWIlV-0008Dc-Mh; Wed, 06 May 2020 14:03:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: i2c: imx219: Drop <linux/clk-provider.h> and <linux/clkdev.h>
Date:   Wed,  6 May 2020 14:03:04 +0200
Message-Id: <20200506120304.31550-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX219 camera driver is not a clock provider, but merely a clock
consumer, and thus does not need to include <linux/clk-provider.h> and
<linux/clkdev.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/i2c/imx219.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index cb03bdec1f9c8954..078f2093d881d7c2 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -15,8 +15,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/clk-provider.h>
-#include <linux/clkdev.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
-- 
2.17.1

