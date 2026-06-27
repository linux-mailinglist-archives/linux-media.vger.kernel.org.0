Return-Path: <linux-media+bounces-65778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hUEnKSoqP2pjPgkAu9opvQ
	(envelope-from <linux-media+bounces-65778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 03:40:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F196D0B7B
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 03:40:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aNOZQ3v3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65778-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65778-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD87303A271
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 01:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D7D2367DF;
	Sat, 27 Jun 2026 01:40:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1531E1EEA54
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 01:40:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782524452; cv=none; b=J7vU3KtG8EPy9yfGcS/lIqAU0VaJZr5HG9epbe0mTZmSXisqTU5awexImwEUE6KmBov7J9sDIsHmHh+pZu/AxN9VNjpk9nr1bwuOgPXML/Bl+AS8MjFG/MNzguNFWNh9bdxp2zkhiLtJXNy+4xWrxjGctCNzBGNd+BgRCiZ/UYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782524452; c=relaxed/simple;
	bh=h5WsO6pgl02kUbaYmhZvaSrkgFqyVIuvtNfh3Dpv/O0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MFpsBlp7FlPDeDM6joG6SIU8FcxlEC6zCG+TWrJm1t+/cEFYAA98PO8Ulul5we6VTQ3rIkVxeC5GwU3rk3tcM4WMNrcAd6WcUNGol92AofwtKcT9UPF9zuwXak1i6LGr1VB5duo5HAmR8Zzwl236n8Fw2C2O72Gn//1+kBirxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNOZQ3v3; arc=none smtp.client-ip=209.85.210.49
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6d991991dso1280004a34.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 18:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782524446; x=1783129246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRnQm2tjjJ6G1uPi1gBywaISv89J55gzIJfaP+iP/wM=;
        b=aNOZQ3v3AjZ4DMntsxmgpndzfGLVtLy/beyYl1zVmQm3hWDQcMG1yauyPBLDnujOey
         kN6KHyL3obbucL4i32SiJH5X6KwhoczDnNc1QhAgpRO+5qeVDtDWAsTziKwP5cF8K87A
         VVIRzH0ymInSzaC+Um7a5KcNiXENLFvanbIMppyGsJ2bKqMy/T/FOKHVFaJmwpwWhwTS
         3s3zh4xDDQJsrVjWk98RQmcKJta1Oz43XolC3TS/bONW1kfclZyigw7lrj5uU9trpHrR
         e13KW/d4UB3eEnQ5PmGN+p9+7DYxqT7hiTrrxEO/dAHP9oafWdWvGRMfeIF7hmGDajyE
         BeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782524446; x=1783129246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRnQm2tjjJ6G1uPi1gBywaISv89J55gzIJfaP+iP/wM=;
        b=BHeKEgzm6yZSsGRzcGu20jaSC11e0dWJSOyliPGJbuUrUs1AR1PwwYcj9Ku8sovshv
         fOSVwtd+fRkJUAFyGxX9418oKSZQB8h4JDgEG2FZzaBfafxiewWx5uUXVupZakk0DQ6Z
         uRaPihb3HQCjq3RKrt5Lg6OegPuht1xnQCSUUOmVn7azhcuhd61ryWzCtzwR8w2G7q91
         zWv8PomJat7IZOAKAO2no6So65OBWd375dY8n6rypzgisRa2B2d0Kng6Urt50Ap9Tb9v
         w/q1rGpL3nfzdHMcPok5D5ZNmkQVlrUB91mkAk3wsh35nS5UPZUHt5bUTG4oFfgUR9pg
         C6UQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rpiLf9uCi2oE1za95OCl+MSL7OSczTUBZJlQJuZVNmJR7T1P4Rek/lWrrnWZF0QFkGmNqpexRW5e73Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBA/qlMgDG31wP0lyBIJWF98e7kyTkDYGDi+LqgD/kWcH96mRd
	a8xa5c6pLuxsqABW5NK0I9qnDQOLYTenFjKEuvM/4UlgWUKk8agL8X8z
X-Gm-Gg: AfdE7cmAaIMg1qhjh6Ooym1MiM3OCerk4NEUcgOAW9cvgtCVSmu60lz+UPCFbebtocn
	5C3SgHZmvhAlkT/iE6sFsMbFOJt66uhea9r9uowPaizAKwccOuAp0kWpSO4ukUJeuamkPrfC+Me
	ydCGFfR19UC5kMKfZzegIqarFieg25xekQbmOwgzQ5HYrbp+aLTuUApOaEfWUFs0qyNRf+QK+h6
	NV1ZDLOzkDSUbOiMDFwyFcXiKYlutl/icog2TTuWOM+k/4yf+CkDJ2OfX4v4Zw+eFnpad7QCssx
	MveK11CCTxZlFthHOeP/QAUyN0mz88rP2nVL9Wp3F3KUlvOlp5gksjS48H17JOmf/UEPRmxnnYi
	Hj4073eZ2xkPDCx76VGfNCIidC+dkjLbBhW1YwjRi2hwm44g8dWnt5Cl0N/2qP8XKD4HTrnz0Pu
	pQzvup9BnJLgS9mTejvX2o98Uehw2qmOz0SUqzzzFnBqQ/mDbezlAMq/57GvkFVg==
X-Received: by 2002:a05:6820:4c14:b0:6a1:50eb:2120 with SMTP id 006d021491bc7-6a150eb241fmr2049087eaf.68.1782524445247;
        Fri, 26 Jun 2026 18:40:45 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472ecd3b51sm16656028fac.7.2026.06.26.18.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 18:40:44 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 0/5] media: hws: add HDMI audio capture support
Date: Fri, 26 Jun 2026 21:40:42 -0400
Message-ID: <20260627014042.79127-1-hoff.benjamin.k@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65778-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linuxtv.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92F196D0B7B

From: Ben Hoff <hoff.benjamin.k@gmail.com>

This series prepares the AVMatrix HWS PCIe capture driver for HDMI audio
capture by making the video DMA programming use the hardware BAR remap
windows consistently, adding the shared scratch DMA arena required by the
remap model, adding a video bounce path for the shared remap window,
hardening queue ownership, and wiring up ALSA PCM capture support.

This driver is derived from a GPL out-of-tree driver. The baseline used
for comparison is available at:

  https://github.com/benhoff/hws/tree/baseline

This series supersedes the earlier standalone submission at:

  https://patchwork.linuxtv.org/project/linux-media/patch/20260620173448.36279-1-hoff.benjamin.k@gmail.com/

Supersedes: <20260620173448.36279-1-hoff.benjamin.k@gmail.com>
Assisted-by: codex:5.5

Validation:

  - Build checks passed with W=1 for the HWS driver as a module
    (VIDEO_HWS=m) and through the built-in directory target
    (VIDEO_HWS=y, producing drivers/media/pci/hws/built-in.a). C=1
    builds completed for both configurations

  - v4l2-compliance 1.32.0, 64 bits, 64-bit time_t, passed
      Total: 51, Succeeded: 51, Failed: 0, Warnings: 1

  - HDMI audio progressive validation passed. Coverage included ALSA
    capture-device enumeration, advertised hardware-parameter checks,
    48 kHz S16_LE stereo capture from an HDMI playback, WAV
    header/size/nonzero-sample checks, captured rate/channel/format
    verification, no reported XRUNs, no kernel warnings/errors during
    capture, repeated start/stop capture cycles, 100 consecutive short
    captures, and 1000 consecutive device open/close cycles.

  - ALSA period/buffer matrix validation passed at 48 kHz S16_LE stereo
    with HDMI playback tone. Tested period/buffer frame pairs were
    256/1024, 256/4096, 1024/4096, and 4096/16384; each case checked
    that arecord accepted the requested hw params, capture completed,
    the WAV artifact had valid header/size/non-silent content and the
    expected rate/channel/format, no XRUN was reported, and no kernel
    warning/error appeared during the case.

  - Mixed audio/video validation passed. V4L2 MMAP streaming was kept
    active on an HWS video node while ALSA captured 48 kHz S16_LE stereo
    audio from the matching HWS PCM device. The test checked that audio
    capture completed, video streaming stayed active for the full run,
    the WAV artifact was present, non-truncated, and non-silent, and the
    kernel log delta did not contain warnings, errors, DMA faults, XRUNs,
    overrun/underrun reports, or HWS timeout/stall diagnostics.

  - video tested with enabled_audio=0

  - pm_test=devices passes with and without D3hot.

Full platform S3/deep suspend is not considered validated, my system is
unstable that I can't resume for deep suspend even without the driver

Ben Hoff (5):
  media: hws: program video DMA through remap windows
  media: hws: add shared scratch DMA arena
  media: hws: add video bounce path for shared remap windows
  media: hws: harden video DMA queue ownership
  media: hws: add HDMI audio capture support

-- 
2.54.0


From 2d1eacaacf5b84b7dea2acbb5961ed914f60864a Mon Sep 17 00:00:00 2001
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Sun, 21 Jun 2026 19:50:30 -0400
Subject: [PATCH 1/5] media: hws: program video DMA through remap windows

Video capture DMA setup uses the BAR remap table plus per-channel device
buffer offsets. Drop the stale direct writes to the legacy DMA address
register and share the remap slot offset between probe-time seeding and
runtime programming.
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


From d182510f0453edef1d486e17e83f28efedb44b8e Mon Sep 17 00:00:00 2001
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Mon, 22 Jun 2026 22:04:12 -0400
Subject: [PATCH 2/5] media: hws: add shared scratch DMA arena

Replace the probe-time seed buffer allocation with a per-channel coherent scratch arena that is acquired by stream users and released by refcount. The arena reserves video bounce space first and an audio capture window after it, and validates that the full allocation fits within the single 512 MiB BAR remap page shared by the channel.

Reset cached video DMA window state when freeing a channel arena so the next stream reprograms the hardware from a clean state.

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


From 0966cf9df4e64cad087dceb0bc99f9560317a749 Mon Sep 17 00:00:00 2001
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Thu, 25 Jun 2026 06:20:36 -0400
Subject: [PATCH 3/5] media: hws: add video bounce path for shared remap
 windows

---
 drivers/media/pci/hws/hws.h       |   3 +
 drivers/media/pci/hws/hws_irq.c   | 272 +++++++++++++++++-------
 drivers/media/pci/hws/hws_irq.h   |   1 +
 drivers/media/pci/hws/hws_pci.c   |  16 +-
 drivers/media/pci/hws/hws_video.c | 330 +++++++++++++++++++++++++-----
 drivers/media/pci/hws/hws_video.h |  10 +-
 6 files changed, 501 insertions(+), 131 deletions(-)

diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
index c0541190c047..552f0663e5d8 100644
--- a/drivers/media/pci/hws/hws.h
+++ b/drivers/media/pci/hws/hws.h
@@ -53,6 +53,7 @@ struct hwsvideo_buffer {
 	int slot;
 };
 
+#define HWS_VIDEO_DIRECT_SLOT (-1)
 #define HWS_VIDEO_BOUNCE_SLOTS 2
 
 struct hws_video {
@@ -174,6 +175,8 @@ struct hws_pcie_dev {
 
 	bool suspended;
 	int irq;
+	spinlock_t irq_thread_lock; /* protects threaded video IRQ counters */
+	unsigned int irq_pending_vdone[MAX_VID_CHANNELS];
 
 	/* Error flags */
 	int pci_lost;
diff --git a/drivers/media/pci/hws/hws_irq.c b/drivers/media/pci/hws/hws_irq.c
index a79cc10720d7..9ad0a69c0b9d 100644
--- a/drivers/media/pci/hws/hws_irq.c
+++ b/drivers/media/pci/hws/hws_irq.c
@@ -7,8 +7,6 @@
 #include <linux/minmax.h>
 #include <linux/string.h>
 
-#include <media/videobuf2-dma-contig.h>
-
 #include "hws_irq.h"
 #include "hws_reg.h"
 #include "hws_video.h"
@@ -45,6 +43,24 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 	}
 
 	spin_lock_irqsave(&v->irq_lock, flags);
+	if (v->active) {
+		buf = v->active;
+		spin_unlock_irqrestore(&v->irq_lock, flags);
+		dev_dbg(&hws->pdev->dev,
+			"arm_next(ch=%u): active buffer already armed %p\n",
+			ch, buf);
+		return 0;
+	}
+	if (v->next_prepared) {
+		buf = v->next_prepared;
+		v->active = buf;
+		v->next_prepared = NULL;
+		spin_unlock_irqrestore(&v->irq_lock, flags);
+		dev_dbg(&hws->pdev->dev,
+			"arm_next(ch=%u): promoted prepared buffer %p\n",
+			ch, buf);
+		return 0;
+	}
 	if (list_empty(&v->capture_queue)) {
 		spin_unlock_irqrestore(&v->irq_lock, flags);
 		dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): queue empty\n", ch);
@@ -70,7 +86,7 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 		dev_dbg(&hws->pdev->dev,
 			"arm_next(ch=%u): suspended after pick\n", ch);
 		spin_lock_irqsave(&v->irq_lock, f);
-		if (v->active) {
+		if (v->active == buf) {
 			list_add(&buf->list, &v->capture_queue);
 			v->queued_count++;
 			v->active = NULL;
@@ -79,11 +95,22 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 		return -EBUSY;
 	}
 
-	/* Program the video DMA window for the selected buffer. */
+	/* Program the baseline DMA window; use arena bounce if needed. */
 	{
-		dma_addr_t dma_addr =
-		    vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
-		hws_program_dma_for_addr(hws, ch, dma_addr);
+		int ret = hws_program_dma_for_buffer(hws, ch, buf);
+
+		if (ret) {
+			unsigned long f;
+
+			spin_lock_irqsave(&v->irq_lock, f);
+			if (v->active == buf) {
+				v->active = NULL;
+				list_add(&buf->list, &v->capture_queue);
+				v->queued_count++;
+			}
+			spin_unlock_irqrestore(&v->irq_lock, f);
+			return ret;
+		}
 	}
 
 	dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): programmed buffer %p\n", ch,
@@ -99,16 +126,16 @@ static void hws_video_handle_vdone(struct hws_video *v)
 	struct hws_pcie_dev *hws = v->parent;
 	unsigned int ch = v->channel_index;
 	struct hwsvideo_buffer *done;
+	struct hwsvideo_buffer *promoted_active = NULL;
 	unsigned long flags;
 	bool promoted = false;
+	int ret;
 
 	dev_dbg(&hws->pdev->dev,
 		"bh_video(ch=%u): stop=%d cap=%d active=%p\n",
 		ch, READ_ONCE(v->stop_requested), READ_ONCE(v->cap_active),
 		v->active);
 
-	int ret;
-
 	dev_dbg(&hws->pdev->dev,
 		"bh_video(ch=%u): entry stop=%d cap=%d\n", ch,
 		v->stop_requested, v->cap_active);
@@ -123,6 +150,7 @@ static void hws_video_handle_vdone(struct hws_video *v)
 	if (done && v->next_prepared) {
 		v->active = v->next_prepared;
 		v->next_prepared = NULL;
+		promoted_active = v->active;
 		promoted = true;
 	}
 	spin_unlock_irqrestore(&v->irq_lock, flags);
@@ -130,31 +158,38 @@ static void hws_video_handle_vdone(struct hws_video *v)
 	/* 1) Complete the buffer the HW just finished (if any) */
 	if (done) {
 		struct vb2_v4l2_buffer *vb2v = &done->vb;
-		size_t expected = v->pix.sizeimage;
-		size_t plane_size = vb2_plane_size(&vb2v->vb2_buf, 0);
+		enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
 
-		if (expected > plane_size) {
+		ret = hws_video_prepare_done_buffer(v, done);
+		if (ret) {
 			dev_warn_ratelimited(&hws->pdev->dev,
-					     "bh_video(ch=%u): sizeimage %zu > plane %zu, dropping seq=%u\n",
-					     ch, expected, plane_size,
-					     (u32)atomic_read(&v->sequence_number) + 1);
-			vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_ERROR);
-			goto arm_next;
+					     "bh_video(ch=%u): failed to prepare completed buffer ret=%d\n",
+					     ch, ret);
+			state = VB2_BUF_STATE_ERROR;
+		} else {
+			dev_dbg(&hws->pdev->dev,
+				"bh_video(ch=%u): DONE buf=%p seq=%u half_seen=%d toggle=%u\n",
+				ch, done, vb2v->sequence, v->half_seen,
+				v->last_buf_half_toggle);
 		}
-		vb2_set_plane_payload(&vb2v->vb2_buf, 0, expected);
 
-		dma_rmb();	/* device writes visible before userspace sees it */
-
-		vb2v->sequence = (u32)atomic_inc_return(&v->sequence_number);
-		vb2v->vb2_buf.timestamp = ktime_get_ns();
-		dev_dbg(&hws->pdev->dev,
-			"bh_video(ch=%u): DONE buf=%p seq=%u half_seen=%d toggle=%u\n",
-			ch, done, vb2v->sequence, v->half_seen,
-			v->last_buf_half_toggle);
+		spin_lock_irqsave(&v->irq_lock, flags);
+		if (v->active == done) {
+			if (v->next_prepared) {
+				v->active = v->next_prepared;
+				v->next_prepared = NULL;
+				promoted_active = v->active;
+				promoted = true;
+			} else {
+				v->active = NULL;
+			}
+		} else if (v->active) {
+			promoted_active = v->active;
+			promoted = true;
+		}
+		spin_unlock_irqrestore(&v->irq_lock, flags);
 
-		if (!promoted)
-			v->active = NULL;	/* channel no longer owns this buffer */
-		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
+		vb2_buffer_done(&vb2v->vb2_buf, state);
 	}
 
 	if (READ_ONCE(hws->suspended))
@@ -163,14 +198,17 @@ static void hws_video_handle_vdone(struct hws_video *v)
 	if (promoted) {
 		dev_dbg(&hws->pdev->dev,
 			"bh_video(ch=%u): promoted pre-armed buffer active=%p\n",
-			ch, v->active);
+			ch, promoted_active);
 		spin_lock_irqsave(&v->irq_lock, flags);
-		hws_prime_next_locked(v);
+		ret = hws_prime_next_locked(v);
 		spin_unlock_irqrestore(&v->irq_lock, flags);
+		if (ret)
+			dev_warn_ratelimited(&hws->pdev->dev,
+					     "bh_video(ch=%u): failed to pre-arm next buffer ret=%d\n",
+					     ch, ret);
 		return;
 	}
 
-arm_next:
 	/* 2) Immediately arm the next queued buffer (if present) */
 	ret = hws_arm_next(hws, ch);
 	if (ret == -EAGAIN) {
@@ -178,16 +216,113 @@ static void hws_video_handle_vdone(struct hws_video *v)
 			"bh_video(ch=%u): no queued buffer to arm\n", ch);
 		return;
 	}
+	if (ret) {
+		dev_warn_ratelimited(&hws->pdev->dev,
+				     "bh_video(ch=%u): stopping video queue after DMA arm failure ret=%d\n",
+				     ch, ret);
+		hws_enable_video_capture(hws, ch, false);
+		WRITE_ONCE(v->cap_active, false);
+		WRITE_ONCE(v->stop_requested, true);
+		vb2_queue_error(&v->buffer_queue);
+		return;
+	}
 	dev_dbg(&hws->pdev->dev,
 		"bh_video(ch=%u): armed next buffer, active=%p\n", ch,
 		v->active);
 	/* On success the engine now points at v->active's DMA address */
 }
 
+static void hws_irq_ack_status(struct hws_pcie_dev *pdx, u32 int_state)
+{
+	if (!int_state || !pdx || !pdx->bar0_base)
+		return;
+
+	writel(int_state, pdx->bar0_base + HWS_REG_INT_STATUS);
+	(void)readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+}
+
+static void hws_irq_record_vdone(struct hws_pcie_dev *pdx, unsigned int ch)
+{
+	unsigned long flags;
+
+	if (!pdx || ch >= MAX_VID_CHANNELS)
+		return;
+
+	spin_lock_irqsave(&pdx->irq_thread_lock, flags);
+	pdx->irq_pending_vdone[ch]++;
+	spin_unlock_irqrestore(&pdx->irq_thread_lock, flags);
+}
+
+static bool hws_irq_take_vdone(struct hws_pcie_dev *pdx, unsigned int *ch)
+{
+	unsigned long flags;
+	unsigned int i;
+
+	if (!pdx || !ch)
+		return false;
+
+	spin_lock_irqsave(&pdx->irq_thread_lock, flags);
+	for (i = 0; i < pdx->cur_max_video_ch && i < MAX_VID_CHANNELS; i++) {
+		if (pdx->irq_pending_vdone[i]) {
+			pdx->irq_pending_vdone[i]--;
+			*ch = i;
+			spin_unlock_irqrestore(&pdx->irq_thread_lock, flags);
+			return true;
+		}
+	}
+	spin_unlock_irqrestore(&pdx->irq_thread_lock, flags);
+	return false;
+}
+
+static bool hws_irq_queue_video(struct hws_pcie_dev *pdx, u32 int_state)
+{
+	bool wake_thread = false;
+	unsigned int ch;
+
+	for (ch = 0; ch < pdx->cur_max_video_ch; ++ch) {
+		u32 vbit = HWS_INT_VDONE_BIT(ch);
+
+		if (!(int_state & vbit))
+			continue;
+
+		if (READ_ONCE(pdx->video[ch].cap_active) &&
+		    !READ_ONCE(pdx->video[ch].stop_requested)) {
+			if (hws_toggle_debug) {
+				u32 toggle =
+				    readl_relaxed(pdx->bar0_base +
+						  HWS_REG_VBUF_TOGGLE(ch)) & 0x01;
+
+				WRITE_ONCE(pdx->video[ch].last_buf_half_toggle,
+					   toggle);
+			}
+			WRITE_ONCE(pdx->video[ch].half_seen, true);
+			hws_irq_record_vdone(pdx, ch);
+			wake_thread = true;
+			dev_dbg(&pdx->pdev->dev,
+				"irq: VDONE ch=%u queued for threaded completion\n",
+				ch);
+		} else {
+			dev_dbg(&pdx->pdev->dev,
+				"irq: VDONE ch=%u ignored (cap=%d stop=%d)\n",
+				ch,
+				READ_ONCE(pdx->video[ch].cap_active),
+				READ_ONCE(pdx->video[ch].stop_requested));
+		}
+	}
+
+	return wake_thread;
+}
+
 irqreturn_t hws_irq_handler(int irq, void *info)
 {
 	struct hws_pcie_dev *pdx = info;
 	u32 int_state;
+	bool wake_thread;
+
+	(void)irq;
+
+	if (!pdx || !pdx->bar0_base)
+		return IRQ_NONE;
 
 	dev_dbg(&pdx->pdev->dev, "irq: entry\n");
 	if (pdx->bar0_base) {
@@ -200,12 +336,11 @@ irqreturn_t hws_irq_handler(int irq, void *info)
 	/* Fast path: if suspended, quietly ack and exit */
 	if (READ_ONCE(pdx->suspended)) {
 		int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		if (int_state) {
-			writel(int_state, pdx->bar0_base + HWS_REG_INT_STATUS);
-			(void)readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		}
+		if (int_state)
+			hws_irq_ack_status(pdx, int_state);
 		return int_state ? IRQ_HANDLED : IRQ_NONE;
 	}
+
 	int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
 	if (!int_state || int_state == 0xFFFFFFFF) {
 		dev_dbg(&pdx->pdev->dev,
@@ -215,53 +350,35 @@ irqreturn_t hws_irq_handler(int irq, void *info)
 	}
 	dev_dbg(&pdx->pdev->dev, "irq: entry INT_STATUS=0x%08x\n", int_state);
 
-	/* Loop until all pending bits are serviced (max 100 iterations) */
-	for (u32 cnt = 0; int_state && cnt < MAX_INT_LOOPS; ++cnt) {
-		for (unsigned int ch = 0; ch < pdx->cur_max_video_ch; ++ch) {
-			u32 vbit = HWS_INT_VDONE_BIT(ch);
+	wake_thread = hws_irq_queue_video(pdx, int_state);
+	hws_irq_ack_status(pdx, int_state);
 
-			if (!(int_state & vbit))
-				continue;
+	return wake_thread ? IRQ_WAKE_THREAD : IRQ_HANDLED;
+}
 
-			if (READ_ONCE(pdx->video[ch].cap_active) &&
-			    !READ_ONCE(pdx->video[ch].stop_requested)) {
-				if (hws_toggle_debug) {
-					u32 toggle =
-					    readl_relaxed(pdx->bar0_base +
-						  HWS_REG_VBUF_TOGGLE(ch)) & 0x01;
-					WRITE_ONCE(pdx->video[ch].last_buf_half_toggle,
-						   toggle);
-				}
-				dma_rmb();
-				WRITE_ONCE(pdx->video[ch].half_seen, true);
-				dev_dbg(&pdx->pdev->dev,
-					"irq: VDONE ch=%u toggle=%u handling inline (cap=%d)\n",
-					ch,
-					READ_ONCE(pdx->video[ch].last_buf_half_toggle),
-					READ_ONCE(pdx->video[ch].cap_active));
-				hws_video_handle_vdone(&pdx->video[ch]);
-			} else {
-				dev_dbg(&pdx->pdev->dev,
-					"irq: VDONE ch=%u ignored (cap=%d stop=%d)\n",
-					ch,
-					READ_ONCE(pdx->video[ch].cap_active),
-					READ_ONCE(pdx->video[ch].stop_requested));
-			}
+irqreturn_t hws_irq_thread(int irq, void *info)
+{
+	struct hws_pcie_dev *pdx = info;
+	unsigned int ch;
+	unsigned int count = 0;
+	bool handled = false;
 
-			writel(vbit, pdx->bar0_base + HWS_REG_INT_STATUS);
-			(void)readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		}
+	(void)irq;
 
-		/* Re-read in case new interrupt bits popped while processing */
-		int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		dev_dbg(&pdx->pdev->dev,
-			"irq: loop cnt=%u new INT_STATUS=0x%08x\n", cnt,
-			int_state);
-		if (cnt + 1 == MAX_INT_LOOPS)
+	if (!pdx || !pdx->bar0_base)
+		return IRQ_NONE;
+
+	while (hws_irq_take_vdone(pdx, &ch)) {
+		handled = true;
+		if (READ_ONCE(pdx->suspended))
+			continue;
+
+		hws_video_handle_vdone(&pdx->video[ch]);
+		count++;
+		if (count == MAX_INT_LOOPS)
 			dev_warn_ratelimited(&pdx->pdev->dev,
-					     "IRQ storm? status=0x%08x\n",
-					     int_state);
+					     "threaded IRQ processing many VDONE events\n");
 	}
 
-	return IRQ_HANDLED;
+	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
diff --git a/drivers/media/pci/hws/hws_irq.h b/drivers/media/pci/hws/hws_irq.h
index a42867aa0c46..4374e9758e4d 100644
--- a/drivers/media/pci/hws/hws_irq.h
+++ b/drivers/media/pci/hws/hws_irq.h
@@ -6,5 +6,6 @@
 #include "hws.h"
 
 irqreturn_t hws_irq_handler(int irq, void *info);
+irqreturn_t hws_irq_thread(int irq, void *info);
 
 #endif /* HWS_INTERRUPT_H */
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
index 589d4840e116..b042bbfae350 100644
--- a/drivers/media/pci/hws/hws_pci.c
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -28,6 +28,11 @@
 #define HWS_BUSY_POLL_DELAY_US 10
 #define HWS_BUSY_POLL_TIMEOUT_US 1000000
 
+static bool hws_enable_audio = true;
+module_param_named(enable_audio, hws_enable_audio, bool, 0644);
+MODULE_PARM_DESC(enable_audio,
+		 "Enable ALSA HDMI audio capture devices; set to 0 for video-only mode");
+
 static unsigned long long hws_elapsed_us(u64 start_ns)
 {
 	return div_u64(ktime_get_mono_fast_ns() - start_ns, 1000);
@@ -125,6 +130,8 @@ static void hws_configure_hardware_capabilities(struct hws_pcie_dev *hdev)
 
 	if (hdev->cur_max_audio_ch > hdev->cur_max_video_ch)
 		hdev->cur_max_audio_ch = hdev->cur_max_video_ch;
+	if (!hws_enable_audio)
+		hdev->cur_max_audio_ch = 0;
 
 	/* universal buffer capacity */
 	hdev->max_hw_video_buf_sz = MAX_MM_VIDEO_SIZE;
@@ -519,6 +526,7 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	hws->irq = -1;
 	hws->suspended = false;
 	mutex_init(&hws->scratch_lock);
+	spin_lock_init(&hws->irq_thread_lock);
 	pci_set_drvdata(pdev, hws);
 
 	/* 1) Enable device + bus mastering (managed) */
@@ -584,10 +592,12 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	hws_irq_clear_pending(hws);
 
 	/* D) Request the legacy shared interrupt line (no vectors/MSI/MSI-X) */
-	ret = devm_request_irq(&pdev->dev, irq, hws_irq_handler, irqf,
-			       dev_name(&pdev->dev), hws);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, hws_irq_handler,
+					hws_irq_thread, irqf, dev_name(&pdev->dev),
+					hws);
 	if (ret) {
-		dev_err(&pdev->dev, "request_irq(%d) failed: %d\n", irq, ret);
+		dev_err(&pdev->dev, "request_threaded_irq(%d) failed: %d\n",
+			irq, ret);
 		goto err_unwind_channels;
 	}
 
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 1531d703f6d8..3a7b2abda502 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -11,6 +11,7 @@
 #include <linux/math64.h>
 #include <linux/interrupt.h>
 #include <linux/moduleparam.h>
+#include <linux/string.h>
 
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-ctrls.h>
@@ -39,7 +40,7 @@ static u32 hws_calc_sizeimage(struct hws_video *v, u16 w, u16 h,
 			      bool interlaced);
 
 /* DMA helper functions */
-static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma);
+static int hws_program_dma_window(struct hws_video *vid, dma_addr_t dma);
 static struct hwsvideo_buffer *
 hws_take_queued_buffer_locked(struct hws_video *vid);
 
@@ -58,7 +59,108 @@ module_param_named(dma_window_verify, dma_window_verify, bool, 0644);
 MODULE_PARM_DESC(dma_window_verify,
 		 "Read back DMA window registers after programming (debug)");
 
-static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
+static bool hws_dma_same_remap_page(dma_addr_t a, dma_addr_t b)
+{
+	return upper_32_bits(a) == upper_32_bits(b) &&
+	       (lower_32_bits(a) & PCI_E_BAR_ADD_MASK) ==
+	       (lower_32_bits(b) & PCI_E_BAR_ADD_MASK);
+}
+
+static size_t hws_video_bounce_size(void)
+{
+	return ALIGN((size_t)MAX_VIDEO_SCALER_SIZE, 64);
+}
+
+static bool hws_video_uses_audio_window(struct hws_video *vid)
+{
+	if (!vid || !vid->parent || vid->channel_index < 0)
+		return false;
+
+	return vid->channel_index < vid->parent->cur_max_audio_ch;
+}
+
+static void hws_ack_video_pending(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	u32 vbit = HWS_INT_VDONE_BIT(ch);
+
+	if (!hws || !hws->bar0_base)
+		return;
+
+	writel(vbit, hws->bar0_base + HWS_REG_INT_STATUS);
+	(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
+}
+
+static bool hws_video_dma_shares_channel_page(struct hws_video *vid,
+					      dma_addr_t dma, size_t size)
+{
+	struct hws_pcie_dev *hws;
+	struct hws_scratch_dma *aud;
+
+	if (!vid || !vid->parent)
+		return false;
+
+	if (!hws_dma_fits_remap_window(dma, size))
+		return false;
+
+	if (!hws_video_uses_audio_window(vid))
+		return true;
+
+	hws = vid->parent;
+	aud = &hws->scratch_aud[vid->channel_index];
+	if (!aud->cpu || !aud->size)
+		return true;
+
+	return hws_dma_same_remap_page(dma, aud->dma);
+}
+
+static int hws_select_video_dma(struct hws_video *vid,
+				struct hwsvideo_buffer *buf,
+				dma_addr_t *dma)
+{
+	struct hws_pcie_dev *hws;
+	struct hws_scratch_dma *arena;
+	dma_addr_t direct_dma;
+	size_t bounce_size;
+	unsigned int slot;
+
+	if (!vid || !buf || !dma)
+		return -EINVAL;
+
+	hws = vid->parent;
+	if (!hws)
+		return -ENODEV;
+
+	direct_dma = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+	if (hws_video_dma_shares_channel_page(vid, direct_dma,
+					      vid->pix.sizeimage)) {
+		buf->slot = HWS_VIDEO_DIRECT_SLOT;
+		*dma = direct_dma;
+		return 0;
+	}
+
+	if (!hws_video_uses_audio_window(vid))
+		return -EFBIG;
+
+	if (buf->vb.vb2_buf.memory == VB2_MEMORY_DMABUF)
+		return -EOPNOTSUPP;
+
+	arena = &hws->scratch_vid[vid->channel_index];
+	if (!arena->cpu || !arena->size)
+		return -ENOMEM;
+
+	bounce_size = hws_video_bounce_size();
+	if (vid->pix.sizeimage > bounce_size ||
+	    arena->size < HWS_VIDEO_BOUNCE_SLOTS * bounce_size)
+		return -EFBIG;
+
+	slot = vid->next_bounce_slot % HWS_VIDEO_BOUNCE_SLOTS;
+	vid->next_bounce_slot = (slot + 1) % HWS_VIDEO_BOUNCE_SLOTS;
+	buf->slot = slot;
+	*dma = arena->dma + slot * bounce_size;
+	return 0;
+}
+
+static int hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
 {
 	const u32 addr_mask = PCI_E_BAR_ADD_MASK;
 	const u32 addr_low_mask = PCI_E_BAR_ADD_LOWMASK;
@@ -120,6 +222,8 @@ static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
 		/* Flush posted writes before arming DMA */
 		readl_relaxed(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
 	}
+
+	return 0;
 }
 
 static struct hwsvideo_buffer *
@@ -138,32 +242,87 @@ hws_take_queued_buffer_locked(struct hws_video *vid)
 	return buf;
 }
 
-void hws_prime_next_locked(struct hws_video *vid)
+int hws_prime_next_locked(struct hws_video *vid)
 {
 	struct hws_pcie_dev *hws;
 	struct hwsvideo_buffer *next;
-	dma_addr_t dma;
+	int ret;
 
 	if (!vid)
-		return;
+		return -EINVAL;
 
 	hws = vid->parent;
 	if (!hws || !hws->bar0_base)
-		return;
+		return -ENODEV;
 
 	if (!READ_ONCE(vid->cap_active) || !vid->active || vid->next_prepared)
-		return;
+		return 0;
 
 	next = hws_take_queued_buffer_locked(vid);
 	if (!next)
-		return;
+		return 0;
+
+	ret = hws_program_dma_for_buffer(hws, vid->channel_index, next);
+	if (ret) {
+		list_add(&next->list, &vid->capture_queue);
+		vid->queued_count++;
+		return ret;
+	}
 
 	vid->next_prepared = next;
-	dma = vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
-	hws_program_dma_for_addr(hws, vid->channel_index, dma);
 	dev_dbg(&hws->pdev->dev,
-		"ch%u pre-armed next buffer %p dma=0x%llx\n",
-		vid->channel_index, next, (u64)dma);
+		"ch%u pre-armed next buffer %p slot=%d\n",
+		vid->channel_index, next, next->slot);
+	return 0;
+}
+
+int hws_video_prepare_done_buffer(struct hws_video *vid,
+				  struct hwsvideo_buffer *buf)
+{
+	struct hws_pcie_dev *hws;
+	struct vb2_v4l2_buffer *vb2v;
+	size_t expected;
+	size_t plane_size;
+
+	if (!vid || !buf)
+		return -EINVAL;
+
+	hws = vid->parent;
+	vb2v = &buf->vb;
+	expected = vid->pix.sizeimage;
+	plane_size = vb2_plane_size(&vb2v->vb2_buf, 0);
+
+	if (expected > plane_size)
+		return -EMSGSIZE;
+
+	dma_rmb();
+	if (buf->slot != HWS_VIDEO_DIRECT_SLOT) {
+		struct hws_scratch_dma *arena;
+		size_t bounce_size = hws_video_bounce_size();
+		void *src;
+		void *dst;
+
+		if (!hws || buf->slot < 0 || buf->slot >= HWS_VIDEO_BOUNCE_SLOTS)
+			return -EINVAL;
+
+		arena = &hws->scratch_vid[vid->channel_index];
+		if (!arena->cpu || arena->size < (buf->slot + 1) * bounce_size)
+			return -ENOMEM;
+
+		dst = vb2_plane_vaddr(&vb2v->vb2_buf, 0);
+		if (!dst)
+			return -EFAULT;
+
+		src = (u8 *)arena->cpu + buf->slot * bounce_size;
+		memcpy(dst, src, expected);
+	}
+
+	vb2_set_plane_payload(&vb2v->vb2_buf, 0, expected);
+	vb2v->field = vid->pix.field;
+	vb2v->sequence = (u32)atomic_fetch_inc(&vid->sequence_number);
+	vb2v->vb2_buf.timestamp = ktime_get_ns();
+	buf->slot = HWS_VIDEO_DIRECT_SLOT;
+	return 0;
 }
 
 static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
@@ -183,19 +342,19 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 	if (v->active) {
 		buf = v->active;
 		v->active = NULL;
-		buf->slot = 0;
+		buf->slot = HWS_VIDEO_DIRECT_SLOT;
 	} else if (!list_empty(&v->capture_queue)) {
 		buf = list_first_entry(&v->capture_queue,
 				       struct hwsvideo_buffer, list);
 		list_del_init(&buf->list);
 		if (v->queued_count)
 			v->queued_count--;
-		buf->slot = 0;
+		buf->slot = HWS_VIDEO_DIRECT_SLOT;
 	}
 	if (v->next_prepared) {
 		next = v->next_prepared;
 		v->next_prepared = NULL;
-		next->slot = 0;
+		next->slot = HWS_VIDEO_DIRECT_SLOT;
 		v->active = next;
 		have_next = true;
 	} else if (!list_empty(&v->capture_queue)) {
@@ -204,7 +363,7 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 		list_del_init(&next->list);
 		if (v->queued_count)
 			v->queued_count--;
-		next->slot = 0;
+		next->slot = HWS_VIDEO_DIRECT_SLOT;
 		v->active = next;
 		have_next = true;
 	} else {
@@ -221,16 +380,14 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 		if (dst)
 			memset(dst, 0x10, v->pix.sizeimage);
 		vb2_set_plane_payload(&vb2v->vb2_buf, 0, v->pix.sizeimage);
-		vb2v->sequence = (u32)atomic_inc_return(&v->sequence_number);
+		vb2v->field = v->pix.field;
+		vb2v->sequence = (u32)atomic_fetch_inc(&v->sequence_number);
 		vb2v->vb2_buf.timestamp = ktime_get_ns();
 		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
 	}
 	if (have_next && next) {
-		dma_addr_t dma =
-		    vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
-
-		hws_program_dma_for_addr(hws, v->channel_index, dma);
-		programmed = true;
+		if (!hws_program_dma_for_buffer(hws, v->channel_index, next))
+			programmed = true;
 	}
 	if (programmed) {
 		wmb(); /* ensure descriptors visible before enabling capture */
@@ -475,6 +632,7 @@ static int hws_buf_init(struct vb2_buffer *vb)
 	struct hwsvideo_buffer *b = to_hwsbuf(vb);
 
 	INIT_LIST_HEAD(&b->list);
+	b->slot = HWS_VIDEO_DIRECT_SLOT;
 	return 0;
 }
 
@@ -492,12 +650,17 @@ static void hws_buf_cleanup(struct vb2_buffer *vb)
 		list_del_init(&b->list);
 }
 
-void hws_program_dma_for_addr(struct hws_pcie_dev *hws, unsigned int ch,
-			      dma_addr_t dma)
+int hws_program_dma_for_buffer(struct hws_pcie_dev *hws, unsigned int ch,
+			       struct hwsvideo_buffer *buf)
 {
 	struct hws_video *vid = &hws->video[ch];
+	dma_addr_t dma;
+	int ret;
 
-	hws_program_dma_window(vid, dma);
+	ret = hws_select_video_dma(vid, buf, &dma);
+	if (ret)
+		return ret;
+	return hws_program_dma_window(vid, dma);
 }
 
 void hws_enable_video_capture(struct hws_pcie_dev *hws, unsigned int chan,
@@ -1091,6 +1254,11 @@ static void hws_buffer_queue(struct vb2_buffer *vb)
 	struct hwsvideo_buffer *buf = to_hwsbuf(vb);
 	struct hws_pcie_dev *hws = vid->parent;
 	unsigned long flags;
+	bool queue_error = false;
+	bool streaming;
+	int ret;
+	LIST_HEAD(done);
+	struct hwsvideo_buffer *b, *tmp;
 
 	dev_dbg(&hws->pdev->dev,
 		"buffer_queue(ch=%u): vb=%p sizeimage=%u q_active=%d\n",
@@ -1098,16 +1266,16 @@ static void hws_buffer_queue(struct vb2_buffer *vb)
 		READ_ONCE(vid->cap_active));
 
 	/* Initialize buffer slot */
-	buf->slot = 0;
+	buf->slot = HWS_VIDEO_DIRECT_SLOT;
 
 	spin_lock_irqsave(&vid->irq_lock, flags);
 	list_add_tail(&buf->list, &vid->capture_queue);
 	vid->queued_count++;
+	streaming = vb2_is_streaming(&vid->buffer_queue) &&
+		    !READ_ONCE(vid->stop_requested);
 
 	/* If streaming and no in-flight buffer, prime HW immediately */
-	if (READ_ONCE(vid->cap_active) && !vid->active) {
-		dma_addr_t dma_addr;
-
+	if (streaming && !vid->active) {
 		dev_dbg(&hws->pdev->dev,
 			"buffer_queue(ch=%u): priming first vb=%p\n",
 			vid->channel_index, &buf->vb.vb2_buf);
@@ -1115,17 +1283,35 @@ static void hws_buffer_queue(struct vb2_buffer *vb)
 		vid->queued_count--;
 		vid->active = buf;
 
-		dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
-		hws_program_dma_for_addr(vid->parent, vid->channel_index,
-					 dma_addr);
+		ret = hws_program_dma_for_buffer(vid->parent,
+						 vid->channel_index, buf);
+		if (ret) {
+			vid->active = NULL;
+			list_add(&buf->list, &vid->capture_queue);
+			vid->queued_count++;
+			WRITE_ONCE(vid->stop_requested, true);
+			hws_enable_video_capture(hws, vid->channel_index, false);
+			hws_video_collect_done_locked(vid, &done);
+			queue_error = true;
+			goto out_unlock;
+		}
 
+		hws_ack_video_pending(hws, vid->channel_index);
 		wmb(); /* ensure descriptors visible before enabling capture */
 		hws_enable_video_capture(hws, vid->channel_index, true);
 		hws_prime_next_locked(vid);
-	} else if (READ_ONCE(vid->cap_active) && vid->active) {
+	} else if (streaming && READ_ONCE(vid->cap_active) && vid->active) {
 		hws_prime_next_locked(vid);
 	}
+out_unlock:
 	spin_unlock_irqrestore(&vid->irq_lock, flags);
+	if (queue_error) {
+		list_for_each_entry_safe(b, tmp, &done, list) {
+			list_del_init(&b->list);
+			vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		}
+		vb2_queue_error(&vid->buffer_queue);
+	}
 }
 
 static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
@@ -1133,8 +1319,8 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct hws_video *v = q->drv_priv;
 	struct hws_pcie_dev *hws = v->parent;
 	struct hwsvideo_buffer *to_program = NULL;	/* local copy */
-	struct vb2_buffer *prog_vb2 = NULL;
 	unsigned long flags;
+	bool scratch_acquired = false;
 	int ret;
 
 	dev_dbg(&hws->pdev->dev, "start_streaming: ch=%u count=%u\n",
@@ -1169,15 +1355,48 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 		return ret;
 	}
 
+	if (hws_video_uses_audio_window(v)) {
+		ret = hws_alloc_channel_scratch(hws, v->channel_index);
+		if (ret) {
+			struct hwsvideo_buffer *b, *tmp;
+			unsigned long f;
+			LIST_HEAD(queued);
+
+			spin_lock_irqsave(&v->irq_lock, f);
+			if (v->active) {
+				list_add_tail(&v->active->list, &queued);
+				v->active = NULL;
+			}
+			if (v->next_prepared) {
+				list_add_tail(&v->next_prepared->list, &queued);
+				v->next_prepared = NULL;
+			}
+			while (!list_empty(&v->capture_queue)) {
+				b = list_first_entry(&v->capture_queue,
+						     struct hwsvideo_buffer, list);
+				list_move_tail(&b->list, &queued);
+			}
+			spin_unlock_irqrestore(&v->irq_lock, f);
+
+			list_for_each_entry_safe(b, tmp, &queued, list) {
+				list_del_init(&b->list);
+				vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+			}
+			return ret;
+		}
+		scratch_acquired = true;
+	}
+
 	(void)hws_read_active_state(hws, v->channel_index,
 				       &v->pix.interlaced);
 
 	lockdep_assert_held(&v->state_lock);
 	/* init per-stream state */
 	WRITE_ONCE(v->stop_requested, false);
-	WRITE_ONCE(v->cap_active, true);
+	WRITE_ONCE(v->cap_active, false);
 	WRITE_ONCE(v->half_seen, false);
 	WRITE_ONCE(v->last_buf_half_toggle, 0);
+	atomic_set(&v->sequence_number, 0);
 
 	/* Try to prime a buffer, but it's OK if none are queued yet */
 	spin_lock_irqsave(&v->irq_lock, flags);
@@ -1187,7 +1406,6 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 		list_del_init(&to_program->list);
 		v->queued_count--;
 		v->active = to_program;
-		prog_vb2 = &to_program->vb.vb2_buf;
 		dev_dbg(&hws->pdev->dev,
 			"start_streaming: ch=%u took buffer %p\n",
 			v->channel_index, to_program);
@@ -1196,17 +1414,35 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	/* Only program/enable HW if we actually have a buffer */
 	if (to_program) {
-		if (!prog_vb2)
-			prog_vb2 = &to_program->vb.vb2_buf;
 		{
-			dma_addr_t dma_addr;
-
-			dma_addr = vb2_dma_contig_plane_dma_addr(prog_vb2, 0);
-			hws_program_dma_for_addr(hws, v->channel_index, dma_addr);
+			LIST_HEAD(queued);
+			struct hwsvideo_buffer *b, *tmp;
+
+			ret = hws_program_dma_for_buffer(hws, v->channel_index,
+							 to_program);
+			if (ret) {
+				unsigned long f;
+
+				WRITE_ONCE(v->cap_active, false);
+				WRITE_ONCE(v->stop_requested, true);
+				spin_lock_irqsave(&v->irq_lock, f);
+				hws_video_collect_done_locked(v, &queued);
+				spin_unlock_irqrestore(&v->irq_lock, f);
+
+				list_for_each_entry_safe(b, tmp, &queued, list) {
+					list_del_init(&b->list);
+					vb2_buffer_done(&b->vb.vb2_buf,
+							VB2_BUF_STATE_QUEUED);
+				}
+				if (scratch_acquired)
+					hws_release_channel_scratch(hws,
+								    v->channel_index);
+				return ret;
+			}
 			dev_dbg(&hws->pdev->dev,
-				"start_streaming: ch=%u programmed buffer %p dma=0x%08x\n",
-				v->channel_index, to_program,
-				lower_32_bits(dma_addr));
+				"start_streaming: ch=%u programmed buffer %p slot=%d\n",
+				v->channel_index, to_program, to_program->slot);
+			hws_ack_video_pending(hws, v->channel_index);
 			(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
 		}
 
@@ -1295,6 +1531,8 @@ static void hws_stop_streaming(struct vb2_queue *q)
 		"video:streamoff:done ch=%u completed=%u (%lluus)\n",
 		v->channel_index, done_cnt, hws_elapsed_us(start_ns));
 	hws_log_video_state(v, "streamoff", "end");
+	if (hws_video_uses_audio_window(v))
+		hws_release_channel_scratch(hws, v->channel_index);
 }
 
 static const struct vb2_ops hwspcie_video_qops = {
@@ -1363,7 +1601,7 @@ int hws_video_register(struct hws_pcie_dev *dev)
 		q = &ch->buffer_queue;
 		memset(q, 0, sizeof(*q));
 		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-		q->io_modes = VB2_MMAP | VB2_DMABUF;
+		q->io_modes = VB2_MMAP;
 		q->drv_priv = ch;
 		q->buf_struct_size = sizeof(struct hwsvideo_buffer);
 		q->ops = &hwspcie_video_qops;
diff --git a/drivers/media/pci/hws/hws_video.h b/drivers/media/pci/hws/hws_video.h
index fcd3eca0b0c3..c5a4c9a545a7 100644
--- a/drivers/media/pci/hws/hws_video.h
+++ b/drivers/media/pci/hws/hws_video.h
@@ -9,7 +9,7 @@ void hws_video_unregister(struct hws_pcie_dev *dev);
 void hws_enable_video_capture(struct hws_pcie_dev *hws,
 			      unsigned int chan,
 			      bool on);
-void hws_prime_next_locked(struct hws_video *vid);
+int hws_prime_next_locked(struct hws_video *vid);
 
 int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch);
 void hws_video_cleanup_channel(struct hws_pcie_dev *pdev, int ch);
@@ -17,9 +17,11 @@ void check_video_format(struct hws_pcie_dev *pdx);
 int hws_check_card_status(struct hws_pcie_dev *hws);
 void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable);
 
-void hws_program_dma_for_addr(struct hws_pcie_dev *hws,
-			      unsigned int ch,
-			      dma_addr_t dma);
+int hws_program_dma_for_buffer(struct hws_pcie_dev *hws,
+			       unsigned int ch,
+			       struct hwsvideo_buffer *buf);
+int hws_video_prepare_done_buffer(struct hws_video *vid,
+				  struct hwsvideo_buffer *buf);
 
 int hws_video_quiesce(struct hws_pcie_dev *hws, const char *reason);
 void hws_video_pm_resume(struct hws_pcie_dev *hws);
-- 
2.54.0


From 6aa7cfc3f33f2f3ec1bde73102fb01d51042f325 Mon Sep 17 00:00:00 2001
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Thu, 25 Jun 2026 06:22:25 -0400
Subject: [PATCH 4/5] media: hws: harden video DMA queue ownership

---
 drivers/media/pci/hws/hws_video.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 3a7b2abda502..58bcc2e7030d 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -330,8 +330,8 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 	struct hws_pcie_dev *hws;
 	unsigned long flags;
 	struct hwsvideo_buffer *buf = NULL, *next = NULL;
-	bool have_next = false;
 	bool programmed = false;
+	int ret = 0;
 
 	if (!v)
 		return false;
@@ -354,22 +354,31 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 	if (v->next_prepared) {
 		next = v->next_prepared;
 		v->next_prepared = NULL;
-		next->slot = HWS_VIDEO_DIRECT_SLOT;
 		v->active = next;
-		have_next = true;
+		programmed = true;
 	} else if (!list_empty(&v->capture_queue)) {
 		next = list_first_entry(&v->capture_queue,
 					struct hwsvideo_buffer, list);
 		list_del_init(&next->list);
 		if (v->queued_count)
 			v->queued_count--;
-		next->slot = HWS_VIDEO_DIRECT_SLOT;
-		v->active = next;
-		have_next = true;
+		ret = hws_program_dma_for_buffer(hws, v->channel_index, next);
+		if (ret) {
+			list_add(&next->list, &v->capture_queue);
+			v->queued_count++;
+			next = NULL;
+		} else {
+			v->active = next;
+			programmed = true;
+		}
 	} else {
 		v->active = NULL;
 	}
 	spin_unlock_irqrestore(&v->irq_lock, flags);
+	if (ret)
+		dev_warn_ratelimited(&hws->pdev->dev,
+				     "%s: failed to arm no-signal buffer ch=%u ret=%d\n",
+				     tag, v->channel_index, ret);
 	if (!buf)
 		return false;
 	/* Complete buffer with a neutral frame so dequeuers keep running. */
@@ -385,10 +394,6 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 		vb2v->vb2_buf.timestamp = ktime_get_ns();
 		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
 	}
-	if (have_next && next) {
-		if (!hws_program_dma_for_buffer(hws, v->channel_index, next))
-			programmed = true;
-	}
 	if (programmed) {
 		wmb(); /* ensure descriptors visible before enabling capture */
 		hws_enable_video_capture(hws, v->channel_index, true);
-- 
2.54.0


From 2af23458ade640442e4bcb5e6f215a0324f17b11 Mon Sep 17 00:00:00 2001
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Thu, 25 Jun 2026 06:22:55 -0400
Subject: [PATCH 5/5] media: hws: add HDMI audio capture support

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

