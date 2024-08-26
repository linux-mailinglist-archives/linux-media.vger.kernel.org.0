Return-Path: <linux-media+bounces-16799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAAF95F1A3
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A190FB22E2F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0DF17B436;
	Mon, 26 Aug 2024 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="liJjew+8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C0117C9B5;
	Mon, 26 Aug 2024 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676076; cv=none; b=ubconn6npkae1y+e4cKC62TEm5Gr9q7uu0wKOUdTyToW2jPKPUD18MMeZbEHtz8rqAieptRbuwyItjl3p6thhXrLvualCMq2+d4qxEpU4FsvV+01gOkbVNA0P/L92HdIyUioZFw+3RO07mZSpoJGzAiLL/Tmsol1MgERw3smVPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676076; c=relaxed/simple;
	bh=0HM33IFSvPq8mPFtAxp1mMrC/z1rT8ewvo6H+mRbCt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSeEhnF1PizGjQ8gNWK1qdLS6TheZ1Y5FnkgHuoPPpsv72f4hO7Cubtset5gdUOJ//Z+G20w1mqWlYP8hSxmulJtwxV98kZQnMDySOPYRSoPGVOGvpG+OqcFZ+Ngu8T6QXAoG7C2UOjKo5ctcIgELVA2OYhM0z6QuAaYyjajHj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=liJjew+8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B545741;
	Mon, 26 Aug 2024 14:40:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724676006;
	bh=0HM33IFSvPq8mPFtAxp1mMrC/z1rT8ewvo6H+mRbCt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=liJjew+8tmregBwKV+eHJqNTOXPICba5m6uYFxVUjHAQOYZCRzg3Ks6uq08wt/1Ka
	 1PwNeWCFKrqbKJC5N/sb44W8nlBAbRDDqCDa9YZLaDWj9ygyPvpIkvtnpmnQUT2ZAg
	 uW8uERbgCgdEa/dhhV2bcDFN0fw6GUQBXZzSA4H4=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 1/7] media: microchip-isc: Drop v4l2_subdev_link_validate() for video devices
Date: Mon, 26 Aug 2024 15:41:00 +0300
Message-ID: <20240826124106.3823-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_link_validate() function is a helper designed to
validate links whose sink is a subdev. When called on a link whose sink
is a video device, it only prints a warning and returns. As the
microchip-isc driver implements manual validate of the subdev to video
device link, we can just dropp the v4l2_subdev_link_validate() to avoid
the warning.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../platform/microchip/microchip-isc-base.c   | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index f3a5cbacadbe..28e56f6a695d 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -902,8 +902,11 @@ static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
 	return 0;
 }
 
-static int isc_validate(struct isc_device *isc)
+static int isc_link_validate(struct media_link *link)
 {
+	struct video_device *vdev =
+		media_entity_to_video_device(link->sink->entity);
+	struct isc_device *isc = video_get_drvdata(vdev);
 	int ret;
 	int i;
 	struct isc_format *sd_fmt = NULL;
@@ -1906,20 +1909,6 @@ int microchip_isc_pipeline_init(struct isc_device *isc)
 }
 EXPORT_SYMBOL_GPL(microchip_isc_pipeline_init);
 
-static int isc_link_validate(struct media_link *link)
-{
-	struct video_device *vdev =
-		media_entity_to_video_device(link->sink->entity);
-	struct isc_device *isc = video_get_drvdata(vdev);
-	int ret;
-
-	ret = v4l2_subdev_link_validate(link);
-	if (ret)
-		return ret;
-
-	return isc_validate(isc);
-}
-
 static const struct media_entity_operations isc_entity_operations = {
 	.link_validate = isc_link_validate,
 };
-- 
Regards,

Laurent Pinchart


