Return-Path: <linux-media+bounces-19624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC899D5AC
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 19:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 511A2284023
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 17:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD741C303D;
	Mon, 14 Oct 2024 17:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcIR/bX+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F9229A0;
	Mon, 14 Oct 2024 17:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728927526; cv=none; b=up6H+Bl1d9mAmgti+pngw5HhaFj6kfKV22AxTU/UweQaHkD3V6S0NiGaYz6pjgPazshSAuSa+++1guBBiboXGsqU59a5dyQxZRv3xAvkSW2xHYpYARYXt11fB48LOcwo5zjEnqqXjxNdsVAuJDnWn1AtOjZiAqWNieqKiABtfY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728927526; c=relaxed/simple;
	bh=s+ht6+ND1BitBGRuSsEjPKbIcyksnV9Q6eHyL7Ksrp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SQuCtuZAkrJ2e/mJUi8goHjpyqGx6PZcVtScama1RkqGhAQnJDhWx0dg7v28oQ43JPvVx/9XgUhIbuaToZRsAh+tpPIEnDW5qCS/NFFDhGrmSqVhcqK27JnuohU9RIDuMz6LsX//zvsXeTwgxPHh0hhJbyn8tcDpOg+mnpmBLq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcIR/bX+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4311e470fdaso30527765e9.3;
        Mon, 14 Oct 2024 10:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728927523; x=1729532323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ueVN2Ek4XObWEXlthFa+g3oz3bdbQFvNmkr/XMgakKQ=;
        b=ZcIR/bX+zgWdVdbmlM/zWGNFkbfzD2B1YpNW+/qLDPSfsbun7kEhpuz0XxkkMOvoiM
         Bp2ReYNMxeqwSGr3vQJ4tSlmtDxUL1NtWuAGEWBlBVomsYWv7HMZreG+6CHg6ppAGeux
         7NUmoZtTDwHnlJs1IvgD7WyizjM2iWA22xWs8qvWx9wDmKTLkrIBJ6ejVrXDJ+0yfJ4X
         gyPYlERV2C/J/J9JrP2QbNgny7D4et8UHW5Skz9pF1q9RIoqzlEsHpUQSJhtebiUT8Zm
         hMpF2DvOHlUmlEhnj1bU1bqUVpIiJ16O3Mb+YLb8xZPYZMIVSmnOOCwCa2MDel26Cnrz
         UWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728927523; x=1729532323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ueVN2Ek4XObWEXlthFa+g3oz3bdbQFvNmkr/XMgakKQ=;
        b=mG3LS6qmEQjXPCXX8a5Wr4lkkmEeEcQB6oyYmoNKcDz7+x2+g+DtZwZi5DhYlhiR/p
         Vtpuykp7KlfRSlKNiQ67jnFE7eFJW0R96i5Xs11UH3gywAq1qXlfROVN4NnqKsJHxDR1
         ERKWmUcXSCaLMDQT18F3vHxCdcDmuGYAdfvOu3Bbn+RsNkUbAKCBvCFM2ujvGOK5EWsR
         91XE5jS/Zni1kK1xZdc2oNds+l9PhyTrOL4cD/0uEen5LR5ZbzQGU0hPj+2wgItFDVVA
         J3Aki86fyV1QOWZ5UItB/vFEETciZlYdqRQzSVFabyah1qNJz00/eszcV64il+FO2kBf
         g2Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVdvdEUgI0C7BdK2Qmy58MPTxROUZvnYTzx9Ud2MI1EzHh3xmJxs42iqOPji4qGglMKqKhdn95oWEiGme8=@vger.kernel.org, AJvYcCXCe0lAcTQ0+r1Ggnl2QpOtj7lmsVYkW1eeN0GuGlQpLSKiiNGvnpChUsAxBdS44TDxysrACZ2jwr9twdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQOCBGE5ZXMRVJ4n5/LY2YGrrDToiYNmC8EhuREnV9UU2q2DK
	qvwnZ1G1pyzPgaWxivfm0kPkDld/QzQsQ7eaFnd6lHTkv0wrp/t+5RDD4A==
X-Google-Smtp-Source: AGHT+IGLQlxbUn1uPDHG7GVy+DOMeUftCVDRF6Vo+BsZh3w4Ur1S8a7JAjqt/+Fw9FCkvyDkESenxA==
X-Received: by 2002:a05:600c:19d1:b0:42c:b037:5fce with SMTP id 5b1f17b1804b1-4311dea3ce0mr113470745e9.3.1728927522722;
        Mon, 14 Oct 2024 10:38:42 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d78dcsm128161835e9.5.2024.10.14.10.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:38:42 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5645: add HAS_EVENTS support
Date: Mon, 14 Oct 2024 19:38:40 +0200
Message-Id: <20241014173840.412695-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Controls can be exposed to userspace via a v4l-subdevX device, and
userspace has to be able to subscribe to control events so that it is
notified when the control changes value.
Add missing HAS_EVENTS support: flag and .(un)subscribe_event().

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/ov5645.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 0c32bd2940ec..2c5145d5c616 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
 	.s_stream = ov5645_s_stream,
 };
 
+static const struct v4l2_subdev_core_ops ov5645_subdev_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
 	.enum_mbus_code = ov5645_enum_mbus_code,
 	.enum_frame_size = ov5645_enum_frame_size,
@@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops ov5645_subdev_ops = {
+	.core = &ov5645_subdev_core_ops,
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
2.34.1


