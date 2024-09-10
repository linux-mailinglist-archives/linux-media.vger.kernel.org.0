Return-Path: <linux-media+bounces-18093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D6973E17
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD6A2869DC
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1401A38C2;
	Tue, 10 Sep 2024 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgJCUBc8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF8719B3D8;
	Tue, 10 Sep 2024 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987982; cv=none; b=BJq7sTHhqdUg2bEOg9Oe39Mg8dG3HaZNqIdx0Fm2J93kQNsxkljL/3mbOSgimaTFSBJZwhyn4DsZZ9Hg16IxFc4q/FB9nqQ3GZmJX6mWMMRDa2CK819tLnLCMSgf4Y3jitJg4p5taBhDleR3TYtcMM7zb0anzEFGhskK8Ykt2ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987982; c=relaxed/simple;
	bh=JGdJLaovjJBbYCO4/ZAujBbI9fa+eu1eoBgflmmamM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qRWpXJN4NAZm68pcMkmeHpeAn4Fwo0YMZhFTjTA+19WmujyXQMdx9+eK1+omNe4eghflhz8r7zpQHs7S/sgMncGWafee7lf/OMDI5yJQbd+69MdDHB8lqcYtwDB6rHVa5ex7VfSmi9UAej3FQ3e1hnwztJTFb/4gNIchAfQfwXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgJCUBc8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so13466505e9.3;
        Tue, 10 Sep 2024 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987979; x=1726592779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKDEYlUyX9mtDWuZXG8A6gqXn9QYzoYPNiuiR8K1vRg=;
        b=YgJCUBc8RJ3QHYwA0RbAvZ6Rudfh5jD0zc05sKv5/ppHjIdh5lE8VF+yhuJBJfbdOV
         FbqJFAH0mYy+0JpKkS/d0QNS2YZc8MAHZ/tV9yVeerFhNUi2XIbjo1n0Ztlvr+/1tpeN
         0LUYwDLy7GZl/VlP4k5ZvJq1ZbR3qy7zl6BHk41PMzIF/DRhPRgBDZx5JIwJx6ZqoT8F
         mJaOYwTzSccNJgv3AdsBVQHklz+fm97le56viOguEUzSIvqIkxuyJNaxuhVLjEqvIcjC
         Dg4/ek2NXfHWjyV7+mgii2H6C+m0AnVW1DwBNnkCcfV3b1CLiJU9L/tRMoyxXypXR3wC
         5/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987979; x=1726592779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKDEYlUyX9mtDWuZXG8A6gqXn9QYzoYPNiuiR8K1vRg=;
        b=wLcYJIe88IulGG9YYHfiI4Ecw+4MyIK6gBAnXiiJDAagB3H1I8a6pYcwICWvzDqAGQ
         iIkAhhr8gpkn0AoXknPdMpEBJlmOdG+4wEmZVYUox2yuKwIIjHFvd/dmtVBk1xXQLBdh
         s+GZiqGcLSn1r+cpeguvbm+/2LC3oBVP6XqB0q8HWUVFT/SreYBiMXFlRxJSES+oxrgB
         8w1tYQ/xgIl67jV7JtKh+SOEifkPQRcGTL5hEJbLzncqevhOwccYvT6VLtQTX1EhIbXx
         La25Gu4DzMH4X2IvBbWomGBnkLBuNCp4iQVV8U5Q+jyBVomHI1H8ueBvT6paLPqcy0p4
         0f2A==
X-Forwarded-Encrypted: i=1; AJvYcCUKSjfW/HZwmDiYk2eS8sGI3RiZz+iazpDrNeAP7nTtOFazyyu4kBL1Ji/aRe+KHW+Rm+7kgeiXrHvf/kKeUP+gMVY=@vger.kernel.org, AJvYcCXPxehv7pOEk6ITLOW6Z1jNRQRUWCI+Tg3ZE9bI6Ksyvs08p7yzkwYFTbVE2Ganipgn3b079vh5SMd12Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx27XaKX7ERZU/s6MEq9RBao+xS0YFwAuabfRetosQzaEfs0L1E
	xxoGsGZ4F7CywDm+TuRQNvdUkFdDGLXPn0ObVmOV4uR48Hzh4/KH
X-Google-Smtp-Source: AGHT+IE/ddFu/z1GAxp7BaYUY9T8bKlWQ1dmYKRj6okptMgprtc/vsgg+nKiwNMQwuzo8WrR2It6Cg==
X-Received: by 2002:a05:600c:1e22:b0:42c:b187:bdd5 with SMTP id 5b1f17b1804b1-42cb187c012mr97209215e9.22.1725987978861;
        Tue, 10 Sep 2024 10:06:18 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:18 -0700 (PDT)
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
Subject: [PATCH v2 02/11] media: i2c: ov5645: Use local `dev` pointer for subdev device assignment
Date: Tue, 10 Sep 2024 18:06:01 +0100
Message-Id: <20240910170610.226189-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

While assigning the subdev device pointer, use the local `dev` pointer
which is already extracted from the `i2c_client` pointer.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 6eedd0310b02..ab3a419df2df 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1187,7 +1187,7 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->sd.internal_ops = &ov5645_internal_ops;
 	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
-	ov5645->sd.dev = &client->dev;
+	ov5645->sd.dev = dev;
 	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
-- 
2.34.1


