Return-Path: <linux-media+bounces-19892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F39869A4275
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3924DB23C4A
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F042202F69;
	Fri, 18 Oct 2024 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKV1NQEX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA5F1F429B;
	Fri, 18 Oct 2024 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265578; cv=none; b=kqeYirhqaGutgg6FnEFDjFSmxGqRxOWf5o3UkMd+rOil5uKuB0kvdQztAZqmrCqiYqhUNRJ2IVpcO3Xwxwt2ShsgXibXUjrMfXjjvCVXbgAGe+S/yimfstDkFoBZ5UcQfGVBBDWp+Bi9SUi+WWo6rqfVe5af8ruYLnDhl+8f2Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265578; c=relaxed/simple;
	bh=qEGWTDcIpgZpoqpwy4WvPYdf6fFIKkT9E0QMZNNGK+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REwpd3lgT2SYIkN08lZqn3iYHyJnGIeU937YhX0+h7JefscUx7yTs4jylkOTUx5KOdSBqd5vfBZd+oXxGT3XoQaN8lC1NG2wYpaKOPJN/1ivtNutaP8tTNgMAnAXJkCXCaLXxnlvhu68u3xKuAN+H4MvWDoL75NB9Iw+cXGdlyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKV1NQEX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4311c285bc9so22252665e9.3;
        Fri, 18 Oct 2024 08:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265574; x=1729870374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0U4Au7uAdir6qQ7Jt8ZveHdO0ZgssgjVGCsAU3TL24=;
        b=GKV1NQEXZa0cERnCc+XXlB4FExP719iIkIp95MzzBYWnvZ+jKEYMh+GuFPxMifnDa3
         ypjife6IjV1MFddovgWR+cKYMbmW9kuG+PpNAx4p+ZK6e4GfHSuLfx8qMqO61ql/i7/m
         +WV4EafCYAQXS0y7tBnDsTEvHKhtF2QmXnFUUkSJeKgl3V30F3fR4CEzbXqyXeE3euad
         euw4Zzh0qGy0HcfZ3AijJNhZa8IxWCBzNA8AHr+VxTudpjqpYS0yqGG13nOBpPzZRBTf
         c40FfmdD7AJCzfAkResPiqdLlYbrwx5z8a5/UVlbrwMmE0vUOD54Evb6PeDTfvYpJAgR
         Bzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265574; x=1729870374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0U4Au7uAdir6qQ7Jt8ZveHdO0ZgssgjVGCsAU3TL24=;
        b=uT2PDWvjXtalWxUotNVt/uxWJcvjuZItOExWxl1sAGPmhwNm6w5Bz/uX3n7GunK15B
         xK2WWnVjKSuyvWtkTqJNhaNUWenMiNt4Ddubj8KjuMoABiF12pAuqfjHzG9YtOh11UNN
         y95gyeFuYFnKiiGqMwFcQ+yJbpU6reKMDXFbBlCn+4QNvpCLq3Nzbh7m0UttLRHhHn9T
         Xekta1+IeOFsEniPdV/X6npOxcRtzV4GcUtgTPbfRBkmxw2Eu9ztc9SJ01F2Nzz2ohxJ
         NAI+MxX6y6AVY2bfY7IxB6RwcR4167w+xGym0zPGyES3o3aVTkF2LaW6H1kbus7xu8hz
         necQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4NT2KbrYy3/jWG5505GRD4wbHKOlQ8BnrihcQm5LWxFpO7xHY+WR2H0KzJ8MbBoWe64x0RZDTPadY/i7mHDmQgtE=@vger.kernel.org, AJvYcCUejRrevLVVwlCAda/MRcpFk5R5V6KOFDvIEisiLZeHST2WVjGPtCglMl809rMLd8QQZ9YhRg6RnL3fDg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGA9+60XNdPzqQB2hNn5FBZhW3RAjjCtfJYgtCM8eh0B/fal/z
	py7wi7SQfYZuQg0yPET7JFugRP/qgOP3GzMBApqisD63xcXMq4mx
X-Google-Smtp-Source: AGHT+IFSdmTWWWU08VdbBijR5lup5eKnwnMvFzEDz0SJum00zuP+wepYkxR8824rhLkirnvxG2mvNA==
X-Received: by 2002:adf:e441:0:b0:37d:387b:f080 with SMTP id ffacd0b85a97d-37eab4ee4a0mr1956834f8f.15.1729265573931;
        Fri, 18 Oct 2024 08:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:32:53 -0700 (PDT)
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
Subject: [PATCH v3 01/10] media: i2c: ov5645: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
Date: Fri, 18 Oct 2024 16:32:21 +0100
Message-ID: <20241018153230.235647-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The OV5645 sensor exposes controls, so the V4L2_SUBDEV_FL_HAS_EVENTS flag
should be set and implement subscribe_event and unsubscribe_event hooks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov5645.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 0c32bd2940ec..bcbf3239d3ea 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -1042,7 +1043,13 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
 	.get_selection = ov5645_get_selection,
 };
 
+static const struct v4l2_subdev_core_ops ov5645_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_ops ov5645_subdev_ops = {
+	.core = &ov5645_core_ops,
 	.video = &ov5645_video_ops,
 	.pad = &ov5645_subdev_pad_ops,
 };
@@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
 	ov5645->sd.internal_ops = &ov5645_internal_ops;
-	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ov5645->sd.dev = &client->dev;
 	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-- 
2.43.0


