Return-Path: <linux-media+bounces-19904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5789A4457
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 19:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E58501F22FF5
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7632038DC;
	Fri, 18 Oct 2024 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ge7k6+MR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16D168488;
	Fri, 18 Oct 2024 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729271473; cv=none; b=OVWa0636RtlgX3rR1xWd5lnGCWrntNts9VgiG7hIx93Kk5/pVzkpyzriNAdtfmeqHmM9HfPDRupVnO65ouFNBpvSHKiZhEdyFlfpeorGPO1YAaYEc9jC6O0r5oThX3TxOIsazIk3BM3NmMVob8oElwofAVcf8jHJyUg/683uUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729271473; c=relaxed/simple;
	bh=IP+x7f2G2AR9oHaCIhywqDwoE70qzEcXZey4A7uNIDI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MluDh2kc0Nciuj0CV5r33iPcGSVcb+adg+3vk5OiIIT+JCPlcaqyxdijmJhG7Ahc/tPNNSfgN7u9CCrKPh39Tmri4j8WzCI+CgYThT4oHVR5/fSccVIe7t8dTpJTC2U3fXz4LoLKjNgU9Af1nSLamTx3enDUC3euteqGulIi91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ge7k6+MR; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53a007743e7so3019301e87.1;
        Fri, 18 Oct 2024 10:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729271469; x=1729876269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgThiGCPl141sFNrgAm+Rln9/CtmEVSLiC31/DgZ018=;
        b=Ge7k6+MR/8HN607bKp4cQYPXIui4IRVWZDgIz9wHVA83VKY5G6ILP5V6GFUBwXl8/W
         7O7lSQ+tm55QEdTSqGiiGjvgPcVcNku3jGtdkOrg0Y/twMfXoiMAZ2s9fEr/BWgHtAqa
         7fZM4muUgek6p+9BvNeMMZF48HzverEuYIm/zULiTZldsJIDF1OvfFwu0TCdU98dQ29I
         1m9qy9GB7TRqWMYMwMf1E/8V8CcEVrrTuiXzxqZZe6CSpjY+WjZTFHadN5mQyL1J3xuH
         WOUsSQ9l+3fQ12yMHm1zT4EF9NdwTk0FtSBXWwn8HOezQUmpTMtgUoY2T9MFDRri8oL4
         q0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729271469; x=1729876269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgThiGCPl141sFNrgAm+Rln9/CtmEVSLiC31/DgZ018=;
        b=d7H700ZqnliuOiKllszEkwbueJJl+IhQorJvQ/sOqpxBprLgC0U31MkZJZO1rgzsDB
         FgiK2D4jQZPn3DfRlXVXgnueSYlqv71PAsflCjcaO4QRxFs/2ylWtdlMBBglCsOfuRvM
         emKK3Pzz+g/0OCr4/gwIkeDnaUZnLLwC/vW/9Oe4Dh7XER+MeujEQ2XviVJn1lWRN+/7
         /+MxjZEhQsoEBvgPh/1z0MH9hnSRvirBqkKYUMOZY1IbUBQJwb/blouVDlvtHELEa/o1
         jGqnaNpQyEmsEoXx3sbOHORnmrA5JaXNgfZELnn4B25PKpzdmIZczwiMjPpyxsGY7E1Q
         5yzw==
X-Forwarded-Encrypted: i=1; AJvYcCWucz64jwyT2m8NnexzkTc6BygomZhvQJb3IfuF1+bL+eCm6PHAMeN2iShjcYM6GAN7TXzNLekEWTn0xl0=@vger.kernel.org, AJvYcCX1s0tWOK6LDWpHFwKHc24OY/4QD6OeJt9Zdnt8SaF37ByVux7x3o1v8t9NbNQI2hkKLtLyL2ZlrBtErhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAIEo6qhTgnwJXPVW7ZRAmeuQyNicmGmDpU4+ZiDIO4sVZjFIX
	NEuME1j8zrVWlIWFZYHHUqLdUBiLjmo9FqEjtibljZlmXAPSOddDa3L5Og==
X-Google-Smtp-Source: AGHT+IH1GFiCfMMKzbKX6Z15IjU2zJjLuKFYvc3YTObVroWLVHx8a+1y4J4vmfFFuDB7oN+LPUlOHg==
X-Received: by 2002:a05:6512:4009:b0:536:9f72:c427 with SMTP id 2adb3069b0e04-53a154a93a0mr2118740e87.28.1729271468789;
        Fri, 18 Oct 2024 10:11:08 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b07f601sm935598a12.22.2024.10.18.10.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:11:08 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.csengg@gmail.com,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-subdev: Refactor events
Date: Fri, 18 Oct 2024 19:11:03 +0200
Message-Id: <20241018171104.1624426-1-tomm.merciai@gmail.com>
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
 drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3a4ba08810d2..77ca829b9983 100644
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
+		     vfh->ctrl_handler)
+			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
+
+		return -ENOIOCTLCMD;
 
 	case VIDIOC_UNSUBSCRIBE_EVENT:
-		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
+		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
+			return -ENOIOCTLCMD;
+
+		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
+			return v4l2_subdev_call(sd, core, unsubscribe_event,
+						vfh, arg);
+
+		return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
 
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


