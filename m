Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 222AF4E5FD7
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 09:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348775AbiCXIDF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 04:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348762AbiCXIC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 04:02:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719FF99ED5
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 01:01:27 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83AEF1858;
        Thu, 24 Mar 2022 09:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648108883;
        bh=nYVU7jnyboXZYlMS5/Ass4CAtHJp1LeY5ZxD1NV+nLE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cMFBjKnOnhisC1PgqS7qD3Yu3ZPz559jGZasa+MMHhMkXbmXNozaZfn1QVYeM+Bxy
         fr1m4+74TLMJ5uC4CxqefGkv6lcc6MWce/O7njhFUrhm3eh8qSoI8MLFPD9wdVINFr
         IAsOf8yoWRY2uKK8XDTwta82fU4yqJE5ztmuqAmk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 7/8] media: subdev: add v4l2_subdev_get_fmt() helper function
Date:   Thu, 24 Mar 2022 10:00:29 +0200
Message-Id: <20220324080030.216716-8-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
References: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l2_subdev_get_fmt() helper function which implements
v4l2_subdev_pad_ops.get_fmt using active state. Subdev drivers that
support active state and do not need to do anything special in their
get_fmt op can use this helper directly for v4l2_subdev_pad_ops.get_fmt.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++++++++++++++
 include/media/v4l2-subdev.h           | 17 +++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d8d1c9ef4dc4..cbc5ebff0656 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1029,6 +1029,24 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
 
+int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (format->pad >= sd->entity.num_pads)
+		return -EINVAL;
+
+	fmt = v4l2_subdev_get_try_format(sd, state, format->pad);
+	if (!fmt)
+		return -EINVAL;
+
+	format->format = *fmt;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 700ce376b22c..491bdbb1670c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1300,6 +1300,23 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
 	return sd->active_state;
 }
 
+/**
+ * v4l2_subdev_get_fmt() - Fill format based on state
+ * @sd: subdevice
+ * @state: subdevice state
+ * @format: pointer to &struct v4l2_subdev_format
+ *
+ * Fill @format->format field based on the information in the @format struct.
+ *
+ * This function can be used by the subdev drivers which support active state to
+ * implement v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to
+ * do anything special in their get_fmt op.
+ *
+ * Returns 0 on success, error value otherwise.
+ */
+int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			struct v4l2_subdev_format *format);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /**
-- 
2.25.1

