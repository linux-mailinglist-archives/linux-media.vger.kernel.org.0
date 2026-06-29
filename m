Return-Path: <linux-media+bounces-66012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q6hpE0O5QmreAAoAu9opvQ
	(envelope-from <linux-media+bounces-66012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:28:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 246FA6DE0AA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:28:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Ufqfpn/o";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66012-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66012-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22B1A306051E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B3E38D40C;
	Mon, 29 Jun 2026 18:26:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0683822AE
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 18:26:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757615; cv=none; b=fFXNKSp8IyaaLhUxKEYhg8fZY55g2JqrkHzdeMmpn0ptE8bBMLdXF7CNmj5/V63aTQHXxt5NXVxyPD2+SfNjlB2yzRRN9fBSsoW+wQ7u3qLcFj/r1T3cXTpjIiN5pUSu8Le7g0ZHU4LFaVyP5MyMfAuRSYHKkm4U7rjRoiWmkGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757615; c=relaxed/simple;
	bh=zVFW5nHRrjiUOsdxRv72dC3WRgl4434KCGCioWrX7Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dobtfgoZbnT4WTpNMIi5fXu2nxrWCKK/QMxc8ntM1gvKvzNnf6uFR3ym3soQiXcFN9XmouCESQ7lIwnMaDQDbz/aeX2L+p3YfhtKEQmo+Ug5SjhGi+C4rp+LRrsPVtG9JlQKdlMlj/DbzonmC8t4tI+Gj49aEqezeR5IbaiJ5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ufqfpn/o; arc=none smtp.client-ip=209.85.210.47
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9bb837fdbso1163404a34.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757613; x=1783362413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJHKxrNcqrK7m6lmjGzIGI6MC0nEKcJeBriefeFakfk=;
        b=Ufqfpn/obbR+2+IkW6ogbewFHlBOv+3pNsAoTR3xrHOfWFaCStcAXqOltZ96cvWDhn
         a+6j28JGpGBz6kf0Z27EmWGVSVp6WpQItrf5xkhWHUcN0IVCL9Rln89p8+FQFKOc2r4l
         fhQie+7qPa+AZfzIkYM7RcuAERYUi2vUE7UJWhhIJaSRKTX1fhfOeQmg5oU1F9ad3fD4
         OyzL/Xc/QGLiVE2b6LcS9YPOtZZuF+2mA7dsE0qgbm3W8vxhzXmuQ5MX7mTw/W45XO3T
         fYc9tAIFdwjlSy6jZWrDo9B1stkK+vlb/6EdwjWfmNfVDVvwineMS/waWgnF22oBDmTO
         Uslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757613; x=1783362413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TJHKxrNcqrK7m6lmjGzIGI6MC0nEKcJeBriefeFakfk=;
        b=iTsjC3XaVzu8pYvZrN0roniRkpb0E1VxS8i9WAJ+yjgF+38jMHsZfxhoALDh7EY/hy
         2mYY4aCDFZG7dvjzHSNzR/uUw6grwDyXLaDU7CWuTSy1JCE8wF6bxUxG6lGhxvBIG/Sx
         cxhdmPTpyhRM8ZSxZJDi2sAifYOqCDz0o2XfEEgRzbE2DjecYJ5wg7k/eUEWYWC0XwON
         f/h6D0rdphWoSdfpvpdhs5kLadKQKbO77yGuZ6tA+RiwfMNYevmbQxJBOi+MpKuobLmc
         S6gVG6V7S2WwuM8Tpf0hIiD6V4u7tKmyHD/SxQLQbF7d7HQPqWR5NMlRLNDuXywdysim
         ZTvg==
X-Forwarded-Encrypted: i=1; AFNElJ9nXBrTslEgzG8BIPNTPafCyTVKiGAzbG7w3oo+3QnA1kxh2NRQCKdppzwUmPJ/qM772Jw6ncGLVnh9SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybCYde+cgOtLSeMkE3UdCuzzWfPuMVVKwrkZp2H5HAnL44S7mw
	+I1b+0FWxQCCuBx/9p1tky5gJZSi6XCgqs8rxC6K9khyyesuLCtkkB+6YrBbyA==
X-Gm-Gg: AfdE7cmi6R1qKCuM0eLJAJqR+mzvvzNSUoBAEHL+HqRlI038T0F8IysYQH1aVT9KYHZ
	lClkJfV5kpBFpz+fLO7jHHrttsl8bY3Gm3z+OQUT2BZMQi54zd1xR0FotLB4R0swHqNYQH5mhNG
	A0DYOho1al6oU3+0th9++Eol+ZJFwNHgL2/WAqZKlXrr0o9nL3ZOFCcMu1q6KBB9gxmgaxH0cFJ
	czYcD319eb5lQCeFQp4MCqywkHCo0vrA9KZ8PEbYQodHbwPdGRjS5Jki4kDnlz3b/4tCzAuMffa
	yrEJWG6XoOTxofzhXw2N4GzFUsc//ZZJTreUbQoTUHLFpA1JnTbrflkvZFigveKcweBJ6uHYYVS
	/66ZE/ez7e0qUHLKj66OiAkK9MepfaMe9Z2IMUK3B5aL0UsMtX34iJVZrAVjYbzGPBX3DMusLOx
	El7gjbx6Nv3YTDjVbN/h8laWEVPR6YX8qpR70BI3+54w9aGBmjS5K7be0OM4kz6A==
X-Received: by 2002:a05:6830:6184:b0:7e6:c752:3f0c with SMTP id 46e09a7af769-7e9ec7553famr509781a34.24.1782757612528;
        Mon, 29 Jun 2026 11:26:52 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2ba18esm396875a34.16.2026.06.29.11.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 11:26:51 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 1/5] media: hws: program video DMA through remap windows
Date: Mon, 29 Jun 2026 14:26:45 -0400
Message-ID: <20260629182649.247879-2-hoff.benjamin.k@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-66012-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 246FA6DE0AA

From: Ben Hoff <hoff.benjamin.k@gmail.com>

Video capture DMA setup uses the BAR remap table plus per-channel device
buffer offsets. Drop the stale direct writes to the legacy DMA address
register and share the remap slot offset between probe-time seeding and
runtime programming.

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
-- 
2.54.0



