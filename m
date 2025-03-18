Return-Path: <linux-media+bounces-28410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9110EA67290
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E0223BEA01
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F034620B7F3;
	Tue, 18 Mar 2025 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cbxw9Lbo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51220B1FC;
	Tue, 18 Mar 2025 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296952; cv=none; b=t7GgqBDRlILeCGwuI8v3rB0ObpUpdOEV5wwzPZ9iV2lUvO8dMksaFuW8qn9oJV6/2jHRq8xxoXTw1qYNId34oLj5nPo0S4N6qFeIBFOozwzf46RQmvjnX35ISq7DIWGa9PCn9HUbrq1kjaa3OQ2lfAJNiVM00tnMcBvARCQzrXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296952; c=relaxed/simple;
	bh=tE1slbE2zq9KHFM8EaSkGynY+cnKiXq+U8c3be9vz70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MaTtrqQ0ohQqsGM+L0IWFL70/BGwQ+V+A46BF3wo0tNOfozvJkEhg8lpaQ4ZQIwHdaJ+RNdG/ylm21/UA4oX5fuR0e60BlcYA4pmB0tmZYvZa/mAXU3yDQgj7fxpRp36qPAgXX+J1e17Lm/ayfiuVs6pG8TqkzFcYudPnFYKnTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cbxw9Lbo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4660911E5;
	Tue, 18 Mar 2025 12:20:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742296839;
	bh=tE1slbE2zq9KHFM8EaSkGynY+cnKiXq+U8c3be9vz70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cbxw9LboCX9nQa4CfiVYp8WQGB6k9w+NxyVT+n/F3LSVtiRot1iI1CDeZQStg+FXk
	 LMeen/qUtdTTErK3WWjIEshOE1f1zDLzvJ9qmGZ+1w9Muug1RX6tYGjeUueiUiHbFd
	 FZ3NEfV4L6orTeiEIr23Xr+aRMj3TwazQ4XKMXS8=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 18 Mar 2025 12:21:22 +0100
Subject: [PATCH v4 3/7] media: vsp1: rwpf: Break out format handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-v4h-iif-v4-3-10ed4c41c195@ideasonboard.com>
References: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
In-Reply-To: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2948;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=tE1slbE2zq9KHFM8EaSkGynY+cnKiXq+U8c3be9vz70=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2Vdq6vFRqKZkjCpRZwHooBYYC6hoE3gmFQRUn
 /lxxPPAxmmJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9lXagAKCRByNAaPFqFW
 PI/cD/9zKOASnWaMCCacxZ3SS9M3wnxjIuzfNf7XoH4nG1nfC/8VkDvDjwthAPGT71AvS88gHWK
 72Cvj3x/fHRBA0bSoEJgZv8+3ugfom+ADoP5TqFL/XTdyOB1ULE8pxYm1uOa5AHN2yiMmx+B3mF
 z+snNQTASVfKa8u0jogD3yHCkRFmw1apKtgYuj2+Swa3Z8RubTE2KBl+SA896v4EdWlqzgqSAA5
 Be82LnBiiStGNm3o17x2x4OvA2oY1jHUmlUx430m9MbQzAjPvioQfoML8iWPnmQTwtT69z75hbF
 ZeQh79IJHK1keRqSu/+VVyByTyrQ1LMjWt+6VhH0mRNrMaN9EgBo8YoqcRVmAbDryzDxyyp9pFm
 UODzc9s4v3GBjljWF5ss1lrxRiZMVSh2HDBYh1F1k+WgtL4MnHufEIqDA6cja2KpIK/YCQ/qLPF
 MSe6xalxozAzgwtb60NjvIUII/Evb/oOLRDIxXbRsSQLSb0MQ2IMxMsMuhoBn4m6gSbQME3NTrC
 jvigIY/PVZENiVacr8AQ+rcsoIL7wOCAxHzvpJod+zrz7Z2HtZY7WOERaYfcJKkrXjeyXqZy5aC
 lHs1+i873oVmBN7AESSBI+cYNk1q94IDbkCuglEVocs/n8LL/CvMqd/GswSB+sSl6CzkmOzx6Ib
 O+8RMFnrbG1Bmpw==
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


