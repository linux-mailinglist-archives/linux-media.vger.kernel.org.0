Return-Path: <linux-media+bounces-28357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D27A64D86
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA2897A67CF
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C8B23BCEA;
	Mon, 17 Mar 2025 11:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AdSFFul8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34523A58F;
	Mon, 17 Mar 2025 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212662; cv=none; b=CQncc83MRLi9q3ZVDKzbeW5W8ysZ507q3qhf4LZK75W+aA1w8Sfb/3AYtah2QUT1+QkUTsxhT83243wiZUo5yAsD/zfffr5qjhTqRwrpdbxVKuOyplUd4v/JWR/82SoPaxaGl5HrWWJqI9Ub/tC74OYcPIcvkz14CYV5k2oT9HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212662; c=relaxed/simple;
	bh=tE1slbE2zq9KHFM8EaSkGynY+cnKiXq+U8c3be9vz70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYx2zQSuHs61xAYiA4dseiVYyIR+MRMOu4vWVlZVVAGj6tEANC09DPjuvkXcc8nTTWJ6gPjUalAeOSzFt2aoggcCUwkVIfPBAy6ddz9kJBVp6Ms8fUm7yFVHLpWf70PIdAzMxqHw1VYVt5yS61kj5adpGm523cSXOlqQgHxKvH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AdSFFul8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D23810D8;
	Mon, 17 Mar 2025 12:55:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742212547;
	bh=tE1slbE2zq9KHFM8EaSkGynY+cnKiXq+U8c3be9vz70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AdSFFul8v08J04fwGVjmMImh9tVnCE4Vw28YEQh6LKL/QZCxo8g+dGmxFgAAROBFH
	 FO5hURZbcLXQGBixa9IWO7fAfm+MRZlhd1SXpnKZd60TQRNNJ0HVjlNXmP959BirAH
	 U9+rce7+/tyzYUUarXgId0ElPS+vjpQ1cX6EXMWw=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 17 Mar 2025 12:56:41 +0100
Subject: [PATCH v3 3/7] media: vsp1: rwpf: Break out format handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250317-v4h-iif-v3-3-63aab8982b50@ideasonboard.com>
References: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
In-Reply-To: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2A4lU9ic/WqMtX5s9iJYWr/DkhfOvxHLniPs2
 +LkyMtUkzaJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9gOJQAKCRByNAaPFqFW
 PJZ7D/41wo0p1C/jDn4JMKGcvi5ThPiaT5ATsjbth3FDVIRj5mm8eaeyqiXpPWVo06EPWlzcI+t
 B5GiM8vttBAWfGpPK+YwtHM2rPDe7HLs+uwYNYIaii8KleJ5TCyIzoC0wX06CGmPizZPo/pZzzP
 G9zMfVuOPHa5+BQN/xaiGzzzqzIToKFHFyLGUjakMe+Ax0wQ04nt6gfnkeI+5drHEtcanLIrcID
 Ow69bYjF4l7xvRGHFvpgJiRW+N3s4QrlPIaoXDIVdt2hgs1Xy9Hjkrw3cEoOz/FHzSjwRcRpItN
 FBvOkpPSU5lVJ5h1mFvaXvF4C0bKY3MYdwFVr4D3snjV9PMlt9ElLToYb+jJNxUVF3iOegMjXKu
 +zo3kDjhm6vFLAQVnpUaT3PDL4Fe3ZsQYhdkqjsX2KnAkXMsEHYi4JYBmDdoN90IlYZSxc4UTt1
 iF6hxy2ck4KP5CZ/IDja1WWbCdlgBNBV0uwElbjMQC1rBEEVBlmvA6saeiJRrMq97JPK63BGK9C
 +/umXkAS54ueLLcl1ybht0V1tTyfa6Ndx91kFKmtN8Ay8eaYjVcUW1tqAg9sDRDEoW4JbP0aBfF
 XPf0WRAmn2NsoUDC73TZ9jv/12LZgvwnJ/9a9jbTHcU2E3VDeZcznGoybON8IKAosicX+u0Ogsd
 dgRMMxRo16YTuqg==
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


