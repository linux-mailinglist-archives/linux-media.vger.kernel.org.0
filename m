Return-Path: <linux-media+bounces-28575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B465A6BE89
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84E75481991
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 15:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9081C1ADB;
	Fri, 21 Mar 2025 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I2P47qiE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F905227BA2;
	Fri, 21 Mar 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742571950; cv=none; b=bIHjpiNwPeVHAs8op3PvW3EYITv3LHxxnrCOQRvcwmvx3OXkW3CL69ZtRbY6lgUwRd+7wDIb9uBrmuHzLRAPZqcbOCWg4/KuL5D/wZtj5iU4fqiR+yPO34bsckiiRWoDm15hiAgLhYRcrIGmx1JQ5p+rm1rNvLT+tYEzcPL6jX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742571950; c=relaxed/simple;
	bh=BpD1h8o+ayIQ9HPPT1CHNuNJ6FnlNNR/OmFuyw03Nwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3SdaOJHITpFjKuak8PoxktmyLuMRuLxUCkOHU6lfPgKDAM2FI0lpD/MPGXiXXYuFGQdZHvQNYhnKG7z/YRkcbRpD9c4U65ZrwfR2Xi8IVjqOGRyp6xI3KLoHeO8YYoZGHYxpEQrJqyA3AniQPoAMi+wlrYdv+1VVvS/JyTA954=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I2P47qiE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.109] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54554146B;
	Fri, 21 Mar 2025 16:43:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742571839;
	bh=BpD1h8o+ayIQ9HPPT1CHNuNJ6FnlNNR/OmFuyw03Nwc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I2P47qiEZOxaw2rm6Psh8Z8UOKWQ1KksWgLAuBq+isxma65/QHYE445RC9XV55nyQ
	 +5gc76/wKXdkNSdp6SXv+1H/aOyf5FoGWmvbxe4nBWxEnvjQ+YfdXBV4zLy/P7kBSP
	 wRZInVTC9HJhtYtZiq0iTyFLPh6fGBBBMJG1AAbI=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 21 Mar 2025 16:45:35 +0100
Subject: [PATCH v6 3/7] media: vsp1: rwpf: Break out format handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-v4h-iif-v6-3-361e9043026a@ideasonboard.com>
References: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
In-Reply-To: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2892;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=BpD1h8o+ayIQ9HPPT1CHNuNJ6FnlNNR/OmFuyw03Nwc=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn3YmkvCA1iwvVR+pdWeMWlNdmjYFKO9VaGMBIR
 I9EFhae8syJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ92JpAAKCRByNAaPFqFW
 PLneD/9Lu3ODhJlAXk3pz8qjAHF5KyIrPjxVTO8fazdq2T7S+ykdZ0ldOs3PJVHc/+IazbQSQMi
 RDFXtOg+cA1pQK2rU2v2DVt0Tga+Fc3KyOrSUnTS4Bk0R4vELefi1iIF1LWn8aRrqJYb+y9nemT
 /zUf7ZgEIwwj0k8LkwqiMwJK6z4r2cNctRAO4SHV48NETDMCr6bnzHEQy7yrA2gbBS/+AsHMXIa
 wYh6EtMIhy8etHOZohK19F5SCDI81fG/KyVplvRlPJIPUPN70PTDet44Hr5SojVgJPvwenRr91B
 Ah4mltajzU34gvAulB7iK+rSExsra8YC0/C3XqDcxBsTiEIcCBjG8uQWAy7O0+EMLBv3YNrZFIh
 GAMIdnPjwFsPvrriUU9mLp67iFNSsmKYPLZnAbVRfpX42ebdX9essjpLhdCK9dSl/NrbB7EwlvZ
 99HMstafSTmSCM1FEI1Y4pCWTHHHThhNBA2c4JcDOzJJSjp5PuRjONme9o6MKH3sln4NqeDg4cC
 Z7rbbLhuuLiSLo4DBo+7ceGNw+bdMbvv79/p4A8zphKj/u8xRnu/2A2eFXeWrf0u3zRgSX2nJuz
 kvubyiibZ0ozoMHdfEfKYnppctPmwOsoEjdOnwVTiW8c2+zjU/GEnmosUWG9vRiTl1K/WueTqAm
 0B68sGIUXUt1mXA==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The current implementation of the r/wpf format handling assumes
three formats to be supported in the RGB/YUV space.

With the forthcoming support for VSPX the r/wpf units will be
used to fetch from external memory images in RAW Bayer format
and buffers of ISP configuration parameters.

Prepare for adding support for these new formats by breaking
out the list of supported media bus codes in the vsp1_rwpf.c
file.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 9d38203e73d0..93b0ed5fd0da 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -16,6 +16,12 @@
 #define RWPF_MIN_WIDTH				1
 #define RWPF_MIN_HEIGHT				1
 
+static const u32 rwpf_mbus_codes[] = {
+	MEDIA_BUS_FMT_ARGB8888_1X32,
+	MEDIA_BUS_FMT_AHSV8888_1X32,
+	MEDIA_BUS_FMT_AYUV8_1X32,
+};
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdevice Operations
  */
@@ -24,16 +30,10 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	static const unsigned int codes[] = {
-		MEDIA_BUS_FMT_ARGB8888_1X32,
-		MEDIA_BUS_FMT_AHSV8888_1X32,
-		MEDIA_BUS_FMT_AYUV8_1X32,
-	};
-
-	if (code->index >= ARRAY_SIZE(codes))
+	if (code->index >= ARRAY_SIZE(rwpf_mbus_codes))
 		return -EINVAL;
 
-	code->code = codes[code->index];
+	code->code = rwpf_mbus_codes[code->index];
 
 	return 0;
 }
@@ -57,6 +57,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
 	int ret = 0;
 
 	mutex_lock(&rwpf->entity.lock);
@@ -68,9 +69,11 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	}
 
 	/* Default to YUV if the requested format is not supported. */
-	if (fmt->format.code != MEDIA_BUS_FMT_ARGB8888_1X32 &&
-	    fmt->format.code != MEDIA_BUS_FMT_AHSV8888_1X32 &&
-	    fmt->format.code != MEDIA_BUS_FMT_AYUV8_1X32)
+	for (i = 0; i < ARRAY_SIZE(rwpf_mbus_codes); ++i) {
+		if (fmt->format.code == rwpf_mbus_codes[i])
+			break;
+	}
+	if (i == ARRAY_SIZE(rwpf_mbus_codes))
 		fmt->format.code = MEDIA_BUS_FMT_AYUV8_1X32;
 
 	format = v4l2_subdev_state_get_format(state, fmt->pad);

-- 
2.48.1


