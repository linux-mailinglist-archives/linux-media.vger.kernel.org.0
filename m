Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AADED118A44
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 14:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfLJN7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 08:59:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:51728 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727377AbfLJN7D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 08:59:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 29E7AB19C;
        Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH for-5.6 11/14] media: cobalt: Drop superfluous ioctl PCM ops
Date:   Tue, 10 Dec 2019 14:58:46 +0100
Message-Id: <20191210135849.15607-12-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

snd_cobalt_pcm_ioctl() does nothing but calling the default handler.
Now PCM core accepts NULL as the default ioctl ops, so let's drop
altogether.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/cobalt/cobalt-alsa-pcm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-alsa-pcm.c b/drivers/media/pci/cobalt/cobalt-alsa-pcm.c
index 77570a1127c9..9e7504e3cfd8 100644
--- a/drivers/media/pci/cobalt/cobalt-alsa-pcm.c
+++ b/drivers/media/pci/cobalt/cobalt-alsa-pcm.c
@@ -237,12 +237,6 @@ static int snd_cobalt_pcm_capture_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_cobalt_pcm_ioctl(struct snd_pcm_substream *substream,
-		     unsigned int cmd, void *arg)
-{
-	return snd_pcm_lib_ioctl(substream, cmd, arg);
-}
-
 static int snd_cobalt_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_cobalt_card *cobsc = snd_pcm_substream_chip(substream);
@@ -450,7 +444,6 @@ snd_pcm_uframes_t snd_cobalt_pcm_pb_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_cobalt_pcm_capture_ops = {
 	.open		= snd_cobalt_pcm_capture_open,
 	.close		= snd_cobalt_pcm_capture_close,
-	.ioctl		= snd_cobalt_pcm_ioctl,
 	.prepare	= snd_cobalt_pcm_prepare,
 	.trigger	= snd_cobalt_pcm_trigger,
 	.pointer	= snd_cobalt_pcm_pointer,
@@ -459,7 +452,6 @@ static const struct snd_pcm_ops snd_cobalt_pcm_capture_ops = {
 static const struct snd_pcm_ops snd_cobalt_pcm_playback_ops = {
 	.open		= snd_cobalt_pcm_playback_open,
 	.close		= snd_cobalt_pcm_playback_close,
-	.ioctl		= snd_cobalt_pcm_ioctl,
 	.prepare	= snd_cobalt_pcm_pb_prepare,
 	.trigger	= snd_cobalt_pcm_pb_trigger,
 	.pointer	= snd_cobalt_pcm_pb_pointer,
-- 
2.16.4

