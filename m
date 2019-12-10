Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C10F2118A38
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 14:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfLJN7B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 08:59:01 -0500
Received: from mx2.suse.de ([195.135.220.15]:51544 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727131AbfLJN7B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 08:59:01 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E43C4AC9F;
        Tue, 10 Dec 2019 13:58:59 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH for-5.6 02/14] media: tw686x: Use managed buffer allocation
Date:   Tue, 10 Dec 2019 14:58:37 +0100
Message-Id: <20191210135849.15607-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clean up the driver with the new managed buffer allocation API.
The hw_params and hw_free callbacks became superfluous and dropped.

Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/tw686x/tw686x-audio.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-audio.c b/drivers/media/pci/tw686x/tw686x-audio.c
index 7786e51d19ae..f5065c72bb28 100644
--- a/drivers/media/pci/tw686x/tw686x-audio.c
+++ b/drivers/media/pci/tw686x/tw686x-audio.c
@@ -78,17 +78,6 @@ void tw686x_audio_irq(struct tw686x_dev *dev, unsigned long requests,
 	}
 }
 
-static int tw686x_pcm_hw_params(struct snd_pcm_substream *ss,
-				struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(ss, params_buffer_bytes(hw_params));
-}
-
-static int tw686x_pcm_hw_free(struct snd_pcm_substream *ss)
-{
-	return snd_pcm_lib_free_pages(ss);
-}
-
 /*
  * Audio parameters are global and shared among all
  * capture channels. The driver prevents changes to
@@ -270,8 +259,6 @@ static const struct snd_pcm_ops tw686x_pcm_ops = {
 	.open = tw686x_pcm_open,
 	.close = tw686x_pcm_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = tw686x_pcm_hw_params,
-	.hw_free = tw686x_pcm_hw_free,
 	.prepare = tw686x_pcm_prepare,
 	.trigger = tw686x_pcm_trigger,
 	.pointer = tw686x_pcm_pointer,
@@ -298,7 +285,7 @@ static int tw686x_snd_pcm_init(struct tw686x_dev *dev)
 	     ss; ss = ss->next, i++)
 		snprintf(ss->name, sizeof(ss->name), "vch%u audio", i);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm,
+	snd_pcm_set_managed_buffer_all(pcm,
 				SNDRV_DMA_TYPE_DEV,
 				&dev->pci_dev->dev,
 				TW686X_AUDIO_PAGE_MAX * AUDIO_DMA_SIZE_MAX,
-- 
2.16.4

