Return-Path: <linux-media+bounces-25221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62C1A1A860
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 18:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B773167FBC
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 17:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199A2212FA4;
	Thu, 23 Jan 2025 17:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hc5AYXIY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BEB15A843;
	Thu, 23 Jan 2025 17:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651890; cv=none; b=u2OnhC2WsiKcr54Vp9fXu9RiaO1kuLCD/jQZ5pwNFJT87UieXUqF04MVtiaWasHM2SNlmAX+RjoJpo8BWi87q/Ww5DlOHnbFbLJZy7aC3VCkjRV4Egmlvl3lEIdRdazBk8PRfosd2rsqSAddDWlv4bfW09jJtmtGZEuyvYIi3IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651890; c=relaxed/simple;
	bh=HN8kF88g6U5ekkg7MbQ55RqNYqDf07+TYAAH59fiKLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VjGkzqt6cbIrlvVpeqQVpTocmbykHahx0RbP2NUqhOEEJXMw3eWPmR6zsSVORueFnR5wRHIVu4JUGNfbg/BGSS9VKEcRvEs4S1HTOcKUQsOL/t5Lbnw0teDdnXCGKIBVxjfevJAgy/1IhtNC2anOu8c/PsxkzmvsLiM6E1ArqjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hc5AYXIY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 659C41990;
	Thu, 23 Jan 2025 18:03:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737651816;
	bh=HN8kF88g6U5ekkg7MbQ55RqNYqDf07+TYAAH59fiKLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hc5AYXIYZYjfyOA0ho4PnlJemr1MyWcKr/k9SbP8EAzd05OmaTGPu+gBdRpTAxpDL
	 uqt8HWM4JcFeO0r+XQY4bbrTd9ffHS8lEqAR9qzcp1i0o8ewjVvUdUsoI/SejXMhco
	 NN8X51ig3AMMDYJEDErnGx+EVXoXjnd9Cu24pMvs=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Thu, 23 Jan 2025 18:04:05 +0100
Subject: [PATCH 4/6] media: vsp1: rwpf: Break out format handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-v4h-iif-v1-4-7b4e5299939f@ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
In-Reply-To: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2732;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=HN8kF88g6U5ekkg7MbQ55RqNYqDf07+TYAAH59fiKLY=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnknakjSWLVp6xXuXoX1mNgUB1r+4Uv8KI2TKVW
 Hedg83Ur+6JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ5J2pAAKCRByNAaPFqFW
 PA21D/sGRlHkE+QF6tEekkrO64wovTEP1GpXKYIJyAZ+m2na9VFIbyS4YtRvi2wckXp6V9gRihu
 zP+/dpTHOefg3hDS+ZBvKcDQKovOCfre/vodV6IxRpwlF/weO3lBbziNjo/aSI15KPr51YQIYjj
 qIqIYmBuFZtaKpUtQd6RDKR+uWmm9T0DugDVhgXU+OMOzqNvDazAsAvdnfwGYOCCWGtShixUg7A
 ns0PfFIEAqDWjyHVb0E/JrT0hjPo7QNIotPy/YToKM5aixOdfQxoBfXs73Ejsh8VbixFEdlKNan
 xY7WI4M8HGUnTq5s7ECTZjNZQ4LEjqtTP9RHbotnrKTHLHWb8+3BtNn0UKkkJ84ETsl4p+uh2qF
 wJ9EoCSOuVQS3vuCacNbampRAVAloa5PTFpb5h8oR4eOeuD2c45XyausaYy43mnQU1RpfGt+kx8
 gQ94M7yU5U8C/h1oOZskqhyAf1wSuNyGWCkOh4EawLvswIFo0qtrV2k7JN2CapSd3ZufoKadbcP
 D53qp0ZtMWUp9aAUt0GDO3Nwy/H+FHC51iVDmyinbcfQckAlKEnrYsOwBVpthNX/heQYxkQEvXb
 asy3nU9sFJUY2xwyy7OoTAP+iS3A0lZ0T5rHuyE8L6cKEy+Pzc7JKrJYvqjxxeZKoKgytRRxbSW
 0d5Py83fISfvk0g==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The current implementation of the r/wpf format handling assumes
three formats to be supported in the RGB/YUV space.

With the forthcoming support for VSPX the r/wpf units will be
used to fetch from exteranal memory images in RAW Bayer format
and buffers of ISP configuration parameters.

Prepare for adding support for these new formats by breaking
out the list of supported media bus codes in the vsp1_rwpf.c
file.

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
2.47.1


