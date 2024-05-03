Return-Path: <linux-media+bounces-10699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7B98BB05F
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 17:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C9951F21625
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 15:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A974315664E;
	Fri,  3 May 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jLd9K0DN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E62155313;
	Fri,  3 May 2024 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714751524; cv=none; b=UfsE8/z65v0xj/OLCz2kiXMu6lSslfWZFhRRRKwm4s6OHWD4wVeHpVgyx1TVFOBeYsqfcFZozhpWFWeqnt5j+bDa7mOBY8UXJH5+W4azcyLJxvFyKmtO2yWAFtsX9V/xINPU46LYCdo1+KIYQDEnd8GOAKW+giEh3t8jSEji4/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714751524; c=relaxed/simple;
	bh=u8vcWdyEa7xSXQUG0zdkGlvRKzIbk6JGMtb7SAxNm80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUwfGuWEdgDL3ui39Be/zPRE/wfppcP5BSjUYau9MEQKNkxnRkNKd1xYNOtkCqMd//b/HhFiQOPkon//mCuPHMHg1RBeQS2gb0Yn+H229OpsDxvcLapfhnAbq5QZ01pg+4QaPpkuR56EPN22ILJ6xj/b7b1LbqYaN8L8L/ZUyZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jLd9K0DN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3458B2F7A;
	Fri,  3 May 2024 17:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714751454;
	bh=u8vcWdyEa7xSXQUG0zdkGlvRKzIbk6JGMtb7SAxNm80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jLd9K0DNya7umuah3R+ousgpfHHk75g9lDjINv3HBPkOuVTEG5oo+/JLSnrYGSxu6
	 nRmJJGkyX6+B+D+1LLw9S/dspbEvOkHuO6MF1xw/VFfN+9M8yakpEVtCjAAaCjp5Tl
	 Vj8ww6mpczhLRlMdQUj+rAQukzhh+1UqZe0hAYJk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 09/11] media: max9286: Fix enum_mbus_code
Date: Fri,  3 May 2024 17:51:24 +0200
Message-ID: <20240503155127.105235-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
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


