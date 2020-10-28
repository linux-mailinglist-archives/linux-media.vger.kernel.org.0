Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC95029D586
	for <lists+linux-media@lfdr.de>; Wed, 28 Oct 2020 23:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbgJ1WC3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 18:02:29 -0400
Received: from retiisi.eu ([95.216.213.190]:47318 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728094AbgJ1WC1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 18:02:27 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 902B6634C8B
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2020 12:10:28 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] imx258: Remove Jason Chen's e-mail
Date:   Wed, 28 Oct 2020 12:05:20 +0200
Message-Id: <20201028100520.16018-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove Jason Chen's e-mail address for it no longer works.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx258.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index ccb55fd1d506..df62c69a48c0 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1305,6 +1305,6 @@ module_i2c_driver(imx258_i2c_driver);
 
 MODULE_AUTHOR("Yeh, Andy <andy.yeh@intel.com>");
 MODULE_AUTHOR("Chiang, Alan");
-MODULE_AUTHOR("Chen, Jason <jasonx.z.chen@intel.com>");
+MODULE_AUTHOR("Chen, Jason");
 MODULE_DESCRIPTION("Sony IMX258 sensor driver");
 MODULE_LICENSE("GPL v2");
-- 
2.27.0

