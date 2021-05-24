Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E6538E45C
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbhEXKqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbhEXKqK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:10 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FE541575;
        Mon, 24 May 2021 12:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853079;
        bh=MnA2vLVQL/SbTMdFzXaXg6jhLCIVhSstXq1p+RFWayQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KtJvylp2n8Nin9sDYoxQqACrW63yKxrFPN0Aej67p8Kvk6BXw1dje1wxRWoB8c+g9
         hhEmI1efswKyjwEb8nC0PWWe9koHF4yQebjxIXiDsduZRBQhFlLcpQL+FgoW5BI1o0
         Kcd4+M09IfvX6DjyqQtfHwEOJ38zTp0MUgxP+hds=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v7 15/27] v4l: Add bus type to frame descriptors
Date:   Mon, 24 May 2021 13:43:56 +0300
Message-Id: <20210524104408.599645-16-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
index 79f9932d2b00..53967379fd08 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -340,12 +340,32 @@ struct v4l2_mbus_frame_desc_entry {
 
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
2.25.1

