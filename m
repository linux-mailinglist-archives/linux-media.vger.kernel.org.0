Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E51F748406
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfFQNdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:33:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54188 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfFQNdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:33:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id BE267260D66
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH v3 1/2] media: vimc: stream: add missing function documentation
Date:   Mon, 17 Jun 2019 10:32:20 -0300
Message-Id: <20190617133221.21246-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
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
Changes in v3: replace "streaming" by "stream" at vimc_streamer_thread().

Changes in v2: fix typos

 drivers/media/platform/vimc/vimc-streamer.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index 236ade38f1da..1fea6d666c2e 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -122,6 +122,14 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 	return -EINVAL;
 }
 
+/*
+ * vimc_streamer_thread - process frames through the pipeline
+ *
+ * @data:	vimc_stream struct of the current stream
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
+ * When starting, check if there is no stream->kthread allocated. This should
+ * indicate that a streaming is already running. Then, it initializes
+ * the pipeline, creates and runs a kthread to consume buffers through the
+ * pipeline.
+ * When stopping, analogously check if there is a stream running, stops
+ * the thread and terminates the pipeline.
+ */
 int vimc_streamer_s_stream(struct vimc_stream *stream,
 			   struct vimc_ent_device *ved,
 			   int enable)
-- 
2.22.0

