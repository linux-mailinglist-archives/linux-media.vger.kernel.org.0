Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4183B1406F1
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 10:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgAQJwM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 04:52:12 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38360 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgAQJwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 04:52:12 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E9EA22946D8
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v3] media: vimc: streamer: if kthread_stop fails, ignore the error
Date:   Fri, 17 Jan 2020 11:50:50 +0200
Message-Id: <20200117095050.9508-1-dafna.hirschfeld@collabora.com>
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
changes since v2: add a comment explaning why we ignore the error

 drivers/media/platform/vimc/vimc-streamer.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index cd6b55433c9e..6a6fa6c21138 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -215,9 +215,13 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 			return 0;
 
 		ret = kthread_stop(stream->kthread);
-		if (ret)
-			return ret;
 
+		/*
+		 * ignore errors from kthread_stop since we have to set kthread
+		 * to NULL and notify the subdevs that the stream stopped anyway
+		 */
+		if (ret)
+			dev_warn(ved->dev, "kthread_stop returned '%d'\n", ret);
 		stream->kthread = NULL;
 
 		vimc_streamer_pipeline_terminate(stream);
-- 
2.17.1

