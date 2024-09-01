Return-Path: <linux-media+bounces-17295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C791967613
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 13:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFEF5B20A92
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 11:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4F3184544;
	Sun,  1 Sep 2024 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="qT507HD/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Okj/PI//"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D7183088;
	Sun,  1 Sep 2024 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725188821; cv=none; b=TFmg597UzCRFE6umJ2bpF7dI8Mz0zQR3E8VQcFIdmHzZNTCGUBi6uqMgm+4PR4aDbg1cnVgEUfBUxgsMR2AQWlTgWNfIAkwjdaxwoF4/YG5NEyJddbJSD5bMxxw3Bp1AIb6OjwsdFS3P7znik+Oc/gyWEUgjNBtbGZlWvFdf4eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725188821; c=relaxed/simple;
	bh=oe33XEGkSwv0xyHRMFBIff4zFvHjiHow0/FMo8PVe3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdggqiRcycSHy8UprSBIXj5jZhhnfiHAfobZvz7n1Fdx38+3satRZ8aRCZPiStdq2FFRMucPLxuLKtD6Avidemt5kId9Xn2S8qND0WXDHa6ZZvrytagX8DGs+1YBtf68P8i6Z8WD4WbkKIg2Ki9VI1byLnMJGqiFMQLJTMOidB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=qT507HD/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Okj/PI//; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 312F8114029C;
	Sun,  1 Sep 2024 07:06:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 01 Sep 2024 07:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725188819; x=
	1725275219; bh=//0Au4s75rwOEPL1M/L4VrMh9aoaUHrkh76N1UUAiIU=; b=q
	T507HD/bUEHBWBS8z3b3pUPfH+n+8w2LZin0WWgcfbuRWxXSPXpi+kUv4MhtQbAU
	otRqVUz3RccqpCLvCdeXP7dQEk0Fz9Pk4PFpQI7LPxHDOZq3fQfgu6dZYXT/gpCY
	Fud6tQCeGowl1jR0fViqhaKrPZt1GebhJO1VX6BK8CwGsB7+bljn4OK/Yg5KG+CN
	OEePjUGaawtNJbZDoO+5ZOfQneC9qnQ/6JZ45/WJ4rx93syVjrHWZw0yt+fc6QPd
	BwGeTUN/ECxlUoFpjwEu1NkR0lQyLwdD8VvnAokCEhRaTcVG2Zk4fhtTp1vKv7kG
	b4ZeVJb+lGPpVbb9n3U1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725188819; x=
	1725275219; bh=//0Au4s75rwOEPL1M/L4VrMh9aoaUHrkh76N1UUAiIU=; b=O
	kj/PI//RnruvjSE7nUR7G4Y+xLae7knIcrf7RelvOv+DvYfwkCeibrcmY6cN5xoE
	Fi1Ci5ppyCqkEcXAqNd+eoM93n8YSWD9S9Y0uOH6YnF5hBXKclegdpccGjg479Xq
	GGI3Kt+WJbU3GP76MiUfhduuG6a0NDAfdsXcG3I2As3UwU7a57xwMvvAJFyjjw1y
	k26VMcGzvinVx5BqtZrN1K0mRkdnShdOXDeYA6l6+J6jSfEBu18Sy5hVtbn1Oobk
	iWGvCMbZqsMziCcul1Rm4hm+zJajBq9MS4MtR6ENfwpkQJDxtCGThDs8MIE9Bkta
	rmBmi0khRKXyuLraFQg5w==
X-ME-Sender: <xms:00rUZiERSHPlPbKMgnzEpYAn6Ta_OPyuUH0maltk8xcbJBAFR-zXLA>
    <xme:00rUZjUNdYWRuN6T-f1Tuuqyonly26vEc0_QfMOat5JxvN5nvNf2r6lkapksgsdE5
    c4QsfAIIDdwF1x0lY4>
X-ME-Received: <xmr:00rUZsKV8Bbhcdz17rcJ2RhGbw8WiloMW7GlPj1QpN5U33Ali92fYAQ982CcqkFXmBflUPaObOTyyWPEnxDCSOVSzqDl1mrgOKFMqvzLHgU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeghedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdff
    kedvtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvg
    hlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrphgr
    ihhssehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpthhtohepvggumhhunh
    gurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhig
    qdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvg
    hvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:00rUZsF7t3oKn5GSPBPolOdgfDbDOjmDf_QNYyKtWhakIhj0tF9MvA>
    <xmx:00rUZoXbfsnDnu7RxGC9C9vmT64sGVE50LT1lq_F1_GuBtRw5otPig>
    <xmx:00rUZvORv_lNf_A9qaWv72GoKPM9ff3cFjtqqm_2DQGo7uqBrorMtw>
    <xmx:00rUZv0HUywF5nL-pGwO9l_UxCr2fRVhfqlT0OOtbn5omSgDuMymUw>
    <xmx:00rUZrFOQJsANkA-h2ZzRqhuyITQOILfRiFyxa4xYqK7HTRvwUYPlryY>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Sep 2024 07:06:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFT][PATCH 5/5] ALSA: firewire: use nonatomic PCM operation
Date: Sun,  1 Sep 2024 20:06:42 +0900
Message-ID: <20240901110642.154523-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
References: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the former commits, the callback of isochronous context runs on work
process. In the case, ALSA PCM device has a flag, nonatomic, to acquire
mutex lock instead of spin lock for PCM substream group.

This commit uses the flag. It has an advantage in the case that ALSA PCM
application uses the large size of intermediate buffer, since it takes
too long time even in tasklet softIRQ to process many of isochronous
packets. It could result in the delay of system event due to disabled
IRQ so long.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c            | 9 ++++++++-
 sound/firewire/bebob/bebob_pcm.c         | 1 +
 sound/firewire/dice/dice-pcm.c           | 1 +
 sound/firewire/digi00x/digi00x-pcm.c     | 1 +
 sound/firewire/fireface/ff-pcm.c         | 1 +
 sound/firewire/fireworks/fireworks_pcm.c | 1 +
 sound/firewire/isight.c                  | 1 +
 sound/firewire/motu/motu-pcm.c           | 1 +
 sound/firewire/oxfw/oxfw-pcm.c           | 1 +
 sound/firewire/tascam/tascam-pcm.c       | 1 +
 10 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index c827d7d8d800..7e97ad133874 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1055,8 +1055,15 @@ static void generate_rx_packet_descs(struct amdtp_stream *s, struct pkt_desc *de
 
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


