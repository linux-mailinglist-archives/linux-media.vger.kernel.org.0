Return-Path: <linux-media+bounces-16607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB10D95BAD6
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 17:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54ADC1F22597
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 15:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067A31CCB3A;
	Thu, 22 Aug 2024 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SwwYTKeb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B08F1C9442;
	Thu, 22 Aug 2024 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341538; cv=none; b=pFEqK5mTS15aM2Hn0Wv0MD1ynRrHI3PKuzetvn7Xc7amuYg7uJ1qX2scHPBCItTUgRc+MXuqnrmz00t8xRDQAImwPnPHlV41hs/r/OMocEyH8MnjZ8xWL3ASlzKkZA6/Kl8dKJNPgbNwElsvtLstvsiq/OmPQnK1Z7MSkY6JkBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341538; c=relaxed/simple;
	bh=IauAKKLLKtIroMXis0ibbuul9unL6FHlSgiNK/zpnac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKz7ECS7nBJf+Us1dZah8l1Q8uaueyZWQXhDAt/EJBjBjqtxFZRCJumEnNLrK+kW+81nITAqCicj25nwiwsO/zEs49EHzprnj8/+ujyrf4qTED0uvFpxKyO7z5XJbkPEKrKEseyjXOlDIBV1pQ7s3mWSLgQdp5jOf99O+J9Is18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SwwYTKeb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9358899;
	Thu, 22 Aug 2024 17:44:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724341471;
	bh=IauAKKLLKtIroMXis0ibbuul9unL6FHlSgiNK/zpnac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SwwYTKebbw7AyV7v1gbv4UQT5inh5ZHvpRMsCn48na+uhgYzAu6+qGGYoR6xSUNzH
	 Q2Lk6sgYJ9tevyk+W0+XM6O+UqxuJ/kH0q1rwOPhYcrTK40Os6b6B07wESI4rcr5NE
	 J0ElSChWpMUA9XxheL4rW8DpviFG1k3LxdKXk4Fs=
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
Subject: [PATCH v2 1/7] media: microchip-isc: Drop v4l2_subdev_link_validate() for video devices
Date: Thu, 22 Aug 2024 18:45:25 +0300
Message-ID: <20240822154531.25912-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
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


