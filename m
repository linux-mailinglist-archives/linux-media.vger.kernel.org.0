Return-Path: <linux-media+bounces-35435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D302AE0EB8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D24BC7AF3B8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAEE25D53B;
	Thu, 19 Jun 2025 20:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="inY0Jlgm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2203876034
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366060; cv=none; b=efCe074jIKMcDg8L/flj1Wd/qBhpj5hKoIB8S8t8MhYOa7ubYbxFElRSFy30/6hw9c9X2o2RUST+gzAjarpkPLRoqS0+MZYmh/obZOjOLsve5mrDPxNIhCJZARWv2yBr2W35mkK9Nju4Qf36f76LA2PTc6PWEk6ZrOS7fExj2yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366060; c=relaxed/simple;
	bh=Fy7CJTsjUWWrSiY4AnR/ZVOGjlvGkcIzeL5HRY3NmBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UI5ToZkVDwPuYOENuRfyD6ZEpDlh/mBLfoCTIXDruUITKXKRgEC4yqpXpStx1TpWYmBwsj9KF7Gw+utIs9fwKr7kC0lqx/yxWKoKt1OM81Y65jIQ6K3UgiEFNCkJqQAfk85loxIh2KB8TSL5aknv4vdB4/JceXt4R24euX05G9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=inY0Jlgm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46EDF9CA;
	Thu, 19 Jun 2025 22:47:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750366039;
	bh=Fy7CJTsjUWWrSiY4AnR/ZVOGjlvGkcIzeL5HRY3NmBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=inY0Jlgm6ASgUve+1q/KU58OprClDq6v7hb4HK5/jEEjUIlvmEmlTmqCwuyJQGwXW
	 n8KpiHwdBg320RUhfrVzY5Pp7OrariZtDsIjnk06SOnNgDF8ou+ugYyC+esgBb/b7A
	 3zdFb0VDfKMy8JUT3WlxTWULoCfE+MiixxdLZZUE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] media: i2c: ds90ub913: Drop check on number of active routes
Date: Thu, 19 Jun 2025 23:47:09 +0300
Message-ID: <20250619204712.16099-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev core now limits the number of active routes to
V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the ds90ub913
driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index fd2d2d5272bf..61920d34efc5 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -316,14 +316,6 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
 	unsigned int i;
 	int ret;
 
-	/*
-	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
-	 * frame desc is made dynamically allocated.
-	 */
-
-	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
-		return -EINVAL;
-
 	ret = v4l2_subdev_routing_validate(sd, routing,
 					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
 	if (ret)
-- 
Regards,

Laurent Pinchart


