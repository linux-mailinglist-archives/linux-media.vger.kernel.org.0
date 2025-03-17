Return-Path: <linux-media+bounces-28361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF67A64D8D
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1D7F7A8DAF
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D039C23F262;
	Mon, 17 Mar 2025 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NWfJO4UQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47F923E33A;
	Mon, 17 Mar 2025 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212669; cv=none; b=hZ/DKRU6z0amPEuDSoVSxIJNLbAgEapAyvO1Goqy4Gx5DSa8EHY93XNkwtBM/ayzJS0/68JryGS6ryZfiPUfAtCr4BWhNPXFbvZFDKFKKP0wHAw4q/f0xzjK4ic45F/Fm2N3avelp5I4Gfg0Dy2eXND5lU5DI07SkdX3zNNs95Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212669; c=relaxed/simple;
	bh=bq3PFayu/4BwfT2SlO+W2wU2snxSQnLdE8pQmBjWLnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wh5m6roboVyODjKmJhAW/1Q6qb9MVKCq7i1H95q2EiHOHomcBh/IrjjeEEG/9OnerCDQmKM/1oxK6ixKB8Kjs57AyXbf43rulnizSZNUlCNFUuVNDJQ0RgjH7dqHqgGu1u5xYOouLhAXXiSymq3xyDMVCb6QaNHGcG0nnVm3LLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NWfJO4UQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCDB219C7;
	Mon, 17 Mar 2025 12:55:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742212550;
	bh=bq3PFayu/4BwfT2SlO+W2wU2snxSQnLdE8pQmBjWLnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NWfJO4UQ2sPYdFVkeRPNPkXcsxIBVsuLneDHkI39mrvzp/MYfREBuHpyHLFRkjLWk
	 BIjG74rHteI2eN2vwtu8W1e3bu2XsoACaBknDo1W7RpX+k1L0h3OTtL5SbLQoClF4i
	 0Nh4U8WDGBEqz4XiVJl27Ng0xsUbL1K1p95x1pc4=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 17 Mar 2025 12:56:45 +0100
Subject: [PATCH v3 7/7] media: vsp1: pipe: Add RAW Bayer formats mapping
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-v4h-iif-v3-7-63aab8982b50@ideasonboard.com>
References: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
In-Reply-To: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=4791;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=bq3PFayu/4BwfT2SlO+W2wU2snxSQnLdE8pQmBjWLnU=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2A4liAhyBVGNxI7gQVZyZo3ZAkozexTFiA19l
 lBOrTKfC/uJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9gOJQAKCRByNAaPFqFW
 PI9RD/9TEnzECr/kPgF0R555kLpW4jEADpErswgIN6W/GbXMwUheqDyBE2CiTIKkISuIxnl1DuP
 /4VSmJzfXqiSVcDCvgrlawuOTJlHhdWhKtZoopgs2soJPvQaT6C+oUxEGHrvbjW1idVRuz3HgrI
 kB1nHO4hd3CS43UbMvdVY60EPmTkKb0bM20JQvD5spBn8LkdzlLvFPFZkAwt/NfzYZtoJt8m27p
 WRy9y9UrfMOQZgBlcqo94XfsRU3tWseUiBbY2hYZxYpTbvWanAlnv6p9OXpyY4dAJet6TE5W7eQ
 6FpLMk14l737P4bMv1PblultZl/dayS2huQsYzyYhErKaqqDcMzkc75v1TGD8EN/WvKrM0aBeLt
 Nu3RvVJBtzv3o8m9PwWcJl+Lljq1B4e6uohSQR9E/UGi5J2PhvodnfM7IHz3jhr5DtevHrT66zB
 GeLWgLjcnj89u1iHqdKJFUwD27KwyIJzHeDS6caZ2Vu1pF5qBqjE7OpCEyldIfdtpeAZ6Fr8V/B
 0WIhC6KBG2Ftw4trQ/W8le0B+XSzR6svTkr6GBb2prywtVYyWKfNuMRG/tcsMUJd4Spm+cikI7Q
 111iWu/iEUFITOte6vY9WuUdsXiWiEbkQnYxnty/6noQq23ScB7lnSq+hfD97wSuGGQoEvW3StB
 v9zk5CD8yR/sPUg==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add formats definition for RAW Bayer formats in vsp1_pipe.c.

8-bits RAW Bayer pixel formats map on VSP format RGB332.
10, 12 and 16 bits RAW Bayer pixel formats map on RGB565 insted.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 72 ++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 8e9be3ec1b4dbdad1cbe35ae3a88952f46e41343..6592513ca833175bdbfe850d61d1b5957ad27e0d 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -30,10 +30,80 @@
  */
 
 static const struct vsp1_format_info vsp1_video_formats[] = {
-	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
+	/* Raw Bayer 8-bit: Maps on RGB332 */
+	{ V4L2_PIX_FMT_SBGGR8, MEDIA_BUS_FMT_Y8_1X8,
+	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 8, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG8, MEDIA_BUS_FMT_Y8_1X8,
+	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 8, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG8, MEDIA_BUS_FMT_Y8_1X8,
+	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 8, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB8, MEDIA_BUS_FMT_Y8_1X8,
 	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  1, { 8, 0, 0 }, false, false, 1, 1, false },
+
+	/* Raw Bayer 10/12/16-bit: Maps on RGB565 */
+	{ V4L2_PIX_FMT_SBGGR10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+
+	{ V4L2_PIX_FMT_SBGGR12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+
+	{ V4L2_PIX_FMT_SBGGR16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+
+	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
+	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
 	{ V4L2_PIX_FMT_ARGB444, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_ARGB_4444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS,

-- 
2.48.1


