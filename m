Return-Path: <linux-media+bounces-18101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB97973E33
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 421AF1F21AF0
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5511AAE24;
	Tue, 10 Sep 2024 17:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpROOnAN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A9C1A2576;
	Tue, 10 Sep 2024 17:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987994; cv=none; b=r7syf8Di0jx1z6/Abfd6kRBZdsbpO6FNm8f3Fe7kyhlBKbp+CtSjQ3G+9loaqtUtAZXK890o8LY6GAAedwdEGI+6i0VywJJnMOUmMq4vdp6YqN6YdkAzEJTXtVrMp0EQQhsMa2v4Y8B8utC2T2s+x68SCv+6DLer0UXCPTCOMvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987994; c=relaxed/simple;
	bh=xpySyiky2995dkjsO4rwSjRrg0sLTkvBoK45Yndy5zg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eKXe2ttzvmhFVSArUPVAs/T6HIt4tnnRwpzvrGkyFH4eXVThy1k1UxEMr4mqbVrJQaT7xzhkKrjsirjBeOPMe8qjjz7tlwzA9sdziHRyLCxjcVuh4Do1dIV5BO1FdyaY+sQyG0OoHbynxaAwcJwx2gPqp+/hrBEwAAtl4G23xRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpROOnAN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374bfc395a5so17374f8f.0;
        Tue, 10 Sep 2024 10:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987990; x=1726592790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+YYl4FCwGtLH07u9sfER4tdyIcReIv8G79RB3UU690=;
        b=mpROOnAN6g5qSFyG/vfrYowloXP9Qeu9mky2VczYfYUfrZB4ifB7/jPE1yH85yfggD
         5ccW8UtzpCM+m6j8fLozDlRhyPKa7SumZwhUhmodPucT5lkav37lqXk/DffUQB6DWFFT
         8Rt7/SAFfvT2XnO7MT8HuJb5o1SP0Rv9T7DcYOgksoumBChCnJBvMbqTKIDUGxHINGDX
         kVVH4CLDaMQdlgRGANP12AwdOk5li/XVpe7jERJTISiHCBh8Rr2LKdeiHPEPt+z1Gf31
         VeWfQCPhdX1gEtU+aFS9JObOK7yzYYO+3UXbXhe+20CO8XduxJ9wuHtLqKAGSP5EmlPh
         sbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987990; x=1726592790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+YYl4FCwGtLH07u9sfER4tdyIcReIv8G79RB3UU690=;
        b=mq6xbw5XJ0npY0q/qfhJQ6wt4dv3k9HYkk3VUAR60ok3yF7fQOvq9ZXtEaGzZiqBgC
         tWxC7tp1A3Az1pgnP4Le2RvO+nLcldpbVp4LNKtrV4AMJ8XJxT0nLM2qxWayfWzcGZGZ
         HYmJEAZwCiqnd5XzXzcBdXDcu/CQlr+X0zMBFo0fFmwXZq9iRjkgzHf5EiFmdtvFQTGH
         UA/9q+h3M0uQvlUeEF8MK9d5WxfXTPr6vKOI6Eqlsufd7e9MtZyaGfs6tsWBj2lCAJ4o
         YsPLTiliQxX+JedkXCMr+gNL/4qX/nnSxcbqpjHsWa2TUTNxsq20X0MUTPo+zZWf+c8y
         ubBw==
X-Forwarded-Encrypted: i=1; AJvYcCU7KUvpa05b7fmrxUXyOc6oaSHGXu8Z0iekV3fBhzR1S+TJe7wzrYqboTPoOXl7R2jZbX1pzaR7OFQ7WQ8=@vger.kernel.org, AJvYcCXGi82FCSwzdChgis3CrSL1KfaSaVK8Dc4gGgPO7wr+fafZs9BhobFu+9UwKpBvfjezUaSm9p+CBOEDXYPHqJ20v+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvn7LIg5uBWK66OOzzEXqYxJoSYTaeA/GrUr3ub4TyKNXrhvLS
	J5pzsFwR5x4nNHCmzUqW6SP+j+ePkn1L+CbHMmXGG6U6iasRzbK0
X-Google-Smtp-Source: AGHT+IGx9u+TZbJA6FNFl8Rf0mmy03cHTRfs7nWDZLqL0r0CnC1a5yMXWMsSvYEjpLCqFmvinS2hYg==
X-Received: by 2002:a5d:4cc5:0:b0:371:6fc7:d45d with SMTP id ffacd0b85a97d-378a89fd663mr2186929f8f.2.1725987990526;
        Tue, 10 Sep 2024 10:06:30 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 10/11] media: i2c: ov5645: Report internal routes to userspace
Date: Tue, 10 Sep 2024 18:06:09 +0100
Message-Id: <20240910170610.226189-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/media/i2c/ov5645.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 255c6395a268..7f1133292ffc 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -947,15 +947,36 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
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
 
@@ -1172,7 +1193,8 @@ static int ov5645_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
 	ov5645->sd.internal_ops = &ov5645_internal_ops;
-	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS |
+			    V4L2_SUBDEV_FL_STREAMS;
 	ov5645->pads[OV5645_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 	ov5645->pads[OV5645_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
 	ov5645->sd.dev = dev;
-- 
2.34.1


