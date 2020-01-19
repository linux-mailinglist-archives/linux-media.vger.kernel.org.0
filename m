Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C9C141DCC
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2020 13:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgASMer (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jan 2020 07:34:47 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56006 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgASMer (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jan 2020 07:34:47 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C33F028A2DB
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v4] media: vimc: streamer: if kthread_stop fails, ignore the error
Date:   Sun, 19 Jan 2020 14:34:34 +0200
Message-Id: <20200119123434.17567-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ignore errors returned from kthread_stop since the
vimc subdevices should still be notified that
streaming stopped so they can release the memory for
the streaming, and also kthread should be set to NULL.
kthread_stop can return -EINTR in case the thread
did not yet run. This can happen if userspace calls
streamon and streamoff right after.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
Changes from v3: change the comment to explain when kthread fails

 drivers/media/platform/vimc/vimc-streamer.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index cd6b55433c9e..26ec81b265c4 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -215,9 +215,15 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 			return 0;
 
 		ret = kthread_stop(stream->kthread);
-		if (ret)
-			return ret;
 
+		/*
+		 * kthread_stop returns -EINTR in cases when streamon was
+		 * immediately followed by streamoff, and the thread didn't had
+		 * a chance to run. Ignore errors to stop the stream in the
+		 * pipeline.
+		 */
+		if (ret)
+			dev_warn(ved->dev, "kthread_stop returned '%d'\n", ret);
 		stream->kthread = NULL;
 
 		vimc_streamer_pipeline_terminate(stream);
-- 
2.17.1

