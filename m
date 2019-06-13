Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01EC14389C
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387621AbfFMPHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:07:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54488 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387604AbfFMPHK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:07:10 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:d719:d9b5:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6CB4D281A15;
        Thu, 13 Jun 2019 16:07:07 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, lkcamp@lists.libreplanetbr.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 2/4] media: vimc: Makefile: file cleanup
Date:   Thu, 13 Jun 2019 12:06:14 -0300
Message-Id: <20190613150616.19336-3-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613150616.19336-1-andrealmeid@collabora.com>
References: <20190613150616.19336-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove redundant Makefile rules (vimc_capture-objs, ...).

Stop exposing vimc-{common, streamer} as modules, since there's no use
case where they would be individually added/removed from Vimc. As
consequence, remove MODULE_ macros from vimc-{common, streamer}.

`-objs` is fitted for building host programs, change to `-y`, more
straightforward for device drivers.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
Suggested-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/media/platform/vimc/Makefile        | 12 +++---------
 drivers/media/platform/vimc/vimc-common.c   |  4 ----
 drivers/media/platform/vimc/vimc-streamer.c |  4 ----
 3 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
index c4fc8e7d365a..96d06f030c31 100644
--- a/drivers/media/platform/vimc/Makefile
+++ b/drivers/media/platform/vimc/Makefile
@@ -1,11 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-vimc-objs := vimc-core.o
-vimc_capture-objs := vimc-capture.o
-vimc_common-objs := vimc-common.o
-vimc_debayer-objs := vimc-debayer.o
-vimc_scaler-objs := vimc-scaler.o
-vimc_sensor-objs := vimc-sensor.o
-vimc_streamer-objs := vimc-streamer.o
+vimc-y := vimc-core.o vimc-common.o vimc-streamer.o
 
-obj-$(CONFIG_VIDEO_VIMC) += vimc.o vimc_capture.o vimc_common.o vimc-debayer.o \
-			    vimc_scaler.o vimc_sensor.o vimc_streamer.o
+obj-$(CONFIG_VIDEO_VIMC) += vimc.o vimc-capture.o vimc-debayer.o \
+                vimc-scaler.o vimc-sensor.o
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index f4d2073076ed..03016f204d05 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -377,7 +377,3 @@ void vimc_ent_sd_unregister(struct vimc_ent_device *ved, struct v4l2_subdev *sd)
 	v4l2_device_unregister_subdev(sd);
 }
 EXPORT_SYMBOL_GPL(vimc_ent_sd_unregister);
-
-MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Common");
-MODULE_AUTHOR("Helen Koike <helen.fornazier@gmail.com>");
-MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index 26b674259489..236ade38f1da 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -188,7 +188,3 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(vimc_streamer_s_stream);
-
-MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Streamer");
-MODULE_AUTHOR("Lucas A. M. Magalhães <lucmaga@gmail.com>");
-MODULE_LICENSE("GPL");
-- 
2.22.0

