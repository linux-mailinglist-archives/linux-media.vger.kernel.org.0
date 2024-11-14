Return-Path: <linux-media+bounces-21395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F46C9C805F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 03:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5ED24B252D9
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 02:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B7F1E5723;
	Thu, 14 Nov 2024 02:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="JG31iwGc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F7518641;
	Thu, 14 Nov 2024 02:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731550011; cv=none; b=ohmKaP0TOXN8hU2DMeRbSpjCiez4Ma4nqkkmPlyQSTRRvXnjq12FXREnhnUJ25JWgXLe6JBQGxi4JIW62DXZVcMYlVO/kfOKWtWWFDZgws1QERQ9cikzcEc2qlw2nxuXFxtcoJF8JoVh6jCAxNFPICAov3sdqk5tdapQ1/BXtLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731550011; c=relaxed/simple;
	bh=6huMnpSgqP+wEFrua2jjupo85dRw+e1pKg5dGzs3rhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HI9B+kt4zE0MBFnoMfxs6EuyIy6jADX0Kw+9UPILaeQx72pGiZOuTXR5tozsmrE3bj6PRNHgOn+TiXW8qw5H4znHymo+SeIxF301AzwtxZbU8CKXJfsiqnuA+hOrHmRH662PMc2VYOH7+cA6isrs+imbXJ83Amqm3ua4ysbdTng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=JG31iwGc; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=aYqNAbWwHtAitjMXdVYel/iWD1XTqhUa6HvabsCGd/k=; b=JG31iwGcyQi/3SPn
	OM/Ws7GNwysi8gMn29UNdVe8T+9OL+h7nTH9JN940fnUPnfmB4nmRChm51DFZY7orueHtj+/bvlK9
	FFS/LdhcEpW1O/urnPfTNGpXYDILAZGoLCmv5qPKHflc9sh4AMrjuQ62MG2y8UIv8tUHsYfiMi5f5
	VaCuwfoGfCHilhKrn2Ik/ANiLEi6iVuEDwqJWJdsgb36tNVEhYGcX8uoVhruo9+8bjdO+V2HVcISf
	IZRDhmoDIkyMgbJ1dyvEz3Zj/RaQEjtvcNIYwM2WXPDaJoXJDfgpSTkgnnR+9Fgyg/RLqp9zS3mDD
	pRWiOvG85nzZNVk68g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tBPFo-00HPhu-2R;
	Thu, 14 Nov 2024 02:06:40 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: b2c2: Remove unused functions
Date: Thu, 14 Nov 2024 02:06:36 +0000
Message-ID: <20241114020636.299783-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

flexcop_dma_control_size_irq() last use was removed in 2005 by
commit 64221be7b900 ("[PATCH] dvb: flexcop: woraround irq stop problem")

flexcop_dump_reg() last use was removed in 2009 by
commit 382c5546d618 ("V4L/DVB (10694): [PATCH] software IRQ watchdog for
Flexcop B2C2 DVB PCI cards")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/common/b2c2/flexcop-common.h |  4 ----
 drivers/media/common/b2c2/flexcop-misc.c   | 13 -------------
 drivers/media/pci/b2c2/flexcop-dma.c       | 17 -----------------
 3 files changed, 34 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop-common.h b/drivers/media/common/b2c2/flexcop-common.h
index f944c59cf495..a468ea7e77a1 100644
--- a/drivers/media/common/b2c2/flexcop-common.h
+++ b/drivers/media/common/b2c2/flexcop-common.h
@@ -125,8 +125,6 @@ void flexcop_dma_free(struct flexcop_dma *dma);
 
 int flexcop_dma_control_timer_irq(struct flexcop_device *fc,
 		flexcop_dma_index_t no, int onoff);
-int flexcop_dma_control_size_irq(struct flexcop_device *fc,
-		flexcop_dma_index_t no, int onoff);
 int flexcop_dma_config(struct flexcop_device *fc, struct flexcop_dma *dma,
 		flexcop_dma_index_t dma_idx);
 int flexcop_dma_xfer_control(struct flexcop_device *fc,
@@ -170,8 +168,6 @@ int flexcop_sram_init(struct flexcop_device *fc);
 void flexcop_determine_revision(struct flexcop_device *fc);
 void flexcop_device_name(struct flexcop_device *fc,
 		const char *prefix, const char *suffix);
-void flexcop_dump_reg(struct flexcop_device *fc,
-		flexcop_ibi_register reg, int num);
 
 /* from flexcop-hw-filter.c */
 int flexcop_pid_feed_control(struct flexcop_device *fc,
diff --git a/drivers/media/common/b2c2/flexcop-misc.c b/drivers/media/common/b2c2/flexcop-misc.c
index 83d01d3a81cc..251c4f731ed1 100644
--- a/drivers/media/common/b2c2/flexcop-misc.c
+++ b/drivers/media/common/b2c2/flexcop-misc.c
@@ -70,16 +70,3 @@ void flexcop_device_name(struct flexcop_device *fc,
 			flexcop_bus_names[fc->bus_type],
 			flexcop_revision_names[fc->rev], suffix);
 }
-
-void flexcop_dump_reg(struct flexcop_device *fc,
-		flexcop_ibi_register reg, int num)
-{
-	flexcop_ibi_value v;
-	int i;
-	for (i = 0; i < num; i++) {
-		v = fc->read_ibi_reg(fc, reg+4*i);
-		deb_rdump("0x%03x: %08x, ", reg+4*i, v.raw);
-	}
-	deb_rdump("\n");
-}
-EXPORT_SYMBOL(flexcop_dump_reg);
diff --git a/drivers/media/pci/b2c2/flexcop-dma.c b/drivers/media/pci/b2c2/flexcop-dma.c
index ff8058568240..2ef97be4dc54 100644
--- a/drivers/media/pci/b2c2/flexcop-dma.c
+++ b/drivers/media/pci/b2c2/flexcop-dma.c
@@ -123,23 +123,6 @@ static int flexcop_dma_remap(struct flexcop_device *fc,
 	return 0;
 }
 
-int flexcop_dma_control_size_irq(struct flexcop_device *fc,
-		flexcop_dma_index_t no,
-		int onoff)
-{
-	flexcop_ibi_value v = fc->read_ibi_reg(fc, ctrl_208);
-
-	if (no & FC_DMA_1)
-		v.ctrl_208.DMA1_IRQ_Enable_sig = onoff;
-
-	if (no & FC_DMA_2)
-		v.ctrl_208.DMA2_IRQ_Enable_sig = onoff;
-
-	fc->write_ibi_reg(fc, ctrl_208, v);
-	return 0;
-}
-EXPORT_SYMBOL(flexcop_dma_control_size_irq);
-
 int flexcop_dma_control_timer_irq(struct flexcop_device *fc,
 		flexcop_dma_index_t no,
 		int onoff)
-- 
2.47.0


