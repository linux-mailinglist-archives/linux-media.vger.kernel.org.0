Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8A14C8FDE
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236069AbiCAQNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236057AbiCAQNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2404513CD4
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:13:03 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0FEE37B6;
        Tue,  1 Mar 2022 17:12:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151165;
        bh=kdljCEFvRgj27rC2udfcF2Xw9M6rcNi0cbUflSSpqpE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vN/CLNbQZ4NenfQ7LD2iUURqnfJtpon3nvEb9Nfo8MuM7LnlbwFAIT91LjY+JzpQ3
         bDV8vp2fMa5oPg+WHZek/LNthDqLyKR3xnwlxH+Fj3BEUSap0krkbATsRx+7fWMOUO
         y5LS+aM1NQ53J6kJmurYBWbj1OaI8JreK8ELhOlw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 29/36] media: subdev: add v4l2_subdev_get_fmt() helper function
Date:   Tue,  1 Mar 2022 18:11:49 +0200
Message-Id: <20220301161156.1119557-30-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
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
v4l2_subdev_pad_ops.get_fmt using streams. Subdev drivers that do not
need to do anything special in their get_fmt op can use this helper
directly for v4l2_subdev_pad_ops.get_fmt.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 16 ++++++++++++++++
 include/media/v4l2-subdev.h           | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e65f802fe2aa..c1cc9b91dba7 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1507,6 +1507,22 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
 
+int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
+						  format->stream);
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
index ed3fe21637e6..a80830801a7f 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1481,6 +1481,23 @@ struct v4l2_mbus_framefmt *
 v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 					     u32 pad, u32 stream);
 
+/**
+ * v4l2_subdev_get_fmt() - Fill format based on state
+ * @sd: subdevice
+ * @state: subdevice state
+ * @format: pointer to &struct v4l2_subdev_format
+ *
+ * Fill @format based on the pad and stream given in the @format struct.
+ *
+ * This function can be used by the subdev drivers to implement
+ * v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to do
+ * anything special in their get_fmt op.
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

