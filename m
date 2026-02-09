Return-Path: <linux-media+bounces-52372-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KcmBK8R9iWks+AQAu9opvQ
	(envelope-from <linux-media+bounces-52372-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 07:25:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F9A10C03E
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 07:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77AA830086E4
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 06:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0E72EA75E;
	Mon,  9 Feb 2026 06:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b="ed/15cvd"
X-Original-To: linux-media@vger.kernel.org
Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBFF238C23
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 06:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770618301; cv=none; b=cO3Ib9pkkCYehXhIXm2v4FGyRrw9MBKYldu+T4KjsoPU4xJtRrXoenQjN129TLxc6u5c5TyC12HFUtjH+9kWmpIZAh2YH/dqDMv86BQLCT3HlFfxVupU5SqPVV4jpdltOb8jXaIsBU9O5CnABfeWxvhdNST9nJLoMmA2cID45eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770618301; c=relaxed/simple;
	bh=xQgVXZmDtOKTeK45bDxS77nXxtn+Miyqu+uiECbQin0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d5DRJJ6LB04TPNbaFEytSG9PQzmOetcvhs0h3qglXv7zHCHu0azi2yrjMBIm0VRF5TSPvVJxpE8MDG9Yu01mtwes6QUSSRkOOt9SeLtpk8p2qCgxyK/xHjpJVMqrd/Zqq6Rwrz4jIq5uZIcZ6OBDmh2yut/4PYg4qx3wKNDs4Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca; spf=pass smtp.mailfrom=r-sc.ca; dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b=ed/15cvd; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Received: from Mac.pk.shawcable.net (S0106dceb699ec90f.pk.shawcable.net [24.69.43.232])
	(using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA512)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4f8ZGh26Ymz2x98;
	Mon, 09 Feb 2026 06:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1770617821;
	bh=ZuGST2Dffqhy85rXRhQy0SXLffiScH9lHHsptaYe8Z4=;
	h=From:To:Cc:Subject:Date:From;
	b=ed/15cvdzXYS9Ax9gV5ms+WjYN1QxTu0+pKnmbBZ2zbwfAeqn50rAnf+EPMxCsGcC
	 W1kIcH+Fr/fV4lJ5LfJH1oV4sGiARX96VrESvvZUPxDMZ2I8XF7AR/tIYk3ZnsdweU
	 yYYw2GrPDB1qXI7oB9Jmxzs60JD7cyieZQfoXs73pNTFvUXXkKCn6497bDLcRFH+1q
	 p7scJ92BszNMPgit62NBjGKRfwke4diCGVOSBswvoK5vafrwjihAzwj+UeqhPkeX73
	 2EXJhENnleQ9+ih/KPstnZf7LlyeYYwOlO3Th8c/lzpyK6UETiG3GHtRPG6McU52Yk
	 /5Qqnkm6uNKmg==
From: Ross Cawston <ross@r-sc.ca>
To: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	hans.verkuil@cisco.com,
	ezequiel@collabora.com,
	benjamin.gaignard@collabora.com,
	"Ross Cawston Mon Sep 8 06 : 05 : 00 2026" <ross@r-sc.ca>
Subject: [PATCH] media: hdmirx: snps, rk: Fix EDID injection with proper HPD toggle on RK3588
Date: Sun,  8 Feb 2026 22:16:51 -0800
Message-ID: <20260209061654.54757-1-ross@r-sc.ca>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[r-sc.ca:s=spacemail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[r-sc.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52372-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross@r-sc.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[r-sc.ca:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,r-sc.ca:email,r-sc.ca:dkim,r-sc.ca:mid]
X-Rspamd-Queue-Id: C6F9A10C03E
X-Rspamd-Action: no action

The existing VIDIOC_S_EDID implementation writes EDID data but does not
properly trigger source renegotiation on RK3588 boards. This results in
no visible change to the source device despite the ioctl succeeding.

Even re-plugging the HDMI cable does not trigger renegotiation on previous
versions of the driver. This version reliably triggers renegotiation on
EDID injection on tested hardware.

Fix by mirroring the vendor BSP behavior:
- Disable HDMI and DMA IRQs to avoid races.
- Simulate plugout if 5V power is present.
- Toggle HPD low before write.
- Schedule a delayed hotplug workqueue (1000ms) to re-enable HPD and
  force renegotiation.

Bump WAIT_SIGNAL_LOCK_TIME from 300ms to 600ms to ensure lock.

This ensures custom EDIDs take effect reliably, allowing userspace to
force specific resolutions/timings.

Tested on Orange Pi 5 Ultra and Radxa Rock 5B — sources now correctly
re-detect and lock to the new EDID modes.

Signed-off-by: Ross Cawston <ross@r-sc.ca>

---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 43 +++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index abc123..def456 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -88,6 +88,10 @@
 	HDMIRX_NUM_RST,
 };
 
+#define WAIT_SIGNAL_LOCK_TIME		600
+#define NO_LOCK_CFG_RETRY_TIME		300
+#define WAIT_LOCK_STABLE_TIME		20
+
 static const char *const pix_fmt_str[] = {
 	"RGB888",
 	"YUV422",
@@ -620,6 +624,7 @@
 
 	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED, 0);
 	hdmirx_interrupts_setup(hdmirx_dev, false);
+	hdmirx_hpd_ctrl(hdmirx_dev, false);
 	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, HDMIRX_DMA_EN, 0);
 	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG4,
 			   LINE_FLAG_INT_EN |
@@ -680,16 +685,32 @@
 	 */
 	mutex_lock(&hdmirx_dev->work_lock);
 
+	/*
+	 * Some sources won't re-read EDID unless we avoid IRQ races and
+	 * force a full plugout/HPD low sequence. On several tested devices,
+	 * leaving IRQs enabled or skipping plugout kept the old EDID cached.
+	 */
+	disable_irq(hdmirx_dev->hdmi_irq);
+	disable_irq(hdmirx_dev->dma_irq);
+
+	if (tx_5v_power_present(hdmirx_dev))
+		hdmirx_plugout(hdmirx_dev);
+
 	hdmirx_hpd_ctrl(hdmirx_dev, false);
 
 	if (edid->blocks) {
 		hdmirx_write_edid(hdmirx_dev, edid);
-		hdmirx_hpd_ctrl(hdmirx_dev, true);
 	} else {
 		cec_phys_addr_invalidate(hdmirx_dev->cec->adap);
 		hdmirx_dev->edid_blocks_written = 0;
 	}
 
+	enable_irq(hdmirx_dev->dma_irq);
+	enable_irq(hdmirx_dev->hdmi_irq);
+
+	queue_delayed_work(system_unbound_wq, &hdmirx_dev->delayed_work_hotplug,
+			   msecs_to_jiffies(1000));
+
 	mutex_unlock(&hdmirx_dev->work_lock);
 
 	return 0;
@@ -2082,9 +2103,9 @@
 {
 	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
 	u32 mu_status, scdc_status, dma_st10, cmu_st;
-	u32 i;
+	u32 i, j = 0;
 
-	for (i = 0; i < 300; i++) {
+	for (i = 1; i < WAIT_SIGNAL_LOCK_TIME; i++) {
 		mu_status = hdmirx_readl(hdmirx_dev, MAINUNIT_STATUS);
 		scdc_status = hdmirx_readl(hdmirx_dev, SCDC_REGBANK_STATUS3);
 		dma_st10 = hdmirx_readl(hdmirx_dev, DMA_STATUS10);
@@ -2093,8 +2114,16 @@
 		if ((mu_status & TMDSVALID_STABLE_ST) &&
 		    (dma_st10 & HDMIRX_LOCK) &&
 		    (cmu_st & TMDSQPCLK_LOCKED_ST))
+			j++;
+		else
+			j = 0;
+
+		if (j > WAIT_LOCK_STABLE_TIME)
 			break;
 
+		if (i % NO_LOCK_CFG_RETRY_TIME == 0)
+			hdmirx_phy_config(hdmirx_dev);
+
 		if (!tx_5v_power_present(hdmirx_dev)) {
 			v4l2_dbg(1, debug, v4l2_dev,
 				 "%s: HDMI pull out, return\n", __func__);
@@ -2104,7 +2133,7 @@
 		hdmirx_tmds_clk_ratio_config(hdmirx_dev);
 	}
 
-	if (i == 300) {
+	if (i == WAIT_SIGNAL_LOCK_TIME) {
 		v4l2_err(v4l2_dev, "%s: signal not lock, tmds_clk_ratio:%d\n",
 			 __func__, hdmirx_dev->tmds_clk_ratio);
 		v4l2_err(v4l2_dev, "%s: mu_st:%#x, scdc_st:%#x, dma_st10:%#x\n",
@@ -2127,7 +2156,8 @@
 				   PKTDEC_AVIIF_RCV_IRQ, 0);
 	}
 
-	msleep(50);
+	hdmirx_reset_dma(hdmirx_dev);
+	msleep(500);
 	hdmirx_format_change(hdmirx_dev);
 
 	return 0;
@@ -2141,6 +2171,7 @@
 	hdmirx_submodule_init(hdmirx_dev);
 	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED,
 			   POWERPROVIDED);
+	hdmirx_hpd_ctrl(hdmirx_dev, true);
 	hdmirx_phy_config(hdmirx_dev);
 	hdmirx_interrupts_setup(hdmirx_dev, true);
 

