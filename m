Return-Path: <linux-media+bounces-19927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B326B9A553D
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 18:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7428228108F
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 16:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E5619340C;
	Sun, 20 Oct 2024 16:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTzTV67p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DD918B09;
	Sun, 20 Oct 2024 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729442140; cv=none; b=Hgo1od8Fe9NSW4Eca71PVc9bSwLBSqYmUYGTAtaftBBGGHHeiso+SBof+DSnoB4+3pW029OlYJfJbRdEkH4kU7hwxzTBAeZBfyx7nBF75T9B9fUjw1DZP9/EZW090GxQxjzmITSVyDY5PuMqUBCK3DiC47X4fmuBv5EgoYx6Gj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729442140; c=relaxed/simple;
	bh=i3pKy0B4EdIW6rRXgHAw5rlPq5INzOy+csBMUQBK5Po=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NqUPi7Hs418LZT0TsZGZaTIXVw0lxOlzoKlsY1kStR1BO2ULhm5keIESIl5b9V0f8WHO9IwF8haVTkfoD5RSuMI1iJrGm3n8NQnBp85cuGVCMJzpqSS55LfuKlrGoZoyV/20pQoZ+9AQL6PW4mILVVUvnwHkGezmwWzFfd+r9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTzTV67p; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a5b2f2026so410766966b.2;
        Sun, 20 Oct 2024 09:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729442136; x=1730046936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVjwJ0xGcOwILTqyKshGzT4w7td9DYigH8aBRMyZLUM=;
        b=JTzTV67peuadfoNo//cKsMR/H8OE7j5z90rD/ECtK8D0X2qQEV8+iy7UJOC/WpgIhc
         cuYdFQZKrvVnDEbtAEk1Uuoe9pn37rRjd72K0mRd44yq4Mw2hGvnSjOT21I+/GGgrJip
         gb3C7/cL6JfvN/V3fvqE66TrnqszaMa2LATKgTsZOl5a7d7+ib/XpcE+0zT5GD9+EPsx
         UwEX47XKe6NHaOnTghdVXetZHhghrdKL6ebmMFcQF4xWBukXjc5MUVcVA7OBjumxbKlh
         mX0HNEzClQfBVSinMuL9PEw2s5iKYe+qjpctIUHrJo6acRGFCoJUd/XvqnBYImFt9iLP
         O3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729442136; x=1730046936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVjwJ0xGcOwILTqyKshGzT4w7td9DYigH8aBRMyZLUM=;
        b=JL//pX+LBfcOSN6vqflgLiOkSZkCSfjUP1oW3Bds0EvU5U1nbHuvQeKqCd0VV1u78u
         b23qmgH9aI1Ue0JKmUkiGVMfGjCkMAFbzWaRQsEl4kS8mLgWdEe5VDFar6uwPTSJfkf4
         4HaH5faZpSRet4rEbTqGSnELL7UTZS2Zxaq3OzA4BBzsSnClQxARxv2pdz67SnMm3xXP
         Y60i7ObeOCk46HUQv5FT+eDJMcw6u6+0BAHOKVN7ZbR+IKikfHe/ieUKWZ1muvvobAQn
         G62RABmCEln7d1TBDLUArAHqz8LXbZqRxo4EctzSs71bb17sJta/kaOrCliXAVApDzuU
         +mvg==
X-Forwarded-Encrypted: i=1; AJvYcCVL/I8bcwKAIgdWgQkKE9mGIQ6ofqvpii707ORWo1T3v3uutQciWvxG3Njy2uIN6GcWzSXoUaJiUMAHCpM=@vger.kernel.org, AJvYcCWToBS2f/+b+b63XoXqTfuuc5rZrSMavEHMCxt6kD6/1HOqKAJ+3hAb+11hb3lMzglM1ubiH6Dvp47MA7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhX9zG8WsGeUS26Yz7LOWZD6FnABHb04FcrXuCqMIIteNiuZFN
	2tM89qDphwBv2W/f3jTC0OVLqnGZx7WKXpdHNNtTlE142BxmYgTK
X-Google-Smtp-Source: AGHT+IEQajIGaPrSgnyv5nYIyJ6sss6QGDSLTQQA9YlNXStTS9Buu9a8PVgfPCD8gUPhJdt5r1evRQ==
X-Received: by 2002:a17:907:7f17:b0:a99:ef65:58d0 with SMTP id a640c23a62f3a-a9a69de6e9emr958862166b.65.1729442136301;
        Sun, 20 Oct 2024 09:35:36 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a915a10edsm103701766b.217.2024.10.20.09.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 09:35:35 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: v4l2-subdev: Refactor events
Date: Sun, 20 Oct 2024 18:35:32 +0200
Message-Id: <20241020163534.1720297-1-tomm.merciai@gmail.com>
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
If a control handler is set for the subdev then set the HAS_EVENTS
flag automatically into v4l2_subdev_init_finalize() and use
v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
as default if subdev don't have .(un)subscribe control operations.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes since v1:
 - Aligned event subscription with unsubscription as suggested by LPinchart,
   SAilus

 drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3a4ba08810d2..fad8fa1f63e8 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -691,10 +691,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
 
 	case VIDIOC_SUBSCRIBE_EVENT:
-		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
+		if (v4l2_subdev_has_op(sd, core, subscribe_event))
+			return v4l2_subdev_call(sd, core, subscribe_event,
+						vfh, arg);
+
+		if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
+		    vfh->ctrl_handler)
+			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
+
+		return -ENOIOCTLCMD;
 
 	case VIDIOC_UNSUBSCRIBE_EVENT:
-		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
+		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
+			return v4l2_subdev_call(sd, core, unsubscribe_event,
+						vfh, arg);
+
+		if (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS)
+			return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
+
+		return -ENOIOCTLCMD;
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	case VIDIOC_DBG_G_REGISTER:
@@ -1641,6 +1656,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
 		}
 	}
 
+	if (sd->ctrl_handler)
+		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
+
 	state = __v4l2_subdev_state_alloc(sd, name, key);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
-- 
2.34.1


