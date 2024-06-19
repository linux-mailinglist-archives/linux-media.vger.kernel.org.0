Return-Path: <linux-media+bounces-13643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB1F90E13D
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 03:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8974628415F
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 01:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AD9B653;
	Wed, 19 Jun 2024 01:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jZXrWC6x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8575210A03;
	Wed, 19 Jun 2024 01:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760264; cv=none; b=M+9XHI6YnXL0JSkwry2+rmuSM4GRsDkk+SmNciYE4dldIuNePZmQmT5VCRBSGfsAJOyRoab5FrPRGyAlD4Wm0uKxJxCArZoT55F+F66hhe9kPMi4xFNXMFTdU0o258BMaq04OOVlFXH7q4Qr4SgFPTuI2TuUku/IUNtPTgAGbMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760264; c=relaxed/simple;
	bh=IauAKKLLKtIroMXis0ibbuul9unL6FHlSgiNK/zpnac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LK3HgpyS8fMSUKUjGmbOk43AERqCX+GO1Piiny1736sk8bBwSnz2vPoKa+BwgYkCSHP1Wni3gNuR1semR8gmtPOPHZyGG4VvBMhozlU52q1sQzvIxaKW9KziZ1WtKJ5uami15vAvCf8hbTnsOLQUFpBLWB2I/9sd3zkqR/qnMdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jZXrWC6x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77DBA1011;
	Wed, 19 Jun 2024 03:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718760242;
	bh=IauAKKLLKtIroMXis0ibbuul9unL6FHlSgiNK/zpnac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jZXrWC6xlSYmHQpeNhr0lQnF5Yksug633wsWdZklbWw5vl2NpH2oKenyHfo9HKL7q
	 msWtvZQHgBcgbDHXu5E0DaHwO8WsUGYFaeLGwachuTt2JeWZYnM4NcEmUNO0u7i6YH
	 GTgUspc0KzQuXpYi9N4BpEXV2SoUCGoy/bko9FVs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/8] media: microchip-isc: Drop v4l2_subdev_link_validate() for video devices
Date: Wed, 19 Jun 2024 04:23:49 +0300
Message-ID: <20240619012356.22685-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
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


