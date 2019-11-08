Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D71B4F5140
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 17:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfKHQgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 11:36:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:37106 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726049AbfKHQgw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 11:36:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5DDD4B3DF;
        Fri,  8 Nov 2019 16:36:51 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 1/2] media: solo6x10: Remove superfluous snd_dma_continuous_data()
Date:   Fri,  8 Nov 2019 17:36:48 +0100
Message-Id: <20191108163649.32590-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191108163649.32590-1-tiwai@suse.de>
References: <20191108163649.32590-1-tiwai@suse.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The recent change (commit 08422d2c559d: "ALSA: memalloc: Allow NULL
device for SNDRV_DMA_TYPE_CONTINOUS type") made the PCM preallocation
helper accepting NULL as the device pointer for the default usage.
Drop the snd_dma_continuous_data() usage that became superfluous from
the callers.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/solo6x10/solo6x10-g723.c | 2 +-
 drivers/media/usb/usbtv/usbtv-audio.c      | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
index 30c8f2ec9c3c..eaa57d835ea8 100644
--- a/drivers/media/pci/solo6x10/solo6x10-g723.c
+++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
@@ -353,7 +353,7 @@ static int solo_snd_pcm_init(struct solo_dev *solo_dev)
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm,
 					SNDRV_DMA_TYPE_CONTINUOUS,
-					snd_dma_continuous_data(GFP_KERNEL),
+					NULL,
 					G723_PERIOD_BYTES * PERIODS,
 					G723_PERIOD_BYTES * PERIODS);
 
diff --git a/drivers/media/usb/usbtv/usbtv-audio.c b/drivers/media/usb/usbtv/usbtv-audio.c
index 6f108996142d..e746c8ddfc49 100644
--- a/drivers/media/usb/usbtv/usbtv-audio.c
+++ b/drivers/media/usb/usbtv/usbtv-audio.c
@@ -378,8 +378,7 @@ int usbtv_audio_init(struct usbtv *usbtv)
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_usbtv_pcm_ops);
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-		snd_dma_continuous_data(GFP_KERNEL), USBTV_AUDIO_BUFFER,
-		USBTV_AUDIO_BUFFER);
+		NULL, USBTV_AUDIO_BUFFER, USBTV_AUDIO_BUFFER);
 
 	rv = snd_card_register(card);
 	if (rv)
-- 
2.16.4

