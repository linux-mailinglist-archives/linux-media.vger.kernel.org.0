Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE3650F1A4
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343603AbiDZHGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 03:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343599AbiDZHGJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 03:06:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2846D4C0
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:03:02 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CA34488;
        Tue, 26 Apr 2022 09:02:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650956580;
        bh=d0qb1lierlzgT3LsSaW00Kief6m4DqTqBtxm4lid6lY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MplMkheQZ+qjbsL4xNyWqHFVTwq1M5cyAGyRZ2zkd3nSy+3uL8wcqhHDFV16ScWiw
         B3PJACnJedJn5RzW+ozVHdpFcAZlODHID84H70XxbgUoRSHIHIwAgi6Wwv0RLvf1Vv
         NskhV/x/gNG8DY6V781ubJl50ODHt0qAbQ/um+bY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 1/3] media: Add bus type to frame descriptors
Date:   Tue, 26 Apr 2022 10:02:38 +0300
Message-Id: <20220426070240.68100-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426070240.68100-1-tomi.valkeinen@ideasonboard.com>
References: <20220426070240.68100-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Add the media bus type to the frame descriptor. CSI-2 specific
information will be added in next patch to the frame descriptor.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

- Make the bus type a named enum
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 6c153b33bb04..16d6559f81ed 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -344,12 +344,32 @@ struct v4l2_mbus_frame_desc_entry {
 
 #define V4L2_FRAME_DESC_ENTRY_MAX	4
 
+/**
+ * enum v4l2_mbus_frame_desc_type - media bus frame description type
+ *
+ * @V4L2_MBUS_FRAME_DESC_TYPE_UNDEFINED:
+ *	Undefined frame desc type. Drivers should not use this, it is
+ *	for backwards compatibility.
+ * @V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL:
+ *	Parallel media bus.
+ * @V4L2_MBUS_FRAME_DESC_TYPE_CSI2:
+ *	CSI-2 media bus. Frame desc parameters must be set in
+ *	&struct v4l2_mbus_frame_desc_entry->csi2.
+ */
+enum v4l2_mbus_frame_desc_type {
+	V4L2_MBUS_FRAME_DESC_TYPE_UNDEFINED = 0,
+	V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL,
+	V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
+};
+
 /**
  * struct v4l2_mbus_frame_desc - media bus data frame description
+ * @type: type of the bus (enum v4l2_mbus_frame_desc_type)
  * @entry: frame descriptors array
  * @num_entries: number of entries in @entry array
  */
 struct v4l2_mbus_frame_desc {
+	enum v4l2_mbus_frame_desc_type type;
 	struct v4l2_mbus_frame_desc_entry entry[V4L2_FRAME_DESC_ENTRY_MAX];
 	unsigned short num_entries;
 };
-- 
2.34.1

