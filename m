Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFE49AFB5
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394789AbfHWMhu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:37:50 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41397 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394779AbfHWMht (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:37:49 -0400
Received: by mail-ed1-f67.google.com with SMTP id w5so13244265edl.8;
        Fri, 23 Aug 2019 05:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xw4AZk4fykI6qkAZg1PCh0T3vV4z+/PeKUb/Xrhl7f0=;
        b=UY0PvlQrCVVjWfqF66V374i6Y/zkovX2ezvWIMKfZDOTI1JcehA9UBp6PuIYKgMf/Y
         I1AFuhMZLr48dHgeJ8+1Bh6ld95aznWIYR2RAw62iZNUlJyecz7cSzMWQdsDWXwGBKJP
         jKo79wnbJfVjpJkCTIoYFk4Ct2GTiGpiDRg1KpQ8YSlS2ngWOWJXfmwsFz/IWWmaDU40
         QONNFv8rJuEqARQD/xzdJz71udHeTOIrI276LDTZMfaH0ci84+vVNauvexAUcnRnxP6Z
         wGqFFYuqmIUMRDj/nlA6WKm49k4SaeSxIlKdn2qH7vOMiffLBu2gZRQZ12ibM1TBVr/5
         4ZFQ==
X-Gm-Message-State: APjAAAWOPtTHqURyIpWYUA/5MFoXdfulhyaGjwIirIYNpxHvHKtIpB2a
        +p1V/kVFOYU1dinJoPnUbgg=
X-Google-Smtp-Source: APXvYqw598HsSm5ntWSZXKJyQtF6NFe8bZoiCnH5oIXVzpYLmyf6KfXHQcXllJn5xNPC4BJquRG2gg==
X-Received: by 2002:a50:c19a:: with SMTP id m26mr4122805edf.184.1566563867089;
        Fri, 23 Aug 2019 05:37:47 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 9sm389687ejw.63.2019.08.23.05.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 05:37:46 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v3 5/7] media: v4l2-core: Add new helper for area controls
Date:   Fri, 23 Aug 2019 14:37:35 +0200
Message-Id: <20190823123737.7774-5-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190823123737.7774-1-ribalda@kernel.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding a V4L2_CID_UNIT_CELL_SIZE control requires a lot of boilerplate,
try to minimize it by adding a new helper.

Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 25 ++++++++++++++++++++++++-
 include/media/v4l2-ctrls.h           | 16 ++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index b3bf458df7f7..33e48f0aec1a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -2660,7 +2660,6 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
 
-/* Helper function for standard integer menu controls */
 struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 			const struct v4l2_ctrl_ops *ops,
 			u32 id, u8 _max, u8 _def, const s64 *qmenu_int)
@@ -2684,6 +2683,30 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
 
+static void area_init(const struct v4l2_ctrl *ctrl, u32 idx,
+		union v4l2_ctrl_ptr ptr)
+{
+	memcpy(ptr.p_area, ctrl->priv, sizeof(*ptr.p_area));
+}
+
+static const struct v4l2_ctrl_type_ops area_ops = {
+	.init = area_init,
+};
+
+struct v4l2_ctrl *v4l2_ctrl_new_area(struct v4l2_ctrl_handler *hdl,
+				     const struct v4l2_ctrl_ops *ops,
+				     u32 id, const struct v4l2_area *area)
+{
+	static struct v4l2_ctrl_config ctrl = {
+		.id = V4L2_CID_UNIT_CELL_SIZE,
+		.type_ops = &area_ops,
+	};
+
+	return v4l2_ctrl_new_custom(hdl, &ctrl, (void *)area);
+}
+EXPORT_SYMBOL(v4l2_ctrl_new_area);
+
+/* Helper function for standard integer menu controls */
 /* Add the controls from another handler to our own. */
 int v4l2_ctrl_add_handler(struct v4l2_ctrl_handler *hdl,
 			  struct v4l2_ctrl_handler *add,
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 9a3d11350e67..36f0712ea6dd 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -669,6 +669,22 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 					 u32 id, u8 max, u8 def,
 					 const s64 *qmenu_int);
 
+/**
+ * v4l2_ctrl_new_area() - Allocate and initialize a V4L2_CTRL_TYPE_AREA control.
+ *
+ * @hdl:	The control handler.
+ * @ops:	The control ops.
+ * @id:	The control ID.
+ * @area:	The width and height of the area in a struct v4l2_area.
+ *
+ * If the &v4l2_ctrl struct could not be allocated then NULL is returned
+ * and @hdl->error is set to the error code (if it wasn't set already).
+ */
+
+struct v4l2_ctrl *v4l2_ctrl_new_area(struct v4l2_ctrl_handler *hdl,
+				     const struct v4l2_ctrl_ops *ops,
+				     u32 id, const struct v4l2_area *area);
+
 /**
  * typedef v4l2_ctrl_filter - Typedef to define the filter function to be
  *	used when adding a control handler.
-- 
2.23.0.rc1

