Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE0C48A331
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 23:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242281AbiAJWtv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 17:49:51 -0500
Received: from retiisi.eu ([95.216.213.190]:52480 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241114AbiAJWtu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 17:49:50 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 128F2634C90;
        Tue, 11 Jan 2022 00:49:45 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 1/1] ov5648: Don't pack controls struct
Date:   Tue, 11 Jan 2022 00:48:31 +0200
Message-Id: <20220110224831.266749-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't pack the driver specific struct containing control pointers. This
lead to potential alignment issues when working with the pointers.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: e43ccb0a045f ("media: i2c: Add support for the OV5648 image sensor")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5648.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 87f9b724cd7f..3478650ee732 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -639,7 +639,7 @@ struct ov5648_ctrls {
 	struct v4l2_ctrl *pixel_rate;
 
 	struct v4l2_ctrl_handler handler;
-} __packed;
+};
 
 struct ov5648_sensor {
 	struct device *dev;
-- 
2.30.2

