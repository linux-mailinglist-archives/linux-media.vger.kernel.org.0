Return-Path: <linux-media+bounces-26874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B633A42D99
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 21:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1FAF1897327
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 20:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA54266569;
	Mon, 24 Feb 2025 20:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g1uwU+2F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509D4264F9D;
	Mon, 24 Feb 2025 20:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428410; cv=none; b=g9eoYM5RNVs70wtAQSt/slWnhOe0BESLyoAVstCJPF+y4/5TYwljER4Cdlncw/fRlkb5REZ+Tb7LCnVZoFDLAsT1CyJ97Hw/zJhniGlj2xLMke80P2S3FezuyMxdnlzHOatZ9nhSKiYy+NfHZyznodAgZsmBAJ0V3vyD2OsIVLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428410; c=relaxed/simple;
	bh=uzFQyNFwu4bIhY1bncdEtv31cE46uVRuczhuiLdIcWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gO6t8jgLVPTqOMvZZtbrgmF6o7TBwMUqF5eGWfBs2pfn9sSMvQjLT6Qcb6J5+x2ZRWtZ46mqhM7YrwtRitAtW50MeMIlWpwtAsBCVp1RyCPeW6Nj/GcTITiW9hvYJC5Z1BavHCGWM7PK2tfHNzXKS9aL4/VqdFnmFGbdCuAuvdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g1uwU+2F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91886E45;
	Mon, 24 Feb 2025 21:18:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740428313;
	bh=uzFQyNFwu4bIhY1bncdEtv31cE46uVRuczhuiLdIcWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g1uwU+2F8vS27+7hR+aMo2UsYIHDb/mVW9ZPexgdZjpHAweU1xGQlRNDSz1W2lzuY
	 ylAcL53KQRq/8dtiOU0hqMaXbuxX2HkXnw7vU5gbD6/9RkAnwVShPrv1y38p3lo+Jx
	 HIIBLdWQatGZWl45pXDzupZQpgh/IihsKuEKGSgo=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 24 Feb 2025 21:19:45 +0100
Subject: [PATCH v2 5/6] media: vsp1: rwpf: Support RAW Bayer and ISP config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-v4h-iif-v2-5-0305e3c1fe2d@ideasonboard.com>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
In-Reply-To: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=4904;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=uzFQyNFwu4bIhY1bncdEtv31cE46uVRuczhuiLdIcWE=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnvNRsTDGfyIsCHkP3sCJaLhEUdH8/lff1vWrXD
 2PeTXLos7aJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ7zUbAAKCRByNAaPFqFW
 PMyvEAC4E1muK+IG03oWAolNrO1KSkJoalUQHClfQGx/nLptuexw6CpwsRIsxR/ozZLDz04Sy61
 TV5ZLZqZofq7smmpGBRlFjvofZ1hC78XaAPJoiE/F+F6YWlyMynIepMATv/6d1+hzGPQryVWuSy
 37TJgyVqCvrjVhZ26waAEppXUfBUIqfH+/RaQXskhw4tgAqpf1A/nia7W/BwcsON5I9zHI3oyH6
 wObDlKqw3z9cs8mHbRZjbqSOvZMI6gVOM3awqhoSx0Eb4UZjsGjHVjKCeV0+yMmLEbpaA8Qu3QE
 9ZPtnd8OXgF4Zze1+9Av7N8uH9WgUcmdupVi6TQx3YfFrBcGbvPH2E0+bhaoaR6byKu5nG/Ro+O
 1qll5Fez1DGwAYAlbc263qpEbSdIZPyWK5h9DlnqHRBO5tdnd0GTrUv2ReXQLePWmelrf/G5dX3
 ZW819m0DYmH3qHeHR2aNo1h3v7PwpNtr5s6hR72BBbeDB+FSB/MhVTOVjWqxO05rG3tM97rMUQM
 cYBoKD1lgK5TmjX0EYhGH46VYWBHk2uunjCVuzOJfQnwdJvbfhMRty25UO6loPthhBBxc41MFNw
 eoATvCUb2c3ecCNrQQoEq+htcDW+uSqUnQFZz/KfdzLOKVMIjCS0dfQe9kSeJV1UNl3j+HoE+Rd
 20DRG5+J7i7kx+Q==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

With the forthcoming support for VSPX the r/wpf unit will be used
to perform memory access on the behalf of the ISP units.

Prepare to support reading from external memory images in RAW Bayer
format and ISP configuration parameters by expanding the list
of supported media bus codes.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 97 +++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 93b0ed5fd0da0c6a182dbbfe1e54eb8cfd66c493..aef7b3d53a2171cda028a272f587641b4a8f85dc 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -10,18 +10,102 @@
 #include <media/v4l2-subdev.h>
 
 #include "vsp1.h"
+#include "vsp1_pipe.h"
 #include "vsp1_rwpf.h"
 #include "vsp1_video.h"
 
 #define RWPF_MIN_WIDTH				1
 #define RWPF_MIN_HEIGHT				1
 
+struct vsp1_rwpf_codes {
+	const u32 *codes;
+	unsigned int num_codes;
+};
+
 static const u32 rwpf_mbus_codes[] = {
 	MEDIA_BUS_FMT_ARGB8888_1X32,
 	MEDIA_BUS_FMT_AHSV8888_1X32,
 	MEDIA_BUS_FMT_AYUV8_1X32,
 };
 
+static const struct vsp1_rwpf_codes rwpf_codes = {
+	.codes = rwpf_mbus_codes,
+	.num_codes = ARRAY_SIZE(rwpf_mbus_codes),
+};
+
+static const u32 vspx_rpf0_mbus_codes[] = {
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SBGGR16_1X16,
+	MEDIA_BUS_FMT_SGBRG16_1X16,
+	MEDIA_BUS_FMT_SGRBG16_1X16,
+	MEDIA_BUS_FMT_SRGGB16_1X16,
+	MEDIA_BUS_FMT_METADATA_FIXED
+};
+
+static const struct vsp1_rwpf_codes vspx_rpf0_codes = {
+	.codes = vspx_rpf0_mbus_codes,
+	.num_codes = ARRAY_SIZE(vspx_rpf0_mbus_codes),
+};
+
+static const u32 vspx_rpf1_mbus_codes[] = {
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SBGGR16_1X16,
+	MEDIA_BUS_FMT_SGBRG16_1X16,
+	MEDIA_BUS_FMT_SGRBG16_1X16,
+	MEDIA_BUS_FMT_SRGGB16_1X16,
+};
+
+static const struct vsp1_rwpf_codes vspx_rpf1_codes = {
+	.codes = vspx_rpf1_mbus_codes,
+	.num_codes = ARRAY_SIZE(vspx_rpf1_mbus_codes),
+};
+
+static const struct vsp1_rwpf_codes *vsp1_rwpf_codes(struct v4l2_subdev *sd)
+{
+	struct vsp1_rwpf *rwpf = to_rwpf(sd);
+	struct vsp1_entity *ent = &rwpf->entity;
+
+	/* Only VSPX supports reading Bayer formats. */
+	if (!vsp1_feature(ent->vsp1, VSP1_HAS_IIF))
+		return &rwpf_codes;
+
+	if (ent->type == VSP1_ENTITY_RPF) {
+		switch (ent->index) {
+		case 0:
+			/* VSPX RPF0 supports ISP config data too. */
+			return &vspx_rpf0_codes;
+		case 1:
+			return &vspx_rpf1_codes;
+		default:
+			return &rwpf_codes;
+		}
+	}
+
+	return &rwpf_codes;
+}
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdevice Operations
  */
@@ -30,10 +114,12 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= ARRAY_SIZE(rwpf_mbus_codes))
+	const struct vsp1_rwpf_codes *codes = vsp1_rwpf_codes(subdev);
+
+	if (code->index >= codes->num_codes)
 		return -EINVAL;
 
-	code->code = rwpf_mbus_codes[code->index];
+	code->code = codes->codes[code->index];
 
 	return 0;
 }
@@ -54,6 +140,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
+	const struct vsp1_rwpf_codes *codes = vsp1_rwpf_codes(subdev);
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
@@ -69,11 +156,11 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	}
 
 	/* Default to YUV if the requested format is not supported. */
-	for (i = 0; i < ARRAY_SIZE(rwpf_mbus_codes); ++i) {
-		if (fmt->format.code == rwpf_mbus_codes[i])
+	for (i = 0; i < codes->num_codes; ++i) {
+		if (fmt->format.code == codes->codes[i])
 			break;
 	}
-	if (i == ARRAY_SIZE(rwpf_mbus_codes))
+	if (i == codes->num_codes)
 		fmt->format.code = MEDIA_BUS_FMT_AYUV8_1X32;
 
 	format = v4l2_subdev_state_get_format(state, fmt->pad);

-- 
2.48.1


