Return-Path: <linux-media+bounces-65996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P7MCFe+bQmp0+gkAu9opvQ
	(envelope-from <linux-media+bounces-65996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:23:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F62A6DD4A3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:23:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=D9+FQTtj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65996-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65996-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3CBE321BC82
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BAC44CAF8;
	Mon, 29 Jun 2026 16:03:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248EF449EB7
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 16:03:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748997; cv=none; b=a6lCo3q/VQ41TDxcC1bhYCYg8yEyksu1Z1Cc8VwLMbheDx4miO30E4kVKdfFVZ9DfYk0Ke14AZu9LpVJVjd6FRAFKO0BwQcsY0Pr7zQiRD55Cp6ZZ6KFdgBL4OH5PS6pcYWRW7sCk+hBbjmzFqZzhiTf4WNfLJQyzVi94FdD17E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748997; c=relaxed/simple;
	bh=EV0jyIlraf8RJgtNV5kHKDV78fIf+wqP2tECrI6Uico=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAeKIbCJiBsQo6srBl3rwQQIfH6DeZP3Y1Py4vpzXa84/poAfRb7QVrAMcBhdPHte+D2UgvY5EwHimxE3nBZPsG45z6n26X6eh49sH7VbVsdgrJLMfwvAqKmHkXoZtzloJssfJfYgzAcXXVEZIvYC8APydIwDbFJzIcYzJvEmBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9+FQTtj; arc=none smtp.client-ip=209.85.160.46
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-44841e9f651so2293417fac.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748993; x=1783353793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYy6xXF8MaED0vNKkW6N6rV7TnotRm2+S9TnnA76Mfs=;
        b=D9+FQTtjpZ2IcCjjjM6qxxnYJBWyKLGf5uke0di34UE9MYW5OBIbcIOBBStCn1yjuZ
         on5yfiyEhH0dd8jxmFTqUoDrSOq86FiBOe62mJ+fe3aqrLV7gAGJ6ajqBwTg1ZY114fP
         dDDsSm0wZRWf1X+BeAw7aw1pkCWi/W9mnE800ZY4PY7y/Xnw0hAnYykrxRio5Ixewddo
         8uZBmX7l7/Flqr6KA0HYc0c3UFW2cYWfgQX5Sy7s8Nmy64A0KTXUFHxlRgYDEXb4G1sf
         rARehqez7t+piwyj7VM4I1vSX+8e/fkKM6P50YA+xroIdyGtSE5BlgnJfeuJVrocdSwm
         KIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748993; x=1783353793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYy6xXF8MaED0vNKkW6N6rV7TnotRm2+S9TnnA76Mfs=;
        b=E3ZsiRMTu02O5g7VRl+PUDUo+Q1lEOWlC9pgLQ0zRFw1cQWW3JseUhoRHixHLNjSCU
         uVZMNkhyHB8jCu3kODj+tqMhNuwyghbw0kbOlOn9h1GHWl+dNrmgvrI4hQLz1oSJD7KM
         U52a2CkMAmb8Ly0ZzG9wPbpu48cIKlmTrd3C4ODoqcGXdoL01IK8uYfd8GrBmXG7dVy6
         DV3/58XETyY3YfpYtG5frDP8cGyrT40R+XPI7rDCFRIGy/9quD1DeHCSTJxBA6YRT6GS
         lQd+X55KUdWAcXn+e+J8sFHNeXwhKVHSOe7GDUcd7nqAW7aPb0Bp4uGbGtXofhLNEjwJ
         KWmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtH3ZqdLWyPlrHZrUBxPDs3N5WKNv5uPT8BXxLlFtGc2G6gHqnja9DD9Nq3hMIrPLqNjpOIQuP4ETOyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwjDim2Lp8GS7rxHxc5OTT3ngraADejVUzQ8PBj88rkchNH9Lk
	n/wa50QtEg2f7FpBHXNTM+xNMDixtj58dqjtAiCFgg1RJZD0iJ6bT0cOYc4b8w==
X-Gm-Gg: AfdE7cnhvnNnlI1dsg6H14hSMgxXJr+4lsdQE7hBHLzdPBCZ04tu3AMz1WFkKwVfn6x
	QEIxMSXG+Yj7zElRViQivqGCUeEWVW2frE9EsLIRwuGa6/+U3zZHhJPm/0/er4YnmpAlMfLoP/I
	NfTNRFz+G8l9cB4ulnCLzI/7czSj9heH4gKR4w6Jf0ukbXjiLARasulKUZlKEoZMnpqwQgYJWxy
	Ttv74mRs4+Zfz2CfT1FJrBjUizZNLs1FTALBUol7VkmnmTXUTTljD4tLCh3NCxC3kVCqiCE6Z6i
	FPKHniBHlJDatXtcxF+cpNi8ng0GzWylpu88Lvlh+LE5Nqjd7hxIoNBFFoN+pp8vDKA9cwZBDzn
	yj22sG7DzROttqY4pq6y3myRLcop/52JJOi5AMv/+4b6ICemm+cC+Jlsg7bD0COYnnKwYzExNiI
	SVVhXF9wj5flhYbzpZ8dSCAqNlwdAjt6j3lcnfbOMNB20dKOyAQ2JHstcCzBOQBw==
X-Received: by 2002:a05:6870:f103:b0:447:7ad3:329b with SMTP id 586e51a60fabf-448dc46529fmr127747fac.6.1782748992471;
        Mon, 29 Jun 2026 09:03:12 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448db9370c9sm145868fac.1.2026.06.29.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:03:11 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 5/5] media: hws: add HDMI audio capture support
Date: Mon, 29 Jun 2026 12:03:04 -0400
Message-ID: <20260629160304.154046-6-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629160304.154046-1-hoff.benjamin.k@gmail.com>
References: <20260629160304.154046-1-hoff.benjamin.k@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-65996-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 9F62A6DD4A3

From: Ben Hoff <hoff.benjamin.k@gmail.com>

---
 drivers/media/pci/hws/Kconfig     |    3 +-
 drivers/media/pci/hws/Makefile    |    2 +-
 drivers/media/pci/hws/hws.h       |   52 ++
 drivers/media/pci/hws/hws_audio.c | 1183 +++++++++++++++++++++++++++++
 drivers/media/pci/hws/hws_audio.h |   23 +
 drivers/media/pci/hws/hws_irq.c   |   32 +
 drivers/media/pci/hws/hws_pci.c   |  105 ++-
 drivers/media/pci/hws/hws_reg.h   |   42 +-
 drivers/media/pci/hws/hws_video.c |    3 +
 9 files changed, 1422 insertions(+), 23 deletions(-)
 create mode 100644 drivers/media/pci/hws/hws_audio.c
 create mode 100644 drivers/media/pci/hws/hws_audio.h

diff --git a/drivers/media/pci/hws/Kconfig b/drivers/media/pci/hws/Kconfig
index ab0bbf49ca71..93a1b9188738 100644
--- a/drivers/media/pci/hws/Kconfig
+++ b/drivers/media/pci/hws/Kconfig
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_HWS
 	tristate "AVMatrix HWS PCIe capture devices"
-	depends on PCI && VIDEO_DEV
+	depends on PCI && VIDEO_DEV && SND
 	select VIDEOBUF2_DMA_CONTIG
+	select SND_PCM
 	help
 	  Enable support for AVMatrix HWS series multi-channel PCIe capture
 	  devices that provide HDMI video capture.
diff --git a/drivers/media/pci/hws/Makefile b/drivers/media/pci/hws/Makefile
index f9c7dc4f2d8d..51aa2a3a0517 100644
--- a/drivers/media/pci/hws/Makefile
+++ b/drivers/media/pci/hws/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-hws-objs := hws_pci.o hws_irq.o hws_video.o hws_v4l2_ioctl.o
+hws-objs := hws_pci.o hws_irq.o hws_video.o hws_v4l2_ioctl.o hws_audio.o
 
 obj-$(CONFIG_VIDEO_HWS) += hws.o
diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
index 552f0663e5d8..47701e6b4e39 100644
--- a/drivers/media/pci/hws/hws.h
+++ b/drivers/media/pci/hws/hws.h
@@ -12,6 +12,10 @@
 #include <linux/spinlock.h>
 #include <linux/sizes.h>
 #include <linux/atomic.h>
+#include <linux/workqueue.h>
+
+#include <sound/pcm.h>
+#include <sound/core.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -20,6 +24,8 @@
 
 #include "hws_reg.h"
 
+struct snd_pcm_substream;
+
 struct hwsmem_param {
 	u32 index;
 	u32 type;
@@ -131,6 +137,46 @@ static inline void hws_set_current_dv_timings(struct hws_video *vid,
 	};
 }
 
+struct hws_audio {
+	/* linkage */
+	struct hws_pcie_dev *parent;
+	int channel_index;
+
+	/* ALSA */
+	struct snd_pcm_substream *pcm_substream;
+	spinlock_t ring_lock; /* protects ring and period position fields */
+	snd_pcm_uframes_t ring_size_byframes;
+	snd_pcm_uframes_t ring_wpos_byframes;
+	snd_pcm_uframes_t period_size_byframes;
+	snd_pcm_uframes_t period_used_byframes;
+	size_t frame_bytes;
+	size_t hw_packet_bytes;
+
+	/* stream state */
+	bool cap_active;
+	bool stream_running;
+	bool stop_requested;
+	struct mutex scratch_state_lock; /* protects scratch_acquired */
+	bool scratch_acquired;
+
+	/* minimal HW packet tracking */
+	struct work_struct deliver_work;
+	spinlock_t pending_lock; /* protects packet_pending/toggle/irq timestamp */
+	bool packet_pending;
+	bool xrun_pending;
+	u8 pending_toggle;
+	u64 pending_irq_ns;
+	u8 last_period_toggle;
+	u32 irq_count;
+	u32 delivered_count;
+	u32 dropped_packets;
+
+	/* PCM format */
+	u32 output_sample_rate;
+	u16 channel_count;
+	u16 bits_per_sample;
+};
+
 struct hws_scratch_dma {
 	void *cpu;
 	dma_addr_t dma;
@@ -141,10 +187,12 @@ struct hws_scratch_dma {
 struct hws_pcie_dev {
 	/* Core objects */
 	struct pci_dev *pdev;
+	struct hws_audio audio[MAX_VID_CHANNELS];
 	struct hws_video video[MAX_VID_CHANNELS];
 
 	/* BAR and workqueues */
 	void __iomem *bar0_base;
+	struct workqueue_struct *audio_wq;
 
 	/* Device identity and capabilities */
 	u16 vendor_id;
@@ -158,14 +206,18 @@ struct hws_pcie_dev {
 	u32 max_hw_video_buf_sz;
 	u8 max_channels;
 	u8 cur_max_video_ch;
+	/* Independently capturable embedded audio inputs exposed as ALSA PCMs. */
 	u8 cur_max_audio_ch;
 	bool start_run;
 
 	bool buf_allocated;
+	u32 audio_pkt_size;
 
 	/* V4L2 framework objects */
 	struct v4l2_device v4l2_device;
 
+	struct snd_card *snd_card;
+
 	/* Kernel thread */
 	struct task_struct *main_task;
 	struct mutex scratch_lock; /* protects scratch DMA arenas and user refs */
diff --git a/drivers/media/pci/hws/hws_audio.c b/drivers/media/pci/hws/hws_audio.c
new file mode 100644
index 000000000000..674d6363a7ff
--- /dev/null
+++ b/drivers/media/pci/hws/hws_audio.c
@@ -0,0 +1,1183 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "hws_audio.h"
+
+#include "hws.h"
+#include "hws_reg.h"
+
+#include <sound/core.h>
+#include <sound/pcm_params.h>
+#include <sound/control.h>
+#include <sound/pcm.h>
+#include <sound/rawmidi.h>
+#include <sound/initval.h>
+#include <linux/ktime.h>
+#include <linux/preempt.h>
+#include "hws_video.h"
+
+static inline void hws_audio_ack_pending(struct hws_pcie_dev *hws,
+					 unsigned int ch);
+static void hws_audio_disable_capture_and_ack(struct hws_pcie_dev *hws,
+					      unsigned int ch);
+static void hws_audio_clear_pending(struct hws_audio *a);
+static void hws_audio_deliver_work(struct work_struct *work);
+static void hws_audio_drain_channel_work(struct hws_audio *a);
+static void hws_audio_discard_stale_done(struct hws_pcie_dev *hws,
+					 struct hws_audio *a,
+					 unsigned int ch);
+
+static void hws_audio_reset_ring_state(struct hws_audio *a)
+{
+	unsigned long flags;
+
+	if (!a)
+		return;
+
+	spin_lock_irqsave(&a->ring_lock, flags);
+	a->ring_size_byframes = 0;
+	a->ring_wpos_byframes = 0;
+	a->period_size_byframes = 0;
+	a->period_used_byframes = 0;
+	a->frame_bytes = 0;
+	spin_unlock_irqrestore(&a->ring_lock, flags);
+}
+
+static void hws_audio_reset_counters(struct hws_audio *a)
+{
+	if (!a)
+		return;
+
+	WRITE_ONCE(a->last_period_toggle, 0xFF);
+	WRITE_ONCE(a->irq_count, 0);
+	WRITE_ONCE(a->delivered_count, 0);
+	WRITE_ONCE(a->dropped_packets, 0);
+}
+
+static void hws_audio_reset_runtime_state(struct hws_audio *a)
+{
+	if (!a)
+		return;
+
+	hws_audio_clear_pending(a);
+	hws_audio_reset_ring_state(a);
+	hws_audio_reset_counters(a);
+}
+
+static bool hws_audio_publish_stopped(struct hws_audio *a)
+{
+	unsigned long flags;
+	bool was_running;
+
+	if (!a)
+		return false;
+
+	spin_lock_irqsave(&a->ring_lock, flags);
+	was_running = READ_ONCE(a->stream_running) ||
+		      READ_ONCE(a->cap_active);
+	WRITE_ONCE(a->stream_running, false);
+	WRITE_ONCE(a->cap_active, false);
+	WRITE_ONCE(a->stop_requested, true);
+	spin_unlock_irqrestore(&a->ring_lock, flags);
+	/*
+	 * IRQ handlers test these flags before touching scratch buffers or
+	 * ALSA pointers. Publish the no-stream state before ACAP is disabled
+	 * and before any teardown clears pcm_substream.
+	 */
+	smp_wmb();
+	return was_running;
+}
+
+static void hws_audio_quiesce_capture(struct hws_pcie_dev *hws,
+				      unsigned int ch, bool sync_irq)
+{
+	struct hws_audio *a;
+
+	if (!hws || ch >= hws->cur_max_audio_ch)
+		return;
+
+	a = &hws->audio[ch];
+	hws_audio_publish_stopped(a);
+
+	hws_audio_disable_capture_and_ack(hws, ch);
+
+	if (sync_irq && hws->irq >= 0 && !in_interrupt())
+		synchronize_irq(hws->irq);
+
+	if (!in_interrupt())
+		hws_audio_drain_channel_work(a);
+
+	hws_audio_reset_runtime_state(a);
+}
+
+#define HWS_AUDIO_PACKET_BYTES      MAX_DMA_AUDIO_PK_SIZE
+#define HWS_AUDIO_PERIODS_MIN       4U
+#define HWS_AUDIO_PERIODS_MAX       16U
+#define HWS_AUDIO_PERIOD_BYTES_MAX  (HWS_AUDIO_PACKET_BYTES * 4U)
+#define HWS_AUDIO_BUFFER_BYTES_MAX  (HWS_AUDIO_PACKET_BYTES * HWS_AUDIO_PERIODS_MAX)
+
+/*
+ * Audio DMA completes in fixed-size packets. The driver copies whole packets
+ * into ALSA's ring, so expose packet-sized period and buffer granularity.
+ */
+static const struct snd_pcm_hardware audio_pcm_hardware = {
+	.info = (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_BLOCK_TRANSFER | SNDRV_PCM_INFO_RESUME |
+		 SNDRV_PCM_INFO_MMAP_VALID),
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.rates = SNDRV_PCM_RATE_48000,
+	.rate_min = 48000,
+	.rate_max = 48000,
+	.channels_min = 2,
+	.channels_max = 2,
+	.buffer_bytes_max = HWS_AUDIO_BUFFER_BYTES_MAX,
+	.period_bytes_min = HWS_AUDIO_PACKET_BYTES,
+	.period_bytes_max = HWS_AUDIO_PERIOD_BYTES_MAX,
+	.periods_min = HWS_AUDIO_PERIODS_MIN,
+	.periods_max = HWS_AUDIO_PERIODS_MAX,
+};
+
+static bool hws_audio_select_buffer(struct hws_pcie_dev *hws, unsigned int ch,
+				    void **cpu_base, dma_addr_t *dma_base,
+				    size_t *size)
+{
+	struct hws_scratch_dma *scratch;
+
+	if (!hws || ch >= hws->cur_max_audio_ch)
+		return false;
+
+	scratch = &hws->scratch_aud[ch];
+	if (!scratch->cpu || !scratch->size)
+		return false;
+
+	if (cpu_base)
+		*cpu_base = scratch->cpu;
+	if (dma_base)
+		*dma_base = scratch->dma;
+	if (size)
+		*size = scratch->size;
+	return true;
+}
+
+static int hws_guard_audio_video_remap_page(struct hws_pcie_dev *hws,
+					    unsigned int ch)
+{
+	struct hws_video *vid;
+	dma_addr_t audio_dma;
+	u32 audio_hi, audio_page;
+
+	if (!hws || ch >= hws->cur_max_audio_ch)
+		return -EINVAL;
+	if (ch >= hws->cur_max_video_ch)
+		return 0;
+
+	vid = &hws->video[ch];
+	if (!READ_ONCE(vid->cap_active) || !vid->window_valid)
+		return 0;
+
+	if (!hws_audio_select_buffer(hws, ch, NULL, &audio_dma, NULL))
+		return -ENOMEM;
+
+	audio_hi = upper_32_bits(audio_dma);
+	audio_page = lower_32_bits(audio_dma) & PCI_E_BAR_ADD_MASK;
+	if (audio_hi == vid->last_dma_hi && audio_page == vid->last_dma_page)
+		return 0;
+
+	dev_warn_ratelimited(&hws->pdev->dev,
+			     "audio ch%u DMA page differs from active video remap slot; refusing shared-window conflict (audio=%pad video_hi=0x%08x video_page=0x%08x)\n",
+			     ch, &audio_dma, vid->last_dma_hi,
+			     vid->last_dma_page);
+	return -EBUSY;
+}
+
+static void hws_audio_program_remap_slot(struct hws_pcie_dev *hws,
+					 u32 table_off, u32 hi, u32 page_lo)
+{
+	writel_relaxed(hi, hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off);
+	writel_relaxed(page_lo, hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off +
+		       PCIE_BARADDROFSIZE);
+}
+
+static int hws_audio_seed_capture_buffer(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	dma_addr_t dma;
+	u32 lo, hi, pci_addr;
+	u32 audio_table_off;
+
+	if (!hws || ch >= hws->cur_max_audio_ch)
+		return -EINVAL;
+
+	if (!hws_audio_select_buffer(hws, ch, NULL, &dma, NULL))
+		return -ENOMEM;
+
+	lo = lower_32_bits(dma);
+	hi = upper_32_bits(dma);
+	pci_addr = lo & PCI_E_BAR_ADD_LOWMASK;
+	lo &= PCI_E_BAR_ADD_MASK;
+	audio_table_off = HWS_AUDIO_REMAP_SLOT_OFF(ch);
+	hws_audio_program_remap_slot(hws, audio_table_off, hi, lo);
+	writel_relaxed((ch + 1u) * PCIEBAR_AXI_BASE + pci_addr,
+		       hws->bar0_base + HWS_REG_AUD_DMA_ADDR(ch));
+	(void)readl(hws->bar0_base + HWS_REG_AUD_DMA_ADDR(ch));
+	return 0;
+}
+
+void hws_audio_seed_channels(struct hws_pcie_dev *hws)
+{
+	unsigned int ch;
+
+	if (!hws || !hws->bar0_base)
+		return;
+
+	for (ch = 0; ch < hws->cur_max_audio_ch; ch++) {
+		int ret;
+
+		if (!hws->scratch_aud[ch].cpu)
+			continue;
+
+		ret = hws_audio_seed_capture_buffer(hws, ch);
+		if (ret)
+			dev_warn(&hws->pdev->dev,
+				 "audio seed ch%u failed ret=%d\n", ch, ret);
+	}
+}
+
+static size_t hws_audio_packet_offset(const struct hws_audio *a, u8 cur_toggle)
+{
+	size_t packet = a->hw_packet_bytes;
+
+	/*
+	 * ABUF_TOGGLE reports the half the device is filling now, so the
+	 * completed packet is the other half.
+	 */
+	return cur_toggle ? 0 : packet;
+}
+
+static void hws_audio_clear_pending(struct hws_audio *a)
+{
+	unsigned long flags;
+
+	if (!a)
+		return;
+
+	spin_lock_irqsave(&a->pending_lock, flags);
+	a->packet_pending = false;
+	a->xrun_pending = false;
+	a->pending_irq_ns = 0;
+	spin_unlock_irqrestore(&a->pending_lock, flags);
+}
+
+static void hws_audio_report_xrun(struct hws_audio *a)
+{
+	struct hws_pcie_dev *hws;
+	struct snd_pcm_substream *ss;
+	unsigned long flags;
+	unsigned int ch;
+
+	if (!a)
+		return;
+
+	hws = a->parent;
+	ch = a->channel_index;
+	ss = READ_ONCE(a->pcm_substream);
+
+	hws_audio_publish_stopped(a);
+	hws_audio_disable_capture_and_ack(hws, ch);
+	hws_audio_clear_pending(a);
+
+	if (!ss)
+		return;
+
+	snd_pcm_stream_lock_irqsave(ss, flags);
+	if (ss->runtime && READ_ONCE(a->pcm_substream) == ss)
+		snd_pcm_stop(ss, SNDRV_PCM_STATE_XRUN);
+	snd_pcm_stream_unlock_irqrestore(ss, flags);
+}
+
+static void hws_audio_drain_channel_work(struct hws_audio *a)
+{
+	if (!a)
+		return;
+
+	if (!in_interrupt())
+		cancel_work_sync(&a->deliver_work);
+	hws_audio_clear_pending(a);
+}
+
+static int hws_audio_acquire_scratch(struct hws_audio *a)
+{
+	struct hws_pcie_dev *hws;
+	unsigned int ch;
+	int ret;
+
+	if (!a || !a->parent)
+		return -EINVAL;
+
+	mutex_lock(&a->scratch_state_lock);
+	if (READ_ONCE(a->scratch_acquired)) {
+		mutex_unlock(&a->scratch_state_lock);
+		return 0;
+	}
+
+	hws = a->parent;
+	ch = a->channel_index;
+	ret = hws_alloc_channel_scratch(hws, ch);
+	if (ret) {
+		mutex_unlock(&a->scratch_state_lock);
+		return ret;
+	}
+
+	WRITE_ONCE(a->scratch_acquired, true);
+	mutex_unlock(&a->scratch_state_lock);
+	return 0;
+}
+
+static void hws_audio_release_scratch(struct hws_audio *a)
+{
+	struct hws_pcie_dev *hws;
+	unsigned int ch;
+
+	if (!a)
+		return;
+
+	mutex_lock(&a->scratch_state_lock);
+	if (!a->scratch_acquired) {
+		mutex_unlock(&a->scratch_state_lock);
+		return;
+	}
+
+	WRITE_ONCE(a->scratch_acquired, false);
+	hws = a->parent;
+	ch = a->channel_index;
+	mutex_unlock(&a->scratch_state_lock);
+
+	if (hws)
+		hws_release_channel_scratch(hws, ch);
+}
+
+static bool hws_audio_deliver_packet(struct hws_audio *a, const void *src)
+{
+	struct snd_pcm_substream *ss;
+	struct snd_pcm_runtime *rt;
+	snd_pcm_uframes_t frames, ring_pos, ring_frames, period_frames;
+	size_t frame_bytes, packet_bytes, ring_bytes, first;
+	unsigned long flags;
+	unsigned int elapsed = 0;
+	bool delivered = false;
+	char *dst;
+
+	if (!READ_ONCE(a->stream_running) || !READ_ONCE(a->cap_active) ||
+	    READ_ONCE(a->stop_requested))
+		return false;
+
+	ss = READ_ONCE(a->pcm_substream);
+	if (!ss)
+		return false;
+
+	rt = ss->runtime;
+	if (!rt || !rt->dma_area)
+		return false;
+
+	spin_lock_irqsave(&a->ring_lock, flags);
+	if (!READ_ONCE(a->stream_running) || !READ_ONCE(a->cap_active) ||
+	    READ_ONCE(a->stop_requested) ||
+	    READ_ONCE(a->pcm_substream) != ss) {
+		spin_unlock_irqrestore(&a->ring_lock, flags);
+		return false;
+	}
+
+	frame_bytes = a->frame_bytes;
+	packet_bytes = a->hw_packet_bytes;
+	ring_frames = a->ring_size_byframes;
+	period_frames = a->period_size_byframes;
+	if (!frame_bytes || !packet_bytes || !ring_frames || !period_frames)
+		goto out_unlock;
+	if (packet_bytes % frame_bytes)
+		goto out_unlock;
+
+	frames = packet_bytes / frame_bytes;
+	if (!frames)
+		goto out_unlock;
+
+	ring_pos = a->ring_wpos_byframes;
+	ring_bytes = ring_frames * frame_bytes;
+	dst = rt->dma_area + ring_pos * frame_bytes;
+	first = min(packet_bytes, ring_bytes - ring_pos * frame_bytes);
+	memcpy(dst, src, first);
+	if (first < packet_bytes)
+		memcpy(rt->dma_area, (const char *)src + first, packet_bytes - first);
+	delivered = true;
+
+	ring_pos += frames;
+	if (ring_pos >= ring_frames)
+		ring_pos %= ring_frames;
+	a->ring_wpos_byframes = ring_pos;
+
+	a->period_used_byframes += frames;
+	while (a->period_used_byframes >= period_frames) {
+		a->period_used_byframes -= period_frames;
+		elapsed++;
+	}
+out_unlock:
+	spin_unlock_irqrestore(&a->ring_lock, flags);
+
+	if (!READ_ONCE(a->stream_running) || !READ_ONCE(a->cap_active) ||
+	    READ_ONCE(a->stop_requested))
+		return delivered;
+
+	while (elapsed--)
+		snd_pcm_period_elapsed(ss);
+	return delivered;
+}
+
+static bool hws_audio_packet_stale(struct hws_audio *a, u64 irq_ns)
+{
+	u64 packet_ns;
+	size_t frame_bytes;
+	u32 rate;
+	u64 frames;
+
+	if (!a || !irq_ns)
+		return false;
+
+	frame_bytes = READ_ONCE(a->frame_bytes);
+	rate = READ_ONCE(a->output_sample_rate);
+	if (!frame_bytes || !rate || a->hw_packet_bytes % frame_bytes)
+		return false;
+
+	frames = a->hw_packet_bytes / frame_bytes;
+	if (!frames)
+		return false;
+
+	packet_ns = div_u64(frames * NSEC_PER_SEC, rate);
+	return ktime_get_mono_fast_ns() - irq_ns >= packet_ns;
+}
+
+static void hws_audio_deliver_one_packet(struct hws_audio *a, u8 cur_toggle)
+{
+	struct hws_pcie_dev *hws;
+	unsigned int ch;
+	void *cpu;
+	size_t size;
+	size_t offset;
+
+	if (!a)
+		return;
+
+	hws = a->parent;
+	ch = a->channel_index;
+	if (!hws || ch >= hws->cur_max_audio_ch)
+		return;
+
+	if (!READ_ONCE(a->stream_running) || !READ_ONCE(a->cap_active) ||
+	    READ_ONCE(a->stop_requested))
+		return;
+
+	if (!hws_audio_select_buffer(hws, ch, &cpu, NULL, &size))
+		return;
+
+	offset = hws_audio_packet_offset(a, cur_toggle);
+	if (offset + a->hw_packet_bytes > size)
+		return;
+
+	dma_rmb();
+	if (hws_audio_deliver_packet(a, (char *)cpu + offset))
+		WRITE_ONCE(a->delivered_count,
+			   READ_ONCE(a->delivered_count) + 1);
+}
+
+static void hws_audio_deliver_work(struct work_struct *work)
+{
+	struct hws_audio *a = container_of(work, struct hws_audio, deliver_work);
+	unsigned long flags;
+	u64 irq_ns;
+	u8 toggle;
+
+	for (;;) {
+		spin_lock_irqsave(&a->pending_lock, flags);
+		if (a->xrun_pending) {
+			a->xrun_pending = false;
+			a->packet_pending = false;
+			a->pending_irq_ns = 0;
+			spin_unlock_irqrestore(&a->pending_lock, flags);
+			hws_audio_report_xrun(a);
+			break;
+		}
+		if (!a->packet_pending) {
+			spin_unlock_irqrestore(&a->pending_lock, flags);
+			break;
+		}
+		toggle = a->pending_toggle;
+		irq_ns = a->pending_irq_ns;
+		a->packet_pending = false;
+		a->pending_irq_ns = 0;
+		spin_unlock_irqrestore(&a->pending_lock, flags);
+
+		if (hws_audio_packet_stale(a, irq_ns)) {
+			WRITE_ONCE(a->dropped_packets,
+				   READ_ONCE(a->dropped_packets) + 1);
+			hws_audio_report_xrun(a);
+			break;
+		}
+
+		hws_audio_deliver_one_packet(a, toggle);
+	}
+}
+
+void hws_audio_queue_interrupt(struct hws_pcie_dev *hws, unsigned int ch, u8 cur_toggle)
+{
+	struct workqueue_struct *wq;
+	struct hws_audio *a;
+
+	if (!hws || ch >= hws->cur_max_audio_ch)
+		return;
+
+	a = &hws->audio[ch];
+	if (!READ_ONCE(a->stream_running) || !READ_ONCE(a->cap_active) ||
+	    READ_ONCE(a->stop_requested))
+		return;
+
+	wq = READ_ONCE(hws->audio_wq);
+	if (!wq) {
+		WRITE_ONCE(a->dropped_packets,
+			   READ_ONCE(a->dropped_packets) + 1);
+		return;
+	}
+
+	WRITE_ONCE(a->last_period_toggle, cur_toggle);
+	spin_lock(&a->pending_lock);
+	if (a->packet_pending) {
+		WRITE_ONCE(a->dropped_packets,
+			   READ_ONCE(a->dropped_packets) + 1);
+		a->xrun_pending = true;
+	}
+	a->pending_toggle = cur_toggle;
+	a->pending_irq_ns = ktime_get_mono_fast_ns();
+	a->packet_pending = true;
+	WRITE_ONCE(a->irq_count, READ_ONCE(a->irq_count) + 1);
+	spin_unlock(&a->pending_lock);
+
+	queue_work(wq, &a->deliver_work);
+}
+
+int hws_audio_init_channel(struct hws_pcie_dev *pdev, int ch)
+{
+	struct hws_audio *aud;
+
+	if (!pdev || ch < 0 || ch >= pdev->max_channels)
+		return -EINVAL;
+
+	aud = &pdev->audio[ch];
+	memset(aud, 0, sizeof(*aud));     /* ok: no embedded locks yet */
+
+	/* identity */
+	aud->parent        = pdev;
+	aud->channel_index = ch;
+	spin_lock_init(&aud->ring_lock);
+	spin_lock_init(&aud->pending_lock);
+	mutex_init(&aud->scratch_state_lock);
+	INIT_WORK(&aud->deliver_work, hws_audio_deliver_work);
+
+	/* defaults */
+	aud->output_sample_rate = 48000;
+	aud->channel_count      = 2;
+	aud->bits_per_sample    = 16;
+	aud->hw_packet_bytes    = pdev->audio_pkt_size;
+
+	/* ALSA linkage */
+	WRITE_ONCE(aud->pcm_substream, NULL);
+
+	/* stream state */
+	WRITE_ONCE(aud->cap_active, false);
+	WRITE_ONCE(aud->stream_running, false);
+	WRITE_ONCE(aud->stop_requested, false);
+	WRITE_ONCE(aud->scratch_acquired, false);
+
+	hws_audio_reset_counters(aud);
+
+	return 0;
+}
+
+void hws_audio_cleanup_channel(struct hws_pcie_dev *pdev, int ch, bool device_removal)
+{
+	struct hws_audio *aud;
+	struct snd_pcm_substream *ss;
+
+	if (!pdev || ch < 0 || ch >= pdev->cur_max_audio_ch)
+		return;
+
+	aud = &pdev->audio[ch];
+	hws_audio_quiesce_capture(pdev, ch, true);
+
+	/* If device is going away and stream was open, tell ALSA. */
+	ss = READ_ONCE(aud->pcm_substream);
+	if (device_removal && ss) {
+		unsigned long flags;
+
+		snd_pcm_stream_lock_irqsave(ss, flags);
+		if (ss->runtime)
+			snd_pcm_stop(ss, SNDRV_PCM_STATE_DISCONNECTED);
+		snd_pcm_stream_unlock_irqrestore(ss, flags);
+		WRITE_ONCE(aud->pcm_substream, NULL);
+	}
+
+	hws_audio_release_scratch(aud);
+}
+
+static inline bool hws_check_audio_capture(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	u32 reg = readl(hws->bar0_base + HWS_REG_ACAP_ENABLE);
+
+	return !!(reg & BIT(ch));
+}
+
+static int hws_audio_hw_ready(struct hws_pcie_dev *hws)
+{
+	u32 status;
+
+	if (!hws || !hws->bar0_base)
+		return -ENODEV;
+
+	status = readl(hws->bar0_base + HWS_REG_SYS_STATUS);
+	if (status == 0xFFFFFFFF) {
+		hws->pci_lost = true;
+		dev_err(&hws->pdev->dev, "PCIe device not responding\n");
+		return -ENODEV;
+	}
+
+	if (!(status & BIT(0))) {
+		dev_warn_ratelimited(&hws->pdev->dev,
+				     "audio start refused while device is not ready (SYS_STATUS=0x%08x)\n",
+				     status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int hws_start_audio_capture(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	struct hws_audio *a;
+	int ret;
+
+	if (!hws || ch >= hws->cur_max_audio_ch)
+		return -EINVAL;
+	a = &hws->audio[ch];
+
+	/* Already running? Re-assert HW if needed. */
+	if (READ_ONCE(a->stream_running)) {
+		if (!hws_check_audio_capture(hws, ch)) {
+			ret = hws_audio_hw_ready(hws);
+			if (ret)
+				return ret;
+			ret = hws_guard_audio_video_remap_page(hws, ch);
+			if (ret)
+				return ret;
+			ret = hws_audio_seed_capture_buffer(hws, ch);
+			if (ret)
+				return ret;
+			WRITE_ONCE(a->cap_active, false);
+			smp_wmb(); /* publish inactive before stale ADONE ack */
+			hws_audio_discard_stale_done(hws, a, ch);
+			WRITE_ONCE(a->cap_active, true);
+			smp_wmb(); /* publish active before ACAP_ENABLE */
+			hws_enable_audio_capture(hws, ch, true);
+		}
+		dev_dbg(&hws->pdev->dev, "audio ch%u already running (re-enabled)\n", ch);
+		return 0;
+	}
+
+	if (!READ_ONCE(a->scratch_acquired))
+		return -ENOMEM;
+
+	ret = hws_audio_hw_ready(hws);
+	if (ret)
+		return ret;
+
+	ret = hws_guard_audio_video_remap_page(hws, ch);
+	if (ret)
+		return ret;
+
+	ret = hws_audio_seed_capture_buffer(hws, ch);
+	if (ret)
+		return ret;
+
+	hws_audio_discard_stale_done(hws, a, ch);
+	hws_audio_reset_counters(a);
+
+	/*
+	 * ADONE can fire as soon as capture is enabled. Discard any completion
+	 * latched before this start, then publish the stream state before
+	 * ACAP_ENABLE so the IRQ path accepts the first fresh packet.
+	 */
+	WRITE_ONCE(a->stop_requested, false);
+	WRITE_ONCE(a->stream_running, true);
+	WRITE_ONCE(a->cap_active, true);
+	smp_wmb(); /* publish start state before ACAP_ENABLE */
+
+	/* Kick HW */
+	hws_enable_audio_capture(hws, ch, true);
+	return 0;
+}
+
+static inline void hws_audio_ack_pending(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	u32 abit = HWS_INT_ADONE_BIT(ch);
+	u32 st;
+
+	if (!hws || !hws->bar0_base || ch >= hws->cur_max_audio_ch)
+		return;
+
+	st = readl(hws->bar0_base + HWS_REG_INT_STATUS);
+
+	if (st & abit) {
+		writel(abit, hws->bar0_base + HWS_REG_INT_ACK);
+		/* flush posted write */
+		readl(hws->bar0_base + HWS_REG_INT_STATUS);
+	}
+}
+
+static void hws_audio_discard_stale_done(struct hws_pcie_dev *hws,
+					 struct hws_audio *a,
+					 unsigned int ch)
+{
+	hws_audio_clear_pending(a);
+	hws_audio_ack_pending(hws, ch);
+}
+
+static void hws_audio_disable_capture_and_ack(struct hws_pcie_dev *hws,
+					      unsigned int ch)
+{
+	if (!hws || !hws->bar0_base || ch >= hws->cur_max_audio_ch)
+		return;
+
+	hws_enable_audio_capture(hws, ch, false);
+	readl(hws->bar0_base + HWS_REG_INT_STATUS);
+	hws_audio_ack_pending(hws, ch);
+}
+
+static inline void hws_audio_ack_all(struct hws_pcie_dev *hws)
+{
+	u32 mask = 0;
+
+	if (!hws || !hws->bar0_base)
+		return;
+
+	for (unsigned int ch = 0; ch < hws->cur_max_audio_ch; ch++)
+		mask |= HWS_INT_ADONE_BIT(ch);
+	if (mask) {
+		writel(mask, hws->bar0_base + HWS_REG_INT_ACK);
+		readl(hws->bar0_base + HWS_REG_INT_STATUS);
+	}
+}
+
+static void hws_stop_audio_capture(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	struct hws_audio *a;
+
+	if (!hws || ch >= hws->cur_max_audio_ch)
+		return;
+
+	a = &hws->audio[ch];
+	if (!READ_ONCE(a->stream_running) && !READ_ONCE(a->cap_active))
+		return;
+
+	hws_audio_publish_stopped(a);
+	hws_audio_disable_capture_and_ack(hws, ch);
+	hws_audio_clear_pending(a);
+	dev_dbg(&hws->pdev->dev, "audio capture stopped on ch %u\n", ch);
+}
+
+void hws_enable_audio_capture(struct hws_pcie_dev *hws,
+			      unsigned int ch, bool enable)
+{
+	u32 reg, mask = BIT(ch);
+
+	if (!hws || ch >= hws->cur_max_audio_ch || hws->pci_lost)
+		return;
+
+	reg = readl(hws->bar0_base + HWS_REG_ACAP_ENABLE);
+	if (enable)
+		reg |= mask;
+	else
+		reg &= ~mask;
+
+	writel(reg, hws->bar0_base + HWS_REG_ACAP_ENABLE);
+
+	dev_dbg(&hws->pdev->dev, "audio capture %s ch%u, reg=0x%08x\n",
+		enable ? "enabled" : "disabled", ch, reg);
+}
+
+static snd_pcm_uframes_t hws_pcie_audio_pointer(struct snd_pcm_substream *substream)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+	snd_pcm_uframes_t pos;
+	unsigned long flags;
+
+	spin_lock_irqsave(&a->ring_lock, flags);
+	pos = a->ring_wpos_byframes;
+	spin_unlock_irqrestore(&a->ring_lock, flags);
+	return pos;
+}
+
+static int hws_pcie_audio_open(struct snd_pcm_substream *substream)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	int ret;
+
+	rt->hw = audio_pcm_hardware;
+
+	ret = snd_pcm_hw_constraint_integer(rt, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+	ret = snd_pcm_hw_constraint_step(rt, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+					 HWS_AUDIO_PACKET_BYTES);
+	if (ret < 0)
+		return ret;
+	ret = snd_pcm_hw_constraint_step(rt, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 HWS_AUDIO_PACKET_BYTES);
+	if (ret < 0)
+		return ret;
+
+	WRITE_ONCE(a->pcm_substream, substream);
+	return 0;
+}
+
+static int hws_pcie_audio_close(struct snd_pcm_substream *substream)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+
+	hws_stop_audio_capture(a->parent, a->channel_index);
+	hws_audio_drain_channel_work(a);
+	hws_audio_reset_runtime_state(a);
+	hws_audio_release_scratch(a);
+	WRITE_ONCE(a->pcm_substream, NULL);
+	return 0;
+}
+
+static int hws_pcie_audio_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *hw_params)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+	struct hws_pcie_dev *hws = a->parent;
+	int pages_changed;
+	int ret;
+
+	if (!hws)
+		return -ENODEV;
+
+	ret = hws_check_card_status(hws);
+	if (ret)
+		return ret;
+
+	pages_changed = snd_pcm_lib_malloc_pages(substream,
+						 params_buffer_bytes(hw_params));
+	if (pages_changed < 0)
+		return pages_changed;
+
+	ret = hws_audio_acquire_scratch(a);
+	if (ret) {
+		snd_pcm_lib_free_pages(substream);
+		return ret;
+	}
+
+	ret = hws_guard_audio_video_remap_page(hws, a->channel_index);
+	if (ret) {
+		hws_audio_release_scratch(a);
+		snd_pcm_lib_free_pages(substream);
+		return ret;
+	}
+
+	return pages_changed;
+}
+
+static int hws_pcie_audio_hw_free(struct snd_pcm_substream *substream)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+	int ret;
+
+	hws_stop_audio_capture(a->parent, a->channel_index);
+	hws_audio_drain_channel_work(a);
+	hws_audio_reset_runtime_state(a);
+	hws_audio_release_scratch(a);
+	ret = snd_pcm_lib_free_pages(substream);
+	return ret;
+}
+
+static int hws_pcie_audio_prepare(struct snd_pcm_substream *substream)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	unsigned long flags;
+	size_t frame_bytes;
+
+	frame_bytes = snd_pcm_format_physical_width(rt->format) / 8;
+	frame_bytes *= rt->channels;
+	if (!frame_bytes || a->hw_packet_bytes % frame_bytes)
+		return -EINVAL;
+
+	spin_lock_irqsave(&a->ring_lock, flags);
+	a->ring_size_byframes = rt->buffer_size;
+	a->ring_wpos_byframes = 0;
+	a->period_size_byframes = rt->period_size;
+	a->period_used_byframes = 0;
+	a->frame_bytes = frame_bytes;
+	spin_unlock_irqrestore(&a->ring_lock, flags);
+
+	hws_audio_reset_counters(a);
+	hws_audio_clear_pending(a);
+	return 0;
+}
+
+static int hws_pcie_audio_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+	struct hws_pcie_dev *hws = a->parent;
+	unsigned int ch = a->channel_index;
+
+	dev_dbg(&hws->pdev->dev, "audio trigger %d on ch %u\n", cmd, ch);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		return hws_start_audio_capture(hws, ch);
+	case SNDRV_PCM_TRIGGER_STOP:
+		hws_stop_audio_capture(hws, ch);
+		return 0;
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		return hws_start_audio_capture(hws, ch);
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		hws_stop_audio_capture(hws, ch);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct snd_pcm_ops hws_pcie_pcm_ops = {
+	.open      = hws_pcie_audio_open,
+	.close     = hws_pcie_audio_close,
+	.ioctl     = snd_pcm_lib_ioctl,
+	.hw_params = hws_pcie_audio_hw_params,
+	.hw_free   = hws_pcie_audio_hw_free,
+	.prepare   = hws_pcie_audio_prepare,
+	.trigger   = hws_pcie_audio_trigger,
+	.pointer   = hws_pcie_audio_pointer,
+};
+
+int hws_audio_register(struct hws_pcie_dev *hws)
+{
+	struct snd_card *card = NULL;
+	struct snd_pcm  *pcm  = NULL;
+	char card_id[16];
+	char card_name[64];
+	int i, ret;
+
+	if (!hws)
+		return -EINVAL;
+	if (!hws->cur_max_audio_ch)
+		return 0;
+
+	/* ---- Create a single ALSA card for this PCI function ---- */
+	snprintf(card_id, sizeof(card_id), "hws%u", hws->port_id);     /* <=16 chars */
+	snprintf(card_name, sizeof(card_name), "HWS HDMI Audio %u", hws->port_id);
+
+	ret = snd_card_new(&hws->pdev->dev, -1 /* auto index */,
+			   card_id, THIS_MODULE, 0, &card);
+	if (ret < 0) {
+		dev_err(&hws->pdev->dev, "snd_card_new failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_card_set_dev(card, &hws->pdev->dev);
+	strscpy(card->driver,   KBUILD_MODNAME, sizeof(card->driver));
+	strscpy(card->shortname, card_name,      sizeof(card->shortname));
+	strscpy(card->longname,  card->shortname, sizeof(card->longname));
+
+	/* ---- Create one PCM capture device per HDMI input ---- */
+	for (i = 0; i < hws->cur_max_audio_ch; i++) {
+		char pcm_name[32];
+
+		snprintf(pcm_name, sizeof(pcm_name), "HDMI In %d", i);
+
+		/* device number = i, so userspace sees hw:X,i */
+		ret = snd_pcm_new(card, pcm_name, i,
+				  0 /* playback */, 1 /* capture */, &pcm);
+		if (ret < 0) {
+			dev_err(&hws->pdev->dev, "snd_pcm_new(%d) failed: %d\n", i, ret);
+			goto error_card;
+		}
+
+		pcm->private_data = &hws->audio[i];
+		strscpy(pcm->name, pcm_name, sizeof(pcm->name));
+		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &hws_pcie_pcm_ops);
+
+		/*
+		 * snd_pcm_lib_malloc_pages() requires a valid DMA buffer type.
+		 * Keep allocation dynamic at HW_PARAMS time, but advertise the
+		 * maximum buffer size up front for modern ALSA.
+		 */
+		ret = snd_pcm_set_managed_buffer_all(pcm,
+						     SNDRV_DMA_TYPE_DEV,
+						     &hws->pdev->dev,
+						     0,
+						     audio_pcm_hardware.buffer_bytes_max);
+		if (ret < 0) {
+			dev_err(&hws->pdev->dev,
+				"snd_pcm_set_managed_buffer_all(%d) failed: %d\n",
+				i, ret);
+			goto error_card;
+		}
+	}
+
+	/* Register the card once all PCMs are created */
+	ret = snd_card_register(card);
+	if (ret < 0) {
+		dev_err(&hws->pdev->dev, "snd_card_register failed: %d\n", ret);
+		goto error_card;
+	}
+
+	/* Store the single card handle (optional: also mirror to each channel if you like) */
+	hws->snd_card = card;
+	dev_info(&hws->pdev->dev, "audio registration complete (%d HDMI inputs)\n",
+		 hws->cur_max_audio_ch);
+	return 0;
+
+error_card:
+	/* Frees all PCMs created on it as well */
+	snd_card_free(card);
+	return ret;
+}
+
+void hws_audio_unregister(struct hws_pcie_dev *hws)
+{
+	if (!hws)
+		return;
+
+	/* Prevent new opens and mark existing streams disconnected */
+	if (hws->snd_card)
+		snd_card_disconnect(hws->snd_card);
+
+	for (unsigned int i = 0; i < hws->cur_max_audio_ch; i++) {
+		struct hws_audio *a = &hws->audio[i];
+
+		hws_audio_publish_stopped(a);
+		hws_enable_audio_capture(hws, i, false);
+	}
+
+	/* Flush ACAP disables before waiting for any running IRQ handler. */
+	if (hws->bar0_base)
+		readl(hws->bar0_base + HWS_REG_INT_STATUS);
+	if (hws->irq >= 0 && !in_interrupt())
+		synchronize_irq(hws->irq);
+
+	hws_audio_drain_work(hws);
+	hws_audio_ack_all(hws);
+
+	for (unsigned int i = 0; i < hws->cur_max_audio_ch; i++) {
+		struct hws_audio *a = &hws->audio[i];
+		struct snd_pcm_substream *ss = READ_ONCE(a->pcm_substream);
+
+		if (ss) {
+			unsigned long flags;
+
+			snd_pcm_stream_lock_irqsave(ss, flags);
+			if (ss->runtime)
+				snd_pcm_stop(ss, SNDRV_PCM_STATE_DISCONNECTED);
+			snd_pcm_stream_unlock_irqrestore(ss, flags);
+		}
+
+		WRITE_ONCE(a->pcm_substream, NULL);
+		hws_audio_reset_runtime_state(a);
+		hws_audio_release_scratch(a);
+	}
+
+	if (hws->snd_card) {
+		snd_card_free_when_closed(hws->snd_card);
+		hws->snd_card = NULL;
+	}
+
+	dev_info(&hws->pdev->dev, "audio unregistered (%u channels)\n",
+		 hws->cur_max_audio_ch);
+}
+
+int hws_audio_pm_suspend_all(struct hws_pcie_dev *hws)
+{
+	struct snd_pcm *seen[ARRAY_SIZE(hws->audio)];
+	int seen_cnt = 0;
+	int i, j, ret = 0;
+
+	if (!hws || !hws->snd_card)
+		return 0;
+
+	/* Iterate audio channels and suspend each unique PCM device */
+	for (i = 0; i < hws->cur_max_audio_ch && i < ARRAY_SIZE(hws->audio); i++) {
+		struct hws_audio *a = &hws->audio[i];
+		struct snd_pcm_substream *ss = READ_ONCE(a->pcm_substream);
+		struct snd_pcm *pcm;
+		bool already = false;
+
+		if (!ss)
+			continue;
+
+		pcm = ss->pcm;
+		if (!pcm)
+			continue;
+
+		/* De-duplicate in case multiple channels share a PCM */
+		for (j = 0; j < seen_cnt; j++) {
+			if (seen[j] == pcm) {
+				already = true;
+				break;
+			}
+		}
+		if (already)
+			continue;
+
+		if (seen_cnt < ARRAY_SIZE(seen))
+			seen[seen_cnt++] = pcm;
+
+		if (!ret) {
+			int r = snd_pcm_suspend_all(pcm);
+
+			if (r)
+				ret = r;  /* remember first error, keep going */
+		}
+
+		if (seen_cnt == ARRAY_SIZE(seen))
+			break; /* defensive: shouldn't happen with sane config */
+	}
+
+	return ret;
+}
+
+void hws_audio_pm_resume(struct hws_pcie_dev *hws)
+{
+	unsigned int ch;
+
+	if (!hws || !hws->bar0_base)
+		return;
+
+	for (ch = 0; ch < hws->cur_max_audio_ch && ch < MAX_VID_CHANNELS; ch++) {
+		struct hws_audio *a = &hws->audio[ch];
+
+		WRITE_ONCE(a->stream_running, false);
+		WRITE_ONCE(a->cap_active, false);
+		WRITE_ONCE(a->stop_requested, true);
+		hws_audio_reset_counters(a);
+		hws_audio_clear_pending(a);
+	}
+	hws_audio_seed_channels(hws);
+	hws_audio_ack_all(hws);
+}
+
+void hws_audio_drain_work(struct hws_pcie_dev *hws)
+{
+	unsigned int ch;
+
+	if (!hws)
+		return;
+
+	for (ch = 0; ch < hws->cur_max_audio_ch && ch < MAX_VID_CHANNELS; ch++)
+		hws_audio_drain_channel_work(&hws->audio[ch]);
+}
diff --git a/drivers/media/pci/hws/hws_audio.h b/drivers/media/pci/hws/hws_audio.h
new file mode 100644
index 000000000000..749ab2ebbf35
--- /dev/null
+++ b/drivers/media/pci/hws/hws_audio.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef HWS_AUDIO_PIPELINE_H
+#define HWS_AUDIO_PIPELINE_H
+
+#include <sound/pcm.h>
+#include "hws.h"
+
+int hws_audio_register(struct hws_pcie_dev *dev);
+void hws_audio_unregister(struct hws_pcie_dev *hws);
+void hws_audio_seed_channels(struct hws_pcie_dev *hws);
+void hws_audio_queue_interrupt(struct hws_pcie_dev *hws, unsigned int ch,
+			       u8 cur_toggle);
+void hws_audio_drain_work(struct hws_pcie_dev *hws);
+void hws_enable_audio_capture(struct hws_pcie_dev *hws,
+			      unsigned int ch,
+			      bool enable);
+
+int hws_audio_init_channel(struct hws_pcie_dev *pdev, int ch);
+void hws_audio_cleanup_channel(struct hws_pcie_dev *pdev, int ch, bool device_removal);
+int hws_audio_pm_suspend_all(struct hws_pcie_dev *hws);
+void hws_audio_pm_resume(struct hws_pcie_dev *hws);
+
+#endif /* HWS_AUDIO_PIPELINE_H */
diff --git a/drivers/media/pci/hws/hws_irq.c b/drivers/media/pci/hws/hws_irq.c
index e18f018b15c4..c28d78884788 100644
--- a/drivers/media/pci/hws/hws_irq.c
+++ b/drivers/media/pci/hws/hws_irq.c
@@ -11,6 +11,7 @@
 #include "hws_reg.h"
 #include "hws_video.h"
 #include "hws.h"
+#include "hws_audio.h"
 
 #define MAX_INT_LOOPS 100
 
@@ -314,6 +315,36 @@ static bool hws_irq_queue_video(struct hws_pcie_dev *pdx, u32 int_state)
 	return wake_thread;
 }
 
+static void hws_irq_handle_audio(struct hws_pcie_dev *pdx, u32 int_state)
+{
+	unsigned int ch;
+
+	for (ch = 0; ch < pdx->cur_max_audio_ch; ++ch) {
+		u32 abit = HWS_INT_ADONE_BIT(ch);
+		u8 cur_toggle;
+
+		if (!(int_state & abit))
+			continue;
+
+		/* Only service running streams */
+		if (!READ_ONCE(pdx->audio[ch].cap_active) ||
+		    !READ_ONCE(pdx->audio[ch].stream_running) ||
+		    READ_ONCE(pdx->audio[ch].stop_requested))
+			continue;
+
+		/*
+		 * Baseline read ABUF_TOGGLE for every ADONE interrupt.
+		 * The register reports the half the device is filling now, so
+		 * the completed packet is the opposite half. Read it in the
+		 * hard handler so the deferred audio work receives the edge's
+		 * toggle value, not a later one.
+		 */
+		cur_toggle = readl_relaxed(pdx->bar0_base +
+					   HWS_REG_ABUF_TOGGLE(ch)) & 0x01;
+		hws_audio_queue_interrupt(pdx, ch, cur_toggle);
+	}
+}
+
 irqreturn_t hws_irq_handler(int irq, void *info)
 {
 	struct hws_pcie_dev *pdx = info;
@@ -351,6 +382,7 @@ irqreturn_t hws_irq_handler(int irq, void *info)
 	dev_dbg(&pdx->pdev->dev, "irq: entry INT_STATUS=0x%08x\n", int_state);
 
 	wake_thread = hws_irq_queue_video(pdx, int_state);
+	hws_irq_handle_audio(pdx, int_state);
 	hws_irq_ack_status(pdx, int_state);
 
 	return wake_thread ? IRQ_WAKE_THREAD : IRQ_HANDLED;
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
index b042bbfae350..f83d6d494d25 100644
--- a/drivers/media/pci/hws/hws_pci.c
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -19,6 +19,7 @@
 #include <media/v4l2-ctrls.h>
 
 #include "hws.h"
+#include "hws_audio.h"
 #include "hws_reg.h"
 #include "hws_video.h"
 #include "hws_irq.h"
@@ -154,6 +155,7 @@ static void hws_configure_hardware_capabilities(struct hws_pcie_dev *hdev)
 }
 
 static void hws_stop_device(struct hws_pcie_dev *hws);
+static void hws_free_seed_buffers(struct hws_pcie_dev *hws);
 
 static void hws_log_lifecycle_snapshot(struct hws_pcie_dev *hws,
 				       const char *action,
@@ -187,6 +189,17 @@ static void hws_log_lifecycle_snapshot(struct hws_pcie_dev *hws,
 		sys_status, dec_mode);
 }
 
+static void hws_init_probe_state(struct hws_pcie_dev *hdev)
+{
+	hdev->max_hw_video_buf_sz = MAX_MM_VIDEO_SIZE;
+	hdev->max_channels = 4;
+	hdev->buf_allocated = false;
+	hdev->main_task = NULL;
+	hdev->audio_pkt_size = MAX_DMA_AUDIO_PK_SIZE;
+	hdev->start_run = false;
+	hdev->pci_lost = 0;
+}
+
 static int read_chip_id(struct hws_pcie_dev *hdev)
 {
 	u32 reg;
@@ -201,13 +214,6 @@ static int read_chip_id(struct hws_pcie_dev *hdev)
 	hdev->support_yv12 = FIELD_GET(DEVINFO_YV12, reg);
 	hdev->port_id = FIELD_GET(DEVINFO_PORTID, reg);
 
-	hdev->max_hw_video_buf_sz = MAX_MM_VIDEO_SIZE;
-	hdev->max_channels = 4;
-	hdev->buf_allocated = false;
-	hdev->main_task = NULL;
-	hdev->start_run = false;
-	hdev->pci_lost = 0;
-
 	writel(0x00, hdev->bar0_base + HWS_REG_DEC_MODE);
 	writel(0x10, hdev->bar0_base + HWS_REG_DEC_MODE);
 
@@ -271,6 +277,21 @@ static void hws_stop_kthread_action(void *data)
 	}
 }
 
+static void hws_destroy_audio_workqueue(struct hws_pcie_dev *hws)
+{
+	struct workqueue_struct *wq;
+
+	if (!hws)
+		return;
+
+	wq = hws->audio_wq;
+	if (!wq)
+		return;
+
+	hws->audio_wq = NULL;
+	destroy_workqueue(wq);
+}
+
 static size_t hws_video_scratch_bytes(void)
 {
 	return HWS_VIDEO_BOUNCE_SLOTS * ALIGN((size_t)MAX_VIDEO_SCALER_SIZE, 64);
@@ -516,6 +537,7 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	int i, ret, irq;
 	unsigned long irqf = 0;
 	bool v4l2_registered = false;
+	bool audio_registered = false;
 
 	/* devres-backed device object */
 	hws = devm_kzalloc(&pdev->dev, sizeof(*hws), GFP_KERNEL);
@@ -561,18 +583,38 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 #endif
 
 	/* 4) Identify chip & capabilities */
+	hws_init_probe_state(hws);
 	read_chip_id(hws);
 	dev_info(&pdev->dev, "Device VID=0x%04x DID=0x%04x\n",
 		 pdev->vendor, pdev->device);
 	hws_init_video_sys(hws, false);
 
-	/* 5) Init channels (video state, locks, vb2, ctrls) */
+	/* 5) Init channels (video/audio state, locks, vb2, ctrls) */
 	for (i = 0; i < hws->max_channels; i++) {
 		ret = hws_video_init_channel(hws, i);
 		if (ret) {
 			dev_err(&pdev->dev, "video channel init failed (ch=%d)\n", i);
 			goto err_unwind_channels;
 		}
+		ret = hws_audio_init_channel(hws, i);
+		if (ret) {
+			dev_err(&pdev->dev, "audio channel init failed (ch=%d)\n", i);
+			hws_video_cleanup_channel(hws, i);
+			goto err_unwind_channels;
+		}
+	}
+
+	if (hws->cur_max_audio_ch) {
+		hws->audio_wq = alloc_workqueue("hws-audio",
+						WQ_HIGHPRI | WQ_UNBOUND | WQ_MEM_RECLAIM,
+						0);
+		if (!hws->audio_wq) {
+			ret = -ENOMEM;
+			dev_err(&pdev->dev, "audio workqueue allocation failed\n");
+			goto err_unwind_channels;
+		}
+	} else {
+		dev_info(&pdev->dev, "audio capture disabled; video-only mode\n");
 	}
 
 	/* 6) Start-run sequence. Scratch DMA is allocated on stream start. */
@@ -616,13 +658,20 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	dev_info(&pdev->dev, "INT_EN_GATE readback=0x%08x\n",
 		 readl(hws->bar0_base + INT_EN_REG_BASE));
 
-	/* 11) Register V4L2 */
+	/* 11) Register V4L2/ALSA */
 	ret = hws_video_register(hws);
 	if (ret) {
 		dev_err(&pdev->dev, "video_register: %d\n", ret);
 		goto err_unwind_channels;
 	}
 	v4l2_registered = true;
+	ret = hws_audio_register(hws);
+	if (ret) {
+		dev_err(&pdev->dev, "audio_register: %d\n", ret);
+		hws_video_unregister(hws);
+		goto err_unwind_channels;
+	}
+	audio_registered = true;
 
 	/* 12) Background monitor thread (managed) */
 	hws->main_task = kthread_run(main_ks_thread_handle, hws, "hws-mon");
@@ -644,15 +693,21 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 
 err_unregister_va:
 	hws_stop_device(hws);
-	hws_video_unregister(hws);
+	if (audio_registered)
+		hws_audio_unregister(hws);
+	if (v4l2_registered)
+		hws_video_unregister(hws);
 	hws_free_seed_buffers(hws);
+	hws_destroy_audio_workqueue(hws);
 	return ret;
 err_unwind_channels:
 	hws_free_seed_buffers(hws);
-	if (!v4l2_registered) {
-		while (--i >= 0)
+	while (--i >= 0) {
+		if (!v4l2_registered)
 			hws_video_cleanup_channel(hws, i);
+		hws_audio_cleanup_channel(hws, i, true);
 	}
+	hws_destroy_audio_workqueue(hws);
 	return ret;
 }
 
@@ -696,7 +751,7 @@ static void hws_stop_dsp(struct hws_pcie_dev *hws)
 	writel(0x0, hws->bar0_base + HWS_REG_VCAP_ENABLE);
 }
 
-/* Publish stop so ISR/BH will not touch video buffers anymore. */
+/* Publish stop so ISR/BH will not touch ALSA/VB2 anymore. */
 static void hws_publish_stop_flags(struct hws_pcie_dev *hws)
 {
 	unsigned int i;
@@ -708,6 +763,14 @@ static void hws_publish_stop_flags(struct hws_pcie_dev *hws)
 		WRITE_ONCE(v->stop_requested, true);
 	}
 
+	for (i = 0; i < hws->cur_max_audio_ch; ++i) {
+		struct hws_audio *a = &hws->audio[i];
+
+		WRITE_ONCE(a->stream_running, false);
+		WRITE_ONCE(a->cap_active, false);
+		WRITE_ONCE(a->stop_requested, true);
+	}
+
 	smp_wmb(); /* make flags visible before we touch MMIO/queues */
 }
 
@@ -720,14 +783,17 @@ static void hws_drain_after_stop(struct hws_pcie_dev *hws)
 
 	/* Mask device enables: no new DMA starts. */
 	writel(0x0, hws->bar0_base + HWS_REG_VCAP_ENABLE);
+	writel(0x0, hws->bar0_base + HWS_REG_ACAP_ENABLE);
 	(void)readl(hws->bar0_base + HWS_REG_INT_STATUS); /* flush */
 
 	/* Let any in-flight DMAs finish (best-effort). */
 	(void)hws_check_busy(hws);
 
-	/* Ack any latched VDONE. */
+	/* Ack any latched VDONE/ADONE. */
 	for (i = 0; i < hws->cur_max_video_ch; ++i)
 		ackmask |= HWS_INT_VDONE_BIT(i);
+	for (i = 0; i < hws->cur_max_audio_ch; ++i)
+		ackmask |= HWS_INT_ADONE_BIT(i);
 	if (ackmask) {
 		writel(ackmask, hws->bar0_base + HWS_REG_INT_STATUS);
 		(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
@@ -736,6 +802,7 @@ static void hws_drain_after_stop(struct hws_pcie_dev *hws)
 	/* Ensure no hard IRQ is still running. */
 	if (hws->irq >= 0)
 		synchronize_irq(hws->irq);
+	hws_audio_drain_work(hws);
 
 	dev_dbg(&hws->pdev->dev, "lifecycle:drain-after-stop:done (%lluus)\n",
 		hws_elapsed_us(start_ns));
@@ -834,8 +901,10 @@ static void hws_remove(struct pci_dev *pdev)
 	/* Stop hardware and capture cleanly. */
 	hws_stop_device(hws);
 
-	/* Unregister V4L2 resources. */
+	/* Unregister ALSA resources before V4L2. */
+	hws_audio_unregister(hws);
 	hws_video_unregister(hws);
+	hws_destroy_audio_workqueue(hws);
 
 	/* Release seeded DMA buffers */
 	hws_free_seed_buffers(hws);
@@ -850,11 +919,16 @@ static int hws_pm_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct hws_pcie_dev *hws = pci_get_drvdata(pdev);
+	int aret;
 	int vret;
 	u64 start_ns = ktime_get_mono_fast_ns();
 	u64 step_ns;
 
 	dev_info(dev, "lifecycle:pm_suspend begin\n");
+	aret = hws_audio_pm_suspend_all(hws);
+	if (aret)
+		dev_warn(dev, "lifecycle:pm_suspend audio quiesce returned %d\n",
+			 aret);
 	vret = hws_quiesce_for_transition(hws, "pm_suspend", false);
 
 	step_ns = ktime_get_mono_fast_ns();
@@ -903,6 +977,7 @@ static int hws_pm_resume(struct device *dev)
 	/* Re-seed BAR remaps/DMA windows and restart the capture core */
 	hws_seed_all_channels(hws);
 	hws_init_video_sys(hws, true);
+	hws_audio_pm_resume(hws);
 	hws_irq_clear_pending(hws);
 	dev_dbg(dev, "lifecycle:pm_resume:chip-reinit (%lluus)\n",
 		hws_elapsed_us(step_ns));
diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hws_reg.h
index c8d6715fe0c2..ebf95e31993e 100644
--- a/drivers/media/pci/hws/hws_reg.h
+++ b/drivers/media/pci/hws/hws_reg.h
@@ -33,9 +33,10 @@
 #define PCI_E_BAR_ADD_MASK 0xE0000000
 #define PCI_E_BAR_ADD_LOWMASK 0x1FFFFFFF
 
+#define MAX_DMA_AUDIO_PK_SIZE      (128U * 16U * 2U)
 /*
  * The legacy driver reserved a 10 KiB hardware capture window per audio
- * channel even though the delivered packet size is smaller. Keep that headroom
+ * channel even though the delivered packet size is 4 KiB. Keep that headroom
  * for the split-buffer DMA engine.
  */
 #define MAX_AUDIO_CAP_SIZE         (10U * 1024U)
@@ -88,6 +89,7 @@
 /* Capture enable switches. */
 /* bit0-3: CH0-CH3 video enable */
 #define HWS_REG_VCAP_ENABLE           (CVBS_IN_BASE +  2 * PCIE_BARADDROFSIZE)
+#define HWS_REG_ACAP_ENABLE           (CVBS_IN_BASE +  3 * PCIE_BARADDROFSIZE)
 /* bits0-3: signal present, bits8-11: interlace */
 #define HWS_REG_ACTIVE_STATUS          (CVBS_IN_BASE +  5  * PCIE_BARADDROFSIZE)
 /* bits0-3: HDCP detected */
@@ -95,12 +97,28 @@
 #define HWS_REG_DMA_MAX_SIZE   (CVBS_IN_BASE +  9 * PCIE_BARADDROFSIZE)
 
 /*
- * Video DMA setup uses one BAR remap-table slot per capture channel. The
- * remap-table slot supplies the host DMA page, while CVBS_IN_BUF_BASE +
- * ch * 4 supplies the device-side buffer offset within that page.
+ * Buffer base registers follow the vendor/baseline layout:
+ *
+ *   video base: CVBS_IN_BUF_BASE + ch * 4
+ *   audio base: CVBS_IN_BUF_BASE + (8 + ch) * 4
+ *
+ * Do not add a video doorbell at CVBS_IN_BASE + (26 + ch) * 4.  Those
+ * offsets alias the audio base bank for low video channel numbers.
  */
+/* Per-channel audio DMA address window. */
+#define HWS_REG_AUD_DMA_ADDR(ch)      (CVBS_IN_BUF_BASE + ((8 + (ch)) * PCIE_BARADDROFSIZE))
+
 #define HWS_VIDEO_REMAP_SLOT_OFF(ch)  (0x208 + ((ch) * 8))
 
+/*
+ * BAR remap slots are selected by the high bits of the programmed device-side
+ * base address.  Both video and audio program (ch + 1) * PCIEBAR_AXI_BASE, so
+ * audio shares the same remap slot as video for that channel.  The audio base
+ * registers live at CVBS_IN_BUF_BASE + (8 + ch) * 4, but that is a register
+ * bank offset, not a second remap-table bank.
+ */
+#define HWS_AUDIO_REMAP_SLOT_OFF(ch)  HWS_VIDEO_REMAP_SLOT_OFF(ch)
+
 /* Per-channel live buffer toggles (read-only). */
 #define HWS_REG_VBUF_TOGGLE(ch)       (CVBS_IN_BASE + (32 + (ch)) * PCIE_BARADDROFSIZE)
 /*
@@ -108,10 +126,18 @@
  * currently filling for channel *ch* (0-3).
  */
 
-/* Per-interrupt bits (video 0-3). */
+#define HWS_REG_ABUF_TOGGLE(ch)       (CVBS_IN_BASE + (40 + (ch)) * PCIE_BARADDROFSIZE)
+/*
+ * Returns 0 or 1 = which half of the audio ring the DMA engine is
+ * currently filling for channel *ch* (0-3).
+ */
+
+/* Per-interrupt bits (video 0-3, audio 0-3). */
 #define HWS_INT_VDONE_BIT(ch)     BIT(ch)         /* 0x01,0x02,0x04,0x08  */
+#define HWS_INT_ADONE_BIT(ch)     BIT(8 + (ch))   /* 0x100 .. 0x800 */
 
-#define HWS_REG_INT_ACK           (CVBS_IN_BASE + 0x4000 + 1 * PCIE_BARADDROFSIZE)
+/* Legacy hardware clears interrupt bits by W1C on INT_STATUS. */
+#define HWS_REG_INT_ACK           HWS_REG_INT_STATUS
 
 /* 16-bit W | 16-bit H. */
 #define HWS_REG_IN_RES(ch)             (CVBS_IN_BASE + (90  + (ch) * 2) * PCIE_BARADDROFSIZE)
@@ -141,4 +167,8 @@
 #define HWS_REG_VBUF_TOGGLE_CH2       HWS_REG_VBUF_TOGGLE(2)
 #define HWS_REG_VBUF_TOGGLE_CH3       HWS_REG_VBUF_TOGGLE(3)
 
+#define HWS_REG_ABUF_TOGGLE_CH0       HWS_REG_ABUF_TOGGLE(0)
+#define HWS_REG_ABUF_TOGGLE_CH1       HWS_REG_ABUF_TOGGLE(1)
+#define HWS_REG_ABUF_TOGGLE_CH2       HWS_REG_ABUF_TOGGLE(2)
+#define HWS_REG_ABUF_TOGGLE_CH3       HWS_REG_ABUF_TOGGLE(3)
 #endif /* _HWS_PCIE_REG_H */
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 58bcc2e7030d..13ddd1040387 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -24,6 +24,7 @@
 #include "hws.h"
 #include "hws_reg.h"
 #include "hws_video.h"
+#include "hws_audio.h"
 #include "hws_irq.h"
 #include "hws_v4l2_ioctl.h"
 
@@ -781,12 +782,14 @@ void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable)
 	/* 1) reset the decoder mode register to 0 */
 	writel(0x00000000, hws->bar0_base + HWS_REG_DEC_MODE);
 	hws_seed_dma_windows(hws);
+	hws_audio_seed_channels(hws);
 
 	/* 3) on a full reset, clear all per-channel status and indices */
 	if (!enable) {
 		for (i = 0; i < hws->max_channels; i++) {
 			/* helpers to arm/disable capture engines */
 			hws_enable_video_capture(hws, i, false);
+			hws_enable_audio_capture(hws, i, false);
 		}
 	}
 
-- 
2.54.0

