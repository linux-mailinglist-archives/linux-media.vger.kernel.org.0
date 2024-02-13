Return-Path: <linux-media+bounces-5080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F953853288
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 15:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 529FD1C22876
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182B057891;
	Tue, 13 Feb 2024 14:02:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE9A5786B;
	Tue, 13 Feb 2024 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707832977; cv=none; b=UZXmYxT327Wlj6Wcp+OYfWaLmsSx2WgaA997K3cxvsH40RbPJgMqkaqUP23rG32vPOEd3xiJVyCxbhNRMJYGcK5WKRiWSavJE33xBBXOJtT+vZju+oeIjxbHUHC6u1DgEiUKgJf/IBYKtdOkj5Q2JgIwpGK2mrpfS2Biwpupts8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707832977; c=relaxed/simple;
	bh=lERj8IJJn2b3H45H4QY4vrFeJGjaU86NcDG5RsIztMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AaLOTfS7l8yizHgHSGWWOeENGm2KSPuzFULd8FY6JxQx4E+5S+KYT3QRrNLSOyWZ+Z9n40Kg2K2V5PXkF5CDFhgn3cyu/RoigK0tSuIHBHcnvehePdk62ysMlCwxwpPTIX7ebMtqAj4BThPlMNc0/s4tCnNu+WsfHA68nIjy0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="193787617"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Feb 2024 23:02:48 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3CF254003EA8;
	Tue, 13 Feb 2024 23:02:45 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from ov5645_global_init_setting
Date: Tue, 13 Feb 2024 14:02:39 +0000
Message-Id: <20240213140240.159057-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing OV5645 with i2c bus frequency @400kHz on RZ/G2L SMARC EVL platform
shows issues like the captured image is either greenish or it is not
capturing the image at all. However, It is working ok when the i2c
frequency is 100kHz. From this, it is clear that we have a timing issue
at high speed. The testing also shows that if we add a delay >= 1 msec
after register write {0x3008, 0x82}, then the captured image is always
good. So, move the register 0x3008 and 0x3103 from ov5645_*_init_setting
to a new table ov5645_global_init_setting.

Drop the unnecessary entry { 0x3008, 0x42 } from ov5645_*init_setting
table at the start.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a26ac11c989d..a5cc959d535e 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -116,10 +116,12 @@ static inline struct ov5645 *to_ov5645(struct v4l2_subdev *sd)
 	return container_of(sd, struct ov5645, sd);
 }
 
-static const struct reg_value ov5645_global_init_setting[] = {
+static const struct reg_value ov5645_global_reset_setting[] = {
 	{ 0x3103, 0x11 },
-	{ 0x3008, 0x82 },
-	{ 0x3008, 0x42 },
+	{ 0x3008, 0x82 }
+};
+
+static const struct reg_value ov5645_global_init_setting[] = {
 	{ 0x3103, 0x03 },
 	{ 0x3503, 0x07 },
 	{ 0x3002, 0x1c },
@@ -671,6 +673,15 @@ static int ov5645_set_power_on(struct device *dev)
 
 	msleep(20);
 
+	ret = ov5645_set_register_array(ov5645, ov5645_global_reset_setting,
+					ARRAY_SIZE(ov5645_global_reset_setting));
+	if (ret < 0) {
+		dev_err(ov5645->dev, "could not reset\n");
+		goto exit;
+	}
+
+	usleep_range(1000, 2000);
+
 	ret = ov5645_set_register_array(ov5645, ov5645_global_init_setting,
 					ARRAY_SIZE(ov5645_global_init_setting));
 	if (ret < 0) {
-- 
2.25.1


