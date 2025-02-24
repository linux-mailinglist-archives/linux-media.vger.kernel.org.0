Return-Path: <linux-media+bounces-26873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0100CA42D94
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 21:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1798170B79
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 20:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E1E265CB2;
	Mon, 24 Feb 2025 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LPqqJ95R"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD662262801;
	Mon, 24 Feb 2025 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428408; cv=none; b=Y+tsjLLrBcyqc6ZR4GXLIYGOqFhLqb/JNBtb+awt9anFVEeNJXPNroORG9qWsiFr4mh5MXeNUOlS14UOtBBVPyNcj0WjTY/zsDWD0ipP1JD4cTvC5Dr4xmRiJvvCrAwha/GTZ8TH61pAKpAK9v3f63FITJ1jP+vrSGiRcUsfLT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428408; c=relaxed/simple;
	bh=0hADf7QXDoCsszjAfVEsTNGYlKDXXkZAZ0v+heiZK10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYZ22tX9ji0VdoMCRVPQVWiUWRsQS0t+/GufE9LTXQ80aRW7TtD6DPqFptuH15ntOGttDzazRt0w5OEf0OA3ufukX0+ee1wE2I440e0zw6DlDZ6rCL9/Kl4XX/9gsOed4VUKMRijAjzM9RMSRnmIAV+HsuBDgVkLWkU016fRduE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LPqqJ95R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB89AD1F;
	Mon, 24 Feb 2025 21:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740428313;
	bh=0hADf7QXDoCsszjAfVEsTNGYlKDXXkZAZ0v+heiZK10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LPqqJ95R1aQklGYpNwf3RaylMe2zu7oWjamlAFDXYOFoVfFGfvoRhaXnIbp3vRLg0
	 pC2aGLdIW+Y6Ox/3hly3XoU+DCk1qwYoa9btf4xXf5VlaZBy+ATMzZIWQIY/lsNzR6
	 iynqOlciZvPsO7NHnd+qBCPlQktBCYw9gFjUowLA=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 24 Feb 2025 21:19:44 +0100
Subject: [PATCH v2 4/6] media: vsp1: rwpf: Break out format handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-v4h-iif-v2-4-0305e3c1fe2d@ideasonboard.com>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
In-Reply-To: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2878;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=0hADf7QXDoCsszjAfVEsTNGYlKDXXkZAZ0v+heiZK10=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnvNRsjvv1fW+gIEgHqTKn7fGh9cGY8h3NWDP5m
 Mv/zpeCGueJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ7zUbAAKCRByNAaPFqFW
 PGp3D/4/9gNuSyBhm+7qmkKYoagrhlWDsPtPi9/Zsj5WKz9/D0qLm2d09n2ULvTCt5+jpJgwTHa
 WFu9+sdpBAXAkb/o5UtqitzeJvevIC4Cltg2vZbTB8fsgbOGR67kfRefg8ezDifyXQ0/zKM3F2X
 VHEvTXFRp22VtffekYnHpeYasGiMQQK5rRxm8ufgkaRJdI0XTJG5hHMsrfqfyhL816U4jRvIZAT
 4OfrciW5Cux6PYcb6nXpC1VgsQCW3+rLN+vI8uVV1UvTURMuhWr0jsi+LuRzzxMAk/UeqXLE8q/
 gDBo0XXaosi4s0q5WTgbMPgqOySKzUKLMZCWBK5sLaVXQmKiu0WUGtgN6I/zJpT7IB3qr759mVb
 tsuVcOeoApYst3KyUmaeztx1Jg19MpMNTciw8W7VkvgN95T9dcbnZavfjSi8/oRUys0oZeAacV2
 WYYGbwRLlZixpEwf+2k4D+fILhzG6MimmtEaW+UAV71HdZ6deacc+j3drfwMNohMoYngByyj0N0
 EHwClJq5joSoJnG6TCNCIrkgC3xiO35m/ky4wOrzP+9yf6VnBdXiX1khycrnPJiWUP5ZObtKcq7
 jhne/BlgnQWX/20TgzDxJpGPxA2MZmK4JgiFmHBbmXyqr1I6illpkil+cjc6Lh2QnLuN+T7tM8F
 Y5l8OJjDDX0dAyw==
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
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 9d38203e73d00b82a1a7db0353e2f0b5a94084f6..93b0ed5fd0da0c6a182dbbfe1e54eb8cfd66c493 100644
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


