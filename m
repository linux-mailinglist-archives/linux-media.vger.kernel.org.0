Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B578F5141
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 17:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfKHQgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 11:36:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:37114 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726095AbfKHQgw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 11:36:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6A9BAB406;
        Fri,  8 Nov 2019 16:36:51 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 2/2] media: tw686x: audio: Avoid non-standard macro usage
Date:   Fri,  8 Nov 2019 17:36:49 +0100
Message-Id: <20191108163649.32590-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191108163649.32590-1-tiwai@suse.de>
References: <20191108163649.32590-1-tiwai@suse.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pass the device pointer from the PCI pointer directly, instead of a
non-standard macro.  The macro didn't give any better readability.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/tw686x/tw686x-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw686x/tw686x-audio.c b/drivers/media/pci/tw686x/tw686x-audio.c
index 40373bd23381..7786e51d19ae 100644
--- a/drivers/media/pci/tw686x/tw686x-audio.c
+++ b/drivers/media/pci/tw686x/tw686x-audio.c
@@ -300,7 +300,7 @@ static int tw686x_snd_pcm_init(struct tw686x_dev *dev)
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm,
 				SNDRV_DMA_TYPE_DEV,
-				snd_dma_pci_data(dev->pci_dev),
+				&dev->pci_dev->dev,
 				TW686X_AUDIO_PAGE_MAX * AUDIO_DMA_SIZE_MAX,
 				TW686X_AUDIO_PAGE_MAX * AUDIO_DMA_SIZE_MAX);
 	return 0;
-- 
2.16.4

