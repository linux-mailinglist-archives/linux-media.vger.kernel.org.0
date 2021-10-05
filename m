Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC42542217D
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbhJEJAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60822 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbhJEJA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:27 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFEB4A2A;
        Tue,  5 Oct 2021 10:58:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424316;
        bh=6AjEaetWUhOFBvdHO2e21OZ7XmnvrixW6TFofwJTRHs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iu9L4xqjxzwJzWhJozRy/QH4qd55rOFVvOVuGASXPhz8+2N7QMV3uS61RO1Kkmwet
         VJVDevsoOrPkLKOMlqsgGzzYBneWnHsJTtYLFTrTBZVCgtRkqQTdqoJTk6pv8WZOUe
         pyePR2jdffNA8WxBVr/J2H0cO487M3CXL8WmZvYA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 25/36] media: add V4L2_SUBDEV_FL_MULTIPLEXED
Date:   Tue,  5 Oct 2021 11:57:39 +0300
Message-Id: <20211005085750.138151-26-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add subdev flag V4L2_SUBDEV_FL_MULTIPLEXED. It is used to indicate that
the subdev supports the new API with multiplexed streams (routing,
stream configs).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b3a72c98a2d3..7f9c83fac020 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -888,6 +888,17 @@ struct v4l2_subdev_internal_ops {
  * should set this flag.
  */
 #define V4L2_SUBDEV_FL_HAS_EVENTS		(1U << 3)
+/*
+ * Set this flag if this subdev supports multiplexed streams. This means
+ * that the driver supports routing and handles the stream parameter in its
+ * v4l2_subdev_pad_ops handlers. More specifically, this means:
+ *
+ * - Centrally managed active state is enabled
+ * - Legacy pad config is _not_ supported (state->pads)
+ * - Routing ioctls are available
+ * - Multiple streams per pad are supported
+ */
+#define V4L2_SUBDEV_FL_MULTIPLEXED		(1U << 4)
 
 struct regulator_bulk_data;
 
-- 
2.25.1

