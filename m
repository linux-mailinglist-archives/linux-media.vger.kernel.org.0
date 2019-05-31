Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0A4B30D60
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 13:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfEaLf2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 07:35:28 -0400
Received: from mga02.intel.com ([134.134.136.20]:60749 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726158AbfEaLf1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 07:35:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 May 2019 04:35:26 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007.fm.intel.com with ESMTP; 31 May 2019 04:35:25 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTPS id 75111207C2;
        Fri, 31 May 2019 14:35:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1hWfox-00044l-04; Fri, 31 May 2019 14:35:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@sx4all.nl, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH 1/1] v4l2-subdev: Try formats are only available if subdev API is enabled
Date:   Fri, 31 May 2019 14:35:38 +0300
Message-Id: <20190531113538.15628-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Return an error for which == V4L2_SUBDEV_FORMAT_TRY if
CONFIG_VIDEO_V4L2_SUBDEV_API is not enabled. This is because the try
formats are not available in that case. Do the check here so that drivers
don't need to.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Depends-on: ("media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument")
---
 drivers/media/v4l2-core/v4l2-subdev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 34219e489be27..88b4b9d7c41be 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -122,7 +122,10 @@ static int subdev_close(struct file *file)
 
 static inline int check_which(__u32 which)
 {
-	if (which != V4L2_SUBDEV_FORMAT_TRY &&
+	if (
+#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
+	    which != V4L2_SUBDEV_FORMAT_TRY &&
+#endif
 	    which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-- 
2.11.0

