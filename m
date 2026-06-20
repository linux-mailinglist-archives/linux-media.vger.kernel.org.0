Return-Path: <linux-media+bounces-65312-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VjS+D03PNmqKFAcAu9opvQ
	(envelope-from <linux-media+bounces-65312-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 19:35:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 853026A9620
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 19:35:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="hFVYje1/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65312-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65312-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CBAE3014C20
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 17:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E4132AABA;
	Sat, 20 Jun 2026 17:35:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4746299A82
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 17:35:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781976902; cv=none; b=XZ0Flkh3sDCJRRQ0ySyOGx/qO/DKVbKiPs0j9FyC2F+shdF4frv3JRJE43KUXnc+L5o3dursjXsCRVDIAXNbOyhrgkgp6wa7GIMWyvvCKcEU9wPIKMWEpNJVnFK7doLopI9WqDrZ0US2mJVm8/EHepiK17zdfTSfnkBFx2ZyJ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781976902; c=relaxed/simple;
	bh=2P12xkWSEue3h/mgkevIPqklN45OQuCiM0Kd82cSOgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hu7vVJgsbhTg7918NrpTnYbtrBENJISahLgFH6ykTF0V3fsHaJAztnzA2nh92A8vYEf9yK3CPIVWgl4iiMB2JaCgOBgqjqIQ6qbC1FaCdHpYwhc2p8ULMlAttm6YQD5eBV/hlfUhYfahQxceaoapZ5CQOp+zMa8nBg0YYBU8cik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFVYje1/; arc=none smtp.client-ip=209.85.167.172
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-486621f0adbso2106603b6e.2
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 10:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781976900; x=1782581700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fZS1zfmNoGva4wMG/4z9Lj0S+ah17QLL6pemw2b+Bf4=;
        b=hFVYje1/fvXVQXWGc1MQj+3ebhDjRIyPOwRdZ/0oAYxcxmS9/S/6V5KtyqXEk7qRs2
         WyiyvCZpwZFKd60bQbz3HULlErEn7XLLP0mQlxMGzg6DqcMtCR3slvY6L1kPNXl7MvO/
         YN0q7DzZSUwON1Mb9/df9j3CS4i1dinS3sXIVit9m/uj73u+5kRmcQxzqB2oSA9czKK0
         dehOXQmLH+a6OmQ27d5aRg2R1h08Hz4FH8bsYAhWiK5u/Tdp7tHiabF9jjaP/0WwFkpp
         toibBYyLvKb0h7ZGqJyZx97fkdsYuy/gUU3KaXs4P4h9CLuaiX2NJN/hki1EmQBJ7tcz
         5RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781976900; x=1782581700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZS1zfmNoGva4wMG/4z9Lj0S+ah17QLL6pemw2b+Bf4=;
        b=lqde330gC+qiu6YCRkceBRw3jDL6om5WTfpAeP/tkAfsV4IZR4xDKOCgZOh0zsW6qk
         sQi9gMAD9rCRAyCkLe50l99Gpylpb4VVMru7DD37qENyATsdo5kZTCwKHO0pLKEvjxkG
         GSeL8mzhqNb3NZxBscoyRrZanatqspBydVZYZvOShzCPH6TmDIZ8aXilZiNiKo0iHR5L
         RUm5raSTEYUgw4oHV1bEimtpoZ77luo+N8vbb3aQkHOdMNSL8A74SBZNv5Yv2HVlC1aO
         anWeIFmTHinYUk3VR+lkTMtZ3Nm2sP84GlGEvCfHuD1r+7vjCiW8i2mAmZR/mmlgFOpc
         PXdg==
X-Forwarded-Encrypted: i=1; AFNElJ8xy83mKkKIq8thueVXOEK+9jdWvo3rf6/AXg3WYsmpJk0MenCaXefkduXo/CYv7dMKWrCDdYOqUykeaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw4mejk1YUpMFXtM7bQihtqKT4tEcZaQY+KAWLas1G5f+yQblb
	HyJy2lmkJsbj+yi/LiLuP0Lr1c789EpWtJg7pSOG5ugn68iZRgp3rn9A
X-Gm-Gg: AfdE7ckAmuwdJFfHKHfp7JQBCcCteDlc3IGGYGT4g8ENHQuur784Ev2M2jVfHsleaXl
	P+G5G+rNjeYa0NH5r9IP6XYgbNtEZNPJLi6muz73Jzbol8pVCniqLd8hI/QqKPzKrS4STiSZ37T
	GseFgSG93c2UcqJBArpY4Uk2h2+QtwsTeHyr3R62pbkMjUAKTkRSWUR0SYp/zGyaRE3tSPiRkxp
	N7bUThjzGz7396uWPWjHmRMeoFKOumt6BFk+PvbmGa/mwN/Kp+zg+4KI8MhDsFoy6doBF46TDF/
	Xh+5qhkRcTuxcLOpbKlCRBgOJqDS5LQKdzVUGFPmk3r/kae/p+v3FyrBckhiYe4niubObtzYy3T
	e33NgyDccdZ/zXbBX9KV1v1w5YKjMOx5Tr4iUiCrWtn9hZm4JNasGgFLYUnn7t7DnZLm+J4taM7
	PQcv9Z5VHwFMcccTkL99f/mns1qWF2c1ZTE7rScGDmM+4PK3CSJMezjbtjAylAP0RFQ3G0vxzE
X-Received: by 2002:a05:6809:34a:10b0:489:6c24:a6ce with SMTP id 5614622812f47-4896c24ab6cmr4925618b6e.23.1781976899551;
        Sat, 20 Jun 2026 10:34:59 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aebb9f1d7sm1646609b6e.4.2026.06.20.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:34:59 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Ben Hoff <hoff.benjamin.k@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: pci: hws: program video DMA through remap window
Date: Sat, 20 Jun 2026 13:34:48 -0400
Message-ID: <20260620173448.36279-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65312-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:hoff.benjamin.k@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,m:hoffbenjamink@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 853026A9620

From: Ben Hoff <hoff.benjamin.k@gmail.com>

Video capture DMA is programmed in two pieces. The BAR remap table selects
the host DMA page, and the per-channel CVBS_IN_BUF_BASE/CVBS_IN_BUF_BASE2
registers select the buffer offset and size.

The extra HWS_REG_DMA_ADDR() writes were overwriting the embedded-audio
capture register window on hardware variants that expose audio. Remove
those writes so arming video capture buffers programs only the video DMA
path and does not disturb audio setup.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws_irq.c   |  6 ++----
 drivers/media/pci/hws/hws_pci.c   | 11 +++++------
 drivers/media/pci/hws/hws_reg.h   | 11 ++++++-----
 drivers/media/pci/hws/hws_video.c | 31 +++++++------------------------
 drivers/media/pci/hws/hws_video.h |  2 --
 5 files changed, 20 insertions(+), 41 deletions(-)

diff --git a/drivers/media/pci/hws/hws_irq.c b/drivers/media/pci/hws/hws_irq.c
index eebb4b8a5cd5..a79cc10720d7 100644
--- a/drivers/media/pci/hws/hws_irq.c
+++ b/drivers/media/pci/hws/hws_irq.c
@@ -60,7 +60,7 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 	dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): picked buffer %p\n", ch,
 		buf);
 
-	/* Publish descriptor(s) before doorbell/MMIO kicks. */
+	/* Publish descriptor(s) before MMIO capture updates. */
 	wmb();
 
 	/* Avoid MMIO during suspend */
@@ -79,13 +79,11 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 		return -EBUSY;
 	}
 
-	/* Also program the DMA address register directly */
+	/* Program the video DMA window for the selected buffer. */
 	{
 		dma_addr_t dma_addr =
 		    vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 		hws_program_dma_for_addr(hws, ch, dma_addr);
-		iowrite32(lower_32_bits(dma_addr),
-			  hws->bar0_base + HWS_REG_DMA_ADDR(ch));
 	}
 
 	dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): programmed buffer %p\n", ch,
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
index 30bb7d34465b..10af6c30566a 100644
--- a/drivers/media/pci/hws/hws_pci.c
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -315,12 +315,11 @@ static void hws_seed_channel(struct hws_pcie_dev *hws, int ch)
 
 	lo &= PCI_E_BAR_ADD_MASK;
 
-	/* Program 64-bit BAR remap entry for this channel (table @ 0x208 + ch * 8) */
-	writel_relaxed(hi, hws->bar0_base +
-			    PCI_ADDR_TABLE_BASE + 0x208 + ch * 8);
-	writel_relaxed(lo, hws->bar0_base +
-			    PCI_ADDR_TABLE_BASE + 0x208 + ch * 8 +
-			    PCIE_BARADDROFSIZE);
+	/* Program 64-bit BAR remap entry for this channel. */
+	writel_relaxed(hi, hws->bar0_base + PCI_ADDR_TABLE_BASE +
+		       HWS_VIDEO_REMAP_SLOT_OFF(ch));
+	writel_relaxed(lo, hws->bar0_base + PCI_ADDR_TABLE_BASE +
+		       HWS_VIDEO_REMAP_SLOT_OFF(ch) + PCIE_BARADDROFSIZE);
 
 	/* Program capture engine per-channel base/half */
 	writel_relaxed((ch + 1) * PCIEBAR_AXI_BASE + pci_addr,
diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hws_reg.h
index e4fb4af44434..344cb8d011a9 100644
--- a/drivers/media/pci/hws/hws_reg.h
+++ b/drivers/media/pci/hws/hws_reg.h
@@ -87,11 +87,12 @@
 #define HWS_REG_HDCP_STATUS            (CVBS_IN_BASE +  8  * PCIE_BARADDROFSIZE)
 #define HWS_REG_DMA_MAX_SIZE   (CVBS_IN_BASE +  9 * PCIE_BARADDROFSIZE)
 
-/* Buffer addresses (written once during init/reset). */
-/* Base of host-visible buffer. */
-#define HWS_REG_VBUF1_ADDR            (CVBS_IN_BASE + 25 * PCIE_BARADDROFSIZE)
-/* Per-channel DMA address. */
-#define HWS_REG_DMA_ADDR(ch)          (CVBS_IN_BASE + (26 + (ch)) * PCIE_BARADDROFSIZE)
+/*
+ * Video DMA setup uses one BAR remap-table slot per capture channel. The
+ * remap-table slot supplies the host DMA page, while CVBS_IN_BUF_BASE +
+ * ch * 4 supplies the device-side buffer offset within that page.
+ */
+#define HWS_VIDEO_REMAP_SLOT_OFF(ch)  (0x208 + ((ch) * 8))
 
 /* Per-channel live buffer toggles (read-only). */
 #define HWS_REG_VBUF_TOGGLE(ch)       (CVBS_IN_BASE + (32 + (ch)) * PCIE_BARADDROFSIZE)
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 18e4bc6901d3..b1af81d1368a 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -26,7 +26,6 @@
 #include "hws_irq.h"
 #include "hws_v4l2_ioctl.h"
 
-#define HWS_REMAP_SLOT_OFF(ch)   (0x208 + (ch) * 8)	/* one 64-bit slot per ch */
 #define HWS_BUF_BASE_OFF(ch)     (CVBS_IN_BUF_BASE  + (ch) * PCIE_BARADDROFSIZE)
 #define HWS_HALF_SZ_OFF(ch)      (CVBS_IN_BUF_BASE2 + (ch) * PCIE_BARADDROFSIZE)
 
@@ -59,21 +58,13 @@ module_param_named(dma_window_verify, dma_window_verify, bool, 0644);
 MODULE_PARM_DESC(dma_window_verify,
 		 "Read back DMA window registers after programming (debug)");
 
-void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
-			  dma_addr_t dma, const char *tag)
-{
-	iowrite32(lower_32_bits(dma), hws->bar0_base + HWS_REG_DMA_ADDR(ch));
-	dev_dbg(&hws->pdev->dev, "dma_doorbell ch%u: dma=0x%llx tag=%s\n", ch,
-		(u64)dma, tag ? tag : "");
-}
-
 static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
 {
 	const u32 addr_mask = PCI_E_BAR_ADD_MASK;
 	const u32 addr_low_mask = PCI_E_BAR_ADD_LOWMASK;
 	struct hws_pcie_dev *hws = vid->parent;
 	unsigned int ch = vid->channel_index;
-	u32 table_off = HWS_REMAP_SLOT_OFF(ch);
+	u32 table_off = HWS_VIDEO_REMAP_SLOT_OFF(ch);
 	u32 lo = lower_32_bits(dma);
 	u32 hi = upper_32_bits(dma);
 	u32 pci_addr = lo & addr_low_mask;
@@ -170,8 +161,6 @@ void hws_prime_next_locked(struct hws_video *vid)
 	vid->next_prepared = next;
 	dma = vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
 	hws_program_dma_for_addr(hws, vid->channel_index, dma);
-	iowrite32(lower_32_bits(dma),
-		  hws->bar0_base + HWS_REG_DMA_ADDR(vid->channel_index));
 	dev_dbg(&hws->pdev->dev,
 		"ch%u pre-armed next buffer %p dma=0x%llx\n",
 		vid->channel_index, next, (u64)dma);
@@ -183,7 +172,7 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 	unsigned long flags;
 	struct hwsvideo_buffer *buf = NULL, *next = NULL;
 	bool have_next = false;
-	bool doorbell = false;
+	bool programmed = false;
 
 	if (!v)
 		return false;
@@ -239,12 +228,11 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 	if (have_next && next) {
 		dma_addr_t dma =
 		    vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
+
 		hws_program_dma_for_addr(hws, v->channel_index, dma);
-		hws_set_dma_doorbell(hws, v->channel_index, dma,
-				     tag ? tag : "nosignal_zero");
-		doorbell = true;
+		programmed = true;
 	}
-	if (doorbell) {
+	if (programmed) {
 		wmb(); /* ensure descriptors visible before enabling capture */
 		hws_enable_video_capture(hws, v->channel_index, true);
 	}
@@ -534,7 +522,6 @@ static void hws_seed_dma_windows(struct hws_pcie_dev *hws)
 {
 	const u32 addr_mask = PCI_E_BAR_ADD_MASK;
 	const u32 addr_low_mask = PCI_E_BAR_ADD_LOWMASK;
-	u32 table = 0x208;	/* one 64-bit entry per channel */
 	unsigned int ch;
 
 	if (!hws || !hws->bar0_base)
@@ -544,7 +531,7 @@ static void hws_seed_dma_windows(struct hws_pcie_dev *hws)
 	if (!hws->cur_max_video_ch || hws->cur_max_video_ch > hws->max_channels)
 		hws->cur_max_video_ch = hws->max_channels;
 
-	for (ch = 0; ch < hws->cur_max_video_ch; ch++, table += 8) {
+	for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
 		if (!hws->scratch_vid[ch].cpu)
 			continue;
 
@@ -554,6 +541,7 @@ static void hws_seed_dma_windows(struct hws_pcie_dev *hws)
 			u32 lo = lower_32_bits(p) & addr_mask;
 			u32 hi = upper_32_bits(p);
 			u32 pci_addr_low = lower_32_bits(p) & addr_low_mask;
+			u32 table = HWS_VIDEO_REMAP_SLOT_OFF(ch);
 
 			writel_relaxed(hi,
 				       hws->bar0_base + PCI_ADDR_TABLE_BASE +
@@ -1128,8 +1116,6 @@ static void hws_buffer_queue(struct vb2_buffer *vb)
 		dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 		hws_program_dma_for_addr(vid->parent, vid->channel_index,
 					 dma_addr);
-		iowrite32(lower_32_bits(dma_addr),
-			  hws->bar0_base + HWS_REG_DMA_ADDR(vid->channel_index));
 
 		wmb(); /* ensure descriptors visible before enabling capture */
 		hws_enable_video_capture(hws, vid->channel_index, true);
@@ -1214,9 +1200,6 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 
 			dma_addr = vb2_dma_contig_plane_dma_addr(prog_vb2, 0);
 			hws_program_dma_for_addr(hws, v->channel_index, dma_addr);
-			iowrite32(lower_32_bits(dma_addr),
-				  hws->bar0_base +
-				  HWS_REG_DMA_ADDR(v->channel_index));
 			dev_dbg(&hws->pdev->dev,
 				"start_streaming: ch=%u programmed buffer %p dma=0x%08x\n",
 				v->channel_index, to_program,
diff --git a/drivers/media/pci/hws/hws_video.h b/drivers/media/pci/hws/hws_video.h
index 4feaf5b2f5a9..fcd3eca0b0c3 100644
--- a/drivers/media/pci/hws/hws_video.h
+++ b/drivers/media/pci/hws/hws_video.h
@@ -20,8 +20,6 @@ void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable);
 void hws_program_dma_for_addr(struct hws_pcie_dev *hws,
 			      unsigned int ch,
 			      dma_addr_t dma);
-void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
-			  dma_addr_t dma, const char *tag);
 
 int hws_video_quiesce(struct hws_pcie_dev *hws, const char *reason);
 void hws_video_pm_resume(struct hws_pcie_dev *hws);

