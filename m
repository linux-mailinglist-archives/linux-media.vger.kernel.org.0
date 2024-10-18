Return-Path: <linux-media+bounces-19901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 292919A428F
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 462571C21964
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996F0204F8B;
	Fri, 18 Oct 2024 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOfe1ilD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFAC204929;
	Fri, 18 Oct 2024 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265588; cv=none; b=aB43ZV7HBqnSCH71lZUAW3JuqpZPcM1lhyBSB5avBXX68IYHh3jIQJU19YsJ2sdeFtizKmOCd27C5cpwnStZIPOKIt4OEcqC/whTOcLMMbVWl3rf7mFm2RQInkK930KZftuqD/6Q/dtam7y4j+2dfquVGA0J52C5kuWWjfsDSfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265588; c=relaxed/simple;
	bh=/39PZzhUFUXGXcWBZ6h5fK8GuTPvzbFlt6OJFHeCprc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TtB3omD6FGTN2AQMEXBo1ivaOrU+PNPYyqi3quzoCfPEcET/ym0g54xGNYFEHVvT3dDztaDUYTGcq9z88GXIHt+/haBtSWCrhciSBEwSXG+Z7VsNaJ9NwZuAQJjnqeeFnakqMfzDWHqT05CUNAWyrrLiBdDw6eWjivu4AFYBvfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOfe1ilD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so22329975e9.1;
        Fri, 18 Oct 2024 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265584; x=1729870384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFaIbW6B+dFqX+0A24vaHWZkiCBtG8ZbwWb93ENLcYU=;
        b=JOfe1ilDBdtAIhZTBr6V714wDpP9blmLN5nZXlDwFCULh3ZdLZq0L3O2swYC8YcQ5x
         iEexdrwVMG8HzQTdnnrlkJDohJESGEOVU+3VbEZ2t6vew8pbUkQ7EdWhdOoH/Wwkae7W
         gv295/hiJ5S03J0ZObZLISkfcDcPuz6YJi7iKSDlOWyNrfLKHPPJEAS9OvpWsMxy68e7
         b1ZTICbEjaa94KUVhdD6k4/W1JTaWu8FtkGV4onKMj8K5RE86/3S79TgFl8gLcgLM5uk
         E6IE/fW7NcBFLySpLR4kves3g7uazsp4sP+rhNWTmR/LDF41hEZFuFnegE5SLFAoGMww
         llng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265584; x=1729870384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFaIbW6B+dFqX+0A24vaHWZkiCBtG8ZbwWb93ENLcYU=;
        b=jjQvCKl7VoRYp0qQcK0X35FoQg0LAeHFykWmhIHOmf+N3FTnItkoGG9PVYcYVeS9uZ
         sUoRXSQMBB/h1Rzcv/opPDLmf9E+wuM9+VbPLZ/Yx5++WwqoozFo+AALxt4rluxZluit
         c6FqxO8jvxOYbwdU0TPzIsQtpihPWhRgKcwhhkcHfbSStMGkmya9wlYACDVA++jQeOWh
         qFXwWAJWzc9BLGbZK/9+ew24mwXdOY4fcJIPgXNDG+/1m24bG2wyhR+xpHzzGHxL22xf
         lJls8CLwibhMDCQejUNNVemfYZl2WweHZnzBH6TL7PacMT7uz1ZtiUGJGWtcuB8aMVgD
         b29w==
X-Forwarded-Encrypted: i=1; AJvYcCUa4O8fXrIIYcfeHrjJhREPGHzUSfRP5NWvMjrKfXYhPf5OL3LLuTyz/aDDg7ueiRgoyzVrd1mGjGzwCcw=@vger.kernel.org, AJvYcCX7zS0gvRTaVpN6D6c6iuuJKkSNEwppFaI1v2sTQ/4gzegHvDLOAUvYLZl6TsBdyWjXZtkoUSAhE9ADZrlqcx5etag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfC11XJAV2DlELizPBfsLTJwDI70THKoXHN9sv25Hn/XkT6B0p
	sSvDUNPeuobBU9C3Us3aEvjZZKcO/e3I0bGVK9u++t+QkWYIao3K
X-Google-Smtp-Source: AGHT+IHnf9H7IkRBUJQ5zbtHrEOepqN6/GqDQeX5fLd4HStYst1/K8gFC1EFQ3eaOYD/AnKdawZ+3w==
X-Received: by 2002:a05:600c:1c9b:b0:431:5632:4497 with SMTP id 5b1f17b1804b1-4316168f1fbmr24091595e9.26.1729265583949;
        Fri, 18 Oct 2024 08:33:03 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:33:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 10/10] media: i2c: ov5645: Report internal routes to userspace
Date: Fri, 18 Oct 2024 16:32:30 +0100
Message-ID: <20241018153230.235647-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Usage of internal pads creates a route internal to the subdev, and the
V4L2 camera sensor API requires such routes to be reported to userspace.
Create the route in the .init_state() operation.

Internal routing support requires stream support, so set the
V4L2_SUBDEV_FL_HAS_STREAMS flag and switch formats and selection
rectangles access from pads to streams. As the route is immutable,
there's no need to implement the .set_routing() operation, and we can
hardcode the sink and source stream IDs to 0.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a3353992594b..da6adb7134cf 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -971,15 +971,36 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 static int ov5645_init_state(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_state *sd_state)
 {
+	struct v4l2_subdev_route routes[1] = {
+		{
+			.sink_pad = OV5645_PAD_IMAGE,
+			.sink_stream = 0,
+			.source_pad = OV5645_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = OV5645_PAD_SOURCE,
+		.stream = 0,
 		.format = {
 			.code = MEDIA_BUS_FMT_UYVY8_1X16,
 			.width = ov5645_mode_info_data[1].width,
 			.height = ov5645_mode_info_data[1].height,
 		},
 	};
+	int ret;
+
+	ret = v4l2_subdev_set_routing(subdev, sd_state, &routing);
+	if (ret)
+		return ret;
 
 	ov5645_set_format(subdev, sd_state, &fmt);
 
@@ -1206,7 +1227,7 @@ static int ov5645_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
 	ov5645->sd.internal_ops = &ov5645_internal_ops;
 	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			    V4L2_SUBDEV_FL_HAS_EVENTS;
+			    V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
 	ov5645->pads[OV5645_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 	ov5645->pads[OV5645_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK |
 					       MEDIA_PAD_FL_INTERNAL;
-- 
2.43.0


