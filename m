Return-Path: <linux-media+bounces-17590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C796BD26
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5611328524F
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEB01DC184;
	Wed,  4 Sep 2024 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="YMWNUsSV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kbr25GYu"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA811DC070;
	Wed,  4 Sep 2024 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454337; cv=none; b=iz6y+JAl+GsSnZZiZGoLAzqXgmUFocG45kLu2tDmqfIwZRszB+cNmHBSmxoOYGTORxiVnKfkGirZIbFPXb0kCf/6jv6jmvNgBisq4kU4qZu80YaVAH0+LSlmC/2LA3LJLFbhTzwOfV5iYCqpDOMhmBKbWyAKH7Pm1u3EYgm1I+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454337; c=relaxed/simple;
	bh=ojVAHMGLVxM6BQXsQwccByzQ1V2w5Q8flcap2aZwbVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4uTX47NYmU1BAwXyLqqka5hkcyRH6hVIPEREsll5e0qPiGJxyNCAn0MH24keEdC1LXu2+X+eLPgDF5wGn4WrzbnSoJG76CfenMkDlNE5GnGF/vC+70+IXxvo2HBOu6ei7+GfAq35Cgf36V08HqL4n426g5tWLLYSq89e3wa5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=YMWNUsSV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kbr25GYu; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D7A1C11401AB;
	Wed,  4 Sep 2024 08:52:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 04 Sep 2024 08:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725454334; x=
	1725540734; bh=nv0xbhGWiRX7u7gz9SGKHEd/5MDr79jm+xvr16IY/JI=; b=Y
	MWNUsSV+drCuf//JaaMU583NJ1Tv75Hb9txQhkyDHRKGMjHldfJVHZz2k9kV/pun
	8H8GX9mHkFJXXyIl9+gtD9Q7q19yhyrWSVIb+DKUWw7VUsWUZAom6edlPkn1lXPu
	AmrGZZ30dcpPvhc5oH6ZgDlSHyPkwn5bLq+otjucmCS2DdG0zm7jZkjtAz7M1IS/
	O8HVF09uUdHWwlpvUuBdFG01exWS9342/eHJsrSMut6EBsPzJq60eqGHAFRiDts7
	IQrUeaOaePS32QU7rgygmEfeyh7EtUknGvisQ04JVpLlu9dAX6rBtgSSG6tLVOpa
	ME+e8xpwnSMrwsUTh08KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725454334; x=
	1725540734; bh=nv0xbhGWiRX7u7gz9SGKHEd/5MDr79jm+xvr16IY/JI=; b=k
	br25GYuhZEkFybMl1mVUkoI1veBpKiO3zVPkoX1fvbSvFMNN2kfitEjmZsygoGQt
	eIRFmgTsswjL6xB7F4N7+J+QHP3Vkr9PdW+Y399sm+corbxtHOW7Dnr61wG3D83y
	WGAf1QBefmCSHu9mYWM4R2Taq0yEthHsJqff9xLw7ZEV57GviSnDOGu/gSqTo3Je
	P8cCYf+PDGxzLbsqz78as0GSZ88sP7TzkuHNJFelbCjbZVJkqYGis8mgOgtAdq6Y
	MTEkTuch4IhPjGw0QvIc31HzyU4Bk9kfnkJzzt8iUvTnYxAAyaOkFNu1wozJPJSg
	uFq6guivLUwneDroyo0ag==
X-ME-Sender: <xms:_lfYZgUdJseWkkFKW7GqvFpCIkZZOD4itS1hWZBRHQw-FXHW_sGKvg>
    <xme:_lfYZkn13mfmLb9B1D3AfJooycC5mJcYhLOzChcieUlnp2oSn0krbMYLk03_gmQvy
    BVgktDPXt7krEDYm3o>
X-ME-Received: <xmr:_lfYZkZe-u4gEUWNMGw5Xlr-GcIvo1va06iHBHOB6W7xRz3ET-rTn5GjHa035gTaormwgaWcd0SUXbEnx03ibYSB0WYHET2ytlG4hc78RzKNgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehjedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdff
    kedvtdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtihifrghisehsuhhsvgdruggvpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrphgrihhssehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhr
    tghpthhtohepvggumhhunhgurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_lfYZvVzuJKDtriBBz2S_0Jk-g4SVlN410JHWqkis2l966gSqP6iZA>
    <xmx:_lfYZqlB18g-mGDX4lJj7mzZZQlWDuKf_MInG00o-TP6vpG-Mx9rtw>
    <xmx:_lfYZkdnV3-mvuuxinTNzhP0Pv5w4tpvjI3iU85Wfrk00e92CkfFYg>
    <xmx:_lfYZsFUEvlyoBbTtBRPu_nd-bNI6JXJnJqtAfGs9OOlpC0dCI1Pyw>
    <xmx:_lfYZsVjBJUhj-_ojJdPUmF7MP7GjW_opI-v-ToTfIQrgOfRn_rDQlkD>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Sep 2024 08:52:12 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 5/5] ALSA: firewire: use nonatomic PCM operation
Date: Wed,  4 Sep 2024 21:51:54 +0900
Message-ID: <20240904125155.461886-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
References: <20240904125155.461886-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the former commits, the callback of isochronous context runs on usual
work process. In the case, ALSA PCM device has a flag, nonatomic, to
acquire mutex lock instead of spin lock for PCM substream group.

This commit uses the flag. It has an advantage in the case that ALSA PCM
application uses the large size of intermediate buffer, since it takes
too long time even in tasklet softIRQ to process many of isochronous
packets, then result in the delay of system event due to disabled IRQ so
long. It is avertible to switch to nonatomic operation.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c            | 34 +++++++++++++++++++-----
 sound/firewire/bebob/bebob_pcm.c         |  1 +
 sound/firewire/dice/dice-pcm.c           |  1 +
 sound/firewire/digi00x/digi00x-pcm.c     |  1 +
 sound/firewire/fireface/ff-pcm.c         |  1 +
 sound/firewire/fireworks/fireworks_pcm.c |  1 +
 sound/firewire/isight.c                  |  1 +
 sound/firewire/motu/motu-pcm.c           |  1 +
 sound/firewire/oxfw/oxfw-pcm.c           |  1 +
 sound/firewire/tascam/tascam-pcm.c       |  1 +
 10 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index c827d7d8d800..c72b2a754775 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -615,6 +615,22 @@ static void update_pcm_pointers(struct amdtp_stream *s,
 		// The program in user process should periodically check the status of intermediate
 		// buffer associated to PCM substream to process PCM frames in the buffer, instead
 		// of receiving notification of period elapsed by poll wait.
+		//
+		// Use another work item for period elapsed event to prevent the following AB/BA
+		// deadlock:
+		//
+		//             thread 1                            thread 2
+		// =================================   =================================
+		//       A.work item (process)                pcm ioctl (process)
+		//                 v                                   v
+		//       process_rx_packets()                  B.PCM stream lock
+		//       process_tx_packets()                          v
+		//                 v                        callbacks in snd_pcm_ops
+		//       update_pcm_pointers()                         v
+		//         snd_pcm_elapsed()           fw_iso_context_flush_completions()
+		//  snd_pcm_stream_lock_irqsave()             disable_work_sync()
+		//                 v                                   v
+		//     wait until release of B                wait until A exits
 		if (!pcm->runtime->no_period_wakeup)
 			queue_work(system_highpri_wq, &s->period_work);
 	}
@@ -1055,8 +1071,15 @@ static void generate_rx_packet_descs(struct amdtp_stream *s, struct pkt_desc *de
 
 static inline void cancel_stream(struct amdtp_stream *s)
 {
+	struct work_struct *work = current_work();
+
 	s->packet_index = -1;
-	if (in_softirq())
+
+	// Detect work items for any isochronous context. The work item for pcm_period_work()
+	// should be avoided since the call of snd_pcm_period_elapsed() can reach via
+	// snd_pcm_ops.pointer() under acquiring PCM stream(group) lock and causes dead lock at
+	// snd_pcm_stop_xrun().
+	if (work && work != &s->period_work)
 		amdtp_stream_pcm_abort(s);
 	WRITE_ONCE(s->pcm_buffer_pointer, SNDRV_PCM_POS_XRUN);
 }
@@ -1856,12 +1879,9 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
 	struct amdtp_stream *irq_target = d->irq_target;
 
 	if (irq_target && amdtp_stream_running(irq_target)) {
-		// use wq to prevent AB/BA deadlock competition for
-		// substream lock:
-		// fw_iso_context_flush_completions() acquires
-		// lock by ohci_flush_iso_completions(),
-		// amdtp-stream process_rx_packets() attempts to
-		// acquire same lock by snd_pcm_elapsed()
+		// The work item to call snd_pcm_period_elapsed() can reach here by the call of
+		// snd_pcm_ops.pointer(), however less packets would be available then. Therefore
+		// the following call is just for user process contexts.
 		if (current_work() != &s->period_work)
 			fw_iso_context_flush_completions(irq_target->context);
 	}
diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index ce49eef0fcba..360ebf3c4ca2 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -367,6 +367,7 @@ int snd_bebob_create_pcm_devices(struct snd_bebob *bebob)
 		goto end;
 
 	pcm->private_data = bebob;
+	pcm->nonatomic = true;
 	snprintf(pcm->name, sizeof(pcm->name),
 		 "%s PCM", bebob->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index d64366217d57..2cf2adb48f2a 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -441,6 +441,7 @@ int snd_dice_create_pcm(struct snd_dice *dice)
 		if (err < 0)
 			return err;
 		pcm->private_data = dice;
+		pcm->nonatomic = true;
 		strcpy(pcm->name, dice->card->shortname);
 
 		if (capture > 0)
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 3bd1575c9d9c..85e65cbc00c4 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -350,6 +350,7 @@ int snd_dg00x_create_pcm_devices(struct snd_dg00x *dg00x)
 		return err;
 
 	pcm->private_data = dg00x;
+	pcm->nonatomic = true;
 	snprintf(pcm->name, sizeof(pcm->name),
 		 "%s PCM", dg00x->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index ec915671a79b..63457d24a288 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -390,6 +390,7 @@ int snd_ff_create_pcm_devices(struct snd_ff *ff)
 		return err;
 
 	pcm->private_data = ff;
+	pcm->nonatomic = true;
 	snprintf(pcm->name, sizeof(pcm->name),
 		 "%s PCM", ff->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &pcm_playback_ops);
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index c3c21860b245..eaf7778211de 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -397,6 +397,7 @@ int snd_efw_create_pcm_devices(struct snd_efw *efw)
 		goto end;
 
 	pcm->private_data = efw;
+	pcm->nonatomic = true;
 	snprintf(pcm->name, sizeof(pcm->name), "%s PCM", efw->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index 806f82c9ceee..b1e059f0d473 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -454,6 +454,7 @@ static int isight_create_pcm(struct isight *isight)
 	if (err < 0)
 		return err;
 	pcm->private_data = isight;
+	pcm->nonatomic = true;
 	strcpy(pcm->name, "iSight");
 	isight->pcm = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 	isight->pcm->ops = &ops;
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index d410c2efbde5..f3b48495acae 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -360,6 +360,7 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu)
 	if (err < 0)
 		return err;
 	pcm->private_data = motu;
+	pcm->nonatomic = true;
 	strcpy(pcm->name, motu->card->shortname);
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_ops);
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 5f43a0b826d2..8ca9dde54ec6 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -440,6 +440,7 @@ int snd_oxfw_create_pcm(struct snd_oxfw *oxfw)
 		return err;
 
 	pcm->private_data = oxfw;
+	pcm->nonatomic = true;
 	strcpy(pcm->name, oxfw->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
 	if (cap > 0)
diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index f6da571707ac..a73003ac11e6 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -279,6 +279,7 @@ int snd_tscm_create_pcm_devices(struct snd_tscm *tscm)
 		return err;
 
 	pcm->private_data = tscm;
+	pcm->nonatomic = true;
 	snprintf(pcm->name, sizeof(pcm->name),
 		 "%s PCM", tscm->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_ops);
-- 
2.43.0


