Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2551D118A45
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 14:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfLJN7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 08:59:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:51706 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727345AbfLJN7D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 08:59:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 14E9BAFA1;
        Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH for-5.6 08/14] media: em28xx: Clean up ALSA PCM API usages
Date:   Tue, 10 Dec 2019 14:58:43 +0100
Message-Id: <20191210135849.15607-9-tiwai@suse.de>
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

Also, snd_em28xx_hw_capture_free() is dropped since the check of
stream_started flag makes no sense; hw_free callback is guaranteed to
be called after the stream gets stopped.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/usb/em28xx/em28xx-audio.c | 86 +--------------------------------
 1 file changed, 1 insertion(+), 85 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-audio.c b/drivers/media/usb/em28xx/em28xx-audio.c
index 79dfbb25714b..a5215fb1d36a 100644
--- a/drivers/media/usb/em28xx/em28xx-audio.c
+++ b/drivers/media/usb/em28xx/em28xx-audio.c
@@ -30,7 +30,6 @@
 #include <linux/spinlock.h>
 #include <linux/soundcard.h>
 #include <linux/slab.h>
-#include <linux/vmalloc.h>
 #include <linux/module.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -192,28 +191,6 @@ static int em28xx_init_audio_isoc(struct em28xx *dev)
 	return 0;
 }
 
-static int snd_pcm_alloc_vmalloc_buffer(struct snd_pcm_substream *subs,
-					size_t size)
-{
-	struct em28xx *dev = snd_pcm_substream_chip(subs);
-	struct snd_pcm_runtime *runtime = subs->runtime;
-
-	dprintk("Allocating vbuffer\n");
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
 static const struct snd_pcm_hardware snd_em28xx_hw_capture = {
 	.info = SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_MMAP           |
@@ -341,63 +318,12 @@ static int snd_em28xx_pcm_close(struct snd_pcm_substream *substream)
 	}
 
 	em28xx_audio_analog_set(dev);
-	if (substream->runtime->dma_area) {
-		dprintk("freeing\n");
-		vfree(substream->runtime->dma_area);
-		substream->runtime->dma_area = NULL;
-	}
 	mutex_unlock(&dev->lock);
 	kref_put(&dev->ref, em28xx_free_device);
 
 	return 0;
 }
 
-static int snd_em28xx_hw_capture_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *hw_params)
-{
-	int ret;
-	struct em28xx *dev = snd_pcm_substream_chip(substream);
-
-	if (dev->disconnected)
-		return -ENODEV;
-
-	dprintk("Setting capture parameters\n");
-
-	ret = snd_pcm_alloc_vmalloc_buffer(substream,
-					   params_buffer_bytes(hw_params));
-	if (ret < 0)
-		return ret;
-#if 0
-	/*
-	 * TODO: set up em28xx audio chip to deliver the correct audio format,
-	 * current default is 48000hz multiplexed => 96000hz mono
-	 * which shouldn't matter since analogue TV only supports mono
-	 */
-	unsigned int channels, rate, format;
-
-	format = params_format(hw_params);
-	rate = params_rate(hw_params);
-	channels = params_channels(hw_params);
-#endif
-
-	return 0;
-}
-
-static int snd_em28xx_hw_capture_free(struct snd_pcm_substream *substream)
-{
-	struct em28xx *dev = snd_pcm_substream_chip(substream);
-	struct em28xx_audio *adev = &dev->adev;
-
-	dprintk("Stop capture, if needed\n");
-
-	if (atomic_read(&adev->stream_started) > 0) {
-		atomic_set(&adev->stream_started, 0);
-		schedule_work(&adev->wq_trigger);
-	}
-
-	return 0;
-}
-
 static int snd_em28xx_prepare(struct snd_pcm_substream *substream)
 {
 	struct em28xx *dev = snd_pcm_substream_chip(substream);
@@ -471,14 +397,6 @@ static snd_pcm_uframes_t snd_em28xx_capture_pointer(struct snd_pcm_substream
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
 /*
  * AC97 volume control support
  */
@@ -709,12 +627,9 @@ static const struct snd_pcm_ops snd_em28xx_pcm_capture = {
 	.open      = snd_em28xx_capture_open,
 	.close     = snd_em28xx_pcm_close,
 	.ioctl     = snd_pcm_lib_ioctl,
-	.hw_params = snd_em28xx_hw_capture_params,
-	.hw_free   = snd_em28xx_hw_capture_free,
 	.prepare   = snd_em28xx_prepare,
 	.trigger   = snd_em28xx_capture_trigger,
 	.pointer   = snd_em28xx_capture_pointer,
-	.page      = snd_pcm_get_vmalloc_page,
 };
 
 static void em28xx_audio_free_urb(struct em28xx *dev)
@@ -936,6 +851,7 @@ static int em28xx_audio_init(struct em28xx *dev)
 		goto card_free;
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_em28xx_pcm_capture);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 	pcm->info_flags = 0;
 	pcm->private_data = dev;
 	strscpy(pcm->name, "Empia 28xx Capture", sizeof(pcm->name));
-- 
2.16.4

