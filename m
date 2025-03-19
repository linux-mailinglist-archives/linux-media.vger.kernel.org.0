Return-Path: <linux-media+bounces-28478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F48A68BC3
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E82E5163914
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 11:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B79257426;
	Wed, 19 Mar 2025 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c3/B96TB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736322571AB;
	Wed, 19 Mar 2025 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383719; cv=none; b=MLOQbs84Rsl1Fnq7EdLHlvLlmfCw/bd5YNDY7XrDRce6GbWTUc7Fmoksw7dOh1+zZ5cLGmHB5SWNefwGjxgmrR4tunj1eUDY8CmHS910eknNmFxnVtQPhg2KvbU989YXJXMzYdcb7qOTZyhUXrCVR56If69/nHNDus0PKamDmYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383719; c=relaxed/simple;
	bh=8/dwMhavIR3LpRaxSdSscjLVSo4SziV3FqCQRkRdRq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGjr/W6RwUPCDmImQwJ7Pi8DKSYk/d377If1JUvAoOb5PxefNg7tmlRI0V1VkdySkdWoAPPlRtKaMU/b1dZIYusNq8ONH524LtQTmzJ4dVI39MH3jh0Lc9+r0CVCGUl4Ig+9Dr4YIBql5Ml6G+ZviCv+jU17O5oNGYl3Zng5rnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c3/B96TB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A7A31986;
	Wed, 19 Mar 2025 12:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742383605;
	bh=8/dwMhavIR3LpRaxSdSscjLVSo4SziV3FqCQRkRdRq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c3/B96TBMkf9/Lm+1PZ1BZZSjBWHDKPw0L45csn/Ft48ggzRHaKUxxYcDI1j8JPzc
	 n3gkPSOo7gu5Kj9mrqlU8ErEZDK29XA9JhJObWOsvRsWp0FAJ1wN8EKgxPmBcu4mJr
	 PSqUQMh9e6DAxAiHgKDxAz0meAvw1kFrZnniMS60=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Wed, 19 Mar 2025 12:28:20 +0100
Subject: [PATCH v5 7/7] media: vsp1: pipe: Add RAW Bayer formats mapping
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250319-v4h-iif-v5-7-0a10456d792c@ideasonboard.com>
References: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
In-Reply-To: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=4724;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=8/dwMhavIR3LpRaxSdSscjLVSo4SziV3FqCQRkRdRq4=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2qpXzRu1nPvFC3X2RdwPhItcJoLdvcyEAp6/U
 NK8NLFgcJOJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9qqVwAKCRByNAaPFqFW
 PI4iD/sEoNcseCpLmaHQZeB2Y/PEycNUycCiEDUDc9355E2nW5vbfsJ8frCDZgYO07aSmZI7SHP
 MZ0CDnXKTJDLN8nCM4hVk/wyzpj4I9RRI6ZF2o6TXXpQPG9JtGjP4j39hzEh86Lt5GiPNYvU5F5
 nV7WjHHTZR5SzAOz4ganmfzZgiXSrHEO3n6uEHPCYn/mwB/C7ff/LHTaFw33apETLdIOcZ0pWjT
 TjOdYvlpVJJ9WGY582ZMq2Edj4v1ka1fQ700G0TLy/TMDcH2ehz/uqsULdyFrBdXOPG9sG+21jU
 EWbjbGu1jAC9aUTzXVhf395hl4KFgo3FFG2CFpNP6OnT7tTbN4EEJRCqEqKNeaFlE7Q9y+m/Zyt
 2ue0xh6rrtRLKSwaj4RwKVzatZe57nqZU7AcWcdHS96vr4str6Ph2kGY7Twhni+DAe+b/uSULqS
 y7GOEHzWPQlYSTwNRHvn5Fq1VkEr47FvvnBDDrlttT1Qzo6kZpz47NqAV6W9Q/7gAsS67I/Hjy7
 4FWqiSU+94OIhWRnAvXkqC9qhFoK5ApU62GRPaWKVzPTxUhv71m4RcIhLMIJEdbdNifozpE3egv
 VTOU4H7NUf9rkIGEZjRT5eqmdvwJAw61agf3LK+hn1tVUuNztLLKLoJrsUe9Yqh1NBULOrB9Ej8
 oFClQZMOYu1n70A==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add formats definition for RAW Bayer formats in vsp1_pipe.c.

8-bits RAW Bayer pixel formats map on VSP format RGB332.
10, 12 and 16 bits RAW Bayer pixel formats map on RGB565 insted.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v3->v4:
- Fix SWAP bits for RAW 10, 12 and 16
---
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 72 ++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 8e9be3ec1b4dbdad1cbe35ae3a88952f46e41343..a51061738edce566079d72bd027391d24a065e72 100644
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
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB10, MEDIA_BUS_FMT_Y10_1X10,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 10, 0, 0 }, false, false, 1, 1, false },
+
+	{ V4L2_PIX_FMT_SBGGR12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB12, MEDIA_BUS_FMT_Y12_1X12,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 12, 0, 0 }, false, false, 1, 1, false },
+
+	{ V4L2_PIX_FMT_SBGGR16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGBRG16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SGRBG16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
+	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_SRGGB16, MEDIA_BUS_FMT_Y16_1X16,
+	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS,
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


