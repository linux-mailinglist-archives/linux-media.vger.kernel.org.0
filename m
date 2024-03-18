Return-Path: <linux-media+bounces-7195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D956F87E842
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 12:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15E801C21709
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 11:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11173FB16;
	Mon, 18 Mar 2024 11:09:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BE73BBF3;
	Mon, 18 Mar 2024 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710760143; cv=none; b=GEBni7gglASLQGMw+qnNUhxdjbEObYVtFsmfmS5ugQ6Ve1X4CflyGvwSYJsXHVmLqVTH8RkT180f+mhCm2Coh5sY/Nu3Lt3miVrApag77pDFLqramRCjoLXzbpexun7DrT4nxeB2KtT3e3i6P8GErkaBSBnhIX/ks5VOk3rIjDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710760143; c=relaxed/simple;
	bh=OcOWKQVnZQ8fcI6ybOb5R5G9y/agyscrhvTLg5lDdg0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yx6sF4b6Zoh5ikLk4bpxi2/LdmL7PqBFcLRz+W5splb45bfDfSkB2XxeMgCYTMBhZqw4GM7ZRAgb2uVtnXVON5t4X752qRZGOXt6Mjj1LGGwK/UEhbiTPqrKTYFL282nE7TguT7SwlDj2NusZEiiMfkKKsScLkB8/GgR4xcmb8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="198188849"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 18 Mar 2024 20:09:00 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 687B74253BE5;
	Mon, 18 Mar 2024 20:08:57 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/3] media: platform: rzg2l-cru: rzg2l-video: Use clk_poll_disable_unprepare()
Date: Mon, 18 Mar 2024 11:08:42 +0000
Message-Id: <20240318110842.41956-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the clk_poll_disable_unprepare() for synchronizing clk gating in
rzg2l_csi2_mipi_link_enable().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Replaced clk_disable_unprepare_sync()-->clk_poll_disable_unprepare()
   and the error propagated to the caller.
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e68fcdaea207..986435bd85c1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -366,6 +366,7 @@ static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
 {
 	unsigned long vclk_rate = csi2->vclk_rate / HZ_PER_MHZ;
 	u32 frrskw, frrclk, frrskw_coeff, frrclk_coeff;
+	int ret;
 
 	/* Select data lanes */
 	rzg2l_csi2_write(csi2, CSI2nMCT0, CSI2nMCT0_VDLN(csi2->lanes));
@@ -387,7 +388,9 @@ static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
 	rzg2l_csi2_write(csi2, CSI2nDTEL, 0xf778ff0f);
 	rzg2l_csi2_write(csi2, CSI2nDTEH, 0x00ffff1f);
 
-	clk_disable_unprepare(csi2->vclk);
+	ret = clk_poll_disable_unprepare(csi2->vclk, 10, 10000);
+	if (ret)
+		return ret;
 
 	/* Enable LINK reception */
 	rzg2l_csi2_write(csi2, CSI2nMCT3, CSI2nMCT3_RXEN);
-- 
2.25.1


