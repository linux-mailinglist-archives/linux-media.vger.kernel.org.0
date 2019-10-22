Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 662B5DFFF1
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 10:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388507AbfJVIqg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 04:46:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45840 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388474AbfJVIqf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 04:46:35 -0400
Received: from localhost.localdomain (2a02-8429-8174-0401-9a7f-8789-6b2c-098e.rev.sfr.net [IPv6:2a02:8429:8174:401:9a7f:8789:6b2c:98e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9DE5C283BAC;
        Tue, 22 Oct 2019 09:46:34 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH 2/2] media: vimc: common: remove unused function 'vimc_pipeline_s_stream'
Date:   Tue, 22 Oct 2019 10:46:08 +0200
Message-Id: <20191022084608.18939-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022084608.18939-1-dafna.hirschfeld@collabora.com>
References: <20191022084608.18939-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function 'vimc_pipeline_s_stream' is not used and can be
removed.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-common.c | 28 -----------------------
 drivers/media/platform/vimc/vimc-common.h | 11 ---------
 2 files changed, 39 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index 5069f0b10ea5..54944ebb40e2 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -214,34 +214,6 @@ struct media_pad *vimc_pads_init(u16 num_pads, const unsigned long *pads_flag)
 	return pads;
 }
 
-int vimc_pipeline_s_stream(struct media_entity *ent, int enable)
-{
-	struct v4l2_subdev *sd;
-	struct media_pad *pad;
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < ent->num_pads; i++) {
-		if (ent->pads[i].flags & MEDIA_PAD_FL_SOURCE)
-			continue;
-
-		/* Start the stream in the subdevice direct connected */
-		pad = media_entity_remote_pad(&ent->pads[i]);
-		if (!pad)
-			continue;
-
-		if (!is_media_entity_v4l2_subdev(pad->entity))
-			return -EINVAL;
-
-		sd = media_entity_to_v4l2_subdev(pad->entity);
-		ret = v4l2_subdev_call(sd, video, s_stream, enable);
-		if (ret && ret != -ENOIOCTLCMD)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int vimc_get_mbus_format(struct media_pad *pad,
 				struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 698db7c07645..3a29202db75b 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -192,17 +192,6 @@ static inline void vimc_pads_cleanup(struct media_pad *pads)
 	kfree(pads);
 }
 
-/**
- * vimc_pipeline_s_stream - start stream through the pipeline
- *
- * @ent:		the pointer to struct media_entity for the node
- * @enable:		1 to start the stream and 0 to stop
- *
- * Helper function to call the s_stream of the subdevices connected
- * in all the sink pads of the entity
- */
-int vimc_pipeline_s_stream(struct media_entity *ent, int enable);
-
 /**
  * vimc_pix_map_by_index - get vimc_pix_map struct by its index
  *
-- 
2.20.1

