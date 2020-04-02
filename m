Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB5519BDFA
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 10:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387823AbgDBIuF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 04:50:05 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56107 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728612AbgDBIuF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 04:50:05 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jJvY1-0008Ss-Pd; Thu, 02 Apr 2020 10:50:01 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jJvY1-00036l-3O; Thu, 02 Apr 2020 10:50:01 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: [PATCH] media: v4l2-image-sizes: add HD and Full-HD definitions
Date:   Thu,  2 Apr 2020 10:49:57 +0200
Message-Id: <20200402084957.2380-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add common (Full-)HD definitions also known as 720p and 1080p.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 include/media/v4l2-image-sizes.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/media/v4l2-image-sizes.h b/include/media/v4l2-image-sizes.h
index 450f4f5d3d6a..24a7a0bb59ab 100644
--- a/include/media/v4l2-image-sizes.h
+++ b/include/media/v4l2-image-sizes.h
@@ -10,6 +10,12 @@
 #define CIF_WIDTH	352
 #define CIF_HEIGHT	288
 
+#define HD_720_WIDTH	1280
+#define HD_720_HEIGHT	720
+
+#define HD_1080_WIDTH	1920
+#define HD_1080_HEIGHT	1080
+
 #define QCIF_WIDTH	176
 #define QCIF_HEIGHT	144
 
-- 
2.20.1

