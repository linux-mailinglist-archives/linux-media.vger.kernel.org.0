Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8896DFFF0
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 10:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388494AbfJVIqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 04:46:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45832 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388474AbfJVIqe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 04:46:34 -0400
Received: from localhost.localdomain (2a02-8429-8174-0401-9a7f-8789-6b2c-098e.rev.sfr.net [IPv6:2a02:8429:8174:401:9a7f:8789:6b2c:98e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 24FF2261098;
        Tue, 22 Oct 2019 09:46:33 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH 1/2] media: vimc: remove EXPORT_SYMBOL_GPL declarations
Date:   Tue, 22 Oct 2019 10:46:07 +0200
Message-Id: <20191022084608.18939-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022084608.18939-1-dafna.hirschfeld@collabora.com>
References: <20191022084608.18939-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vimc is a single kernel module and does not need to
export any symbols therefore there is no need for these
declarations.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-common.c   | 8 --------
 drivers/media/platform/vimc/vimc-streamer.c | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index a3120f4f7a90..5069f0b10ea5 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -171,7 +171,6 @@ const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i)
 
 	return &vimc_pix_map_list[i];
 }
-EXPORT_SYMBOL_GPL(vimc_pix_map_by_index);
 
 const struct vimc_pix_map *vimc_pix_map_by_code(u32 code)
 {
@@ -183,7 +182,6 @@ const struct vimc_pix_map *vimc_pix_map_by_code(u32 code)
 	}
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(vimc_pix_map_by_code);
 
 const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat)
 {
@@ -195,7 +193,6 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat)
 	}
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(vimc_pix_map_by_pixelformat);
 
 /* Helper function to allocate and initialize pads */
 struct media_pad *vimc_pads_init(u16 num_pads, const unsigned long *pads_flag)
@@ -216,7 +213,6 @@ struct media_pad *vimc_pads_init(u16 num_pads, const unsigned long *pads_flag)
 
 	return pads;
 }
-EXPORT_SYMBOL_GPL(vimc_pads_init);
 
 int vimc_pipeline_s_stream(struct media_entity *ent, int enable)
 {
@@ -245,7 +241,6 @@ int vimc_pipeline_s_stream(struct media_entity *ent, int enable)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(vimc_pipeline_s_stream);
 
 static int vimc_get_mbus_format(struct media_pad *pad,
 				struct v4l2_subdev_format *fmt)
@@ -357,7 +352,6 @@ int vimc_link_validate(struct media_link *link)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(vimc_link_validate);
 
 static const struct media_entity_operations vimc_ent_sd_mops = {
 	.link_validate = vimc_link_validate,
@@ -419,11 +413,9 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 	vimc_pads_cleanup(ved->pads);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(vimc_ent_sd_register);
 
 void vimc_ent_sd_unregister(struct vimc_ent_device *ved, struct v4l2_subdev *sd)
 {
 	media_entity_cleanup(ved->ent);
 	v4l2_device_unregister_subdev(sd);
 }
-EXPORT_SYMBOL_GPL(vimc_ent_sd_unregister);
diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index faa2879c25df..092833623ac1 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -216,4 +216,3 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(vimc_streamer_s_stream);
-- 
2.20.1

