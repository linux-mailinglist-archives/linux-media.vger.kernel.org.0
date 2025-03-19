Return-Path: <linux-media+bounces-28474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3B3A68BBD
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEADA88431C
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 11:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2349255E53;
	Wed, 19 Mar 2025 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bsUfFbVG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1E2255231;
	Wed, 19 Mar 2025 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383712; cv=none; b=F6WcvXgZwQ0LFxQoSZsRCGse+dxBoH2Y2HkHNjRvqHFwdoMbU4afGj72eEqFkERXpCwOftxrhDq0dlrd6Hv+0tZoCAoAFdtmJvR2/RXCxjYHlC8X0qZ556+zDhFVxRsgMKV8fp1hkm7VHQx2hLEMThD/wIuF9GrK6RIIeycgcI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383712; c=relaxed/simple;
	bh=tE1slbE2zq9KHFM8EaSkGynY+cnKiXq+U8c3be9vz70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORG+j3nd9RGd25oQBbE1GgNJbH6vFOXGH124se4cKV7A9to7VBo9jb7JuY3BEyT0NJ2+LwtfbCymX5M2As6xDez4OIYzTf7bZZTHI6oBgEgVXgr7Rn4/BkKc2s1F68tn94qE7GzLh/OQyg8yMWZNQ9QGIciD01Mx9NcnebumVtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bsUfFbVG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AA63E0D;
	Wed, 19 Mar 2025 12:26:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742383603;
	bh=tE1slbE2zq9KHFM8EaSkGynY+cnKiXq+U8c3be9vz70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bsUfFbVG1EQGEK5/BqyJ2FvA8x87WEMQdeqN6xSzYnqkw7nzqaD+xDuCPuDWgyzu2
	 M9epZdET3KRGYNU0Qdy5SyHqcZle6AVDzkZgqjiCzgj9EfYy7ZA/b/s/CF2aPYylYt
	 9rvAX4VRr8y+IFC0xuheNgDj07XMIXfCxpwo26dE=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Wed, 19 Mar 2025 12:28:16 +0100
Subject: [PATCH v5 3/7] media: vsp1: rwpf: Break out format handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250319-v4h-iif-v5-3-0a10456d792c@ideasonboard.com>
References: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
In-Reply-To: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2qpW9KWVy7HBf/z/2sKimXvyz8N+79C0SfPYF
 FCghwj99dmJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9qqVgAKCRByNAaPFqFW
 PIjqEADGST3yypFzmKXoJ74vg9logEQNuVuL+0pPHy59xKm7We9exG+gJrIN0KEZZCFNivhu7Cj
 AdwhYZ2sfiIsQXOVP3aHxTrnkBBoRfEehEofA21FPPdFld3CildZur+dPymC/bh0erAg4Idf17W
 cXoURf9WpDKUFrZgYgXN+nb5Xq7HchOoW6QWoMW40bKvNqqfNGU0UPnLCugtfSqvQXn/84wOFNt
 rea76mcO56Fdfm9uWJlVt1UZQnG+ETVBn9VYsiqD+Eob6ncQZVVmR7rkaiOLdrv0wgKyLm6kN6j
 KivRT/3CzcTtRqN44bGV4/Hg5YDO4Et8XuP+NC+uKq1n3QnGs8KEQQyjmxFzjV0nFyqwlid/ApT
 Iz0A3rwg8ICvSeVIIHfgjeKsRt/k5dru8uPqvT9568LYA0JitFqAg4pKECQKk3B6stlKUegkvjr
 VGODkaZ56hJUxWTe375wglHDfk2TK7oapul0LLIvZ90PPegBxQjGTe+nQYrD2PtxXIHTwTjXiCp
 TgqXG70JFNnRmB38JL0nxB9zn3lumODf6M6x4ZRlX+wbtgfBkpWtAFEmlznYdhh5YlASHake4Cw
 U5c0vbkUAswQMM9ZzLFyQnxeCaFsDe8CchDD4YVbC8hSn5x395nuvTxMgudLQRi7JIvQBc+mWWI
 xSqkTC3Ordf/lGw==
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


