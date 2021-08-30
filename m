Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743053FB448
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236384AbhH3LDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236488AbhH3LD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:29 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77389B7E;
        Mon, 30 Aug 2021 13:02:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321351;
        bh=Q3RxadSLrXHtHkV0AyktOCF7iAfAYimZgccI7frbwRo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aH+hh5lymuFlEsWlw7aNrznOsnS7SpXAOkh0TQjtKnMQknf3ZiqNEWAOuSTod36ds
         zIXGhpfMjaLR7lxerQZY2TDS8dPHBxJOUAIHrEiQuDHYIkbojq8GQJf2eCYRngs5ba
         ftS/1XOVq2nhgm+dU6xS9NUo6VJ7Yx404sKCgZ3E=
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
Subject: [PATCH v8 23/36] media: Add CSI-2 bus configuration to frame descriptors
Date:   Mon, 30 Aug 2021 14:01:03 +0300
Message-Id: <20210830110116.488338-24-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

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
index 65471e579815..3071d202597d 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -312,6 +312,17 @@ struct v4l2_subdev_audio_ops {
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
@@ -335,11 +346,16 @@ enum v4l2_mbus_frame_desc_flags {
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

