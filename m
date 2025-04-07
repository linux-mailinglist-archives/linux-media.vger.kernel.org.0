Return-Path: <linux-media+bounces-29480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D61A7D9B4
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 11:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C45FD3A7349
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184D41BBBD4;
	Mon,  7 Apr 2025 09:32:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9238219DF9A;
	Mon,  7 Apr 2025 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018329; cv=none; b=fi9aUnmjhx8Bgte+/pLjsFo+JCSm5ueG4X+VqeAMLLFnKMiwOjQsh/XwF2btJ1BeK8iCdBS9ZodybHH0w9NvMuM3/LL3Ql5jn+pausoPLqotAOyCLAR8i7lGVOnvbGcfiJoV2ZJKHkawaoqJLOxs6G5fMjQwsHP1DE31zNHO9fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018329; c=relaxed/simple;
	bh=CuOMW1C4Pbg7FPpsMNXZPzmN5JzUgxIJ+FbcCmVWVhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=idRgDJv8k/3w8y0+OQxkJ5PGi9Aw6X+RCu3W94iRFZw2ZsfUTFAwbPYDpgKD+OAsOLh0rwYY0Uo8xr3+PkvqsZ/rV/fnMR49eAa86ngrrQelMUsX4f86fWm3z2+9Ar+BPsCojTOqam/fz2ZxNkFuXHJQNRz+09bLJw5u2CESAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: enbYyVcuRWCQQW9gWwiRuw==
X-CSE-MsgGUID: tktRxtAlRWes8p8Gq12P4A==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Apr 2025 18:32:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.133])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7BF2641C7D50;
	Mon,  7 Apr 2025 18:32:00 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] media: platform: exynos4-is: Use of_get_available_child_by_name()
Date: Mon,  7 Apr 2025 10:31:56 +0100
Message-ID: <20250407093158.36290-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify fimc_md_is_isp_available() by using
of_get_available_child_by_name().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Rebased to next as the dependency patch hits on 6.15-rc1.
---
 drivers/media/platform/samsung/exynos4-is/media-dev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index a50e58ab7ef7..ce89465c22de 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -179,8 +179,8 @@ int fimc_md_set_camclk(struct v4l2_subdev *sd, bool on);
 static inline bool fimc_md_is_isp_available(struct device_node *node)
 {
 	struct device_node *child __free(device_node) =
-		of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
-	return child ? of_device_is_available(child) : false;
+		of_get_available_child_by_name(node, FIMC_IS_OF_NODE_NAME);
+	return child != NULL;
 }
 #else
 #define fimc_md_is_isp_available(node) (false)
-- 
2.43.0


