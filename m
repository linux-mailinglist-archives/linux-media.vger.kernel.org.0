Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF6BD946D
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 16:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405269AbfJPOzR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 10:55:17 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46393 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393064AbfJPOzR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 10:55:17 -0400
Received: by mail-lj1-f193.google.com with SMTP id d1so24289500ljl.13;
        Wed, 16 Oct 2019 07:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CCfz1udCO4iU6up5+Db3Z9kSOI2I8n3Hfy4n2+SvpRY=;
        b=takbKn32OG50f1p4knweJWiwgRgPnfxD2vsyEH8Uk3G/HwwfWBxHD2Nfgkb3RzPhic
         uj2tYi08BTUIbQ5ZTxaqUpQcF1Lgji+4PEQZsAoOiIVl2sRVyallxwveoUPv01gf8R0N
         bnU9EUFHvhZR1aI8JPL4SPn45elVxFO325yqm5+GwpUqTdEzNTXXuadyt5kKsnTc9F5J
         s+s0Yexd4gp5OqvTgjR3WqIeGMju95elZaSoGXnRvyHKH6GijMjBGdmkmFfNUTVjfVqR
         9RnwCODDV7Ylo7NTunagt/rHAjdJw1sw9iqeo0vW3C9hWV7N3LiqqyjCVRbqxEKAsQGP
         TDxQ==
X-Gm-Message-State: APjAAAULQTmzczk67gRtx24S4+1qag9z0qZBunykthxptN3joPNYeTqk
        qxqzRSKZ8RbgVBdbqtC9fKc=
X-Google-Smtp-Source: APXvYqxG7CI/8BsMPfBrwI63mtNVIjtRqJP90lwXOJZwjbrevduVUxHrUTjcKYOmD3FI1WkaNy2tKA==
X-Received: by 2002:a2e:c42:: with SMTP id o2mr25138621ljd.166.1571237714980;
        Wed, 16 Oct 2019 07:55:14 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id u8sm7726251lfb.36.2019.10.16.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 07:55:13 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v2] media: v4l2-ctrl: Add p_def to v4l2_ctrl_config
Date:   Wed, 16 Oct 2019 16:55:12 +0200
Message-Id: <20191016145512.24747-1-ribalda@kernel.org>
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
 drivers/media/v4l2-core/v4l2-ctrls.c | 3 ++-
 include/media/v4l2-ctrls.h           | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index bf50d37ef6c1..939aa110daa0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -2583,7 +2583,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, ptr_null, priv);
+			flags, qmenu, qmenu_int,
+			v4l2_ctrl_ptr_create((void *)cfg->p_def), priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 26205ba3a0a0..d08d19a4ae34 100644
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
+	const void *p_def;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
-- 
2.23.0

