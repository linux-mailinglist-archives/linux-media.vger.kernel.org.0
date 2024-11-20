Return-Path: <linux-media+bounces-21677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C629D3E79
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 16:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50B451F24E48
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1641D14E4;
	Wed, 20 Nov 2024 14:56:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA41D097F;
	Wed, 20 Nov 2024 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114565; cv=none; b=Li6kSyt2BUTkNsTuAGvbL6iXumRne0PPQ8tiaHaRMKpfXwXMmPr/S8r/o2o+/ikLvdH38cO4/JWxYBsk3nUjfXLQJNPX4etsIVFlX2g5aRVSU0faWQmy2uSx6QFdo0j3dFV1pv+qHf/18x3vdleo3LvLxzLF4dl38d3ROoFqxsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114565; c=relaxed/simple;
	bh=kIG+NzLjc40LveG2RWiM3dyEoF6S9l1AQNPYWTk+x+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ggH08U7PCyMuCz2n/In0mjHRxSssatbpvqKxeJQHrjGt5VbroLR9/zj209P/ImMwb9V5LknQKESOtKaRarWngL3MhMgzKj0ZU+d2CgLeowuxHqr6DoJmQasRwd8eyQJGs2Q8SR6mo++XvUbKuRjJAKj6soZ4OEMss4Ad8Hfxq44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id B69F1633E7;
	Wed, 20 Nov 2024 15:48:54 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 3/3] media: mgb4: Defines cleanup
Date: Wed, 20 Nov 2024 15:48:46 +0100
Message-ID: <20241120144846.2271-4-tumic@gpxsee.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120144846.2271-1-tumic@gpxsee.org>
References: <20241120144846.2271-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Do not define stuff used in a single source file in a global header.
Do not mix defines with "bare" values in the initialization.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_core.c | 4 +++-
 drivers/media/pci/mgb4/mgb4_core.h | 3 ---
 drivers/media/pci/mgb4/mgb4_vout.c | 9 ++-------
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index bc63dc81bcae..8ceaed5c1453 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -40,7 +40,9 @@
 #include "mgb4_trigger.h"
 #include "mgb4_core.h"
 
-#define MGB4_USER_IRQS 16
+#define MGB4_USER_IRQS  16
+#define MGB4_MGB4_BAR_ID 0
+#define MGB4_XDMA_BAR_ID 1
 
 #define DIGITEQ_VID 0x1ed8
 #define T100_DID    0x0101
diff --git a/drivers/media/pci/mgb4/mgb4_core.h b/drivers/media/pci/mgb4/mgb4_core.h
index 9aec62514c0b..e86742d7b6c4 100644
--- a/drivers/media/pci/mgb4/mgb4_core.h
+++ b/drivers/media/pci/mgb4/mgb4_core.h
@@ -18,9 +18,6 @@
 #define MGB4_VIN_DEVICES  2
 #define MGB4_VOUT_DEVICES 2
 
-#define MGB4_MGB4_BAR_ID  0
-#define MGB4_XDMA_BAR_ID  1
-
 #define MGB4_IS_GMSL(mgbdev) \
 	((mgbdev)->module_version >> 4 == 2)
 #define MGB4_IS_FPDL3(mgbdev) \
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 600f858918e7..14c5725bd4d8 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -24,10 +24,6 @@
 #include "mgb4_cmt.h"
 #include "mgb4_vout.h"
 
-#define DEFAULT_WIDTH     1280
-#define DEFAULT_HEIGHT    640
-#define DEFAULT_PERIOD    (MGB4_HW_FREQ / 60)
-
 ATTRIBUTE_GROUPS(mgb4_fpdl3_out);
 ATTRIBUTE_GROUPS(mgb4_gmsl_out);
 
@@ -664,11 +660,10 @@ static void fpga_init(struct mgb4_vout_dev *voutdev)
 	const struct mgb4_vout_regs *regs = &voutdev->config->regs;
 
 	mgb4_write_reg(video, regs->config, 0x00000011);
-	mgb4_write_reg(video, regs->resolution,
-		       (DEFAULT_WIDTH << 16) | DEFAULT_HEIGHT);
+	mgb4_write_reg(video, regs->resolution, (1280 << 16) | 640);
 	mgb4_write_reg(video, regs->hsync, 0x00283232);
 	mgb4_write_reg(video, regs->vsync, 0x40141F1E);
-	mgb4_write_reg(video, regs->frame_limit, DEFAULT_PERIOD);
+	mgb4_write_reg(video, regs->frame_limit, MGB4_HW_FREQ / 60);
 	mgb4_write_reg(video, regs->padding, 0x00000000);
 
 	voutdev->freq = mgb4_cmt_set_vout_freq(voutdev, 61150 >> 1) << 1;
-- 
2.47.0


