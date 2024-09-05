Return-Path: <linux-media+bounces-17719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8291196E5F9
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 268D8B23513
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 22:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40961B86F9;
	Thu,  5 Sep 2024 22:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K8pAaQPU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C105D1AB514;
	Thu,  5 Sep 2024 22:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576823; cv=none; b=iT3iCOCnStj1juZPTorIAyFfI91cXEGYJm4LfmMVy8ewpCUUMPaFS7tDJLTzLZFnDBxg41RJ1OfgWYXwJ86qKlUEA6oe+K9/EsNPVWMvZPLxaIy5R3qmAcdRqkbvRG4CrRNYOQ6mgdv0/Sq3ucsM3RiT/Gap3m5sQBVNwoxkDxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576823; c=relaxed/simple;
	bh=pw7XGS4OO8Fu31h0Rowj9Qv+w+cgSylPnYD9HTV1WSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKhgnaiJ5azLY0szDAjNvSexRzrTSz4Um1ogfPycYnzA1py2fTQ7BNfl5Z/DDIIrY6THQJL8W+fXL8ewlc7ndoC7dvPijovUaA7XKhWynzYKxa5lohjbvng8wdVXDczbX6imIo47e2scOzmojkBlA7BqBCyRhNXkSVjT07+RtE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K8pAaQPU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 742CF1BD0;
	Fri,  6 Sep 2024 00:52:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725576736;
	bh=pw7XGS4OO8Fu31h0Rowj9Qv+w+cgSylPnYD9HTV1WSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K8pAaQPUU7wpRah/h9HCfSeVPlmoKpTPsHtfxhEujH4B7TC+xS72jWN1WA7nyybJf
	 cWk7p8fXN89B5Dckz2o/Ag46W3UMKSG5ugcommlReKiHwOH8ERtABj5viHQki06sbq
	 IQKZ5jYWbQJXY96PZa5XB05Ot9R1/oKUFHFkS3Qs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH/RFC v2 9/9] media: i2c: ar0144: Add support for companding
Date: Fri,  6 Sep 2024 01:53:07 +0300
Message-ID: <20240905225308.11267-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
References: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the V4L2_CID_COMPANDING control to enable control of companding. The
sensor supports compression only, enable the linear (no companding) and
compression menu entries.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ar0144.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ar0144.c b/drivers/media/i2c/ar0144.c
index c2ef8b26a2bc..8789ba0d2ea8 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -1010,6 +1010,12 @@ static int ar0144_s_ctrl(struct v4l2_ctrl *ctrl)
 			  AR0144_AUTO_AG_EN | AR0144_AE_ENABLE : 0, &ret);
 		break;
 
+	case V4L2_CID_COMPANDING:
+		cci_write(sensor->regmap, AR0144_COMPANDING,
+			  ctrl->val == V4L2_COMPANDING_COMPRESS ?
+			  AR0144_COMPAND_EN : 0, &ret);
+		break;
+
 	case V4L2_CID_LINK_FREQ:
 		break;
 
@@ -1044,7 +1050,7 @@ static int ar0144_init_ctrls(struct ar0144 *sensor)
 	if (ret < 0)
 		return ret;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 17);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 18);
 
 	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ar0144_ctrl_ops,
 					&props);
@@ -1108,6 +1114,10 @@ static int ar0144_init_ctrls(struct ar0144 *sensor)
 	sensor->vflip = v4l2_ctrl_new_std(&sensor->ctrls, &ar0144_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
 
+	v4l2_ctrl_new_std_menu(&sensor->ctrls, &ar0144_ctrl_ops,
+			       V4L2_CID_COMPANDING, V4L2_COMPANDING_COMPRESS, 0,
+			       V4L2_COMPANDING_LINEAR);
+
 	if (sensor->ctrls.error) {
 		ret = sensor->ctrls.error;
 		v4l2_ctrl_handler_free(&sensor->ctrls);
-- 
Regards,

Laurent Pinchart


