Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3874450AE0
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 14:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbfFXMjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 08:39:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48230 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfFXMjo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 08:39:44 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:d719:dd85:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3800A260ED4;
        Mon, 24 Jun 2019 13:39:39 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH v2 3/5] media: vimc: stream: format comments as kernel-doc
Date:   Mon, 24 Jun 2019 09:37:27 -0300
Message-Id: <20190624123729.5847-3-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624123729.5847-1-andrealmeid@collabora.com>
References: <20190624123729.5847-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Format the current existing comments as kernel-doc comments, to be
reused at kernel documention. Add opening marks (/**) and return values.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---

Changes in v2: replace ``vimc_streamer_s_stream`` for
vimc_streamer_s_stream().

 drivers/media/platform/vimc/vimc-streamer.c | 38 +++++++++++++--------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index 3b3f36357a0e..62dde7d74c24 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -20,6 +20,8 @@
  *
  * Helper function that returns the media entity containing the source pad
  * linked with the first sink pad from the given media entity pad list.
+ *
+ * Return: The source pad or NULL, if it wasn't found.
  */
 static struct media_entity *vimc_get_source_entity(struct media_entity *ent)
 {
@@ -35,7 +37,7 @@ static struct media_entity *vimc_get_source_entity(struct media_entity *ent)
 	return NULL;
 }
 
-/*
+/**
  * vimc_streamer_pipeline_terminate - Disable stream in all ved in stream
  *
  * @stream: the pointer to the stream structure with the pipeline to be
@@ -63,15 +65,18 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
 	}
 }
 
-/*
- * vimc_streamer_pipeline_init - initializes the stream structure
+/**
+ * vimc_streamer_pipeline_init - Initializes the stream structure
  *
  * @stream: the pointer to the stream structure to be initialized
  * @ved:    the pointer to the vimc entity initializing the stream
  *
  * Initializes the stream structure. Walks through the entity graph to
  * construct the pipeline used later on the streamer thread.
- * Calls s_stream to enable stream in all entities of the pipeline.
+ * Calls vimc_streamer_s_stream() to enable stream in all entities of
+ * the pipeline.
+ *
+ * Return: 0 if success, error code otherwise.
  */
 static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 				       struct vimc_ent_device *ved)
@@ -122,13 +127,17 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 	return -EINVAL;
 }
 
-/*
- * vimc_streamer_thread - process frames through the pipeline
+/**
+ * vimc_streamer_thread - Process frames through the pipeline
  *
  * @data:	vimc_stream struct of the current stream
  *
  * From the source to the sink, gets a frame from each subdevice and send to
  * the next one of the pipeline at a fixed framerate.
+ *
+ * Return:
+ * Always zero (created as ``int`` instead of ``void`` to comply with
+ * kthread API).
  */
 static int vimc_streamer_thread(void *data)
 {
@@ -157,19 +166,20 @@ static int vimc_streamer_thread(void *data)
 	return 0;
 }
 
-/*
- * vimc_streamer_s_stream - start/stop the streaming on the media pipeline
+/**
+ * vimc_streamer_s_stream - Start/stop the streaming on the media pipeline
  *
  * @stream:	the pointer to the stream structure of the current stream
  * @ved:	pointer to the vimc entity of the entity of the stream
  * @enable:	flag to determine if stream should start/stop
  *
- * When starting, check if there is no stream->kthread allocated. This should
- * indicate that a stream is already running. Then, it initializes
- * the pipeline, creates and runs a kthread to consume buffers through the
- * pipeline.
- * When stopping, analogously check if there is a stream running, stop
- * the thread and terminates the pipeline.
+ * When starting, check if there is no ``stream->kthread`` allocated. This
+ * should indicate that a stream is already running. Then, it initializes the
+ * pipeline, creates and runs a kthread to consume buffers through the pipeline.
+ * When stopping, analogously check if there is a stream running, stop the
+ * thread and terminates the pipeline.
+ *
+ * Return: 0 if success, error code otherwise.
  */
 int vimc_streamer_s_stream(struct vimc_stream *stream,
 			   struct vimc_ent_device *ved,
-- 
2.22.0

