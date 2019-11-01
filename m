Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6BD9EC1B3
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2019 12:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbfKALYD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Nov 2019 07:24:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34978 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfKALYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Nov 2019 07:24:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id y6so6992562lfj.2;
        Fri, 01 Nov 2019 04:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9P8rBv8FlOAdd5Kdu3vWsUKtcKK3jMnnUl9eTBCRCiQ=;
        b=i1xbJEe/QyVRm0WYAQMlPgQMmF9kwPRNJTpODcl3IpdrJ4u/TaNVYfOOLChGoDYuof
         IXPpvJ7AXUCUm0mHMrEDoPFHVewOfbBR9oT1JtxVFAai3QqEnUwS1k6U1B6441O8XotW
         G5tEmfQUxWv9kLZ0ZyJUwdOSIsVvnSefZcT9DxQBtWH4SzDpooA3/1sRKOBJ0y9q5aEC
         zLuF17IOPnuae9vEeZ0Wql/qqvMsuz3HgYhjNVk5GY8Sx1fDk0El1CxwKgGvB/4BbE8X
         U1pIJclSqvn+mHiZLsmytWh6XksmrPy9AhYUfZVbVuHNdeDpHuutKyc/tP8Ahbm2W/Kn
         gXnw==
X-Gm-Message-State: APjAAAW+NsazG5C4fpexXSecdnB2HX1IQddP5+NHFi1h66KaO7A54TLE
        7h57y1fvkEKM5lKLwFm0gNA=
X-Google-Smtp-Source: APXvYqwsKU+cT7wK/M+L48ozRCDKr1OG1PgfC7KWJwdfzSP/WTzGDxhH1938xJq/mEuIIBAmp3TMrA==
X-Received: by 2002:a19:ac48:: with SMTP id r8mr7285986lfc.181.1572607441240;
        Fri, 01 Nov 2019 04:24:01 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id v1sm2313691lji.89.2019.11.01.04.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:23:59 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v3 1/5] media: v4l2_ctrl: Add p_def to v4l2_ctrl_config
Date:   Fri,  1 Nov 2019 12:23:54 +0100
Message-Id: <20191101112358.29538-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This allows setting the default value on compound controls created via
v4l2_ctrl_new_custom.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 2 +-
 include/media/v4l2-ctrls.h           | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index b4caf2d4d076..73d99c3561ce 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -2690,7 +2690,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, ptr_null, priv);
+			flags, qmenu, qmenu_int, cfg->p_def, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index e719d56fc024..78a97b10c89e 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -382,6 +382,7 @@ struct v4l2_ctrl_handler {
  * @max:	The control's maximum value.
  * @step:	The control's step value for non-menu controls.
  * @def:	The control's default value.
+ * @p_def:	The control's default value for compound controls.
  * @dims:	The size of each dimension.
  * @elem_size:	The size in bytes of the control.
  * @flags:	The control's flags.
@@ -410,6 +411,7 @@ struct v4l2_ctrl_config {
 	s64 max;
 	u64 step;
 	s64 def;
+	union v4l2_ctrl_ptr p_def;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
-- 
2.24.0.rc1

