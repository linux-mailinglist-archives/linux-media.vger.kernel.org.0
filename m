Return-Path: <linux-media+bounces-29704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31383A819EC
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 02:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A1B01905FF5
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 00:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EB078F47;
	Wed,  9 Apr 2025 00:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PVtiQC8V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F0F29A0;
	Wed,  9 Apr 2025 00:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159127; cv=none; b=CuaHlr/fM19+rnSuktSSGVxMYFOz1e4Qcr+yqTycDg4xpKHjjDHlHwGIxk7wZ+e6o/7fg4ByDaIs1/urT6eCuA8Pmz/a0k37Ok7LvWsfAQh07PlK9GedFpV7l9tPOeMzcruBZC9+urHzlZ/XpwVRAD4FNdK378fp/lpu9b6FRXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159127; c=relaxed/simple;
	bh=cekU9eVJL6FeVSYK66IjyuHYO4RG+f2FYRvZ3/dhwIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDhV6SBpYtUWJVTj1vpbkuGbuelA+aEfY41V7PyPDD2NQ+e5twJmvI7cO4QtE0Dlvy4N6AbDUru+eqpl7B5pJ5P9behWZJXCrSxvhx0jjdgZt42cZ1DyGC4dRD4X3rxYztP9ZmCqkZE2kOVP++ofu1NO4FRyZKOBQv/sKHdPrXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PVtiQC8V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1960C99F;
	Wed,  9 Apr 2025 02:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159005;
	bh=cekU9eVJL6FeVSYK66IjyuHYO4RG+f2FYRvZ3/dhwIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PVtiQC8Vzotkk2tb1jpgSb+xt7mesfAaeN0XvUwyEr7Z18g4zXyqS2whx88lVHQ1c
	 qsXO1Y+WUOruFvbhAQIWD6J5Q1tKq+zaan5Lx5737ea5k9dyTc3tikclAYR8TIxoZN
	 QF+ffTjDzV8qE2eM1VcJg8ZxCuo08xV1e72JDe9k=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 2/6] media: renesas: vsp1: Make HSI and HST modules optional
Date: Wed,  9 Apr 2025 03:38:11 +0300
Message-ID: <20250409003815.10253-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all VSP instance incorporate the HSI and HST modules. Add a
VSP1_HAS_HSIT feature flag, and create the modules only on VSP instances
that implement them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1.h    |  1 +
 .../media/platform/renesas/vsp1/vsp1_drv.c    | 59 ++++++++++---------
 2 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index 2f6f0c6ae555..44cb991f094f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -56,6 +56,7 @@ struct vsp1_uif;
 #define VSP1_HAS_BRS		BIT(9)
 #define VSP1_HAS_EXT_DL		BIT(10)
 #define VSP1_HAS_NON_ZERO_LBA	BIT(11)
+#define VSP1_HAS_HSIT		BIT(12)
 
 struct vsp1_device_info {
 	u32 version;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 9fc6bf624a52..4697bf790954 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -302,22 +302,6 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 		list_add_tail(&vsp1->clu->entity.list_dev, &vsp1->entities);
 	}
 
-	vsp1->hsi = vsp1_hsit_create(vsp1, true);
-	if (IS_ERR(vsp1->hsi)) {
-		ret = PTR_ERR(vsp1->hsi);
-		goto done;
-	}
-
-	list_add_tail(&vsp1->hsi->entity.list_dev, &vsp1->entities);
-
-	vsp1->hst = vsp1_hsit_create(vsp1, false);
-	if (IS_ERR(vsp1->hst)) {
-		ret = PTR_ERR(vsp1->hst);
-		goto done;
-	}
-
-	list_add_tail(&vsp1->hst->entity.list_dev, &vsp1->entities);
-
 	if (vsp1_feature(vsp1, VSP1_HAS_HGO) && vsp1->info->uapi) {
 		vsp1->hgo = vsp1_hgo_create(vsp1);
 		if (IS_ERR(vsp1->hgo)) {
@@ -340,6 +324,24 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 			      &vsp1->entities);
 	}
 
+	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
+		vsp1->hsi = vsp1_hsit_create(vsp1, true);
+		if (IS_ERR(vsp1->hsi)) {
+			ret = PTR_ERR(vsp1->hsi);
+			goto done;
+		}
+
+		list_add_tail(&vsp1->hsi->entity.list_dev, &vsp1->entities);
+
+		vsp1->hst = vsp1_hsit_create(vsp1, false);
+		if (IS_ERR(vsp1->hst)) {
+			ret = PTR_ERR(vsp1->hst);
+			goto done;
+		}
+
+		list_add_tail(&vsp1->hst->entity.list_dev, &vsp1->entities);
+	}
+
 	/*
 	 * The LIFs are only supported when used in conjunction with the DU, in
 	 * which case the userspace API is disabled. If the userspace API is
@@ -683,8 +685,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.model = "VSP1-S",
 		.gen = 2,
 		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HGO
-			  | VSP1_HAS_HGT | VSP1_HAS_LUT | VSP1_HAS_SRU
-			  | VSP1_HAS_WPF_VFLIP,
+			  | VSP1_HAS_HGT | VSP1_HAS_HSIT | VSP1_HAS_LUT
+			  | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
 		.rpf_count = 5,
 		.uds_count = 3,
 		.wpf_count = 4,
@@ -694,7 +696,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.version = VI6_IP_VERSION_MODEL_VSPR_H2,
 		.model = "VSP1-R",
 		.gen = 2,
-		.features = VSP1_HAS_BRU | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
+		.features = VSP1_HAS_BRU | VSP1_HAS_HSIT | VSP1_HAS_SRU
+			   | VSP1_HAS_WPF_VFLIP,
 		.rpf_count = 5,
 		.uds_count = 3,
 		.wpf_count = 4,
@@ -704,7 +707,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.version = VI6_IP_VERSION_MODEL_VSPD_GEN2,
 		.model = "VSP1-D",
 		.gen = 2,
-		.features = VSP1_HAS_BRU | VSP1_HAS_HGO | VSP1_HAS_LUT,
+		.features = VSP1_HAS_BRU | VSP1_HAS_HGO | VSP1_HAS_HSIT
+			  | VSP1_HAS_LUT,
 		.lif_count = 1,
 		.rpf_count = 4,
 		.uds_count = 1,
@@ -716,8 +720,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.model = "VSP1-S",
 		.gen = 2,
 		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HGO
-			  | VSP1_HAS_HGT | VSP1_HAS_LUT | VSP1_HAS_SRU
-			  | VSP1_HAS_WPF_VFLIP,
+			  | VSP1_HAS_HGT | VSP1_HAS_HSIT | VSP1_HAS_LUT
+			  | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
 		.rpf_count = 5,
 		.uds_count = 1,
 		.wpf_count = 4,
@@ -727,8 +731,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.version = VI6_IP_VERSION_MODEL_VSPS_V2H,
 		.model = "VSP1V-S",
 		.gen = 2,
-		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_LUT
-			  | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
+		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HSIT
+			  | VSP1_HAS_LUT | VSP1_HAS_SRU | VSP1_HAS_WPF_VFLIP,
 		.rpf_count = 4,
 		.uds_count = 1,
 		.wpf_count = 4,
@@ -738,7 +742,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.version = VI6_IP_VERSION_MODEL_VSPD_V2H,
 		.model = "VSP1V-D",
 		.gen = 2,
-		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_LUT,
+		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HSIT
+			  | VSP1_HAS_LUT,
 		.lif_count = 1,
 		.rpf_count = 4,
 		.uds_count = 1,
@@ -750,8 +755,8 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.model = "VSP2-I",
 		.gen = 3,
 		.features = VSP1_HAS_CLU | VSP1_HAS_HGO | VSP1_HAS_HGT
-			  | VSP1_HAS_LUT | VSP1_HAS_SRU | VSP1_HAS_WPF_HFLIP
-			  | VSP1_HAS_WPF_VFLIP,
+			  | VSP1_HAS_HSIT | VSP1_HAS_LUT | VSP1_HAS_SRU
+			  | VSP1_HAS_WPF_HFLIP | VSP1_HAS_WPF_VFLIP,
 		.rpf_count = 1,
 		.uds_count = 1,
 		.wpf_count = 1,
-- 
Regards,

Laurent Pinchart


