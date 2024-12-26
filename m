Return-Path: <linux-media+bounces-24096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF659FC980
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 08:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32FBF1632F4
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 07:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729E11D357A;
	Thu, 26 Dec 2024 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qGAsi9WQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56610170A1A;
	Thu, 26 Dec 2024 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735199447; cv=none; b=h85Qoa4ECbLTc/NKWl9pHN7viU71UQrFmgWMqw1G/anbF+QRINxztywrBw9TiP/dlKcahp1CZta4NipTUARxFXQiuFBKLzluGNawDW3ybqD0rg2Od9uwL1TSHL1GLNpdxtGepxJQkI/6Keny2ocLjD6LsrzuCnivc5bYd5px32w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735199447; c=relaxed/simple;
	bh=CGWJJ6QjxAk8dmSaAbJoGvk/1Mi7CjgFSSaQvIpSy8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JbpNaedfoZGFImG0ol9sISRQMvk+sZiGIHYejSGjlCl0nUjKiZOEP//CWXPEvqE5+GPP13evdEDfjxDBGc0P7LnayMppCXlw1oEwEPiDubwiVv25aC2UyeQHuQY5bVJ4+xkUsaQQlS3cnbTteyC6ksXsWrRxPwU/aGrhUaFSP1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qGAsi9WQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:416f:6c:4037:639a:e90f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 300B09FF;
	Thu, 26 Dec 2024 08:50:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735199401;
	bh=CGWJJ6QjxAk8dmSaAbJoGvk/1Mi7CjgFSSaQvIpSy8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qGAsi9WQFfYOcxr8W89IoxJIT8ELN24qNShq/7pN1+w3XmYKEUf+uJHkh9Stra1pT
	 hgk3zyQBvbjk2It1GSVR9u8yyJnYf4mAGTIUBIWvdPMgOZlNbDyGXU3Y+OuufI9iv6
	 XNKggQ4bR8hckd6AEffXmb0OslCHp4j+lvC2KO94=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Dec 2024 13:19:34 +0530
Subject: [PATCH v4 2/5] media: i2c: imx219: Rename VTS to FRM_LENGTH
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-imx219_fixes-v4-2-dd28383f06f7@ideasonboard.com>
References: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
In-Reply-To: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=CGWJJ6QjxAk8dmSaAbJoGvk/1Mi7CjgFSSaQvIpSy8o=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnbQrCP4+MqByS/CCkMhoiZoMPq5saH73Bh/1oD
 gsz5w+NPzeJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ20KwgAKCRBD3pH5JJpx
 RVEtD/9bu0+yug/pZKvz/OivIbmk3U+3bS02XcbfsPoDZqjuPfkVMvPGIjKVut442fBA2eDHMSm
 fj2MwmYLd7gGN3CNHiHL6mhmrAI9IFNvCj/MYa8eLESrTIWCKFmwHcFVfF3hMlbVOASMmcOiGb1
 MZg89a14ltIrftFolqTj1mWuHtDvr1EzOTQJ+ZSN69dkbDC5JUCok/YuW0Jvfeu04j4VGxXjphP
 H+D+JOsp29dbyjpQYo6cTIkJrYNCjXuAIgvjbXvLRRi7ykEghpxJRdInqQCg1fhBKPUen9KuN+E
 gnDFev7MqxuHkTfUGEuXuEycktdIE0Hp5Bh1GVf7yCyFqz6BP4sScZl59xPyhlFemGowG58qgQe
 /gl6/OZuEu7iCM5+dgm7U6WumCGNPYieYWzbfvurfCAEUuOWfA4suO5IkvmC0ba/t64ZBV60/k5
 nmGG2ulpB19Hw2Jtk1/zplRmBUEZXRMsfRuQYnlQE+XGW1sqyepg0cZbnO98Fcyd8et/EgzoCYr
 I0naDLOMCuWvgOTgC+1B2Vdbxjnjnihnh+QhT625RGh6ZvDwkhwn4WFjUfcRpMGi4JYGouI1Q5R
 fv5ESI5zlbaR7VFEdkQdNzAD66fKqV2vYJRIhe5VAtJb7ZJZxMGyuMvwSoXp8PgoBSuQG+fjDON
 wabe40cxLDZjwcA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The IMX219 datasheet uses the terms FRM_LENGTH and LINE_LENGTH instead
of VTS/HTS.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 0486bbc046cb9c36afd911eb799c1b010a01d496..6c4a72d88cdd2bdd05f2273786110c9f2818e44f 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -70,9 +70,8 @@
 #define IMX219_EXPOSURE_MAX		65535
 
 /* V_TIMING internal */
-#define IMX219_REG_VTS			CCI_REG16(0x0160)
-#define IMX219_VTS_MAX			0xffff
-
+#define IMX219_REG_FRM_LENGTH		CCI_REG16(0x0160)
+#define IMX219_FLL_MAX			0xffff
 #define IMX219_VBLANK_MIN		32
 
 /* HBLANK control - read only */
@@ -418,7 +417,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 			  imx219->hflip->val | imx219->vflip->val << 1, &ret);
 		break;
 	case V4L2_CID_VBLANK:
-		cci_write(imx219->regmap, IMX219_REG_VTS,
+		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH,
 			  format->height + ctrl->val, &ret);
 		break;
 	case V4L2_CID_TEST_PATTERN_RED:
@@ -493,7 +492,7 @@ static int imx219_init_controls(struct imx219 *imx219)
 	/* Initial vblank/hblank/exposure parameters based on current mode */
 	imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
-					   IMX219_VTS_MAX - mode->height, 1,
+					   IMX219_FLL_MAX - mode->height, 1,
 					   mode->vts_def - mode->height);
 	hblank = IMX219_PPL_DEFAULT - mode->width;
 	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
@@ -847,7 +846,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
-					 IMX219_VTS_MAX - mode->height, 1,
+					 IMX219_FLL_MAX - mode->height, 1,
 					 mode->vts_def - mode->height);
 		__v4l2_ctrl_s_ctrl(imx219->vblank,
 				   mode->vts_def - mode->height);

-- 
2.47.1


