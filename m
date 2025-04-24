Return-Path: <linux-media+bounces-30898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD940A9A2DE
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B41A7AC5C3
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 07:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63C41F30BE;
	Thu, 24 Apr 2025 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YHJUX2Ja"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EAD1E0E0C;
	Thu, 24 Apr 2025 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478394; cv=none; b=K4ObQL1n1BJ70dbK7pcGbR8/QyTIp8Ywx+KNhkI/xM11wBZ0dDbxuLDjlzUQPy1yPF4mhEBHmNB1ieJhy/P63jXpduJhVyTZmyEyNrddglHLkdP1oIk6ZC08m3iLV69iXPwfmFalR56s//Cj7uVFUjcc6L0EmNZ4iepWpjC18AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478394; c=relaxed/simple;
	bh=zpw2BmTkwqCgwgXl+ftJyityMF1OTsK2895rFqug5l0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=goZA7NaCD36GR2hhQr1w+yr5BIiaSbdC81gYDtxoZBggTDR2U2I1dxn1vFF8migtSiMf/a0aecUBPEr2NorS7Whzwg4UGpzVyWj6JosVk0FYITGm1CQN9UHMbfN/Rervj7brXkdfvMKCdDhp6EkV4T8Be6B4gjDZeSfhY+WEQ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YHJUX2Ja; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D48EDF01;
	Thu, 24 Apr 2025 09:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745478386;
	bh=zpw2BmTkwqCgwgXl+ftJyityMF1OTsK2895rFqug5l0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YHJUX2Ja25Ny3T3a0E49fi+tPT2Oxg/l/YZQNqvF9BqxBFofjmNYlaBpE0ClIP6ZI
	 LxxSrzj8Rdt8FsO9qsZJ8eyt2HhfwWUy3KBCjDMefTqqM3S4owQoG5gAEMAxAF1AFR
	 EoLQK1bmu3MgHAlZfFa8qpVDz5mMUJ+Wo8+zeWVQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 24 Apr 2025 10:05:33 +0300
Subject: [PATCH v2 1/4] media: rcar-vin: Add RCAR_GEN4 model value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250424-rcar-fix-raw-v2-1-f6afca378124@ideasonboard.com>
References: <20250424-rcar-fix-raw-v2-0-f6afca378124@ideasonboard.com>
In-Reply-To: <20250424-rcar-fix-raw-v2-0-f6afca378124@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3186;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=zpw2BmTkwqCgwgXl+ftJyityMF1OTsK2895rFqug5l0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoCeLxtqyiM2FlZxxbGYRsf5SFoiOl2mtx2YPeu
 vqzCMfDVzmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAni8QAKCRD6PaqMvJYe
 9X3JD/0dZbokS6Mkx6xOBSKFtv01y26NQ8tMRl6lq1yQVk6hC00/PozntGlFtSufOZtXj0RLiua
 jWgfzmWrY98WGSU5mk/k+VoCNqROJ6I2E9rxb5qh+2wACT0bbI+igwal5WEQlO37+BtOaR3HFiv
 s5Ax4xiN1MO50V8jIIY2YQKVtcGmEgtIeHotiMaKxjHo2byr96tNiQtHxUlpIbBPlJqlFlnBrR7
 lbau4emsnAJ1CmlxwWt11uIhsDqllrtbguiUG/b3ulWENpXvKAqZuIjT0OvkwuwxXiKHHTGFOlF
 k3LZm/76k9UiiYMsfJIc+KOvGl21y+lpkdxo01rIDVdhk2yRcDFZZd6N1rNeGTm106aWSBP0FDQ
 zeC3gBcDoNMgXKMsPOLLIHcCacE202AU/WmhnIH7I3gDlaMKKbb7hn4HUM0xzLi0CBYT3PAuKaI
 KCW7IAh2Z2OTrovfu/RoJViaKQdhtiADuokOeMlLue4I1ObvsqI5wj3ZaCt12mJGd7OcpGL7nkK
 AGIlAE9TpUVRBJihqW3ID/+wjbYwPPR5+v0uLrHlah5mVuPASmqkeCpQbzqQuiK6ORXzuYUECfN
 MNF09bEveahf/ibwhcFLRZSF55BmlYalebzOoZzmwmGp5HSenM9E43FO/eotvoibb+NritvgmHA
 fACuA2HVULzn2+w==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Currently Gen4 VINs are marked as RCAN_GEN3 models. Add a new enum
value, RCAR_GEN4, and use it for Gen4 VINs. No functional changes in
this patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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


