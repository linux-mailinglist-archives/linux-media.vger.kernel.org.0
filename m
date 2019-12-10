Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7306E118A42
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 14:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbfLJN7J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 08:59:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:51722 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727349AbfLJN7D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 08:59:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 158C0AFB1;
        Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH for-5.6 07/14] media: cs231xx: Clean up ALSA PCM API usages
Date:   Tue, 10 Dec 2019 14:58:42 +0100
Message-Id: <20191210135849.15607-8-tiwai@suse.de>
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

Also, snd_cx231xx_hw_capture_free() is dropped since the check of
stream_started flag makes no sense; hw_free callback is guaranteed to
be called after the stream gets stopped.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/usb/cx231xx/cx231xx-audio.c | 78 +------------------------------
 1 file changed, 1 insertion(+), 77 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-audio.c b/drivers/media/usb/cx231xx/cx231xx-audio.c
index fd6e2df3d1b7..d46efea53370 100644
--- a/drivers/media/usb/cx231xx/cx231xx-audio.c
+++ b/drivers/media/usb/cx231xx/cx231xx-audio.c
@@ -13,7 +13,6 @@
 #include <linux/spinlock.h>
 #include <linux/soundcard.h>
 #include <linux/slab.h>
-#include <linux/vmalloc.h>
 #include <linux/module.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -372,28 +371,6 @@ static int cx231xx_init_audio_bulk(struct cx231xx *dev)
 	return errCode;
 }
 
-static int snd_pcm_alloc_vmalloc_buffer(struct snd_pcm_substream *subs,
-					size_t size)
-{
-	struct snd_pcm_runtime *runtime = subs->runtime;
-	struct cx231xx *dev = snd_pcm_substream_chip(subs);
-
-	dev_dbg(dev->dev, "Allocating vbuffer\n");
-	if (runtime->dma_area) {
-		if (runtime->dma_bytes > size)
-			return 0;
-
-		vfree(runtime->dma_area);
-	}
-	runtime->dma_area = vmalloc(size);
-	if (!runtime->dma_area)
-		return -ENOMEM;
-
-	runtime->dma_bytes = size;
-
-	return 0;
-}
-
 static const struct snd_pcm_hardware snd_cx231xx_hw_capture = {
 	.info = SNDRV_PCM_INFO_BLOCK_TRANSFER	|
 	    SNDRV_PCM_INFO_MMAP			|
@@ -484,11 +461,6 @@ static int snd_cx231xx_pcm_close(struct snd_pcm_substream *substream)
 	}
 
 	dev->adev.users--;
-	if (substream->runtime->dma_area) {
-		dev_dbg(dev->dev, "freeing\n");
-		vfree(substream->runtime->dma_area);
-		substream->runtime->dma_area = NULL;
-	}
 	mutex_unlock(&dev->lock);
 
 	if (dev->adev.users == 0 && dev->adev.shutdown == 1) {
@@ -504,44 +476,6 @@ static int snd_cx231xx_pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_cx231xx_hw_capture_params(struct snd_pcm_substream *substream,
-					 struct snd_pcm_hw_params *hw_params)
-{
-	struct cx231xx *dev = snd_pcm_substream_chip(substream);
-	int ret;
-
-	dev_dbg(dev->dev, "Setting capture parameters\n");
-
-	ret = snd_pcm_alloc_vmalloc_buffer(substream,
-					   params_buffer_bytes(hw_params));
-#if 0
-	/* TODO: set up cx231xx audio chip to deliver the correct audio format,
-	   current default is 48000hz multiplexed => 96000hz mono
-	   which shouldn't matter since analogue TV only supports mono */
-	unsigned int channels, rate, format;
-
-	format = params_format(hw_params);
-	rate = params_rate(hw_params);
-	channels = params_channels(hw_params);
-#endif
-
-	return ret;
-}
-
-static int snd_cx231xx_hw_capture_free(struct snd_pcm_substream *substream)
-{
-	struct cx231xx *dev = snd_pcm_substream_chip(substream);
-
-	dev_dbg(dev->dev, "Stop capture, if needed\n");
-
-	if (atomic_read(&dev->stream_started) > 0) {
-		atomic_set(&dev->stream_started, 0);
-		schedule_work(&dev->wq_trigger);
-	}
-
-	return 0;
-}
-
 static int snd_cx231xx_prepare(struct snd_pcm_substream *substream)
 {
 	struct cx231xx *dev = snd_pcm_substream_chip(substream);
@@ -614,24 +548,13 @@ static snd_pcm_uframes_t snd_cx231xx_capture_pointer(struct snd_pcm_substream
 	return hwptr_done;
 }
 
-static struct page *snd_pcm_get_vmalloc_page(struct snd_pcm_substream *subs,
-					     unsigned long offset)
-{
-	void *pageptr = subs->runtime->dma_area + offset;
-
-	return vmalloc_to_page(pageptr);
-}
-
 static const struct snd_pcm_ops snd_cx231xx_pcm_capture = {
 	.open = snd_cx231xx_capture_open,
 	.close = snd_cx231xx_pcm_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = snd_cx231xx_hw_capture_params,
-	.hw_free = snd_cx231xx_hw_capture_free,
 	.prepare = snd_cx231xx_prepare,
 	.trigger = snd_cx231xx_capture_trigger,
 	.pointer = snd_cx231xx_capture_pointer,
-	.page = snd_pcm_get_vmalloc_page,
 };
 
 static int cx231xx_audio_init(struct cx231xx *dev)
@@ -666,6 +589,7 @@ static int cx231xx_audio_init(struct cx231xx *dev)
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
 			&snd_cx231xx_pcm_capture);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 	pcm->info_flags = 0;
 	pcm->private_data = dev;
 	strscpy(pcm->name, "Conexant cx231xx Capture", sizeof(pcm->name));
-- 
2.16.4

