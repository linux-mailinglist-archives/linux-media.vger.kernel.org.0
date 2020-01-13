Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F71013997D
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 20:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgAMTAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 14:00:08 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51232 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbgAMTAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 14:00:08 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 41D4028DE7D
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH] media: vimc: streamer: fix memory leak in vimc subdevs if kthread_run fails
Date:   Mon, 13 Jan 2020 20:59:33 +0200
Message-Id: <20200113185934.15722-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case kthread_run fails, the vimc subdevices
should be notified that streaming stopped so they can
release the memory for the streaming. Also, kthread should be
set to NULL.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-streamer.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index 5c5d3c068398..47a7470e581e 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -207,8 +207,13 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 		stream->kthread = kthread_run(vimc_streamer_thread, stream,
 					      "vimc-streamer thread");
 
-		if (IS_ERR(stream->kthread))
-			return PTR_ERR(stream->kthread);
+		if (IS_ERR(stream->kthread)) {
+			ret = PTR_ERR(stream->kthread);
+			dev_err(ved->dev, "kthread_run failed with %d\n", ret);
+			vimc_streamer_pipeline_terminate(stream);
+			stream->kthread = NULL;
+			return ret;
+		}
 
 	} else {
 		if (!stream->kthread)
-- 
2.17.1

