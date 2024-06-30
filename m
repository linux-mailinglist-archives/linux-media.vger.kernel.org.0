Return-Path: <linux-media+bounces-14424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3204191D216
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 16:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA248281397
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 14:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3806D154429;
	Sun, 30 Jun 2024 14:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UwWxfmQd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6DF1527A7;
	Sun, 30 Jun 2024 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719757136; cv=none; b=uIBPONQaZwaoVkRXuKlrzVJxdV0xV8L9mu0ULL0zwZGDv0HoK+Y8adFTjCx+70sO7zvhAX2Rv4XDpApqBQvdLg9ApVTglyvq4ub5axXnEH6TUMdwea1RUaVy0a0tDmWEdH2G2kCTDQBQK6nXrhB+B4MSYh/UGlyALR/FtSiKSp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719757136; c=relaxed/simple;
	bh=AIWHRQnFxr0+qHVZZKNQOczVJMdXyP80HPCnIXV5OMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdLOFPP8wXsrem7s652ydKOjAw6juaR7UIZlJDhexTiaUp79YN90zB+8L6eak5LxMBzQ/LBY1czqmhbvAfn4+PD8Vhv4mSUGWBvxeOlSYfbVqDpF59fpli8Ey1V3JD1AhuFoYJtSMoCKg3YEy3jZTDuJ4KyufFUniLclyRS1G7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UwWxfmQd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-36-175-nat.elisa-mobile.fi [85.76.36.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DB7D4B0;
	Sun, 30 Jun 2024 16:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719757103;
	bh=AIWHRQnFxr0+qHVZZKNQOczVJMdXyP80HPCnIXV5OMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UwWxfmQdf4iTL37QmJJuiHHuPfgfAIIWUA5nFgn2kLnUY7/zxmeNz4ztP9mSbZRyQ
	 NjIlz7xv3tztc6jalsB8bqhJX3RGbElYdxSW6Qc965y+CI+LYcaJH61te8CdUASItm
	 jDoNLarzvyxSyKnwWJ6NXms2PZ+coOx6nUlz05f0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH/RFC v1 9/9] media: i2c: ar0144: Add support for companding
Date: Sun, 30 Jun 2024 17:17:59 +0300
Message-ID: <20240630141802.15830-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
References: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the V4L2_CID_COMPANDING control to enable control of companding. The
sensor supports A-law only, enable the linear (no companding) and A-law
menu entries.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ar0144.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ar0144.c b/drivers/media/i2c/ar0144.c
index 782a09a66ba6..021e19861f8f 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -996,6 +996,12 @@ static int ar0144_s_ctrl(struct v4l2_ctrl *ctrl)
 			  AR0144_AUTO_AG_EN | AR0144_AE_ENABLE : 0, &ret);
 		break;
 
+	case V4L2_CID_COMPANDING:
+		cci_write(sensor->regmap, AR0144_COMPANDING,
+			  ctrl->val == V4L2_COMPANDING_ALAW ?
+			  AR0144_COMPAND_EN : 0, &ret);
+		break;
+
 	case V4L2_CID_LINK_FREQ:
 		break;
 
@@ -1030,7 +1036,7 @@ static int ar0144_init_ctrls(struct ar0144 *sensor)
 	if (ret < 0)
 		return ret;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 17);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 18);
 
 	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ar0144_ctrl_ops,
 					&props);
@@ -1094,6 +1100,10 @@ static int ar0144_init_ctrls(struct ar0144 *sensor)
 	sensor->vflip = v4l2_ctrl_new_std(&sensor->ctrls, &ar0144_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
 
+	v4l2_ctrl_new_std_menu(&sensor->ctrls, &ar0144_ctrl_ops,
+			       V4L2_CID_COMPANDING, V4L2_COMPANDING_ALAW, 0,
+			       V4L2_COMPANDING_LINEAR);
+
 	if (sensor->ctrls.error) {
 		ret = sensor->ctrls.error;
 		v4l2_ctrl_handler_free(&sensor->ctrls);
-- 
Regards,

Laurent Pinchart


