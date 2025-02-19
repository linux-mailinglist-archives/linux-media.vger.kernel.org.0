Return-Path: <linux-media+bounces-26372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E38A3C094
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25F31172D52
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560121EDA1A;
	Wed, 19 Feb 2025 13:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bmiMBl6w"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421701E0B61;
	Wed, 19 Feb 2025 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972987; cv=none; b=nSGEwGxp4nqnR8lfyRjSaOTm+IZqdzGZHPZnehYzkoG0UguOXt1WKWW5NY76ljYeLk0wfIC4ZNjjtwGytOiBb5aLV8VGXVzTDMVr024MOfsneNGBccmw69MjSUWQg/8kF5J3KRZgjMxQIGCiQdK64bS0mXYlgs3dHUfI9Zr2DqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972987; c=relaxed/simple;
	bh=QCdow8fYV/gcoLZOG4ngc/tMnOtsJNdvgkcgwY/I9qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPtq3615Wwl64bd4H62WOazDPOk+Rac4Y10mFTijUiXuI71VI+be9dr/VSmMzOMPjf8xKKxx2kQJlo/8FWMSg/UyLs3jVXWhOSPZsKCLfphDDLqUujNL9gi+fItVmG2hf61JqC2fKUZ81c66nHj+cbAyo2gwAkd/sSDVW75lC0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bmiMBl6w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E4236B5;
	Wed, 19 Feb 2025 14:48:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972901;
	bh=QCdow8fYV/gcoLZOG4ngc/tMnOtsJNdvgkcgwY/I9qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bmiMBl6w1a3GzTwXOK7xmwKB8PoOzmcj9NvMbvhsCP2QDDxewuF2be/wXVJ96HSGm
	 OEr+Pu0a+azgV9pYxZfPtJcR8ZGEqypXWoY9BY1bqr/Dap8Wd9KrC6fe8o+AHOcTcD
	 LYzb40oVqBxLfiN3dJAyet49DDnx0rWue7GAN3YI=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:48:55 +0200
Subject: [PATCH 01/18] media: rcar-vin: Add RCAR_GEN4 model value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-1-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=3060;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=QCdow8fYV/gcoLZOG4ngc/tMnOtsJNdvgkcgwY/I9qw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFv+AUe/JK1zWWc7VybdLq2/DzF9PBAyG1EQ
 42GPjgCLqSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhbwAKCRD6PaqMvJYe
 9f9lEACGTYXM+t0Q0JlZtfM68RaR0SgNXQMVg6rpMGtgHLK5+ZgmxPedqmh0vDZngY+yYFQM0VW
 azP7HOuGZwP5FnIlqA46qJ+9rXZPp7yeH1F24Nuad3kpQ9SyFw1qvVt4++OKP1yx5NdMg9V2+0T
 HAJ4sFs5puleOC5CbGzU6Vzzj8pbztWHo7A/R+e9D2W1/RRNPv7BV3/5grQMTQu/QG6IHM0Z7P7
 RdCtkjyZBCqw5y+jy1S+soWK9gcl4dr9VgI7mqcw/FRxnCXa+Bn3zsL4mMUaPpx760zZk+pk/i5
 VGKDpkLiQKjZGOPuSE8pHpLTRVkfDEbjpQkKa3r5JhUo7Y2bml8L4jhD1Wylr+9j67KxpiGoe93
 x+kWkaNF/d1UbGNyfE1bJx0J3HvOHbFZXkdnd47kLk1YkbISw2pnecJqfH9lKufNaqjVAD2Sh7+
 wZnRSmkQgAz/dqGd33DrG6TAtpyaoOHGTPuigntgHZL/0YfofOBjixVc27p7/zi4Vw//vAEKneg
 t8aHbEVpYbiEmvFIVpXq0/3vEaxc4XLXDaLV3tED2ZQ94opioGyVY0aZmDVK2J6W5gyuTb8WfyG
 r6JdgqCqiQ1xX4zxASWorqmz41oLD2O5iY2RIs0owO7Li96QVQoDls8485EGDOJWkTM846mR01I
 hddbYtVszMGbHxw==
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
index c3cf02b94a2b..68c0acc7fc2c 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1089,7 +1089,7 @@ static const struct rvin_info rcar_info_r8a77995 = {
 };
 
 static const struct rvin_info rcar_info_gen4 = {
-	.model = RCAR_GEN3,
+	.model = RCAR_GEN4,
 	.use_mc = true,
 	.use_isp = true,
 	.nv12 = true,
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 976a4e218cd9..f0a77199cead 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -821,7 +821,7 @@ static int rvin_setup(struct rvin_dev *vin)
 	}
 
 	/* Make sure input interface and input format is valid. */
-	if (vin->info->model == RCAR_GEN3) {
+	if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) {
 		switch (vnmc & VNMC_INF_MASK) {
 		case VNMC_INF_YUV8_BT656:
 		case VNMC_INF_YUV10_BT656:
@@ -844,7 +844,7 @@ static int rvin_setup(struct rvin_dev *vin)
 	}
 
 	/* Enable VSYNC Field Toggle mode after one VSYNC input */
-	if (vin->info->model == RCAR_GEN3)
+	if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4)
 		dmr2 = VNDMR2_FTEV;
 	else
 		dmr2 = VNDMR2_FTEV | VNDMR2_VLV(1);
@@ -944,7 +944,7 @@ static int rvin_setup(struct rvin_dev *vin)
 		if (input_is_yuv == output_is_yuv)
 			vnmc |= VNMC_BPS;
 
-		if (vin->info->model == RCAR_GEN3) {
+		if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) {
 			/* Select between CSI-2 and parallel input */
 			if (rvin_remote_is_parallel(vin))
 				vnmc |= VNMC_DPINE;
@@ -1325,7 +1325,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 
 	if (rvin_scaler_needed(vin)) {
 		/* Gen3 can't scale NV12 */
-		if (vin->info->model == RCAR_GEN3 &&
+		if ((vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) &&
 		    vin->format.pixelformat == V4L2_PIX_FMT_NV12)
 			return -EPIPE;
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 62fed93e4438..90534df84ccd 100644
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


