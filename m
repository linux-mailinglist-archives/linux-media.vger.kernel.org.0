Return-Path: <linux-media+bounces-5081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DBC85328A
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 15:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D6B1F2527B
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5867057300;
	Tue, 13 Feb 2024 14:03:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA6B56B65;
	Tue, 13 Feb 2024 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707832981; cv=none; b=XYI5mEyB5IS48rxlGHSgwilJ1N8ZwRPto8Zc+K7NFGdS4t3QdlmtN3fcznye48vmpW0w13pHrfz+A/9V4EtBamcHiwj84SwcKQ4xamKDrhWmGn0RFe7xgOzwa1SdqnxJSVXaPFFrXqddod6thtx0vk3fJeKwhVaInTBTX0w84Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707832981; c=relaxed/simple;
	bh=mbtLi9LgnmLtFh8Ji33wbLMXLXS2YnmiTy1pL44wBVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FV9Yn8RwloyPX5a4CkKIlIXmZ1QKFIqn+SonmckMfxJG5EmF4XVVB0OozljVTr7smzcynR9GHZ5AJdIhlKxSnzYSUVNDivLXPWZ3JvsKl8JT4ehJGtF0zZelSB4tfnZ/wozqTXDNovbpGouRt4FxYcUmj4hHznWlL1MTs94nDSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="197700756"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Feb 2024 23:02:51 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 57CF4400753C;
	Tue, 13 Feb 2024 23:02:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: ov5645: Add a small delay after writes in ov5645_set_register_array()
Date: Tue, 13 Feb 2024 14:02:40 +0000
Message-Id: <20240213140240.159057-3-biju.das.jz@bp.renesas.com>
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

Since OV5645 is showing issues @400kHz, it makes sense to add a small
delay after register writes for settling the register values. So introduce
a small delay by adding a read() after write() and also add a debug code
for data mismatch.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a5cc959d535e..ea9b7c610f2d 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -624,11 +624,20 @@ static int ov5645_set_register_array(struct ov5645 *ov5645,
 {
 	unsigned int i;
 	int ret;
+	u8 val;
 
 	for (i = 0; i < num_settings; ++i, ++settings) {
 		ret = ov5645_write_reg(ov5645, settings->reg, settings->val);
 		if (ret < 0)
 			return ret;
+
+		ret = ov5645_read_reg(ov5645, settings->reg, &val);
+		if (ret < 0)
+			return ret;
+
+		if (val != settings->val)
+			dev_dbg(ov5645->dev, "Data mismatch reg=%x val=%x/%x\n",
+				settings->reg, settings->val, val);
 	}
 
 	return 0;
-- 
2.25.1


