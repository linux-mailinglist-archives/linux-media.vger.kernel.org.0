Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756B345E901
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 09:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345567AbhKZIMR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 03:12:17 -0500
Received: from retiisi.eu ([95.216.213.190]:44184 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345932AbhKZIKP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 03:10:15 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 359A6634C90;
        Fri, 26 Nov 2021 10:06:56 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     niklas.soderlund@ragnatech.se
Subject: [PATCH 1/1] max96712: Depend on VIDEO_V4L2
Date:   Fri, 26 Nov 2021 10:06:23 +0200
Message-Id: <20211126080623.1587610-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Depend on VIDEO_V4L2 for the driver actually depends on it, failing to
compile otherwise.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/max96712/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 258d47644cbd..acde14fd5c4d 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
 	depends on OF_GPIO
+	depends on VIDEO_V4L2
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
-- 
2.30.2

