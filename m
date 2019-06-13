Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D50F24389E
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387673AbfFMPHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:07:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54498 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733129AbfFMPHP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:07:15 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:d719:d9b5:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7F63628389F;
        Thu, 13 Jun 2019 16:07:10 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, lkcamp@lists.libreplanetbr.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 3/4] media: vimc: stream: add missing function documentation
Date:   Thu, 13 Jun 2019 12:06:15 -0300
Message-Id: <20190613150616.19336-4-andrealmeid@collabora.com>
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

Add comments at vimc_streamer_s_stream and vimc_streamer_thread, making
the vimc-stream totally documented.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 drivers/media/platform/vimc/vimc-streamer.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index 236ade38f1da..8556cc6e8654 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -122,6 +122,14 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 	return -EINVAL;
 }
 
+/*
+ * vimc_streamer_thread - process frames through the pipeline
+ *
+ * @data:	vimc_stream struct of the current streaming
+ *
+ * From the source to the sink, gets a frame from each subdevice and send to
+ * the next one of the pipeline in a fixed framerate.
+ */
 static int vimc_streamer_thread(void *data)
 {
 	struct vimc_stream *stream = data;
@@ -149,6 +157,20 @@ static int vimc_streamer_thread(void *data)
 	return 0;
 }
 
+/*
+ * vimc_streamer_s_stream - start/stop the streaming on the media pipeline
+ *
+ * @stream:	the pointer to the stream structure of the current stream
+ * @ved:	pointer to the vimc entity of the entity of the stream
+ * @enable:	flag to determine if stream should start/stop
+ *
+ * When starting, checks if there's no stream->kthread allocated. This should
+ * indicates that a streaming is already running. Then, it's initialize
+ * the pipeline, create and run a kthread to consume buffers through the
+ * pipeline.
+ * When stopping, analogously check's it there's a streaming running, stops
+ * the thread and terminate the pipeline.
+ */
 int vimc_streamer_s_stream(struct vimc_stream *stream,
 			   struct vimc_ent_device *ved,
 			   int enable)
-- 
2.22.0

