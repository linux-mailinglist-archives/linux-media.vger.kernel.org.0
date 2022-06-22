Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06A8C5548E6
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351641AbiFVJby (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354202AbiFVJbw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:31:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234823818C
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:31:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B2D1261A11
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 09:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A64EC34114;
        Wed, 22 Jun 2022 09:31:50 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] vb2/au0828: move the v4l_vb2q_enable_media_source to the au0828 driver
Date:   Wed, 22 Jun 2022 11:31:45 +0200
Message-Id: <20220622093145.927377-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220622093145.927377-1-hverkuil-cisco@xs4all.nl>
References: <20220622093145.927377-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the new prepare_streaming op it is possible to move the ugly
v4l_vb2q_enable_media_source() call in vb2_core_streamon to the
driver. It was called incorrectly in vb2 as well: it was only
called if sufficient buffers were queued at STREAMON time, but not
if more buffers were queued later. This was not an issue with the
au0828 driver since it never set min_buffers_needed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 3 ---
 drivers/media/usb/au0828/au0828-vbi.c           | 2 ++
 drivers/media/usb/au0828/au0828-video.c         | 1 +
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index d4d4b433c0e5..6b4f8cc50a1c 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2121,9 +2121,6 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
 	 * are available.
 	 */
 	if (q->queued_count >= q->min_buffers_needed) {
-		ret = v4l_vb2q_enable_media_source(q);
-		if (ret)
-			goto unprepare;
 		ret = vb2_start_streaming(q);
 		if (ret)
 			goto unprepare;
diff --git a/drivers/media/usb/au0828/au0828-vbi.c b/drivers/media/usb/au0828/au0828-vbi.c
index 97f5e8733c2a..b0333637b747 100644
--- a/drivers/media/usb/au0828/au0828-vbi.c
+++ b/drivers/media/usb/au0828/au0828-vbi.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <media/v4l2-mc.h>
 
 /* ------------------------------------------------------------------ */
 
@@ -70,6 +71,7 @@ const struct vb2_ops au0828_vbi_qops = {
 	.queue_setup     = vbi_queue_setup,
 	.buf_prepare     = vbi_buffer_prepare,
 	.buf_queue       = vbi_buffer_queue,
+	.prepare_streaming = v4l_vb2q_enable_media_source,
 	.start_streaming = au0828_start_analog_streaming,
 	.stop_streaming  = au0828_stop_vbi_streaming,
 	.wait_prepare    = vb2_ops_wait_prepare,
diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index c0f118563c7d..49678ddf247a 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -915,6 +915,7 @@ static const struct vb2_ops au0828_video_qops = {
 	.queue_setup     = queue_setup,
 	.buf_prepare     = buffer_prepare,
 	.buf_queue       = buffer_queue,
+	.prepare_streaming = v4l_vb2q_enable_media_source,
 	.start_streaming = au0828_start_analog_streaming,
 	.stop_streaming  = au0828_stop_streaming,
 	.wait_prepare    = vb2_ops_wait_prepare,
-- 
2.35.1

