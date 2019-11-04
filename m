Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7280DEE0AF
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 14:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbfKDNJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 08:09:30 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45082 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbfKDNJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 08:09:30 -0500
Received: by mail-lj1-f195.google.com with SMTP id n21so3890632ljg.12;
        Mon, 04 Nov 2019 05:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9P8rBv8FlOAdd5Kdu3vWsUKtcKK3jMnnUl9eTBCRCiQ=;
        b=RnTgQhOQ+YJWPEtNsSXE+8Rl3OSw/q1579PXm8Wt4uRGElZaQCa4T8fThPkXDozvau
         e+ZGVy3jFUQXMUF5OjkfrOI5/4fIKtSdvscuhkybPuMCNeL3ezbhO1uFoVLULiWpy8DX
         bVfE4nshiQJjp9TYhGn3rsTdiD3tNZRfIoOnvuoBB/Gouqqufat/Sm3ZejpLn7naGuoQ
         gj50wt1XwwHD+YnfQSkGW6YJTEHQ0X7iDYO3gr3VrJzeeqsiYg9zuNdyFtLgtuXWBytT
         sOWHqdWFIp0o0iAi+aXMRzl/5fgYhXYAIyc7VoSSsccUIBPu5H6KiAK4GpSzRT9FOEnt
         /XEg==
X-Gm-Message-State: APjAAAX1TpA/NoKZUohJL3UoFN0TU+at09vXAqk4FWtOSwRKU6yQ1j1O
        BfbwzCoIjY1uNnr1Wkwbb4vtDJUn/qM=
X-Google-Smtp-Source: APXvYqzcI44Lu+vcPgtgkIXtqYfzThKqoYRzsOByJ+efQrIZgoiFus2ESUgT0d0GIKWI+BjQT8VYbA==
X-Received: by 2002:a2e:85c3:: with SMTP id h3mr5790400ljj.122.1572872968219;
        Mon, 04 Nov 2019 05:09:28 -0800 (PST)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id q124sm985414ljq.93.2019.11.04.05.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 05:09:27 -0800 (PST)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v4 1/6] media: v4l2_ctrl: Add p_def to v4l2_ctrl_config
Date:   Mon,  4 Nov 2019 14:09:18 +0100
Message-Id: <20191104130923.22184-1-ribalda@kernel.org>
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

