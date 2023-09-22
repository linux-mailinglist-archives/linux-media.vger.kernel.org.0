Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0963A7AB16A
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 13:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbjIVL56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 07:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbjIVL54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 07:57:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1255F198
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 04:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695383871; x=1726919871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bd2YYJCzGlMt6IUuz2mj70eciD1v2dqyycwBrrFKol4=;
  b=kFouVJWmBZInt8N2bKNBWj3eCY9PFFuIXD18d0N1YxMEJgCRI5348FDt
   oulrC5go304bjnWtqXUPgwwzwyATsz02teuuO3QIienAYudJ6Y+qEfyu2
   DszRuT6TnArug/A7zhmXxpWKMTKvwQ1VQ9fHh+1Fv7CwoaQUO4ffih4hx
   k1849ODZrdp2/8KA2/Y8hNtZMDrOVUM/aw5IL0e5y1r6Rzzqqvohuly2l
   NmD3fSLxLA5qz0TFlhYK/baT2Vzy/fi/AugTKwGPDCohhlwzc6TmP6uFe
   x4yPsaFOacJuZeUMwkIpy5BEo5+dELWCiXIgief/dSVKB1YqhsngrcaSJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383558626"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383558626"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837714690"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="837714690"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:57:48 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0DAAE11FC30;
        Fri, 22 Sep 2023 14:57:44 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v4 11/12] media: v4l: subdev: Print debug information on frame descriptor
Date:   Fri, 22 Sep 2023 14:57:29 +0300
Message-Id: <20230922115730.251779-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
References: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print debug level information on returned frame descriptors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 31 ++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7b087be3ff4f..ed0069efc921 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/version.h>
 #include <linux/videodev2.h>
@@ -309,9 +310,37 @@ static int call_set_selection(struct v4l2_subdev *sd,
 static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			       struct v4l2_mbus_frame_desc *fd)
 {
+	unsigned int i;
+	int ret;
+
 	memset(fd, 0, sizeof(*fd));
 
-	return sd->ops->pad->get_frame_desc(sd, pad, fd);
+	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
+	if (ret)
+		return ret;
+
+	dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
+		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
+		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
+		"unknown");
+
+	for (i = 0; i < fd->num_entries; i++) {
+		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
+		char buf[20] = "";
+
+		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+			WARN_ON(snprintf(buf, sizeof(buf),
+					 ", vc %u, dt 0x%02x",
+					 entry->bus.csi2.vc,
+					 entry->bus.csi2.dt) >= sizeof(buf));
+
+		dev_dbg(sd->dev,
+			"\tstream %u, code 0x%04x, length %u, flags 0x%04x%s\n",
+			entry->stream, entry->pixelcode, entry->length,
+			entry->flags, buf);
+	}
+
+	return 0;
 }
 
 static inline int check_edid(struct v4l2_subdev *sd,
-- 
2.39.2

