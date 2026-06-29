Return-Path: <linux-media+bounces-66013-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cVi0DFi5QmrjAAoAu9opvQ
	(envelope-from <linux-media+bounces-66013-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:28:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A46ED6DE0B1
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:28:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fhK6EzwN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66013-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66013-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D46E53071E4C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB0E386C39;
	Mon, 29 Jun 2026 18:26:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0B8388386
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 18:26:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757617; cv=none; b=n5dLaBDqoMY/BooxsdwuH87Fy2nwuIcQFHtfTVEqlVIMaEKBbBeDZNKXOJXxQPUKBpzdH2Aap93yASEuL68l02ZxL5M0vBG3oHh5qUNZK0ZlIt73PPNtmrRUudt53VQjFb+WhCqU8qiPITm5n4BzGTOanwNgP9MRoplry0/Gx2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757617; c=relaxed/simple;
	bh=wMK7iXSoSugUWrDjatemlzzdjA+Vex6R7zKGSBFo1EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=numVvNEls8MtaMuxeAY+sCZ2c9os13BiiCbdzVNUKA7SL9YL00wEd5DFD3rnnsGLe8GRmZkE+aBKzvDVKYMV79Oho53Rig8XrMlb5SJ0g/K1nh7xH1ll9aKxRSMAPfz0cUIRNfnnlyAiZndH7hKwISoGOQS6IGNRV9RZPSkqglg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhK6EzwN; arc=none smtp.client-ip=209.85.210.48
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9c7e8eb21so1450151a34.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757613; x=1783362413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLtGHInHNswfJ53zh1smU7vqkd1P31gDWvBtCx78XKE=;
        b=fhK6EzwNXvfjJfdxGRjbfQ40qW3a3tH0tfPlaA876LklrJnxrsoNx+szfBawrAZbR1
         Ll6HkCq4vd2kbAThh50IMaOXoSE0o6IKNy5X49eFLK9WnrEJpGnJZt/bDvl8uSDUnEPQ
         aIXXYq2+MdjyazEwKPAcEGIG9K4OXisfkUIy/oomGQtIPz6WcQepbmDATxoY5gouBnnJ
         BcoLDZyjV/G+DAfY/mqbmzAuPVNNyVUVHj/mkv7RG3NJ5dvgTCQZe6vPKWR8U8+byXMO
         0pp6ZfOOjMTrdtIg7pSAAZQSYLUXYBTbM0aklil/Xc1JxVt5YKuiPXc92O/IFJJhc6Ok
         x6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757613; x=1783362413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vLtGHInHNswfJ53zh1smU7vqkd1P31gDWvBtCx78XKE=;
        b=rS+seRM+p/N0Sux/z1v5q0CehAGl6JrN58+h803S5+6G7TNjIl3VNaUuCM4kPrbY0B
         hnsao/IhryjkMPdexeQqcWfUZHc5PWCWjO6P+JgtFrotVXw28gxxR/6Ie3BoacDsnhUb
         96kzAUtgyYVMZ85hQikh0/AANRGsmbcVtcx3X/j+8rfnAaCOsfs9efTec/wXeceXTJI3
         n0NcwWZ7RJ2dQMreho5nwPeqRMGlppwhwx5Ft5zi8ppZIIIy+MCk6/PvNn5CB7xcSIqy
         Eoq8rfhJkM/W1g5KqKgalw/UcSLszUAOESHIkUkWwyjObq6tTMrIDf4G4CNWXf0TS8vv
         +i5g==
X-Forwarded-Encrypted: i=1; AFNElJ/ggWeQj7pmTuFxFVzWUM6Un4ajhYShcmu55jpvREgl/WsNSrj3PsapLf/S/tHofoYb7x1VfXpnOyFq0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHUBzZAFjBLSZKdPfKc+O3Uw5sMNzN8At7m0WHa5M+bsw8ZkMb
	A/yNQCU7RQ5/qi8xfq8vTEKyFU9SddMVg3O+qDOFp522j7ywb9AKa/PsYG9TAg==
X-Gm-Gg: AfdE7cmqzooaIyzDFG5dQyuV5q2BL5l6+e7sW+OhyNxEkI+RHwvV5HhX53Lufxwc4WO
	i3PjZ1cXPVrVJ521IWuRR66Vmv9vh0oBDaFVgRetWCgcRhbi3V+MVdOc/O0SWDRUEuS9I8GLv5U
	ScQ9KaJev/jH1XNw0eXjhh0mSwdfVWdATPYAGB3fq0dEZndteD6recn1KqBu/yJVQS1ekhejk9u
	4ZFZwS1MWePNEvH+2sFJOim12mfu5KnW6rjv0H69VgZWp6vO68m9sko7UFHmFRgNVjfponp0sVW
	tLXn74ZD2T8CytMezR9kZPP8rbbNrwiCsepf9VEVoih05SVGcPFNl6k3RWiBeDS0ln1i8K6cAEr
	CNVKCQBSE2Q618sNZsQ82huqK88TZnOW8V9uPh3RgEKdbOC/T7YuS40cqLUHsNmUesDHxKBdOLO
	7AQBvr92IktkOOF97zQXSBk3gxScxIuvJnH8RB7CnAQ4x8PGCpv+yPEc5QTZGKUg==
X-Received: by 2002:a05:6830:3981:b0:7e9:b34c:ce3d with SMTP id 46e09a7af769-7e9ec719a52mr491437a34.18.1782757613316;
        Mon, 29 Jun 2026 11:26:53 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2ba18esm396875a34.16.2026.06.29.11.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 11:26:52 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 2/5] media: hws: add shared scratch DMA arena
Date: Mon, 29 Jun 2026 14:26:46 -0400
Message-ID: <20260629182649.247879-3-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629182649.247879-1-hoff.benjamin.k@gmail.com>
References: <20260629182649.247879-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66013-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A46ED6DE0B1

From: Ben Hoff <hoff.benjamin.k@gmail.com>

Replace the probe-time seed buffer allocation with a per-channel coherent
scratch arena that is acquired by stream users and released by refcount.
The arena reserves video bounce space first and an audio capture window
after it, and validates that the full allocation fits within the single
512 MiB BAR remap page shared by the channel.

Reset cached video DMA window state when freeing a channel arena so the
next stream reprograms the hardware from a clean state.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws.h       |  28 +++++
 drivers/media/pci/hws/hws_pci.c   | 192 ++++++++++++++++++++++++------
 drivers/media/pci/hws/hws_reg.h   |   7 ++
 drivers/media/pci/hws/hws_video.c |  17 +--
 4 files changed, 198 insertions(+), 46 deletions(-)

diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
index 8fbe1fe27844..c0541190c047 100644
--- a/drivers/media/pci/hws/hws.h
+++ b/drivers/media/pci/hws/hws.h
@@ -8,6 +8,7 @@
 #include <linux/kthread.h>
 #include <linux/pci.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/sizes.h>
 #include <linux/atomic.h>
@@ -52,6 +53,8 @@ struct hwsvideo_buffer {
 	int slot;
 };
 
+#define HWS_VIDEO_BOUNCE_SLOTS 2
+
 struct hws_video {
 	/* Linkage */
 	struct hws_pcie_dev *parent;
@@ -104,6 +107,7 @@ struct hws_video {
 	u32 last_dma_page;
 	u32 last_pci_addr;
 	u32 last_half16;
+	u8 next_bounce_slot;
 
 	/* Misc counters */
 	int signal_loss_cnt;
@@ -130,6 +134,7 @@ struct hws_scratch_dma {
 	void *cpu;
 	dma_addr_t dma;
 	size_t size;
+	bool owned;
 };
 
 struct hws_pcie_dev {
@@ -152,6 +157,7 @@ struct hws_pcie_dev {
 	u32 max_hw_video_buf_sz;
 	u8 max_channels;
 	u8 cur_max_video_ch;
+	u8 cur_max_audio_ch;
 	bool start_run;
 
 	bool buf_allocated;
@@ -161,7 +167,10 @@ struct hws_pcie_dev {
 
 	/* Kernel thread */
 	struct task_struct *main_task;
+	struct mutex scratch_lock; /* protects scratch DMA arenas and user refs */
+	unsigned int scratch_users[MAX_VID_CHANNELS];
 	struct hws_scratch_dma scratch_vid[MAX_VID_CHANNELS];
+	struct hws_scratch_dma scratch_aud[MAX_VID_CHANNELS];
 
 	bool suspended;
 	int irq;
@@ -170,4 +179,23 @@ struct hws_pcie_dev {
 	int pci_lost;
 };
 
+static inline bool hws_dma_fits_remap_window(dma_addr_t dma, size_t size)
+{
+	dma_addr_t end;
+
+	if (!size)
+		return false;
+
+	end = dma + size - 1;
+	if (end < dma)
+		return false;
+
+	return upper_32_bits(dma) == upper_32_bits(end) &&
+	       (lower_32_bits(dma) & PCI_E_BAR_ADD_MASK) ==
+	       (lower_32_bits(end) & PCI_E_BAR_ADD_MASK);
+}
+
+int hws_alloc_channel_scratch(struct hws_pcie_dev *hws, unsigned int ch);
+void hws_release_channel_scratch(struct hws_pcie_dev *hws, unsigned int ch);
+
 #endif
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
index 10af6c30566a..589d4840e116 100644
--- a/drivers/media/pci/hws/hws_pci.c
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -11,6 +11,7 @@
 #include <linux/err.h>
 #include <linux/ktime.h>
 #include <linux/math64.h>
+#include <linux/minmax.h>
 #include <linux/pm.h>
 #include <linux/freezer.h>
 #include <linux/pci_regs.h>
@@ -101,22 +102,30 @@ static void hws_configure_hardware_capabilities(struct hws_pcie_dev *hdev)
 	case 0x8504:
 	case 0x6504:
 		hdev->cur_max_video_ch = 4;
+		hdev->cur_max_audio_ch = 4;
 		break;
 	case 0x8532:
 		hdev->cur_max_video_ch = 2;
+		hdev->cur_max_audio_ch = 2;
 		break;
 	case 0x8512:
 	case 0x6502:
 		hdev->cur_max_video_ch = 2;
+		hdev->cur_max_audio_ch = 0;
 		break;
 	case 0x8501:
 		hdev->cur_max_video_ch = 1;
+		hdev->cur_max_audio_ch = 0;
 		break;
 	default:
 		hdev->cur_max_video_ch = 4;
+		hdev->cur_max_audio_ch = 0;
 		break;
 	}
 
+	if (hdev->cur_max_audio_ch > hdev->cur_max_video_ch)
+		hdev->cur_max_audio_ch = hdev->cur_max_video_ch;
+
 	/* universal buffer capacity */
 	hdev->max_hw_video_buf_sz = MAX_MM_VIDEO_SIZE;
 
@@ -255,55 +264,164 @@ static void hws_stop_kthread_action(void *data)
 	}
 }
 
-static int hws_alloc_seed_buffers(struct hws_pcie_dev *hws)
+static size_t hws_video_scratch_bytes(void)
 {
-	int ch;
-	/* 64 KiB is plenty for a safe dummy; hardware needs 64-byte alignment. */
-	const size_t need = ALIGN(64 * 1024, 64);
+	return HWS_VIDEO_BOUNCE_SLOTS * ALIGN((size_t)MAX_VIDEO_SCALER_SIZE, 64);
+}
 
-	for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
+static size_t hws_audio_scratch_bytes(void)
+{
+	return ALIGN((size_t)MAX_AUDIO_CAP_SIZE, 64);
+}
+
+static void hws_clear_scratch(struct hws_scratch_dma *scratch)
+{
+	scratch->cpu = NULL;
+	scratch->dma = 0;
+	scratch->size = 0;
+	scratch->owned = false;
+}
+
+static void hws_free_channel_scratch_locked(struct hws_pcie_dev *hws,
+					    unsigned int ch)
+{
+	struct hws_scratch_dma *vid;
+	struct hws_scratch_dma *aud;
+
+	if (!hws || ch >= MAX_VID_CHANNELS)
+		return;
+
+	vid = &hws->scratch_vid[ch];
+	aud = &hws->scratch_aud[ch];
+
+	if (ch < hws->cur_max_video_ch) {
+		hws->video[ch].window_valid = false;
+		hws->video[ch].last_dma_hi = 0;
+		hws->video[ch].last_dma_page = 0;
+		hws->video[ch].last_pci_addr = 0;
+		hws->video[ch].last_half16 = 0;
+		hws->video[ch].next_bounce_slot = 0;
+	}
+	hws->scratch_users[ch] = 0;
+
+	if (aud->cpu && aud->owned)
+		dma_free_coherent(&hws->pdev->dev, aud->size, aud->cpu,
+				  aud->dma);
+	hws_clear_scratch(aud);
+
+	if (vid->cpu && vid->owned)
+		dma_free_coherent(&hws->pdev->dev, vid->size, vid->cpu,
+				  vid->dma);
+	hws_clear_scratch(vid);
+}
+
+int hws_alloc_channel_scratch(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	size_t aud_off = hws_video_scratch_bytes();
+	size_t arena_need = aud_off;
+	bool has_audio;
+
+	if (!hws || ch >= max_t(unsigned int, hws->cur_max_video_ch,
+				hws->cur_max_audio_ch))
+		return -EINVAL;
+
+	has_audio = ch < hws->cur_max_audio_ch;
+	if (has_audio)
+		arena_need = ALIGN(aud_off + hws_audio_scratch_bytes(), 64);
+
+	/*
+	 * One coherent per-channel arena backs both fallback video DMA and audio
+	 * DMA. The video bounce slots live first; the audio capture window starts
+	 * at aud_off. The whole arena must fit inside a single 512 MiB remap page
+	 * because video and audio share the channel remap slot.
+	 */
+	mutex_lock(&hws->scratch_lock);
+	if (hws->scratch_vid[ch].cpu) {
+		hws->scratch_users[ch]++;
+		mutex_unlock(&hws->scratch_lock);
+		return 0;
+	}
+
+	{
 #if defined(CONFIG_HAS_DMA) /* normal on PCIe platforms */
-		void *cpu = dma_alloc_coherent(&hws->pdev->dev, need,
-					       &hws->scratch_vid[ch].dma,
-					       GFP_KERNEL);
+		dma_addr_t dma = 0;
+		void *cpu = NULL;
+		int attempt;
+
+		for (attempt = 0; attempt < 8; attempt++) {
+			cpu = dma_alloc_coherent(&hws->pdev->dev, arena_need,
+						 &dma, GFP_KERNEL);
+			if (!cpu)
+				break;
+			if (!hws_dma_fits_remap_window(dma, arena_need)) {
+				dev_dbg(&hws->pdev->dev,
+					"scratch arena: retry ch=%u dma=%pad size=%zu crosses remap window\n",
+					ch, &dma, arena_need);
+				dma_free_coherent(&hws->pdev->dev, arena_need,
+						  cpu, dma);
+				cpu = NULL;
+				continue;
+			}
+			break;
+		}
 #else
 		void *cpu = NULL;
+		dma_addr_t dma = 0;
 #endif
 		if (!cpu) {
 			dev_warn(&hws->pdev->dev,
-				 "scratch: dma_alloc_coherent failed ch=%d\n", ch);
-			/* not fatal: free earlier ones and continue without seeding */
-			while (--ch >= 0) {
-				if (hws->scratch_vid[ch].cpu)
-					dma_free_coherent(&hws->pdev->dev,
-							  hws->scratch_vid[ch].size,
-							  hws->scratch_vid[ch].cpu,
-							  hws->scratch_vid[ch].dma);
-				hws->scratch_vid[ch].cpu = NULL;
-				hws->scratch_vid[ch].size = 0;
-			}
+				 "scratch arena: dma_alloc_coherent failed ch=%u\n",
+				 ch);
+			mutex_unlock(&hws->scratch_lock);
 			return -ENOMEM;
 		}
-		hws->scratch_vid[ch].cpu  = cpu;
-		hws->scratch_vid[ch].size = need;
+
+		hws->scratch_vid[ch].dma = dma;
+		hws->scratch_vid[ch].cpu = cpu;
+		hws->scratch_vid[ch].size = arena_need;
+		hws->scratch_vid[ch].owned = true;
+
+		if (has_audio) {
+			hws->scratch_aud[ch].dma = dma + aud_off;
+			hws->scratch_aud[ch].cpu = (u8 *)cpu + aud_off;
+			hws->scratch_aud[ch].size = hws_audio_scratch_bytes();
+			hws->scratch_aud[ch].owned = false;
+		}
 	}
+	hws->scratch_users[ch] = 1;
+
+	dev_dbg(&hws->pdev->dev,
+		"scratch arena: allocated ch=%u size=%zu audio=%d\n",
+		ch, arena_need, has_audio);
+	mutex_unlock(&hws->scratch_lock);
 	return 0;
 }
 
+void hws_release_channel_scratch(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	if (!hws || ch >= MAX_VID_CHANNELS)
+		return;
+
+	mutex_lock(&hws->scratch_lock);
+	if (hws->scratch_users[ch] > 0)
+		hws->scratch_users[ch]--;
+	if (!hws->scratch_users[ch])
+		hws_free_channel_scratch_locked(hws, ch);
+	mutex_unlock(&hws->scratch_lock);
+}
+
 static void hws_free_seed_buffers(struct hws_pcie_dev *hws)
 {
 	int ch;
 
-	for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
-		if (hws->scratch_vid[ch].cpu) {
-			dma_free_coherent(&hws->pdev->dev,
-					  hws->scratch_vid[ch].size,
-					  hws->scratch_vid[ch].cpu,
-					  hws->scratch_vid[ch].dma);
-			hws->scratch_vid[ch].cpu = NULL;
-			hws->scratch_vid[ch].size = 0;
-		}
-	}
+	if (!hws)
+		return;
+
+	/* Teardown-only force-free path; normal streams use release refcounts. */
+	mutex_lock(&hws->scratch_lock);
+	for (ch = 0; ch < MAX_VID_CHANNELS; ch++)
+		hws_free_channel_scratch_locked(hws, ch);
+	mutex_unlock(&hws->scratch_lock);
 }
 
 static void hws_seed_channel(struct hws_pcie_dev *hws, int ch)
@@ -326,11 +444,11 @@ static void hws_seed_channel(struct hws_pcie_dev *hws, int ch)
 		       hws->bar0_base + CVBS_IN_BUF_BASE +
 		       ch * PCIE_BARADDROFSIZE);
 
-	/* Half size: use either the current format's half or half of scratch. */
+	/* Half size: use either the current format or the video arena. */
 	{
 		u32 half = hws->video[ch].pix.half_size ?
 			hws->video[ch].pix.half_size :
-			(u32)(hws->scratch_vid[ch].size / 2);
+			(u32)(MAX_VIDEO_SCALER_SIZE / 2);
 
 		writel_relaxed(half / 16,
 			       hws->bar0_base + CVBS_IN_BUF_BASE2 +
@@ -400,6 +518,7 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	hws->pdev = pdev;
 	hws->irq = -1;
 	hws->suspended = false;
+	mutex_init(&hws->scratch_lock);
 	pci_set_drvdata(pdev, hws);
 
 	/* 1) Enable device + bus mastering (managed) */
@@ -448,12 +567,7 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 		}
 	}
 
-	/* 6) Allocate scratch DMA and seed BAR table + channel base/half (legacy SetDMAAddress) */
-	ret = hws_alloc_seed_buffers(hws);
-	if (!ret)
-		hws_seed_all_channels(hws);
-
-	/* 7) Start-run sequence. */
+	/* 6) Start-run sequence. Scratch DMA is allocated on stream start. */
 	hws_init_video_sys(hws, false);
 
 	/* A) Force legacy INTx; legacy used request_irq(pdev->irq, ..., IRQF_SHARED) */
diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hws_reg.h
index 344cb8d011a9..c8d6715fe0c2 100644
--- a/drivers/media/pci/hws/hws_reg.h
+++ b/drivers/media/pci/hws/hws_reg.h
@@ -33,6 +33,13 @@
 #define PCI_E_BAR_ADD_MASK 0xE0000000
 #define PCI_E_BAR_ADD_LOWMASK 0x1FFFFFFF
 
+/*
+ * The legacy driver reserved a 10 KiB hardware capture window per audio
+ * channel even though the delivered packet size is smaller. Keep that headroom
+ * for the split-buffer DMA engine.
+ */
+#define MAX_AUDIO_CAP_SIZE         (10U * 1024U)
+
 #define MAX_VID_CHANNELS            4
 
 #define MAX_MM_VIDEO_SIZE            SZ_4M
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index b1af81d1368a..1531d703f6d8 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -306,6 +306,7 @@ int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch)
 
 	vid->queued_count = 0;
 	vid->window_valid = false;
+	vid->next_bounce_slot = 0;
 
 	/* Default format. */
 	vid->pix.width = 1920;
@@ -556,17 +557,18 @@ static void hws_seed_dma_windows(struct hws_pcie_dev *hws)
 				       hws->bar0_base + CVBS_IN_BUF_BASE +
 				       ch * PCIE_BARADDROFSIZE);
 
-			/* Half-frame length in /16 units.
-			 * Prefer the current channel's computed half_size if available.
-			 * Fall back to half of the probe-owned scratch buffer.
+			/*
+			 * Half-frame length in /16 units. Prefer the current
+			 * format and fall back to the video bounce window,
+			 * not the full per-channel arena that also contains audio.
 			 */
 			{
 				u32 half_bytes = hws->video[ch].pix.half_size ?
-				    hws->video[ch].pix.half_size :
-				    (u32)(hws->scratch_vid[ch].size / 2);
+					hws->video[ch].pix.half_size :
+					(u32)(MAX_VIDEO_SCALER_SIZE / 2);
+
 				writel_relaxed(half_bytes / 16,
-					       hws->bar0_base +
-					       CVBS_IN_BUF_BASE2 +
+					       hws->bar0_base + CVBS_IN_BUF_BASE2 +
 					       ch * PCIE_BARADDROFSIZE);
 			}
 		}
@@ -1166,6 +1168,7 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 		}
 		return ret;
 	}
+
 	(void)hws_read_active_state(hws, v->channel_index,
 				       &v->pix.interlaced);
 
-- 
2.54.0



