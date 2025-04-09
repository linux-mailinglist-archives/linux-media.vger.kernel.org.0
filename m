Return-Path: <linux-media+bounces-29705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899AA819F2
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 02:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88D31762B6
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 00:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4B084A3E;
	Wed,  9 Apr 2025 00:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GBJt9ZvX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13CA73451;
	Wed,  9 Apr 2025 00:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159128; cv=none; b=sebADpVaBdF9dyV8JKEDRgLWr1P8YZAdo4uOCp78fKBhzzedR7zZu4LXNSQjGuqlh1Kisl+UOwXhaRZnrBAtGY/YmJa4gUSltNm12uJ6mcDd20C9nkA/pC/ncfmGKsKF0GtMqu0P+Fu/tV15tpnPAHvqopalNfibzSxG5ced2Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159128; c=relaxed/simple;
	bh=Yv7f/psoZpSd7+LfMVmbEDCZJoXgjpkocw1zrs36iV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVi6AyuL3yUsrqipbU/GdVcWXIEcRzmYvllxvURDiX2UYvL8KGx3pqCLwSprrVPB0FUft8z5GhT0wrh4JyVQPyxF4DQ2hnN2bIx7FxsLTZXEYeSIpCuO+k8vo8DDeR1xGHE/c8RxS4S6AFXPxu5KyqPzmlw1TWqNqtxT6T7AWVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GBJt9ZvX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C1C7A98;
	Wed,  9 Apr 2025 02:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159006;
	bh=Yv7f/psoZpSd7+LfMVmbEDCZJoXgjpkocw1zrs36iV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GBJt9ZvX4PLFEdF0Qhxj+b65Fj7KTmhx5jJs34iH/7g/dKNFmIKU0X/Lo/xuCFU5r
	 mvVF/mRXVi0G8VDEMZEEvMXjik6fw/yygd6PXa6oYdUnhid+bHLD60UoXpte4W6/TK
	 K5LHyJ2Tx8I36uzBumOwZcPwioeOOGxFEoFnw6q0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 3/6] media: renesas: vsp1: Fix HSV format enumeration
Date: Wed,  9 Apr 2025 03:38:12 +0300
Message-ID: <20250409003815.10253-4-laurent.pinchart+renesas@ideasonboard.com>
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

The HSV formats are not restricted to Gen2 platforms, but to VSP
instances that implement the HSI and HST modules. Make it conditional to
the VSP1_HAS_HSIT feature flag.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 16a78a00c6c9..f7b133536704 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -215,6 +215,9 @@ static const struct vsp1_format_info vsp1_video_gen2_formats[] = {
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  1, { 16, 0, 0 }, false, true, 2, 1, false },
+};
+
+static const struct vsp1_format_info vsp1_video_hsit_formats[] = {
 	{ V4L2_PIX_FMT_HSV24, MEDIA_BUS_FMT_AHSV8888_1X32,
 	  VI6_FMT_RGB_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
@@ -255,6 +258,16 @@ const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 		}
 	}
 
+	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
+		for (i = 0; i < ARRAY_SIZE(vsp1_video_hsit_formats); ++i) {
+			const struct vsp1_format_info *info =
+				&vsp1_video_hsit_formats[i];
+
+			if (info->fourcc == fourcc)
+				return info;
+		}
+	}
+
 	return NULL;
 }
 
@@ -285,6 +298,12 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
 				return &vsp1_video_gen2_formats[index];
 		}
 
+		if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
+			index -= ARRAY_SIZE(vsp1_video_gen2_formats);
+			if (index < ARRAY_SIZE(vsp1_video_hsit_formats))
+				return &vsp1_video_hsit_formats[index];
+		}
+
 		return NULL;
 	}
 
@@ -311,6 +330,19 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
 		}
 	}
 
+	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
+		for (i = 0; i < ARRAY_SIZE(vsp1_video_hsit_formats); ++i) {
+			const struct vsp1_format_info *info =
+				&vsp1_video_hsit_formats[i];
+
+			if (info->mbus == code) {
+				if (!index)
+					return info;
+				index--;
+			}
+		}
+	}
+
 	return NULL;
 }
 
-- 
Regards,

Laurent Pinchart


