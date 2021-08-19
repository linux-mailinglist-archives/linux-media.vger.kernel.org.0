Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56533F2181
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 22:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhHSUUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 16:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235055AbhHSUUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 16:20:17 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCAEC061575
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 13:19:41 -0700 (PDT)
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 636CB634C94;
        Thu, 19 Aug 2021 23:19:37 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-acpi@vger.kernel.org, linux-media@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, rafael@kernel.org
Subject: [RFC 3/3] gpio-tps68470: Add modalias
Date:   Thu, 19 Aug 2021 23:19:36 +0300
Message-Id: <20210819201936.7390-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819201936.7390-1-sakari.ailus@linux.intel.com>
References: <20210819201936.7390-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add modalias for this driver, so that it is loaded automatically once the
devices pop up.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/gpio/gpio-tps68470.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index 0ab88ef241de..8afcd31f4ea3 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -158,3 +158,4 @@ static struct platform_driver tps68470_gpio_driver = {
 module_platform_driver(tps68470_gpio_driver);
 
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:tps68470-gpio");
-- 
2.30.2

