Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B98118A3D
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 14:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbfLJN7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 08:59:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:51726 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727380AbfLJN7E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 08:59:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 18DD7B157;
        Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH for-5.6 10/14] media: tm6000: Clean up ALSA PCM API usages
Date:   Tue, 10 Dec 2019 14:58:45 +0100
Message-Id: <20191210135849.15607-11-tiwai@suse.de>
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

Also, snd_tm6000_capture_free() is dropped since the check of
stream_started flag makes no sense; hw_free callback is guaranteed to
be called after the stream gets stopped.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/usb/tm6000/tm6000-alsa.c | 81 +---------------------------------
 1 file changed, 1 insertion(+), 80 deletions(-)

diff --git a/drivers/media/usb/tm6000/tm6000-alsa.c b/drivers/media/usb/tm6000/tm6000-alsa.c
index d6c79c13b332..2bfa5abc1b49 100644
--- a/drivers/media/usb/tm6000/tm6000-alsa.c
+++ b/drivers/media/usb/tm6000/tm6000-alsa.c
@@ -10,7 +10,6 @@
 #include <linux/interrupt.h>
 #include <linux/usb.h>
 #include <linux/slab.h>
-#include <linux/vmalloc.h>
 
 #include <linux/delay.h>
 #include <sound/core.h>
@@ -94,40 +93,6 @@ static int _tm6000_stop_audio_dma(struct snd_tm6000_card *chip)
 	return 0;
 }
 
-static void dsp_buffer_free(struct snd_pcm_substream *substream)
-{
-	struct snd_tm6000_card *chip = snd_pcm_substream_chip(substream);
-
-	dprintk(2, "Freeing buffer\n");
-
-	vfree(substream->runtime->dma_area);
-	substream->runtime->dma_area = NULL;
-	substream->runtime->dma_bytes = 0;
-}
-
-static int dsp_buffer_alloc(struct snd_pcm_substream *substream, int size)
-{
-	struct snd_tm6000_card *chip = snd_pcm_substream_chip(substream);
-
-	dprintk(2, "Allocating buffer\n");
-
-	if (substream->runtime->dma_area) {
-		if (substream->runtime->dma_bytes > size)
-			return 0;
-
-		dsp_buffer_free(substream);
-	}
-
-	substream->runtime->dma_area = vmalloc(size);
-	if (!substream->runtime->dma_area)
-		return -ENOMEM;
-
-	substream->runtime->dma_bytes = size;
-
-	return 0;
-}
-
-
 /****************************************************************************
 				ALSA PCM Interface
  ****************************************************************************/
@@ -268,40 +233,6 @@ static int tm6000_fillbuf(struct tm6000_core *core, char *buf, int size)
 	return 0;
 }
 
-/*
- * hw_params callback
- */
-static int snd_tm6000_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *hw_params)
-{
-	int size, rc;
-
-	size = params_period_bytes(hw_params) * params_periods(hw_params);
-
-	rc = dsp_buffer_alloc(substream, size);
-	if (rc < 0)
-		return rc;
-
-	return 0;
-}
-
-/*
- * hw free callback
- */
-static int snd_tm6000_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_tm6000_card *chip = snd_pcm_substream_chip(substream);
-	struct tm6000_core *core = chip->core;
-
-	if (atomic_read(&core->stream_started) > 0) {
-		atomic_set(&core->stream_started, 0);
-		schedule_work(&core->wq_trigger);
-	}
-
-	dsp_buffer_free(substream);
-	return 0;
-}
-
 /*
  * prepare callback
  */
@@ -369,14 +300,6 @@ static snd_pcm_uframes_t snd_tm6000_pointer(struct snd_pcm_substream *substream)
 	return chip->buf_pos;
 }
 
-static struct page *snd_pcm_get_vmalloc_page(struct snd_pcm_substream *subs,
-					     unsigned long offset)
-{
-	void *pageptr = subs->runtime->dma_area + offset;
-
-	return vmalloc_to_page(pageptr);
-}
-
 /*
  * operators
  */
@@ -384,12 +307,9 @@ static const struct snd_pcm_ops snd_tm6000_pcm_ops = {
 	.open = snd_tm6000_pcm_open,
 	.close = snd_tm6000_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = snd_tm6000_hw_params,
-	.hw_free = snd_tm6000_hw_free,
 	.prepare = snd_tm6000_prepare,
 	.trigger = snd_tm6000_card_trigger,
 	.pointer = snd_tm6000_pointer,
-	.page = snd_pcm_get_vmalloc_page,
 };
 
 /*
@@ -459,6 +379,7 @@ static int tm6000_audio_init(struct tm6000_core *dev)
 	strscpy(pcm->name, "Trident TM5600/60x0", sizeof(pcm->name));
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_tm6000_pcm_ops);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	INIT_WORK(&dev->wq_trigger, audio_trigger);
 	rc = snd_card_register(card);
-- 
2.16.4

