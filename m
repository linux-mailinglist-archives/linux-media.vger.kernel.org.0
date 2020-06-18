Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F841FF0BC
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 13:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729693AbgFRLfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 07:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729683AbgFRLfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 07:35:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CF2C06174E
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 04:35:37 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D91C12A4A86
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v4 4/4] media: staging: rkisp1: rsz: set default format if the given format is not RKISP1_ISP_SD_SRC
Date:   Thu, 18 Jun 2020 13:35:18 +0200
Message-Id: <20200618113518.30057-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618113518.30057-1-dafna.hirschfeld@collabora.com>
References: <20200618113518.30057-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When setting the sink format of the 'rkisp1_resizer'
the format should be supported by 'rkisp1_isp' on
the video source pad. This patch checks this condition
and sets the format to default if the condition is false.

Fixes: 56e3b29f9f6b "media: staging: rkisp1: add streaming paths"

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/staging/media/rkisp1/rkisp1-common.h  | 3 +++
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 3 ---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 0c4fe503adc9..12bd9d05050d 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -22,6 +22,9 @@
 #include "rkisp1-regs.h"
 #include "uapi/rkisp1-config.h"
 
+#define RKISP1_ISP_SD_SRC BIT(0)
+#define RKISP1_ISP_SD_SINK BIT(1)
+
 #define RKISP1_ISP_MAX_WIDTH		4032
 #define RKISP1_ISP_MAX_HEIGHT		3024
 #define RKISP1_ISP_MIN_WIDTH		32
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index abfedb604303..b21a67aea433 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -23,9 +23,6 @@
 
 #define RKISP1_ISP_DEV_NAME	RKISP1_DRIVER_NAME "_isp"
 
-#define RKISP1_ISP_SD_SRC BIT(0)
-#define RKISP1_ISP_SD_SINK BIT(1)
-
 /*
  * NOTE: MIPI controller and input MUX are also configured in this file.
  * This is because ISP Subdev describes not only ISP submodule (input size,
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index d64c064bdb1d..137298b77341 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -542,7 +542,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 					    which);
 	sink_fmt->code = format->code;
 	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
-	if (!mbus_info) {
+	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
 		sink_fmt->code = RKISP1_DEF_FMT;
 		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
 	}
-- 
2.17.1

