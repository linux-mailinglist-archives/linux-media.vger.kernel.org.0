Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD02B118A3C
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 14:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbfLJN7E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 08:59:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:51738 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727386AbfLJN7D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 08:59:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 29DE6B174;
        Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH for-5.6 12/14] media: cx18: Drop superfluous ioctl PCM ops
Date:   Tue, 10 Dec 2019 14:58:47 +0100
Message-Id: <20191210135849.15607-13-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

snd_cx18_pcm_ioctl() does nothing but calling the default handler.
Now PCM core accepts NULL as the default ioctl ops, so let's drop
altogether.

Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/cx18/cx18-alsa-pcm.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-alsa-pcm.c b/drivers/media/pci/cx18/cx18-alsa-pcm.c
index 7dec5ce20eb7..bed28b4b41f7 100644
--- a/drivers/media/pci/cx18/cx18-alsa-pcm.c
+++ b/drivers/media/pci/cx18/cx18-alsa-pcm.c
@@ -200,18 +200,6 @@ static int snd_cx18_pcm_capture_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_cx18_pcm_ioctl(struct snd_pcm_substream *substream,
-		     unsigned int cmd, void *arg)
-{
-	struct snd_cx18_card *cxsc = snd_pcm_substream_chip(substream);
-	int ret;
-
-	snd_cx18_lock(cxsc);
-	ret = snd_pcm_lib_ioctl(substream, cmd, arg);
-	snd_cx18_unlock(cxsc);
-	return ret;
-}
-
 static int snd_cx18_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_cx18_card *cxsc = snd_pcm_substream_chip(substream);
@@ -244,7 +232,6 @@ snd_pcm_uframes_t snd_cx18_pcm_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_cx18_pcm_capture_ops = {
 	.open		= snd_cx18_pcm_capture_open,
 	.close		= snd_cx18_pcm_capture_close,
-	.ioctl		= snd_cx18_pcm_ioctl,
 	.prepare	= snd_cx18_pcm_prepare,
 	.trigger	= snd_cx18_pcm_trigger,
 	.pointer	= snd_cx18_pcm_pointer,
-- 
2.16.4

