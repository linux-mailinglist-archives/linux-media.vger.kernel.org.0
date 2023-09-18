Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A82297A4A2D
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 14:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241615AbjIRMwo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 08:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241576AbjIRMwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 08:52:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242759C
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 05:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695041524; x=1726577524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U1Qvq5f9Zk3v7yL6ycYsO2NFkIbbx6Yg2bqzwTxVkWY=;
  b=jGPLkh1MSrwrXd9VC4Bh3aEvCbsoeoKYVWgXeJkDPun/TGnmKODid37u
   JxHlEesaXVMqeIC2VDdrqymAcRS3zCL5wvLSyy5+GiHGmh49SrK0BmXTV
   uzNbtqMCIVT7/sW5UcbyTXc66/Ykumi4k3rze/I0aABCEZ6xam2Wd8xCC
   ytnSVveKWqg8hLojkKK13cw+rn8yxGAOGqGlw6tAOlGRN29erkxh7Foa6
   X4Q2N4q0S7++jLCrG+DCFtSwRrSr6mEsZF8MV29LcdCUcR4ebeO2VDq7H
   Q/YDZDTub5/yLnm7X/JdseivkqzhAGTBMoTk5DlIFjdB6gwZwTrA6KRBF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364689001"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="364689001"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="836005484"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="836005484"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:51:57 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3059D11F854;
        Mon, 18 Sep 2023 15:51:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v2 11/12] media: v4l: subdev: Print debug information on frame descriptor
Date:   Mon, 18 Sep 2023 15:51:37 +0300
Message-Id: <20230918125138.90002-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
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
 drivers/media/v4l2-core/v4l2-subdev.c | 35 ++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7b087be3ff4f..abd9275febdb 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -309,9 +309,42 @@ static int call_set_selection(struct v4l2_subdev *sd,
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
+	dev_dbg(sd->dev, "Frame descriptor\n");
+	dev_dbg(sd->dev, "\ttype %s\n",
+		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
+		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
+		"unknown");
+	dev_dbg(sd->dev, "\tentries %u\n", fd->num_entries);
+
+	for (i = 0; i < fd->num_entries; i++) {
+		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
+
+		dev_dbg(sd->dev, "\tentry %u\n", i);
+		dev_dbg(sd->dev, "\tflags%s%s\n",
+			entry->flags & V4L2_MBUS_FRAME_DESC_FL_LEN_MAX ?
+			" LEN_MAX" : "",
+			entry->flags & V4L2_MBUS_FRAME_DESC_FL_BLOB ?
+			" BLOB" : "");
+		dev_dbg(sd->dev, "\t\tstream %u\n", entry->stream);
+		dev_dbg(sd->dev, "\t\tpixelcode 0x%4.4x\n", entry->pixelcode);
+		dev_dbg(sd->dev, "\t\tlength %u\n", entry->length);
+
+		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+			dev_dbg(sd->dev, "\t\tvc %u\n", entry->bus.csi2.vc);
+			dev_dbg(sd->dev, "\t\tdt 0x%2.2x\n", entry->bus.csi2.dt);
+		}
+	}
+
+	return 0;
 }
 
 static inline int check_edid(struct v4l2_subdev *sd,
-- 
2.39.2

