Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4043FB44B
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236532AbhH3LDg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236493AbhH3LDa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:30 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16BEE220E;
        Mon, 30 Aug 2021 13:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321353;
        bh=3xTblfq00yXar8gawda0KjUrZ6yQgX3YMAn7J39H5rE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QoTzlQDsM8qCFpe+K8y3Me8p/+yLPJQ0YzHcjB9vEX1jY6+RaabB1VkVq2VACKifY
         eKf8t+fdU4TjpSm77cikWS/LfknOvsrXOYv9Su7LHcaDVAOgXlCvhnupRd4NuqPBCi
         2magLQ7eBIrOkcuu67Kcuu+sPEDLiI7/qXktP63Y=
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
Subject: [PATCH v8 26/36] media: add V4L2_SUBDEV_FL_MULTIPLEXED
Date:   Mon, 30 Aug 2021 14:01:06 +0300
Message-Id: <20210830110116.488338-27-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add subdev flag V4L2_SUBDEV_FL_MULTIPLEXED. It is used to indicate that
the subdev supports the new API with multiplexed streams (routing,
stream configs).

TODO: describe better what the flag does.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1c022d1a6896..356901d8a948 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -890,6 +890,12 @@ struct v4l2_subdev_internal_ops {
  * should set this flag.
  */
 #define V4L2_SUBDEV_FL_HAS_EVENTS		(1U << 3)
+/*
+ * Set this flag if this subdev supports multiplexed streams. This means
+ * that the driver supports routing and handles the stream parameter in its
+ * v4l2_subdev_pad_ops handlers.
+ */
+#define V4L2_SUBDEV_FL_MULTIPLEXED		(1U << 4)
 
 struct regulator_bulk_data;
 
-- 
2.25.1

