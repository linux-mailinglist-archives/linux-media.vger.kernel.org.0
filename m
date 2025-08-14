Return-Path: <linux-media+bounces-40069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936BFB29871
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54E4C5E1288
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961AC26E143;
	Mon, 18 Aug 2025 04:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NTRPU8c7"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6072676D9
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491893; cv=none; b=Vwk0IuUaXaqDP1qnIl9eUkRgBTn4+uqd8lviCEYlirkLtuAuugwY7NwkrzvzcjtCqGtosNKdbsR1GCrCARe5Plri5l62m2LSnNyc/hZSqFA+tbhG7q6rp3ReO0FJRV/ZkoDiMDsMpf92pkx+eoSrZF1G0GCl9yFTKv+/rq4qeg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491893; c=relaxed/simple;
	bh=seHCUh3GOuJ1i/dddajxLW5/ykCNQ/HPMKtKbDBv604=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=C7JRs5NR/FiCOb3qV1o7bwOBizH8Rmsn2MPHlH2UJByYutoCdxbLnEqdBg8MiNpjBapISb0EvoYCrXIqFP4YA47/fkRvdV1e/zjAqhb5knCtyhU1K21dH4zsAPwdGzx6i0IyArgpIYulMBUADa664QxLIOntIGTBc1O8A+a/xKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NTRPU8c7; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250818043809epoutp0148948fdce74b74377ad92c64cbe9f54e~cwpKG3oB40483804838epoutp015
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250818043809epoutp0148948fdce74b74377ad92c64cbe9f54e~cwpKG3oB40483804838epoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491889;
	bh=IifKKYa4gU4DS2kIv1xGxa91TOJORg9sXPh7k3X+Zd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NTRPU8c7IwOWygdwfPN2QRljUUDzobd0cTYoFsJLvGBXX1a1Q1SXQuyG2811o3bOz
	 7mk6lP7R9c2x+kW5ZkmSDWUVovpmZdiGVxmI2w0hHfSxqdJ1m170Ap3f7Xo3B4Mq3Z
	 bPNfV7hb+VgF2OMzBiMWz5s71bg7WvTA+2T6E8a8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043808epcas5p47b007bc5c807d3f0d8e7b9dd0b97225a~cwpJXkvPk3042630426epcas5p4O;
	Mon, 18 Aug 2025 04:38:08 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c50MM3tQPz2SSKj; Mon, 18 Aug
	2025 04:38:07 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98~bp35wJTYF0487304873epcas5p2c;
	Thu, 14 Aug 2025 14:10:41 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141037epsmtip267eb5a4015bde3d72cab2ddf1cea5ede~bp316uv121850318503epsmtip2O;
	Thu, 14 Aug 2025 14:10:37 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 08/12] media: imx-mipi-csis: Add support to dump all vc
 regs
Date: Thu, 14 Aug 2025 19:39:39 +0530
Message-ID: <20250814140943.22531-9-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98@epcas5p2.samsung.com>

Extend support to dump all 4 virtual channel register.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 4f6c417fdf58..c1653a738854 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -876,11 +876,26 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
 		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
 		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
 		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
+		{ MIPI_CSIS_ISP_CONFIG_CH(1), "ISP_CONFIG_CH1" },
+		{ MIPI_CSIS_ISP_CONFIG_CH(2), "ISP_CONFIG_CH2" },
+		{ MIPI_CSIS_ISP_CONFIG_CH(3), "ISP_CONFIG_CH3" },
 		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
+		{ MIPI_CSIS_ISP_RESOL_CH(1), "ISP_RESOL_CH1" },
+		{ MIPI_CSIS_ISP_RESOL_CH(2), "ISP_RESOL_CH2" },
+		{ MIPI_CSIS_ISP_RESOL_CH(3), "ISP_RESOL_CH3" },
 		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
+		{ MIPI_CSIS_SDW_CONFIG_CH(1), "SDW_CONFIG_CH1" },
+		{ MIPI_CSIS_SDW_CONFIG_CH(2), "SDW_CONFIG_CH2" },
+		{ MIPI_CSIS_SDW_CONFIG_CH(3), "SDW_CONFIG_CH3" },
 		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
+		{ MIPI_CSIS_SDW_RESOL_CH(1), "SDW_RESOL_CH1" },
+		{ MIPI_CSIS_SDW_RESOL_CH(2), "SDW_RESOL_CH2" },
+		{ MIPI_CSIS_SDW_RESOL_CH(3), "SDW_RESOL_CH3" },
 		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
 		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
+		{ MIPI_CSIS_FRAME_COUNTER_CH(1), "FRAME_COUNTER_CH1" },
+		{ MIPI_CSIS_FRAME_COUNTER_CH(2), "FRAME_COUNTER_CH2" },
+		{ MIPI_CSIS_FRAME_COUNTER_CH(3), "FRAME_COUNTER_CH3" },
 	};
 
 	unsigned int i;
-- 
2.49.0


