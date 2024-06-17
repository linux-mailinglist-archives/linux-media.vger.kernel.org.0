Return-Path: <linux-media+bounces-13467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B790B6E8
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FC68B32997
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AB5C8E1;
	Mon, 17 Jun 2024 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ms5kbIIK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0478310953;
	Mon, 17 Jun 2024 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640741; cv=none; b=rte04/0A4d5YOz3x7olXXBIchuwF9wmMf1h/GhmFdOp+Iid6h5r1JHTWUYEjQGJmdcaU8G+crHplm8GJ9bfimjEbxh8xHViPNcaUqgbo3m8wz4T/KWgbS03OvhHf/G4BKD+4BBcYRNQE5q7EZb1CBlyRXX1qhfWlML04cry9Q5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640741; c=relaxed/simple;
	bh=VMlPLIGEeyeK4MCi8bIe4XLT+b7XxuPLIy6phoKhGrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugsPHEl2naHI0G6zFANK2v6JeHULthJCnV4y8LSkJLLwY7M4PzcQjsCdjuRRaiG96cJpn+HUOOSwDrAkwHUEm0r2NCC6L+c9XBWpE0YDtOvDlGLzdEF96P0Wz21V7cpuFIY//kHCD6Od23fHvOvSpC/ipEll+1SVVe7T2dsLghU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ms5kbIIK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 506BE1011;
	Mon, 17 Jun 2024 18:11:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718640706;
	bh=VMlPLIGEeyeK4MCi8bIe4XLT+b7XxuPLIy6phoKhGrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ms5kbIIKL58h/z5PzQWaZfMO8lQsc2qkVHAsecnSZSYRavqwcIubcdN47ADefE94n
	 vibVBbqnh2pTE1EySAUDSWX2TJ5n5mpAiW0z00sxmFiIvdqp9vz9v7if9MfsP++5jc
	 hcaCYNt2W+I+qd4g8kKrN8BaUjyeqF8HybrVGh9o=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 09/11] media: max9286: Fix enum_mbus_code
Date: Mon, 17 Jun 2024 18:11:32 +0200
Message-ID: <20240617161135.130719-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
References: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The max9286 driver supports multiple output formats but only a single
one is reported through the .enum_mbus_code operation.

Fix that.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index dfcb3fc03350..46ce8e51c011 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -914,10 +914,10 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->pad || code->index > 0)
+	if (code->pad || code->index >= ARRAY_SIZE(max9286_formats))
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
+	code->code = max9286_formats[code->index].code;
 
 	return 0;
 }
-- 
2.45.2


