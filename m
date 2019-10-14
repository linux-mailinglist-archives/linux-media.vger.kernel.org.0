Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2259D64DA
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 16:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732554AbfJNOOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 10:14:32 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33156 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732330AbfJNOOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 10:14:32 -0400
Received: by mail-lj1-f194.google.com with SMTP id a22so16837141ljd.0;
        Mon, 14 Oct 2019 07:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cuSCXY7MyqvuURIbUyovz0gGBG/KVjSu575UROxamTY=;
        b=PYpJQoQ0LcJdRDOkUGxNy9JCyOrrhH1JhRxZPy5+SPJcqBLvnueDHL9bH7ckreRsnh
         NjGP1w4fzUUKrvaq2laP6zOwrcel1npwnlT3dzcLwWAlBtLOC9rFMoG6zDVpezNhKyQH
         UpZACmnSWzBNnpEkl2AM+fkYmVoPRgYRqCfDLDPis7yGrbswGKxH5yoyArxfafGu+Oza
         iypcRl7/QQoQ91RiyBynxFKZuX6GSKmhk7ZxL/Sc4xmLjMvbP+GXSFnjpBbw/N63fInb
         +O70UF/7MBNTSrC1jw4y6P/hfxtEcfMvh1gSQsAO9t1tUIJ0L56+BKsne7W7WdacQrFQ
         +ZQg==
X-Gm-Message-State: APjAAAWZrRZoD+1T0aMAD/7fwpQFe983Qr84IFtlbzK+ZRk51L7whKmF
        v8Dofw0j/+r36HTUZidE6GI=
X-Google-Smtp-Source: APXvYqyg4aRm5D2Q7Zm/L6BTkCMdAktgcO/vIK5TXw5ZzA7DDHbs0dpppACfhxx6hNT6O7nJv8B9Mg==
X-Received: by 2002:a05:651c:338:: with SMTP id b24mr9220276ljp.65.1571062469740;
        Mon, 14 Oct 2019 07:14:29 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id k21sm4143995lfm.68.2019.10.14.07.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 07:14:28 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH] media: v4l2-ctrl: Add p_def to v4l2_ctrl_config
Date:   Mon, 14 Oct 2019 16:14:27 +0200
Message-Id: <20191014141427.30708-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
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
index bf50d37ef6c1..12cf38f73f7b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -2583,7 +2583,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, ptr_null, priv);
+			flags, qmenu, qmenu_int, cfg->p_def, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 26205ba3a0a0..2fca5b823961 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -375,6 +375,7 @@ struct v4l2_ctrl_handler {
  * @max:	The control's maximum value.
  * @step:	The control's step value for non-menu controls.
  * @def:	The control's default value.
+ * @p_def:	The control's default value for compound controls.
  * @dims:	The size of each dimension.
  * @elem_size:	The size in bytes of the control.
  * @flags:	The control's flags.
@@ -403,6 +404,7 @@ struct v4l2_ctrl_config {
 	s64 max;
 	u64 step;
 	s64 def;
+	union v4l2_ctrl_ptr p_def;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
-- 
2.23.0

