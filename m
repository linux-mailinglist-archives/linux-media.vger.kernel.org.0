Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F3E46366D
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242163AbhK3OUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242104AbhK3OUO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:14 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E0BE3529;
        Tue, 30 Nov 2021 15:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281813;
        bh=ATr2EGEni0QrXHoTvbQskjUwFqrWjsCieLEaaZ8qoFk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tl6FiwscLLunDi2bsb9LiU+/a+Cxy/YoOiU1Ukb/bsDcQOsU0rj/N8+/ASunqxFfx
         wgzivihJGW1GSYcHJB75EN+7tKOBOgi2kaz/ousBnbviLQwdmFas7SGhGvziNbzi71
         qL2LfCGGaKnBjdcmF+fkqlhW4u87DEkEieFFIzBE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 25/38] media: add V4L2_SUBDEV_FL_MULTIPLEXED
Date:   Tue, 30 Nov 2021 16:15:23 +0200
Message-Id: <20211130141536.891878-26-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
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
index a82fc74f4646..45861bcdccf5 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -892,6 +892,17 @@ struct v4l2_subdev_internal_ops {
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

