Return-Path: <linux-media+bounces-25315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E83A1DA43
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 17:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA42B7A3923
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 16:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B341632DA;
	Mon, 27 Jan 2025 16:10:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E4A13B5B6;
	Mon, 27 Jan 2025 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737994210; cv=none; b=NjRauHKbdQNdmIjP1hmjFkuXjvWj15iTLJGVKH9bdKf7OoErRbjfcIaOfDIOwMUHQvO85Nby3Fh9TQ43lFr6xkFco4rTEXyXKof37aVuKjQvdn1ZGOdPPwGACJnNcwHknvkW+3OtRvCPf1SfaE3snXO5d942KM182NPFGUbej2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737994210; c=relaxed/simple;
	bh=WnTdDqsuzQboYr6r6Dsr/8poUVdirk8ZehRnBi+TQXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hE4xHp7KTj9Q1D5VKWxmsbZdG80TxG4paUORywStwuL6hfD862cXFBI9mTbgd4Cn6pl4u3Y3scD39XmOYVXZ7kY9y8GWx/sjx5LvdjKhJwzIAz6Au2ZKGcVVW/3Pp3ismvcQ5UPTSIDjniOyikmxe/ZzxtlbUq48BWOX7kh/KVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 2E7225413D;
	Mon, 27 Jan 2025 17:00:03 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 1/2] media: mgb4: Added support for additional GMSL modules variants
Date: Mon, 27 Jan 2025 16:59:56 +0100
Message-ID: <20250127155957.5254-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250127155957.5254-1-tumic@gpxsee.org>
References: <20250127155957.5254-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Added support for GMSL modules variants 3 and 4. Variant 3 is the same as
variant 2 from the driver's point of view. Variant 4 has "hardwired" daisy
chain loopback outputs and thus missing the v4l2 outputs.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_core.c | 13 +++++++++----
 drivers/media/pci/mgb4/mgb4_core.h |  8 ++++++--
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index 8ceaed5c1453..23bc04129827 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -406,8 +406,9 @@ static int get_module_version(struct mgb4_dev *mgbdev)
 		dev_err(dev, "unknown module type\n");
 		return -EINVAL;
 	}
-	fw_version = mgb4_read_reg(&mgbdev->video, 0xC4);
-	if (fw_version >> 24 != mgbdev->module_version >> 4) {
+	fw_version = mgb4_read_reg(&mgbdev->video, 0xC4) >> 24;
+	if ((MGB4_IS_FPDL3(mgbdev) && fw_version != 1) ||
+	    (MGB4_IS_GMSL(mgbdev) && fw_version != 2)) {
 		dev_err(dev, "module/firmware type mismatch\n");
 		return -EINVAL;
 	}
@@ -599,14 +600,18 @@ static int mgb4_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	rv = get_module_version(mgbdev);
 	if (rv < 0)
 		goto exit;
+	/* Propagate the module type(version) to the FPGA */
+	mgb4_write_reg(&mgbdev->video, 0xD4, mgbdev->module_version);
 
 	/* Video input v4l2 devices */
 	for (i = 0; i < MGB4_VIN_DEVICES; i++)
 		mgbdev->vin[i] = mgb4_vin_create(mgbdev, i);
 
 	/* Video output v4l2 devices */
-	for (i = 0; i < MGB4_VOUT_DEVICES; i++)
-		mgbdev->vout[i] = mgb4_vout_create(mgbdev, i);
+	if (MGB4_HAS_VOUT(mgbdev)) {
+		for (i = 0; i < MGB4_VOUT_DEVICES; i++)
+			mgbdev->vout[i] = mgb4_vout_create(mgbdev, i);
+	}
 
 	/* Triggers */
 	mgbdev->indio_dev = mgb4_trigger_create(mgbdev);
diff --git a/drivers/media/pci/mgb4/mgb4_core.h b/drivers/media/pci/mgb4/mgb4_core.h
index e86742d7b6c4..cc24068400a2 100644
--- a/drivers/media/pci/mgb4/mgb4_core.h
+++ b/drivers/media/pci/mgb4/mgb4_core.h
@@ -19,9 +19,13 @@
 #define MGB4_VOUT_DEVICES 2
 
 #define MGB4_IS_GMSL(mgbdev) \
-	((mgbdev)->module_version >> 4 == 2)
+	((((mgbdev)->module_version >> 4) >= 2) && \
+	 (((mgbdev)->module_version >> 4) <= 4))
 #define MGB4_IS_FPDL3(mgbdev) \
-	((mgbdev)->module_version >> 4 == 1)
+	(((mgbdev)->module_version >> 4) == 1)
+#define MGB4_HAS_VOUT(mgbdev) \
+	((((mgbdev)->module_version >> 4) >= 1) && \
+	 (((mgbdev)->module_version >> 4) <= 3))
 
 struct mgb4_dma_channel {
 	struct dma_chan *chan;
-- 
2.48.0


