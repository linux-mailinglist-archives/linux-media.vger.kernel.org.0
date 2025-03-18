Return-Path: <linux-media+bounces-28414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C61EA67297
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BECB4222BD
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8AB20C48C;
	Tue, 18 Mar 2025 11:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wCWD3SHk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F1320C463;
	Tue, 18 Mar 2025 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296967; cv=none; b=FZf8xf0EMxIxiJcdqXvICSDS5ODu4HgCSEizDlq2w2kThCMzIaBEhU+cT+nEF2SlT1J2jZhdwqwrt+p7T7rU3FhlH9Ty0QsEd5wzHuiadWvCSC5ol7s0lgbNALr8axIRT7g4hT44uR0aK6zkjQ7aIk+u72rWUAKuBEj02yCZBUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296967; c=relaxed/simple;
	bh=8/dwMhavIR3LpRaxSdSscjLVSo4SziV3FqCQRkRdRq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfbjZDx60IV0mftBaT+I4IZNZl5h8/MSMqRAAxdYSkS+zToFcoff9ot0V13/mFMoQicRRef4lHTZxmg3dNOUWQg9PcLeKOZC0zM55/ZXDBD/zHMQWVyjmHwr4EF6UfIWXEYPZtzgtryvyeO0M/LITojC9UvSFU0JZOPo9ZB3i0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wCWD3SHk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A92A017D8;
	Tue, 18 Mar 2025 12:20:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742296842;
	bh=8/dwMhavIR3LpRaxSdSscjLVSo4SziV3FqCQRkRdRq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wCWD3SHk4YkzJqqEmx2VJjb76FxkdysjZHxEovTROnbSIx+5LwyIhVw1GNn5Bt4OG
	 PdAsbcUvtHkil/FBs4fbYTy2upd8YIB0dDekBriJJH/NlvmlOz4efG6nKI/Pn8N0PG
	 KOelg1puzzPkyrp06gIZFohH3EgnEzJ+X65uvi/A=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 18 Mar 2025 12:21:26 +0100
Subject: [PATCH v4 7/7] media: vsp1: pipe: Add RAW Bayer formats mapping
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-v4h-iif-v4-7-10ed4c41c195@ideasonboard.com>
References: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
In-Reply-To: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2VdqJ3PHqxkB83ZEhvYJMZfWDGAoB9EGFjytu
 Wozp4BqH8WJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9lXagAKCRByNAaPFqFW
 PBegEACDVy82f4QU82I8Ci+eRN/kbVNaM/cVaUl8h9JCMfPb1ts9Zh9w/d+7WpGTeAipwxFiym/
 +SXWfZMPgPWpEJcK3I3ZEinsNztxzRyJdi5Pa6j8ncjC8kXqKZ1MblLUjk3uqZ4ffonkDsjf40g
 2RzA7fWQDpxMT7uhtu10Emle92PWByFBb7lMZCUcD4wAZcPd2ke9Hl2YEigexDoK43w7xSz8tQo
 WifBHcOT02JBL1KXSnEEkiKSOQdkF7FvvwMRyzKHSgX/lyyZ8kJz7xGiFLvCx+dm2xhweJZLsdO
 xnQ6CA56JxJu1QVgSSe1K3kR/B+hpFTH6VmnYcKHSRmKE2gdXquUwTd3ckqwI8fp4WKMzzAn6/j
 OUYSQdqop18YzpvZ21YGM7vEnNHACFAJ+donJSFRzrfS4HLe6SWPrtMLYKiVO/z87lMR7iwnnwL
 dduDYB2yoR6pE372002XjlmR02tVevW7aLLJnmMqjOP1sJ4Uyf2l9F1td2p60CDttfg9hp1u4WD
 NThpyD4PplPBaQtB0urGwdH5s5Ef6XKz5ONH18p3zbbuqQHofCYM9jhJYH+lLMgTsYYNq3oVkUg
 Jjuk7FkNK9s8Ruh7sReJLA7PiQahOjAGFOhXYZrtjG+unoEs+OpctWgfj4ze3rQe+sIAPG00Yx2
 G1A4ICSteRSfJPw==
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


