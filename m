Return-Path: <linux-media+bounces-5488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D27885B966
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 11:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDDD5284900
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 10:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF3064CC8;
	Tue, 20 Feb 2024 10:43:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108EA62160;
	Tue, 20 Feb 2024 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708425837; cv=none; b=rxZTyTbfO2zZQJYhqTFq/U0kYzqCOd1sFV0m85LIO5FMzguK8ZIV+oDxVUgYRm1DsezpDBmTSJjE7dNpP1ugQG3GGqXV7zMsIdH2s6qVP/uZq9Qm/cVPtajUMxh+8bFsF1lKIyszMy3ls0d3ESMes6MwNsjBUHdI3SNzUKz2s2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708425837; c=relaxed/simple;
	bh=hk+SwYEtbz1YbuLnMcYcZXEyiHG0rluyq/cy+FSA2hA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rdnXgl+4AI+YCMsfqpqxvmx4tBkJgBT/wOT2FQWEXGgDwXokJyk25Ceqt4xOmlTN/x13EzH1zfJ+qfj9ytkaAgtvkW6ijw0QKx4kFDILzSzN/yJzGh9oTsBffQfliATCvIpLW8rMvDcC4ykiOz27p33TauYqqKH1XYt78MdQATA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="194579423"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Feb 2024 19:43:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.246])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AD77D4004BD4;
	Tue, 20 Feb 2024 19:43:51 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/3] media: platform: rzg2l-cru: rzg2l-video: Use clk_poll_disable_unprepare()
Date: Tue, 20 Feb 2024 10:43:36 +0000
Message-Id: <20240220104336.260194-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220104336.260194-1-biju.das.jz@bp.renesas.com>
References: <20240220104336.260194-1-biju.das.jz@bp.renesas.com>
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


