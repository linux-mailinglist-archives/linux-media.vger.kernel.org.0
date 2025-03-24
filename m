Return-Path: <linux-media+bounces-28624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240E1A6D94C
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 12:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9831716B8F8
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 11:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CCD25E46D;
	Mon, 24 Mar 2025 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rw+zXg4W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8391C8FBA;
	Mon, 24 Mar 2025 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742816963; cv=none; b=JgRBAcn2ksYg0yREhRjIxWxF2ZsYlLYxD+zqAD4pCodF3v9tAi8APSAvYPVrHMDCz7EFyLaofTaov05d1+fmQGACycKuo5z+lIcqtvEF2OS9dWESIRqoZUj9x35vqXoNhbXB3Sp/aXETBbQoJop5AugvADHn4+qWnUTRqD3IhEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742816963; c=relaxed/simple;
	bh=N64ITdRKfXrt4WCnwBdgiYbVM3m6EWxyjJ1k7m//CQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPPrYxUpSlF2CFwSTaACiX1ARFvH7P4Ef4N5ewRKD9gFfJrpiQmSaqWVWGr/4NkrQTK0oOOGp80Nh30zQ8hRnmvG3P1Zq8dkGHiu+lzniMdtbkQAgTpfNj/TKKKyNfHxWc9sY6/6UECZK21Okjo570q/RIF1YNWYgO7pGPMFyU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rw+zXg4W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 722A8A8F;
	Mon, 24 Mar 2025 12:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742816853;
	bh=N64ITdRKfXrt4WCnwBdgiYbVM3m6EWxyjJ1k7m//CQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rw+zXg4WUJtOFAbF/oosPsk/Dyjrm0ceQhlQYz9v6wYU9TE+al8sOSHVNSoSmACH+
	 XPOHI9dkfVHgMBw4fGqSWpoBZCHfH5mf3TkoySZh12dzjD+n2nkSHki+6L22Y+nTfS
	 63W4mJfT7KI2EdP2+J68xj+CbvXW0LMo/1O27ii0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 24 Mar 2025 13:48:52 +0200
Subject: [PATCH 1/3] media: rcar-vin: Add RCAR_GEN4 model value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-rcar-fix-raw-v1-1-ae56c1c7a2f6@ideasonboard.com>
References: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
In-Reply-To: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3044;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=N64ITdRKfXrt4WCnwBdgiYbVM3m6EWxyjJ1k7m//CQc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4Ua9hwfHs5iF4NaMVGMY4hTEHe5Ob+YWxjQKA
 r9/4WH3muOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+FGvQAKCRD6PaqMvJYe
 9RPmD/9pcPdFouxXlAaZk8TVsJA32rq5zJ1qAPoAFPhp/J166jixl+Mis+BL++WJ6ivLYCLxOic
 3M3od5Q94nc9P6phHCff9AriCRJ2uCjOaloTSxEXUYg3EhbWudNBnHxPdvIq33u7Nc8YZFSrIIQ
 vEeSjG0aKwxrwe4N0o1P5NaGwzzoa4MyIZ1z3Ztw9OJC4xDPYR6fOY57yFX8kdzDXzottPEOefs
 62qAS7LX+Iq1YVQhiEMSmlXGHJ0g2ii0ND1lehhG95tWqwxZa/XQTg++fPoLVBBTqBw6DL6QJ/u
 dVqehJLk9a33XfaKSMEq5rbxuQY2oQFKWP9Dy1X+P996iRsplyQq2QucOOgn466k+K8wV646egz
 ue0MeE8bteETC3pa4vQWaNO1e1glFlMFkQYzLybADhWakUC2q56KKPAF+es6s9vrjBtCJEX2FC5
 f7wF0ESfr/t7Zt4jR8ENRpuaHIHcmp04P1+58tUrpf2Bu8Nwowub0Mu3oY/E8rbWPswllZtRCGx
 D+O5BW2qSOZmlmHb5zu6HPulqs3H95CUNiQV6hvFiC2evps3HsX3AEqNpFxE5Vh9jgpyn5nMX6k
 D7veqyb1nBo0QO72d+xTRfRZCbFemZT466XtS9kCm5p66OcIcom6P9Q+JHhfET8t67fglgsJl6S
 AyKNwVp2fCSd9jQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Currently Gen4 VINs are marked as RCAN_GEN3 models. Add a new enum
value, RCAR_GEN4, and use it for Gen4 VINs. No functional changes in
this patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 8 ++++----
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h  | 1 +
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index ddfb18e6e7a4..88989c5fe636 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1275,7 +1275,7 @@ static const struct rvin_info rcar_info_r8a77995 = {
 };
 
 static const struct rvin_info rcar_info_gen4 = {
-	.model = RCAR_GEN3,
+	.model = RCAR_GEN4,
 	.use_mc = true,
 	.use_isp = true,
 	.nv12 = true,
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 8de871240440..972ae2cb3314 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -803,7 +803,7 @@ static int rvin_setup(struct rvin_dev *vin)
 	}
 
 	/* Make sure input interface and input format is valid. */
-	if (vin->info->model == RCAR_GEN3) {
+	if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) {
 		switch (vnmc & VNMC_INF_MASK) {
 		case VNMC_INF_YUV8_BT656:
 		case VNMC_INF_YUV10_BT656:
@@ -826,7 +826,7 @@ static int rvin_setup(struct rvin_dev *vin)
 	}
 
 	/* Enable VSYNC Field Toggle mode after one VSYNC input */
-	if (vin->info->model == RCAR_GEN3)
+	if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4)
 		dmr2 = VNDMR2_FTEV;
 	else
 		dmr2 = VNDMR2_FTEV | VNDMR2_VLV(1);
@@ -926,7 +926,7 @@ static int rvin_setup(struct rvin_dev *vin)
 		if (input_is_yuv == output_is_yuv)
 			vnmc |= VNMC_BPS;
 
-		if (vin->info->model == RCAR_GEN3) {
+		if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) {
 			/* Select between CSI-2 and parallel input */
 			if (vin->is_csi)
 				vnmc &= ~VNMC_DPINE;
@@ -1351,7 +1351,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 
 	if (rvin_scaler_needed(vin)) {
 		/* Gen3 can't scale NV12 */
-		if (vin->info->model == RCAR_GEN3 &&
+		if ((vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) &&
 		    vin->format.pixelformat == V4L2_PIX_FMT_NV12)
 			return -EPIPE;
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index f87d4bc9e53e..34bbd1343bf6 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -39,6 +39,7 @@ enum model_id {
 	RCAR_M1,
 	RCAR_GEN2,
 	RCAR_GEN3,
+	RCAR_GEN4,
 };
 
 enum rvin_csi_id {

-- 
2.43.0


