Return-Path: <linux-media+bounces-27466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03416A4DC22
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B56341892559
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325F31FFC4E;
	Tue,  4 Mar 2025 11:11:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE27202F96
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086691; cv=none; b=mzY0gAsOfodS+/CAprEFP9Z28axfZapDHZSTBzW75vdMS/izI6zK9hCkl4FnSL3357z693y7FycNSaX77MGLnSElsO+8eV1e6sT4f/kaFPnOQlIcVAH7dyj1OM0AuVvZFAtOSI+MX57UKoFXXQnsbV3RMsYBTIbHQYmEiDu9hEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086691; c=relaxed/simple;
	bh=I4Ir5F6HVvEEfpJaB2p7puHx/V38QMW1g4Tj61gkqgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwttFcqqAi5+tOpARs8RyZFfeBxp6aoIXHb6bQb4Cbq+U6rgIXj7qLl94SpZDl13OZy7nvnKSdwqm/cEh/iMo15bXqPmHiECi7RbVgw09e/Z+mTBWLiPxnNgOMSMKrc0i3QoKnW0/2y4q8IeP4gGcDFNMhBs1nvqQyqVDneGBCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2825DC4CEEB;
	Tue,  4 Mar 2025 11:11:31 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 7/8] media: pci: zoran: use (t,l)/wxh format for rectangle
Date: Tue,  4 Mar 2025 12:08:13 +0100
Message-ID: <d8c912e6cd393df106bfc02f6dd365278840cd54.1741086494.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1741086494.git.hverkuil@xs4all.nl>
References: <cover.1741086494.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize reporting of rectangles to (t,l)/wxh.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/pci/zoran/zoran_card.c | 2 +-
 drivers/media/pci/zoran/zr36016.c    | 2 +-
 drivers/media/pci/zoran/zr36050.c    | 2 +-
 drivers/media/pci/zoran/zr36060.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_card.c b/drivers/media/pci/zoran/zoran_card.c
index 3975fc1b2ee3..e31f9f19a48a 100644
--- a/drivers/media/pci/zoran/zoran_card.c
+++ b/drivers/media/pci/zoran/zoran_card.c
@@ -1202,7 +1202,7 @@ static int zoran_debugfs_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "JPG ver_dcm %u\n", zr->jpg_settings.ver_dcm);
 	seq_printf(seq, "JPG tmp_dcm %u\n", zr->jpg_settings.tmp_dcm);
 	seq_printf(seq, "JPG odd_even %u\n", zr->jpg_settings.odd_even);
-	seq_printf(seq, "JPG crop %dx%d %d %d\n",
+	seq_printf(seq, "JPG crop (%d,%d)/%dx%d\n",
 		   zr->jpg_settings.img_x,
 		   zr->jpg_settings.img_y,
 		   zr->jpg_settings.img_width,
diff --git a/drivers/media/pci/zoran/zr36016.c b/drivers/media/pci/zoran/zr36016.c
index 4b328ad6083f..d2e136c48a1b 100644
--- a/drivers/media/pci/zoran/zr36016.c
+++ b/drivers/media/pci/zoran/zr36016.c
@@ -216,7 +216,7 @@ static int zr36016_set_video(struct videocodec *codec, const struct tvnorm *norm
 	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 	struct zoran *zr = videocodec_to_zoran(codec);
 
-	zrdev_dbg(zr, "%s: set_video %d.%d, %d/%d-%dx%d (0x%x) call\n",
+	zrdev_dbg(zr, "%s: set_video %d.%d, (%u,%u)/%ux%u (0x%x) call\n",
 		  ptr->name, norm->h_start, norm->v_start,
 		  cap->x, cap->y, cap->width, cap->height,
 		  cap->decimation);
diff --git a/drivers/media/pci/zoran/zr36050.c b/drivers/media/pci/zoran/zr36050.c
index b07d7e5c1b4a..c17965073557 100644
--- a/drivers/media/pci/zoran/zr36050.c
+++ b/drivers/media/pci/zoran/zr36050.c
@@ -547,7 +547,7 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 	struct zoran *zr = videocodec_to_zoran(codec);
 	int size;
 
-	zrdev_dbg(zr, "%s: set_video %d.%d, %d/%d-%dx%d (0x%x) q%d call\n",
+	zrdev_dbg(zr, "%s: set_video %d.%d, (%u,%u)/%ux%u (0x%x) q%d call\n",
 		  ptr->name, norm->h_start, norm->v_start,
 		  cap->x, cap->y, cap->width, cap->height,
 		  cap->decimation, cap->quality);
diff --git a/drivers/media/pci/zoran/zr36060.c b/drivers/media/pci/zoran/zr36060.c
index 75fd167603dc..d6c12efc5bb6 100644
--- a/drivers/media/pci/zoran/zr36060.c
+++ b/drivers/media/pci/zoran/zr36060.c
@@ -488,7 +488,7 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 	u32 reg;
 	int size;
 
-	zrdev_dbg(zr, "%s: set_video %d/%d-%dx%d (%%%d) call\n", ptr->name,
+	zrdev_dbg(zr, "%s: set_video (%u,%u)/%ux%u (%%%d) call\n", ptr->name,
 		  cap->x, cap->y, cap->width, cap->height, cap->decimation);
 
 	/* if () return -EINVAL;
-- 
2.47.2


