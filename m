Return-Path: <linux-media+bounces-17631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0196C948
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 245DE1C2551B
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FCB18E02B;
	Wed,  4 Sep 2024 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VT1CbOC4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF5D18A6B0;
	Wed,  4 Sep 2024 21:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484079; cv=none; b=g1abEJe8WBksvnoGXIrnuSZuGfoPvfv6ReQVD5fmkmW7f5SCBPhSQKjRf4jJypDxXANGUGZAOrFF5w9eWefre0uCVcU+ZStxV9jfPeQfIXKwrymzz5wdqNyQvY6kVEI5fjiSCnXQ89YoncD8DDiQVge44DfjjUJpxY9/lXI1c0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484079; c=relaxed/simple;
	bh=0j/GEeuxLu4HcIR1VojcZGXjpw+NsfuHifXNqadlWm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WVsStfZWPc6KzRaZUa1+eCvqKi652pZ9WZWIeBQemNPUK2zoahaKHDyZ5qSnpMQep4JSJ+tFZmyeIZZWTmKsqEfGCJ/1LRRIqG08cqLCIIanvGNk2V+3o8s7JacOjYwW2bZZ67hfRuYuv4Vw+637V773AuXx/pLkfj7BSAkamco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VT1CbOC4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42c79deb7c4so38336455e9.3;
        Wed, 04 Sep 2024 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484076; x=1726088876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkG2UKqmGGAU2ZlTW5zJdnvjcvNezmRv0bTbQ21OpnA=;
        b=VT1CbOC4Jfuxoiv0UtDJu5MMn5izBQmBZasnFBp1lNHiCwBaqqclG+yO81JseOnb/G
         xRBIjWoQjLl4LRWLy4miXdP33hFmLARgtFZOtcYM9H6szj/rqpyE5y6P998e8JlxKtST
         5nOHxMqDOrA/7XkfusK/k6A12r1g58e6FxczxTAnOQs6oLEP1KhHYe8uJRIE35QH5u8S
         CjA3gqaD2/dqdfpi1lGRZ3YSTrYl/p7XnUlQulwDLhAC2BnjsFYwr/roVzcCRrOLs2nT
         TFOlMSkMFiVCIeolnmpnTBUSNO0rd3tyN3Y7gj5rtY9HllxfeIv15c7eIum99E9zXY/4
         2RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484076; x=1726088876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkG2UKqmGGAU2ZlTW5zJdnvjcvNezmRv0bTbQ21OpnA=;
        b=gD+/1BaUzLQ03jKscQfIjBJFWFP1xkfE7jFfNwC/x5qszU85Xc8yBLv2tsOp0yW0YJ
         ZZZww9VAt1AuW1kDTjJ+bTBWe3ahJ03roWe9RDx4GZQJ1S9qaKW2crLd6EM2O99bzH0a
         w9bRqXj/bz41tKVL4rDXGDWmqbUrQ7eSP9p55rYHtzrvBmUHzvhnfa4b/yi5muOe27Ek
         vY3XQE3ywHtC7JjxC6A3MyT4tl+DWlsgBIdvOHASUZG1pUyQo5x14+41beEE/sjlvxNV
         rjhgugnr/trNvLiaZdVQai2hBmqLkIX9WkvhSIoXm8uE00PUEOzOOl6cKrut2I7ERtkP
         YfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzLEDZq9m8VEu3rq1ZziEsO4FF9mAkapyBT3MEVao2m2N2vWK0TMLmOQufkm7jRUFNU09LVf59Lon+XwA=@vger.kernel.org, AJvYcCXVjWVFfRAy6sgf7Nwu8F/746Z6elQ8YpAljsGoMuNtl0XScVf6G98LVnrxOQf4h2lHHPEik8d2IAjbv6CT0rsCPlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywJEMahVcgAhpylYfUnS0iqNQ0nTZ3tM1wg6l2VZS5acwwSpFt
	aq9/aSNerlNEkWjnYpsE6IUep5hIzLX9LPkAY5jQqC25cVMknrzT
X-Google-Smtp-Source: AGHT+IHmQ8DXYWFTgFm8T4pyrIKvxkeZTrDyn2eWsUQJ7y/Ei26juDuXm8eqUcnMxTZA5qtguLTW9w==
X-Received: by 2002:a05:600c:3582:b0:42b:9260:235f with SMTP id 5b1f17b1804b1-42c7b5b4b72mr93342855e9.19.1725484076041;
        Wed, 04 Sep 2024 14:07:56 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:55 -0700 (PDT)
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
Subject: [RFC PATCH 11/12] media: i2c: ov5645: Report streams using frame descriptors
Date: Wed,  4 Sep 2024 22:07:18 +0100
Message-Id: <20240904210719.52466-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 14010d328e79..45762783a19f 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -28,6 +28,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
@@ -829,6 +830,32 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
 	.s_ctrl = ov5645_s_ctrl,
 };
 
+static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (pad != OV5645_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0);
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	memset(fd->entry, 0, sizeof(fd->entry));
+
+	fd->entry[0].pixelcode = fmt->code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_YUV422_8B;
+
+	return 0;
+}
+
 static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -1061,6 +1088,7 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
+	.get_frame_desc = ov5645_get_frame_desc,
 	.enum_mbus_code = ov5645_enum_mbus_code,
 	.enum_frame_size = ov5645_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
-- 
2.34.1


