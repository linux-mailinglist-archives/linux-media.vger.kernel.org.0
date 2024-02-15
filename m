Return-Path: <linux-media+bounces-5220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA6B856630
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 15:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB831C210E2
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 14:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D7D132493;
	Thu, 15 Feb 2024 14:43:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A58130ADA;
	Thu, 15 Feb 2024 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708008228; cv=none; b=HKVlt/CqqJ/cF8IAb/70TpBmKJvTTGc2ZsMatZrB9MF6VkF6KbncXxIZ1OQiYlSTAyHLwQmMF7ndToMl4+fajz89dYqI4uTuyV10SCqz5EQC4PVcWlWm04fYUGHXUdZhHxrfxNLLG72WuypA7haJknD3JlsnmI5GcCKwIZ+RJi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708008228; c=relaxed/simple;
	bh=zJ9w4ic3sa3c5jQtZJ7pU4HFEu4i3F7l4Qda7gm3VtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eHx8kPqzhB0NBd7Vw/0BzsDHgUkqU9cAtdTsYUPJpLn4YCYN+nv32VemYlWzqmQk2cbhNRWGlBaCuUud73M1PPnSyGrAYPKHmUlmGoSfRyvTLdhHOYYr+IdC+ci8fLeUfTbiXHtVvAH5wDFrmAXthgSiQs4b8EfIUjrg8DpFlcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,161,1705330800"; 
   d="scan'208";a="197977133"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Feb 2024 23:43:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.136])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A9A1F425D7EE;
	Thu, 15 Feb 2024 23:43:35 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Wolfram Sang <wsa@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] media: i2c: ov5645: Remove software reset entry from ov5645_global_init_setting
Date: Thu, 15 Feb 2024 14:43:33 +0000
Message-Id: <20240215144333.82036-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SYSTEM_CTRL0 register in ov5645 is almost similar to ov5640. But the
hard reset control is mandatory for the ov5645 device, so there is no
need for soft reset in the driver.

Add a 1msec delay for the software power up (OV5645_SYSTEM_CTRL0_START)
register in ov5645_global_init_setting. Without this delay sometimes the
image is not captured at all when the i2c frequency is 400kHz.

The changes are fixing both the greenish issue and image capture at 400kHz
i2c frequency on Renesas RZ/G2L SMARC EVK platforms.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped patch#2
 * Updated commit header and description.
 * Dropped unneeded software reset from ov5645_global_init_setting
 * Added 1 msec delay for software power up from ov5645_*_init_setting.
---
 drivers/media/i2c/ov5645.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a26ac11c989d..df86b951b9f3 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -118,7 +118,6 @@ static inline struct ov5645 *to_ov5645(struct v4l2_subdev *sd)
 
 static const struct reg_value ov5645_global_init_setting[] = {
 	{ 0x3103, 0x11 },
-	{ 0x3008, 0x82 },
 	{ 0x3008, 0x42 },
 	{ 0x3103, 0x03 },
 	{ 0x3503, 0x07 },
@@ -627,6 +626,10 @@ static int ov5645_set_register_array(struct ov5645 *ov5645,
 		ret = ov5645_write_reg(ov5645, settings->reg, settings->val);
 		if (ret < 0)
 			return ret;
+
+		if (settings->reg == OV5645_SYSTEM_CTRL0 &&
+		    settings->val == OV5645_SYSTEM_CTRL0_START)
+			usleep_range(1000, 2000);
 	}
 
 	return 0;
-- 
2.25.1


