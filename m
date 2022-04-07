Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4EB4F793B
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 10:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240339AbiDGIRS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 04:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242736AbiDGIRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 04:17:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560821DAFB3
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 01:15:14 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43F0C499;
        Thu,  7 Apr 2022 10:15:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649319309;
        bh=2zPxb2H/E0FnZTDaTguBA+EJVpbJDgfHVuPpag0PEDE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vWWr7XBLY29W/D3FYcvCDyUzltqtHsTV8stWTYZbBspM1Ko4o28bE5XjDxsaKy28k
         vhmLBzsBKqjL+4VMUKh21d6XhtJUi33ZZXDtZ0KfwjBaaV+QxGwGx9k13unnNoKrih
         i94H6SnvMy8SkzWPO+MEkKhHFDp+ZxmPU2PKLYjo=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 7/8] media: subdev: add v4l2_subdev_get_fmt() helper function
Date:   Thu,  7 Apr 2022 11:14:23 +0300
Message-Id: <20220407081424.295870-8-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407081424.295870-1-tomi.valkeinen@ideasonboard.com>
References: <20220407081424.295870-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++++++++++++++
 include/media/v4l2-subdev.h           | 17 +++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index d8d1c9ef4dc4..5c7681cc1fa2 100644
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
+	fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
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
index ec0bfecb8d5d..9d0acc3d65fb 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1303,6 +1303,23 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
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

