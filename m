Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A852C118A3F
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 14:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbfLJN7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 08:59:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:51708 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727159AbfLJN7E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 08:59:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 09EBAAEEC;
        Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH for-5.6 05/14] media: cx18: Clean up ALSA PCM API usages
Date:   Tue, 10 Dec 2019 14:58:40 +0100
Message-Id: <20191210135849.15607-6-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the recent	change in ALSA PCM core, the whole open-coded vmalloc
buffer handling	in this	driver can be dropped by replacing with	the
managed buffer allocation.

Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/cx18/cx18-alsa-pcm.c | 62 +---------------------------------
 1 file changed, 1 insertion(+), 61 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-alsa-pcm.c b/drivers/media/pci/cx18/cx18-alsa-pcm.c
index 13f858c41836..7dec5ce20eb7 100644
--- a/drivers/media/pci/cx18/cx18-alsa-pcm.c
+++ b/drivers/media/pci/cx18/cx18-alsa-pcm.c
@@ -11,7 +11,6 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/vmalloc.h>
 
 #include <media/v4l2-device.h>
 
@@ -213,55 +212,6 @@ static int snd_cx18_pcm_ioctl(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-
-static int snd_pcm_alloc_vmalloc_buffer(struct snd_pcm_substream *subs,
-					size_t size)
-{
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
-static int snd_cx18_pcm_hw_params(struct snd_pcm_substream *substream,
-			 struct snd_pcm_hw_params *params)
-{
-	dprintk("%s called\n", __func__);
-
-	return snd_pcm_alloc_vmalloc_buffer(substream,
-					   params_buffer_bytes(params));
-}
-
-static int snd_cx18_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_cx18_card *cxsc = snd_pcm_substream_chip(substream);
-	unsigned long flags;
-	unsigned char *dma_area = NULL;
-
-	spin_lock_irqsave(&cxsc->slock, flags);
-	if (substream->runtime->dma_area) {
-		dprintk("freeing pcm capture region\n");
-		dma_area = substream->runtime->dma_area;
-		substream->runtime->dma_area = NULL;
-	}
-	spin_unlock_irqrestore(&cxsc->slock, flags);
-	vfree(dma_area);
-
-	return 0;
-}
-
 static int snd_cx18_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_cx18_card *cxsc = snd_pcm_substream_chip(substream);
@@ -291,24 +241,13 @@ snd_pcm_uframes_t snd_cx18_pcm_pointer(struct snd_pcm_substream *substream)
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
 static const struct snd_pcm_ops snd_cx18_pcm_capture_ops = {
 	.open		= snd_cx18_pcm_capture_open,
 	.close		= snd_cx18_pcm_capture_close,
 	.ioctl		= snd_cx18_pcm_ioctl,
-	.hw_params	= snd_cx18_pcm_hw_params,
-	.hw_free	= snd_cx18_pcm_hw_free,
 	.prepare	= snd_cx18_pcm_prepare,
 	.trigger	= snd_cx18_pcm_trigger,
 	.pointer	= snd_cx18_pcm_pointer,
-	.page		= snd_pcm_get_vmalloc_page,
 };
 
 int snd_cx18_pcm_create(struct snd_cx18_card *cxsc)
@@ -334,6 +273,7 @@ int snd_cx18_pcm_create(struct snd_cx18_card *cxsc)
 
 	snd_pcm_set_ops(sp, SNDRV_PCM_STREAM_CAPTURE,
 			&snd_cx18_pcm_capture_ops);
+	snd_pcm_set_managed_buffer_all(sp, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 	sp->info_flags = 0;
 	sp->private_data = cxsc;
 	strscpy(sp->name, cx->card_name, sizeof(sp->name));
-- 
2.16.4

