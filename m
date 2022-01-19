Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39786493691
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 09:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352606AbiASIu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 03:50:27 -0500
Received: from retiisi.eu ([95.216.213.190]:34036 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352582AbiASIuY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 03:50:24 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 339B2634C93;
        Wed, 19 Jan 2022 10:50:20 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Daniel Scally <djrscally@gmail.com>
Subject: [PATCH 1/1] ov8865: Fix indentation in set_selection callback
Date:   Wed, 19 Jan 2022 10:48:59 +0200
Message-Id: <20220119084859.7113-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixed wrong indentation in set_selection callback.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov8865.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 2b18d8e54098..cfc726e0ed1e 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2838,8 +2838,8 @@ static int ov8865_get_selection(struct v4l2_subdev *subdev,
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
 		mutex_lock(&sensor->mutex);
-			__ov8865_get_pad_crop(sensor, state, sel->pad,
-					      sel->which, &sel->r);
+		__ov8865_get_pad_crop(sensor, state, sel->pad,
+				      sel->which, &sel->r);
 		mutex_unlock(&sensor->mutex);
 		break;
 	case V4L2_SEL_TGT_NATIVE_SIZE:
-- 
2.30.2

