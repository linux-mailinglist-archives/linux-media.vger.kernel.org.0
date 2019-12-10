Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D508118A40
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 14:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfLJN7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 08:59:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:51762 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727421AbfLJN7E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 08:59:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 18955AFFE;
        Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH for-5.6 09/14] media: go7007: Clean up ALSA PCM API usages
Date:   Tue, 10 Dec 2019 14:58:44 +0100
Message-Id: <20191210135849.15607-10-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the recent change in ALSA PCM core, the whole open-coded vmalloc
buffer handling in this driver can be dropped by replacing with the
managed buffer allocation.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/usb/go7007/snd-go7007.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/go7007/snd-go7007.c b/drivers/media/usb/go7007/snd-go7007.c
index b05fa227ffb2..40dbf081ef6b 100644
--- a/drivers/media/usb/go7007/snd-go7007.c
+++ b/drivers/media/usb/go7007/snd-go7007.c
@@ -9,7 +9,6 @@
 #include <linux/spinlock.h>
 #include <linux/delay.h>
 #include <linux/sched.h>
-#include <linux/vmalloc.h>
 #include <linux/time.h>
 #include <linux/mm.h>
 #include <linux/i2c.h>
@@ -100,16 +99,7 @@ static int go7007_snd_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *hw_params)
 {
 	struct go7007 *go = snd_pcm_substream_chip(substream);
-	unsigned int bytes;
-
-	bytes = params_buffer_bytes(hw_params);
-	if (substream->runtime->dma_bytes > 0)
-		vfree(substream->runtime->dma_area);
-	substream->runtime->dma_bytes = 0;
-	substream->runtime->dma_area = vmalloc(bytes);
-	if (substream->runtime->dma_area == NULL)
-		return -ENOMEM;
-	substream->runtime->dma_bytes = bytes;
+
 	go->audio_deliver = parse_audio_stream_data;
 	return 0;
 }
@@ -119,9 +109,6 @@ static int go7007_snd_hw_free(struct snd_pcm_substream *substream)
 	struct go7007 *go = snd_pcm_substream_chip(substream);
 
 	go->audio_deliver = NULL;
-	if (substream->runtime->dma_bytes > 0)
-		vfree(substream->runtime->dma_area);
-	substream->runtime->dma_bytes = 0;
 	return 0;
 }
 
@@ -185,12 +172,6 @@ static snd_pcm_uframes_t go7007_snd_pcm_pointer(struct snd_pcm_substream *substr
 	return gosnd->hw_ptr;
 }
 
-static struct page *go7007_snd_pcm_page(struct snd_pcm_substream *substream,
-					unsigned long offset)
-{
-	return vmalloc_to_page(substream->runtime->dma_area + offset);
-}
-
 static const struct snd_pcm_ops go7007_snd_capture_ops = {
 	.open		= go7007_snd_capture_open,
 	.close		= go7007_snd_capture_close,
@@ -200,7 +181,6 @@ static const struct snd_pcm_ops go7007_snd_capture_ops = {
 	.prepare	= go7007_snd_pcm_prepare,
 	.trigger	= go7007_snd_pcm_trigger,
 	.pointer	= go7007_snd_pcm_pointer,
-	.page		= go7007_snd_pcm_page,
 };
 
 static int go7007_snd_free(struct snd_device *device)
@@ -260,6 +240,8 @@ int go7007_snd_init(struct go7007 *go)
 	gosnd->pcm->private_data = go;
 	snd_pcm_set_ops(gosnd->pcm, SNDRV_PCM_STREAM_CAPTURE,
 			&go7007_snd_capture_ops);
+	snd_pcm_set_managed_buffer_all(gosnd->pcm, SNDRV_DMA_TYPE_VMALLOC,
+				       NULL, 0, 0);
 
 	ret = snd_card_register(gosnd->card);
 	if (ret < 0) {
-- 
2.16.4

