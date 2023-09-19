Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB387A62AE
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 14:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjISMUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 08:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbjISMUW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 08:20:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1E8E79
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695125978; x=1726661978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PtueazjijaSQAHS1fnHaZONd/RP137LwLPAwO38B8Zg=;
  b=TR59GcHCLOT/f27XhuBosBjAXTtwzeeweUKpIdMWH8vCJJuh37t1C4mP
   lIsMEVA9ejT6NncjEMWvpa0DUHSIKm45Ad3HZ26KYE0Y0pduIpQ/WjSzA
   8hFdA707qdUuWvJ8ldwYZn4o4NMnSZycAqF75pWxmYwsCOCZwbwmQ7bnQ
   DEaEjJdPYfe4GDnvB48LFMJTfEP2K8IG2U1e5FfKO4AoAjzxx410xI0xG
   kUHM/Se64rJFkFNpwv0PYaPZQF/yTzEycZk8fOy3wMalHGQoRgAes9QV/
   zny+mJFYag/Ew2GJKlca+cHIRxtuKKoOtH1jSC19Fka+ji2xrOvjjpw7d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466251044"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="466251044"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 05:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811701671"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="811701671"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 05:17:48 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 99056120C1C;
        Tue, 19 Sep 2023 15:17:44 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v3 11/12] media: v4l: subdev: Print debug information on frame descriptor
Date:   Tue, 19 Sep 2023 15:17:27 +0300
Message-Id: <20230919121728.126781-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
References: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print debug level information on returned frame descriptors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 32 ++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7b087be3ff4f..504ca625b2bd 100644
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
@@ -309,9 +310,38 @@ static int call_set_selection(struct v4l2_subdev *sd,
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
+			snprintf(buf, sizeof(buf), ", vc %u, dt 0x%2.2x",
+				 entry->bus.csi2.vc, entry->bus.csi2.dt);
+
+		dev_dbg(sd->dev,
+			"\tstream %u, code 0x%4.4x, lenght %u, flags%s%s%s\n",
+			entry->stream, entry->pixelcode, entry->length,
+			entry->flags & V4L2_MBUS_FRAME_DESC_FL_LEN_MAX ?
+			" LEN_MAX" : "",
+			entry->flags & V4L2_MBUS_FRAME_DESC_FL_BLOB ?
+			" BLOB" : "", buf);
+	}
+
+	return 0;
 }
 
 static inline int check_edid(struct v4l2_subdev *sd,
-- 
2.39.2

