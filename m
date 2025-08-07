Return-Path: <linux-media+bounces-39025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66802B1D618
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 217991AA2321
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F1D279789;
	Thu,  7 Aug 2025 10:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DcjrStTw"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47F3278E47
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564014; cv=none; b=R7riRUNtczEFOZKZbPwIRgCVX3c2Rdsig7HHQXKG02p0q0OEv8qjSxmg3S826BBXh2/QfPX1s86xCvHEWAF3om8EjK2uggct5+5xpmzC2/yoblq+VLbsAX8ankygG6wwnwgI2dPeNxLpnkOhovekzyVlvQ6DxLpEp3h2iJ3Qr7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564014; c=relaxed/simple;
	bh=it6ZeG5ZxrWnDtIl7K6dPUy1gvQUC2n7RiimrPMbSWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=I8WqV9dAidAhjhIFQScSH6qSiKTCV2DTQRTGALX++oOJPbG2izouEXTH9iNREGSWgsv+bGogzAxxP9+IW6lDxe+juHvrOS4V+huBYjpiIP1i0EDJAdGwRpc8APhy4xpXOqq8Tx0F5tqL0i4B4xkW+poJOqLlBCVlSe1U+LpRSts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DcjrStTw; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250807105330epoutp010c9e13d2a6aafde90e8e33487c1d21ca~ZdqvS0iYt1289212892epoutp01g
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:53:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250807105330epoutp010c9e13d2a6aafde90e8e33487c1d21ca~ZdqvS0iYt1289212892epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754564010;
	bh=0PnTd3WZG/fm6S5+AMV4x+2ufZv6k6uyirKu5AAni10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DcjrStTwbsGSZqOgcC4B/HUUX6oXYfMjPjIfSC7/q+wmINptksvYz4lYcew9W3W8f
	 QnHW940NUWIM5mEKsW/ZnEyAYdDqCzkmGBQZ/qgxUtMeiKSvucSul5ymahXOHwOX1i
	 UGbP+KAHbxRMTIOWanzdNn/JIcPGomwLWWrjxqOU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250807105329epcas5p1edbd7ab30549989effa47c3ed866e28e~Zdqumj4CK2372223722epcas5p12;
	Thu,  7 Aug 2025 10:53:29 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4byPCX3Lxwz6B9m9; Thu,  7 Aug
	2025 10:53:28 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250807032520epcas5p47545f2b03e29296b583248f8315abf45~ZXjcgwDPU0583105831epcas5p48;
	Thu,  7 Aug 2025 03:25:20 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032518epsmtip24960da37a4e98ff6e17bd9d0006e6de2~ZXjajd3B21700017000epsmtip2e;
	Thu,  7 Aug 2025 03:25:18 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 07/10] media: s5p-mfc: Modify compatible string check for
 SoC-specific support
Date: Thu,  7 Aug 2025 08:54:46 +0530
Message-ID: <20250807032449.92770-8-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032520epcas5p47545f2b03e29296b583248f8315abf45
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032520epcas5p47545f2b03e29296b583248f8315abf45
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032520epcas5p47545f2b03e29296b583248f8315abf45@epcas5p4.samsung.com>

Modify the compatible string handling in the MFC driver
to explicitly match SoC-specific identifiers.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 73fdcd362265..d13770058e63 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1711,22 +1711,22 @@ static const struct of_device_id exynos_mfc_match[] = {
 		.compatible = "samsung,mfc-v5",
 		.data = &mfc_drvdata_v5,
 	}, {
-		.compatible = "samsung,mfc-v6",
+		.compatible = "samsung,exynos5250-mfc",
 		.data = &mfc_drvdata_v6,
 	}, {
-		.compatible = "samsung,mfc-v7",
+		.compatible = "samsung,exynos5420-mfc",
 		.data = &mfc_drvdata_v7,
 	}, {
 		.compatible = "samsung,exynos3250-mfc",
 		.data = &mfc_drvdata_v7_3250,
 	}, {
-		.compatible = "samsung,mfc-v8",
+		.compatible = "samsung,exynos5800-mfc",
 		.data = &mfc_drvdata_v8,
 	}, {
 		.compatible = "samsung,exynos5433-mfc",
 		.data = &mfc_drvdata_v8_5433,
 	}, {
-		.compatible = "samsung,mfc-v10",
+		.compatible = "samsung,exynos7880-mfc",
 		.data = &mfc_drvdata_v10,
 	}, {
 		.compatible = "tesla,fsd-mfc",
-- 
2.49.0


