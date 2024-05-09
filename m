Return-Path: <linux-media+bounces-11229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5F78C128C
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED010281D06
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 16:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A862917082C;
	Thu,  9 May 2024 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AYv/+9Yp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE62216F8E0;
	Thu,  9 May 2024 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715271275; cv=none; b=OcqBgQRghTI3XdJm8ndqoP2wvGG4RpyYThG+xTtHaWiRnSIhHvx7/r+1yUz/eqecbyG2UMuVg8deV2nZzfJTtulD/sSviDtyAl8ExafOyLJktGbC9tpjvFGgpJVjhl2S9WLZou9FDZSrWa+xfOrk5wb73LuKBZsCJVpT97Vb71s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715271275; c=relaxed/simple;
	bh=Gfgem0ngZYezZpP8whM15Imal456kGBLVC7a1WVXbig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6NieQ0yaxvVuExiUXhJe2W5OGdUu0avO9QWXCBfAwD2E81DdUUUmRZhp3aobFFSyCIavMAADl/VwiDj2tjI3UI54oKzBRlvNccLju8P9J8kCgHPVLp75G1mahtFucj28o4krMLJedJ3YNEe+1xBskawuHInwQpthsfFYlNj48Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AYv/+9Yp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92D9D2FEA;
	Thu,  9 May 2024 18:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715271260;
	bh=Gfgem0ngZYezZpP8whM15Imal456kGBLVC7a1WVXbig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AYv/+9YpgWf4jWiOp6UOTBZY2kPnLTXIgEZM/XxqSyJCJDIMkqzQ8hIohQOEqPnkz
	 0oAwFLfjnZ5rr9L0k0cAj/MFRIMSxxgcRtHhRbgcBqJU9dk6gUW6B95CHVfvq1YDag
	 +filukpaxBiSt7up1COEmTjCRwnJlzX8g3tgneZM=
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
Subject: [PATCH v3 09/11] media: max9286: Fix enum_mbus_code
Date: Thu,  9 May 2024 18:13:59 +0200
Message-ID: <20240509161403.111789-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
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
index d685d445cf23..5321238cad60 100644
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
2.44.0


