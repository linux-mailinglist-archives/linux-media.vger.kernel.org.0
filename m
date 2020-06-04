Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7101EEABF
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 21:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729360AbgFDTAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 15:00:31 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55576 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728900AbgFDTAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 15:00:31 -0400
Received: from localhost.localdomain (p200300cb871f5b00dc30b2a26950c31b.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:dc30:b2a2:6950:c31b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 58B962A47F6;
        Thu,  4 Jun 2020 20:00:29 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org
Subject: [PATCH 2/2] media: staging: rkisp1: rsz: set default format if the given format is not RKISP1_DIR_SRC
Date:   Thu,  4 Jun 2020 21:00:15 +0200
Message-Id: <20200604190015.12069-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604190015.12069-1-dafna.hirschfeld@collabora.com>
References: <20200604190015.12069-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When setting the sink format of the 'rkisp1_resizer'
the format should be supported by 'rkisp1_isp' on
the video source pad. This patch checks this condition
and set the format to default if the condition is false.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h  | 4 ++++
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 4 ----
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 0c4fe503adc9..39d8e46d8d8a 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -22,6 +22,10 @@
 #include "rkisp1-regs.h"
 #include "uapi/rkisp1-config.h"
 
+#define RKISP1_DIR_SRC BIT(0)
+#define RKISP1_DIR_SINK BIT(1)
+#define RKISP1_DIR_SINK_SRC (RKISP1_DIR_SINK | RKISP1_DIR_SRC)
+
 #define RKISP1_ISP_MAX_WIDTH		4032
 #define RKISP1_ISP_MAX_HEIGHT		3024
 #define RKISP1_ISP_MIN_WIDTH		32
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index dc2b59a0160a..e66e87d6ea8b 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -23,10 +23,6 @@
 
 #define RKISP1_ISP_DEV_NAME	RKISP1_DRIVER_NAME "_isp"
 
-#define RKISP1_DIR_SRC BIT(0)
-#define RKISP1_DIR_SINK BIT(1)
-#define RKISP1_DIR_SINK_SRC (RKISP1_DIR_SINK | RKISP1_DIR_SRC)
-
 /*
  * NOTE: MIPI controller and input MUX are also configured in this file.
  * This is because ISP Subdev describes not only ISP submodule (input size,
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index d64c064bdb1d..fa28f4bd65c0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -542,7 +542,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 					    which);
 	sink_fmt->code = format->code;
 	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
-	if (!mbus_info) {
+	if (!mbus_info || !(mbus_info->direction & RKISP1_DIR_SRC)) {
 		sink_fmt->code = RKISP1_DEF_FMT;
 		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
 	}
-- 
2.17.1

