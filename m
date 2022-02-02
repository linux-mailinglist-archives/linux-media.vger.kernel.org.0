Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3164A72C7
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 15:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344610AbiBBOM6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 09:12:58 -0500
Received: from retiisi.eu ([95.216.213.190]:42590 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233774AbiBBOM5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Feb 2022 09:12:57 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 6F9AB634C91;
        Wed,  2 Feb 2022 16:12:52 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] media: i2c: ov08d10: Unlock on error in ov08d10_enum_frame_size()
Date:   Wed,  2 Feb 2022 16:11:21 +0200
Message-Id: <20220202141121.238930-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

This error path needs to drop the mutex to avoid a deadlock.

Fixes: 7be91e02ed57 ("media: i2c: Add ov08d10 camera sensor driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov08d10.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 1f42dd714ef6..e5ef6466a3ec 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1264,8 +1264,10 @@ static int ov08d10_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	mutex_lock(&ov08d10->mutex);
-	if (fse->code != ov08d10_get_format_code(ov08d10))
+	if (fse->code != ov08d10_get_format_code(ov08d10)) {
+		mutex_unlock(&ov08d10->mutex);
 		return -EINVAL;
+	}
 	mutex_unlock(&ov08d10->mutex);
 
 	fse->min_width = ov08d10->priv_lane->sp_modes[fse->index].width;
-- 
2.30.2

