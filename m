Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE62136C654
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237839AbhD0MrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:47:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45348 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237632AbhD0MrB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:47:01 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 988B514E2;
        Tue, 27 Apr 2021 14:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527578;
        bh=o0tNGynceYGt7c4qwqdUWuzC/vfOER7eZiEiHOboOVQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=md1CQU0Eck6A0pKIczxOn3h2LJdGt56ZNllifEie5f3oQ7Z0B2+tmiFyEokical84
         OEVtbcDaFRq/omP7Vm4pGdfSGTyqIcBTdMRXNWy/UVoB4c886mqAVDvPezmO1WRJZl
         u30yRdHuwcLBRqimkpYCzYBhafTso+59z7iYraBs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 16/24] v4l: Add CSI-2 bus configuration to frame descriptors
Date:   Tue, 27 Apr 2021 15:45:15 +0300
Message-Id: <20210427124523.990938-17-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add CSI-2 bus specific configuration to the frame descriptors. This allows
obtaining the virtual channel and data type information for each stream
the transmitter is sending.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index ac531b752028..695e97b6eb13 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -308,6 +308,17 @@ struct v4l2_subdev_audio_ops {
 	int (*s_stream)(struct v4l2_subdev *sd, int enable);
 };
 
+/**
+ * struct v4l2_mbus_frame_desc_entry_csi2
+ *
+ * @vc: CSI-2 virtual channel
+ * @dt: CSI-2 data type ID
+ */
+struct v4l2_mbus_frame_desc_entry_csi2 {
+	u8 vc;
+	u8 dt;
+};
+
 /**
  * enum v4l2_mbus_frame_desc_flags - media bus frame description flags
  *
@@ -331,11 +342,16 @@ enum v4l2_mbus_frame_desc_flags {
  *		%FRAME_DESC_FL_BLOB is not set.
  * @length:	number of octets per frame, valid if @flags
  *		%V4L2_MBUS_FRAME_DESC_FL_LEN_MAX is set.
+ * @bus:	Bus-specific frame descriptor parameters
+ * @bus.csi2:	CSI-2-specific bus configuration
  */
 struct v4l2_mbus_frame_desc_entry {
 	enum v4l2_mbus_frame_desc_flags flags;
 	u32 pixelcode;
 	u32 length;
+	union {
+		struct v4l2_mbus_frame_desc_entry_csi2 csi2;
+	} bus;
 };
 
 #define V4L2_FRAME_DESC_ENTRY_MAX	4
-- 
2.25.1

