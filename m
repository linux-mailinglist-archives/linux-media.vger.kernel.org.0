Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2C822114
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 03:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbfERBH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 21:07:57 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:16505 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726200AbfERBH5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 21:07:57 -0400
X-Halon-ID: 5cb8cb74-7909-11e9-8d05-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 5cb8cb74-7909-11e9-8d05-005056917f90;
        Sat, 18 May 2019 03:07:53 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     libcamera-devel@lists.libcamera.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH 2/3] vimc: Serialize vimc_streamer_s_stream()
Date:   Sat, 18 May 2019 03:07:43 +0200
Message-Id: <20190518010744.15195-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prepare for multiple video streams from the same sensor by serializing
vimc_streamer_s_stream(). Multiple streams will allow for multiple
concurrent calls to this function that could involve the same
subdevices.

If that happens the internal state of the involved subdevices could go
out of sync as they are being started and stopped at the same time,
prevent this by serializing starting and stopping of the vimc streamer.

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
 drivers/media/platform/vimc/vimc-streamer.c | 23 ++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index 26b6742594890b16..514690dca3b1187b 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -153,39 +153,48 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 			   struct vimc_ent_device *ved,
 			   int enable)
 {
+	static DEFINE_MUTEX(vimc_streamer_lock);
 	int ret;
 
 	if (!stream || !ved)
 		return -EINVAL;
 
+	ret = mutex_lock_interruptible(&vimc_streamer_lock);
+	if (ret)
+		return ret;
+
 	if (enable) {
 		if (stream->kthread)
-			return 0;
+			goto out;
 
 		ret = vimc_streamer_pipeline_init(stream, ved);
 		if (ret)
-			return ret;
+			goto out;
 
 		stream->kthread = kthread_run(vimc_streamer_thread, stream,
 					      "vimc-streamer thread");
 
-		if (IS_ERR(stream->kthread))
-			return PTR_ERR(stream->kthread);
+		if (IS_ERR(stream->kthread)) {
+			ret = PTR_ERR(stream->kthread);
+			goto out;
+		}
 
 	} else {
 		if (!stream->kthread)
-			return 0;
+			goto out;
 
 		ret = kthread_stop(stream->kthread);
 		if (ret)
-			return ret;
+			goto out;
 
 		stream->kthread = NULL;
 
 		vimc_streamer_pipeline_terminate(stream);
 	}
+out:
+	mutex_unlock(&vimc_streamer_lock);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(vimc_streamer_s_stream);
 
-- 
2.21.0

