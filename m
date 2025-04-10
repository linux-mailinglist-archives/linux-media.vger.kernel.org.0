Return-Path: <linux-media+bounces-29843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E578EA838B1
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 07:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E5363B1790
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C87201267;
	Thu, 10 Apr 2025 05:52:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3210B1C3BEB;
	Thu, 10 Apr 2025 05:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744264359; cv=none; b=sjIDJgk7lCg4yfxNcj0Tv//GQBW3rSZgONbIApqhUQXQ3RxJ6ewIG2EYidSUyidASidBfYYMSHSqf09HHN5xOJU5DS10r3Ue3ZJB604y52A3mOzjnvII9l/Od+0vqR+kPurTb4mejUpvczGtVNo7gEhGu/e8n6yyDkGpFIqFjj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744264359; c=relaxed/simple;
	bh=LUW3f/3ooEUC5Ii2dNvbQ3vnVQNTFhnSLEa05vIJ+iE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/beWCwPSEcdxuLZwPqh3K3d1qEaha7vgsFzMpOgb7stqU+YW91wJBLGbBNCwNA2SmEsW3r8WUQaQtZNutAvU2OseRAWhoUA2GC62sWyapXwPuqOtd/N7J1jZfa8/csebXfmVOzBrM/OOVd33D6ZHjqfzlcSJRBueM3pa64SiTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: As0fnxYxSp+ksbv7bZCSmA==
X-CSE-MsgGUID: rFEIlZNZR8+GjXdpmE5CoQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2025 14:52:29 +0900
Received: from localhost.localdomain (unknown [10.226.92.117])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9C797419AE41;
	Thu, 10 Apr 2025 14:52:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4] media: platform: exynos4-is: Use of_get_available_child_by_name()
Date: Thu, 10 Apr 2025 06:52:21 +0100
Message-ID: <20250410055223.5048-1-biju.das.jz@bp.renesas.com>
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
v3->v4:
 * Readded Rb tag from Krzysztof as it is trivial change.
v2->v3:
 * Fixed CHECK: Comparison to NULL could be written "child" reoported by
   [1] https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/74116132/artifacts/report.htm
 * Dropped Rb tag from Krzysztof.
v1->v2:
 * Rebased to next as the dependency patch hits on 6.15-rc1.
---
 drivers/media/platform/samsung/exynos4-is/media-dev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index a50e58ab7ef7..ea496670d4b5 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -179,8 +179,8 @@ int fimc_md_set_camclk(struct v4l2_subdev *sd, bool on);
 static inline bool fimc_md_is_isp_available(struct device_node *node)
 {
 	struct device_node *child __free(device_node) =
-		of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
-	return child ? of_device_is_available(child) : false;
+		of_get_available_child_by_name(node, FIMC_IS_OF_NODE_NAME);
+	return child;
 }
 #else
 #define fimc_md_is_isp_available(node) (false)
-- 
2.43.0


