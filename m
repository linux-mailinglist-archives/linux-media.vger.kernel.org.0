Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9772CCF5
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 19:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfE1RDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 13:03:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45948 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbfE1RDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 13:03:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A1E37284AFB
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v6 07/16] rockchip/vpu: Rename rockchip_vpu_common.h into rockchip_vpu_v4l2.h
Date:   Tue, 28 May 2019 14:02:23 -0300
Message-Id: <20190528170232.2091-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528170232.2091-1-ezequiel@collabora.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

We're about to add prototypes for the vb2/v4l2 helpers shared by the
encoder/decoder logic in this file, so let's pick a name that reflects
that (rockchip_vpu_common.h was a bit to generic).

Suggested-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes from v3:
* None

Changes from v2:
* New patch

 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c | 2 +-
 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c | 2 +-
 drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c       | 2 +-
 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c       | 2 +-
 .../vpu/{rockchip_vpu_common.h => rockchip_vpu_v4l2.h}      | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/staging/media/rockchip/vpu/{rockchip_vpu_common.h => rockchip_vpu_v4l2.h} (88%)

diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
index 791353ae01e7..68176e91330a 100644
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
+++ b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
@@ -9,7 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include "rockchip_vpu_jpeg.h"
 #include "rockchip_vpu.h"
-#include "rockchip_vpu_common.h"
+#include "rockchip_vpu_v4l2.h"
 #include "rockchip_vpu_hw.h"
 #include "rk3288_vpu_regs.h"
 
diff --git a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c b/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c
index 74823d25cd8d..460edc5ebe4d 100644
--- a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c
+++ b/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c
@@ -27,7 +27,7 @@
 #include <media/v4l2-mem2mem.h>
 #include "rockchip_vpu_jpeg.h"
 #include "rockchip_vpu.h"
-#include "rockchip_vpu_common.h"
+#include "rockchip_vpu_v4l2.h"
 #include "rockchip_vpu_hw.h"
 #include "rk3399_vpu_regs.h"
 
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
index f47fbd0f9545..59b72245fb07 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
@@ -24,7 +24,7 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
-#include "rockchip_vpu_common.h"
+#include "rockchip_vpu_v4l2.h"
 #include "rockchip_vpu.h"
 #include "rockchip_vpu_hw.h"
 
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
index 4512e94c3f32..d2b4225516b5 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
@@ -28,7 +28,7 @@
 
 #include "rockchip_vpu.h"
 #include "rockchip_vpu_hw.h"
-#include "rockchip_vpu_common.h"
+#include "rockchip_vpu_v4l2.h"
 
 static const struct rockchip_vpu_fmt *
 rockchip_vpu_find_format(struct rockchip_vpu_ctx *ctx, u32 fourcc)
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.h
similarity index 88%
rename from drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h
rename to drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.h
index ca77668d9579..50ad40dfb4f4 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.h
@@ -13,8 +13,8 @@
  * Copyright (C) 2011 Samsung Electronics Co., Ltd.
  */
 
-#ifndef ROCKCHIP_VPU_COMMON_H_
-#define ROCKCHIP_VPU_COMMON_H_
+#ifndef ROCKCHIP_VPU_V4L2_H_
+#define ROCKCHIP_VPU_V4L2_H_
 
 #include "rockchip_vpu.h"
 
@@ -26,4 +26,4 @@ void rockchip_vpu_enc_reset_src_fmt(struct rockchip_vpu_dev *vpu,
 void rockchip_vpu_enc_reset_dst_fmt(struct rockchip_vpu_dev *vpu,
 				    struct rockchip_vpu_ctx *ctx);
 
-#endif /* ROCKCHIP_VPU_COMMON_H_ */
+#endif /* ROCKCHIP_VPU_V4L2_H_ */
-- 
2.20.1

