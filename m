Return-Path: <linux-media+bounces-17630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1426E96C945
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9E49287790
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC5118C91C;
	Wed,  4 Sep 2024 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDlvPoiB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40F51898E1;
	Wed,  4 Sep 2024 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484078; cv=none; b=rrvmE9fZ0OogMNtj5mrj/0q0NggzGbtrX0iNGIboW7ZeGgF8Z7yx4UvnSXhrEAovdPaueoDHbeHsz9Jqeecj4++ixbi++X38MqdSN9YYma5RjFycdEOSkLXucD1Lx87ky2DZ04MWH8MxfxPjPhgOVTCCf6kazc3sV3uw7UfTtr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484078; c=relaxed/simple;
	bh=jzqa1ut+5yUIkNvgtui45igFbPcbvGJIFbgoFI8N6I8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kkqo6mzD/JvrOm5t/cpG5KaAlfSrtFvROgSuiJud1NU7r0NnGWS1Kjsf7OLdQvuDvF2kJS9nlUuqd7E0O3FMtGpRnclrlUA8hdKAzNRzqmX1KwD/kms+sI4hGtqHJWdI+LDtSULshxxajh+vSWy7MqgG6aDDohRwG7saT2P7Nzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDlvPoiB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-374c7d14191so626907f8f.0;
        Wed, 04 Sep 2024 14:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484075; x=1726088875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1J+9XNW4CsktFOBdcl6+iRK30VsMjMiAHF06kCLm/c=;
        b=RDlvPoiB8NFoxgUG+sXVEB2RHhWR9HyEQFJdTJTVRigiQZdNN057ZWpBStLUv5DG4j
         4HPrA93PyniW3YeDb+MyDcQk0Ggatny8ZpL1wdcRYtVUwBY+r051wfMzToqLw6/rQZhU
         M7ZfMWxqFAjNpP6G90T62yj/aLoKzorR7N3cWsXXQ7Iw22wGNo8n8kdRRD2eGe8ohv8M
         LhRWl94KbMfOb87c4AjfX1DtHTY9WWPRtANBBmEdOL3zKYKC0d7uHYw89Oy9T/wyyGZS
         NMUYsNW98a4kXb3aDR9dc5p7j6EsciZUd6VezHLBnOJBvSsw9Z/OBkb+8m6lo5owP47K
         04FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484075; x=1726088875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1J+9XNW4CsktFOBdcl6+iRK30VsMjMiAHF06kCLm/c=;
        b=aZc45+KrEsx46tAkQ5N2Jq3fDRXbi6SArd5Hg1eI/XspiGnwV3hVDXnG0/cWDO1KtN
         PwH6n1SCtGpl0zQo4cdWfH0Fu9cP9EHNVewNlUegcPvk5BSPFVeWv1o76pt4H3uiEX1m
         x2mZKIviYdR4bM2j1J1JpIFundzhSjE31VdOPMzA4yUgovR4zVxY6fa54y4FUV6OFIDC
         j3qP/W6/B1lZbYzRBuS032fQOljznTa7tvTqeESmQ5m9G57P6KZpWM3lZ0hKpofCJN4n
         q6mkA6qD2biCE6Xx8GfD8m4yai2LhWf4SpB2xVHWZ7gTehv47TKt7vZ+yvPhPVDCJhGd
         RQwA==
X-Forwarded-Encrypted: i=1; AJvYcCUiNaUyltQXl3EsU2AX8CcZvCRWxb8bPsN2ZawIQWA2ja+e6GZsIvB7VnAXEFdoV8S8Z/mFCOArecCr2LtmL9qVQDM=@vger.kernel.org, AJvYcCXhTfP0h9mzb8uwhcugoAvSyS0wpkHZViM2DhwHRlYCf8qjoV0i6sxYhucxLqbB04Pi4mKyaBhmXNpOvh0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbtc9/6RMtTVQQEwI7leZMOzv+gW0gTAZ/7krq+y2bc7ctfZxd
	Jr+G/e5hUkEbjLzjjtX8BcG18HB6TZ/TKHi3kjIiMXuYWLqNLkLK
X-Google-Smtp-Source: AGHT+IHe6AWWYqF3gje9YHnl2a+KBa7nOScIeRb4YrwPuWv0nYHsf4e0s4gIziOsm8JaK3EvXV0ypA==
X-Received: by 2002:adf:e882:0:b0:374:cc89:174b with SMTP id ffacd0b85a97d-377998aafc7mr2294272f8f.4.1725484074900;
        Wed, 04 Sep 2024 14:07:54 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 10/12] media: i2c: ov5645: Report internal routes to userspace
Date: Wed,  4 Sep 2024 22:07:17 +0100
Message-Id: <20240904210719.52466-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index e5ec09f44bec..14010d328e79 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -946,15 +946,36 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
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
 			.code = OV5645_NATIVE_FORMAT,
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
 
@@ -1171,7 +1192,8 @@ static int ov5645_probe(struct i2c_client *client)
 
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


