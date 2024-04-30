Return-Path: <linux-media+bounces-10432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 208328B6FD7
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3A601F23FAE
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B01A12C550;
	Tue, 30 Apr 2024 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sg/xlmDA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B6A12C47F;
	Tue, 30 Apr 2024 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473627; cv=none; b=bJUDQyxWTlYXT/InK8Nm/DWtOcBcnT7RT0AHrGvgByrkfrOLwfcVSiuNBlj+XRal5mRxZalBpQfrP6UrlXFZm6IMmCYAwUy6gmLbu7i3nXWim+S0j5y4bq4O3FxyC1T4tYMQKsLb9ZkaV/qPkpQjOcWPQ24LmtF8HfMZ2C9jIkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473627; c=relaxed/simple;
	bh=PZxoeiIGigaivbzucKMAoMDXpf20UGj7Vk3eJgwsdos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEkrpr/Grb83+uiFFC0Cxnfg+ObyViO8T3Qjx2IjHEwfcC3n+aWTcVCQCd3MHBjDD9KHIu3BYT7Mh6twxQqgoP/mCCvz95jJRdsH3RWpjrGLrJMH8TavlA4W5QOVvlgihmRTCFlnmg7k36grnXzhlQlaGD6uTlExp3Mi4vrvVfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sg/xlmDA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5FB71D47;
	Tue, 30 Apr 2024 12:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473561;
	bh=PZxoeiIGigaivbzucKMAoMDXpf20UGj7Vk3eJgwsdos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sg/xlmDA2AqTwowGChyocWV/oDZJT+JK4NM2h/hStc+H+ZTsnwbpLJDSJrHUWs8W+
	 cvv0gIgam/5xvWlfFlDpzi6QNnrnunDeuXByykmrPnTSbF70L3WUIFRQI6fR5Uh95f
	 4kx6bsymaOg9JaQeWsAaHeb8RbsauFwTSjMwMUZA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 09/19] media: max9286: Fix enum_mbus_code
Date: Tue, 30 Apr 2024 12:39:45 +0200
Message-ID: <20240430103956.60190-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The max9286 driver supports multiple output formats but only a single
one is reported theough the .enum_mbus_code operation.

Fix that.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index fb13bfde42df..575d8ac8efa1 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -917,10 +917,10 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
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


