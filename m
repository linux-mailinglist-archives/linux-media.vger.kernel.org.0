Return-Path: <linux-media+bounces-10909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9228BD322
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C84971F2504F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0142615747F;
	Mon,  6 May 2024 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pA5tb9R9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76506156C5F;
	Mon,  6 May 2024 16:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014213; cv=none; b=IV1TOI+/WA7jlsbxvgU8NbyrP7kg6F/dyzPgdRX0qoj38zSzFhc84ZbisFdT0eNPc/XitH9cF3/9VO0S4xevB+e9jDVeEo1twLl0GRVCBJseqYa8bzeeL5+wgcPWWTte4Eg+ing/GoN6Bl4lJc8c2u3We00P9p/OGnb5N7Uc3fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014213; c=relaxed/simple;
	bh=Gfgem0ngZYezZpP8whM15Imal456kGBLVC7a1WVXbig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbbEY/ViQcSrflR2Lx4VZQhJH8wFUkpEngIcahITr9zuAwVVV7VoqcX/k9x39Iu9N744ZI5a28gxq86PA3PfSDaKeKy5BJkt4f8UI0rDDuVSm+wGGxRMIxKX6IZmEoumROFv3qIRbp+U5JPeAqYNo+Wn+ARFVJDYYCD8dPmiq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pA5tb9R9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1167916C5;
	Mon,  6 May 2024 18:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715014199;
	bh=Gfgem0ngZYezZpP8whM15Imal456kGBLVC7a1WVXbig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pA5tb9R97lRkz1H2o2JPt8MjXu1axXnFxU1oS281zOY/57HAZh5VbjEWaHw9LkOx/
	 rCqHbIrE/1X2bzwsToB8uzBcRKwBq+4SZmgNqb25j5JMF1V8FBjjlyTCB10PDrLNTI
	 QM41aF1b4t/5AgvE5OX7bKQvUA9XwUxCElcYg9Yw=
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
Subject: [PATCH v2 09/11] media: max9286: Fix enum_mbus_code
Date: Mon,  6 May 2024 18:49:37 +0200
Message-ID: <20240506164941.110389-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
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


