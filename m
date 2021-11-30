Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7371C463669
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242168AbhK3OU1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242086AbhK3OUL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:11 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16F003528;
        Tue, 30 Nov 2021 15:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281809;
        bh=goluvIEi2SV6a2wMiaHG/4C28EV1pjBSfTQEtDm+ypk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fAvbPGM2YTzBDyLsgZhAzLWRBBAWC8GTVL3OCHlVvhHSqv/3Ns8dfyuUN05Zi+T0G
         hy7jSCp7q+smmOm7GxU4+R/PKz2ILbrSX83Zc5jtyrFm1HGlOJJhbCH5QusL3Hwm4U
         GJ2kRt7VUx/UCRgid+vrjeTCSbNkATWBhmtvK4v0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 21/38] media: Add bus type to frame descriptors
Date:   Tue, 30 Nov 2021 16:15:19 +0200
Message-Id: <20211130141536.891878-22-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
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
index 873bbe0686e3..03e58fc35092 100644
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
2.25.1

