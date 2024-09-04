Return-Path: <linux-media+bounces-17621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F896C925
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15A521F24FC7
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B801547EB;
	Wed,  4 Sep 2024 21:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feEMuDac"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1881487E3;
	Wed,  4 Sep 2024 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484066; cv=none; b=JeXMIn3x3hSdIM26XoEyZBD89UX8VBV6rrtH3ZqdZ/QdidwFYYqloctgUybKVMW/1CcY5VOdoX6/sXhK5ixg6ritLvl30OUW3pM5AaedBGIebnfFIjTrY10u7hj88/Mm9A+AZ3FQF+A/Tr1uyQN2M/QnIQMOXspP7ISKq1pDKrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484066; c=relaxed/simple;
	bh=aY/aJQpV38qNROExL3xJqYKRw9fwpPUOQxSrGJ5yIiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mhqSJxoR+vEaQKDneJRTSIS84x9fIE8GtSWJy9wbEz7dtcd81diHavKAGAZB6p7dXjwMEUETKfKJQ6Hw599Z6mPfnZFejhql4IuDyy9HRGQ1NFTZA1SZ10Fxa7eFelhDiUcQkbpjXU21KKfDZ4LsO1zBmNQVFyKcOPKp6V/p8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feEMuDac; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so57861845e9.2;
        Wed, 04 Sep 2024 14:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484064; x=1726088864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc7MVYbBTomhAghG+qJoHxAlGvl31VLQMoetsad1iTQ=;
        b=feEMuDacp5/8AVwS/GD6natgn8NT90d0yTyx4OxDEePK4QojkrpiSpeudkMuHi/VKP
         I+WWtMV/oGg/u5oOxzPbpaD3AIrFwJwLl8KMoeosc5TvhhEBcioUd6/fNghA5bqL+SID
         Ot7WqXAPxdLBDhMrTI1AzGyW2qbiC6IJmupTVxdSw5zoEC2ren7u5PW+gyBk6zPHuKSY
         6lfw6VoulZh50AjAg6H0EqbDZnSpt5XT3Hvk5nK17tKrcgyF0xbawSRzbDsVkdl0bjZ1
         aSuhB7GiMD90Cu98b8Cyy4Q8OwE9flgw3f/+0y94eFZGMY5DE6Mu5VczAnEpblPM063E
         2cBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484064; x=1726088864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jc7MVYbBTomhAghG+qJoHxAlGvl31VLQMoetsad1iTQ=;
        b=Xw62PWbgRqD/xfzsz1v6RwBOUay2kGuebqzJlV9HSaBBf9cNyjcavYEd9yy7l1UrmP
         IVOtBt7fjZ2eFJSy8VOi6eh0rugGwtR9G7NSIC/SEOnkRDU6z3dUbBH5E9NuSNkdJp5u
         Q4PQbmAIfu2g7bzikTF1cF/k5yphG2CogpIbAmB2PiQbzBfHvma/eG86n5uhMdujIqrv
         Ah8iU65GrLrGjAOhW6wu9HIHOLixQGnWye4g+bGULG1ETdMq+ECcwqb73o0Z4MzA7XBm
         cQWXeKAUzS98vM3oWG1qAOBiuByGftFVowP3OssGmKAvRTvNw2sm7i3Elp1sNtzBns8m
         TPBw==
X-Forwarded-Encrypted: i=1; AJvYcCVyRnwSUBNStIZxe2h+yIl7Dwn64dQtkuRIwEteKBkp0Ga4FgmM5aSHh996WaEq3s2kP7Uk3gOBBGX4SDU=@vger.kernel.org, AJvYcCW2+6dh/I8DgM3aSOJo3NXAtzh7gNxRZ9Qb2wVClKC+kFHfQlhWFrCWYmaYSZd2krwABXJcHKZk/YmhELZx0TcxBUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNiT5ZcO3RKf52dOBI9rAnmoae8+U66SHYmBTmHhmNaW72b/z
	giQPmo1iWxyvPYcIkaLFXN/LU959p0oOASACVHzt/b08GQrbMVXU
X-Google-Smtp-Source: AGHT+IEG1xxnHICBbjgQjyLAhdPkSCuL0iFOVc2UlPBgzSYVPheCM3ApQ1pzzl5GKWc09JGokwSXJg==
X-Received: by 2002:a05:600c:3b8f:b0:426:6320:226a with SMTP id 5b1f17b1804b1-42c7b5a8f75mr113452075e9.15.1725484063692;
        Wed, 04 Sep 2024 14:07:43 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:42 -0700 (PDT)
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
Subject: [RFC PATCH 01/12] media: i2c: ov5645: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
Date: Wed,  4 Sep 2024 22:07:08 +0100
Message-Id: <20240904210719.52466-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The OV5645 sensor exposes controls, so the V4L2_SUBDEV_FL_HAS_EVENTS flag
should be set and implement subscribe_event and unsubscribe_event hooks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 019979f553b1..6eedd0310b02 100644
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
@@ -1178,7 +1185,7 @@ static int ov5645_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
 	ov5645->sd.internal_ops = &ov5645_internal_ops;
-	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ov5645->sd.dev = &client->dev;
 	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-- 
2.34.1


