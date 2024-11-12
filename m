Return-Path: <linux-media+bounces-21326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ABB9C5F0F
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 18:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9894C1F23B9D
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 17:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5091E21730C;
	Tue, 12 Nov 2024 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jfa9G3P1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A0121502E
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432667; cv=none; b=SHqq0Gx40q1WYsY9/dvMicEv5fuPNgJO9ZGre8pBUvVWByeFTDQRMD+CdfJ5bm2/B6aQYQnN5+nGYMdUDgVkK+U1CGC+wgLNPcRCPlrjeOhi4k04ZOSzGzNKn3JwEtoB/gUQTLCbOzMCpRNIcFKbrmLylP0o7JL5u4smCOgfHyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432667; c=relaxed/simple;
	bh=E17kbtXRsRfcdSPkrY+rNCC2i3rDAnsvyr4zp1CZtMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RS2izVf495/Q84b6tocxqo5++f7DvpynCq1nREEiWW1Z64dz5dvk9lj/X93NayLhsDxOjouzTAzI7sr7g0hqcWNLnHq8fHyIOd1CkV0Z7OQExBRAq4l4o+AMxckMY0F2M9CBFw2MkBhkUfq5ONKvl9qGMV8OZIMY/5mdlmeXDLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jfa9G3P1; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b15416303aso425401585a.1
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 09:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731432665; x=1732037465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqZQPsCIYOn8pJkWFSJPCD0PspSusOPrE3O05rrigFM=;
        b=jfa9G3P1pvyRg0jMeD47qazXZkBS1UDmLgIwRI+joHWmZHXprsqygNAvU2WD8Na5Ya
         ywG8Ir2Yp5qg8zsV1IRoPRzOT+yLFddG9vIcqcV/1LBG95QrmKOSmAW1Um+xUD7gaqSc
         qQJZZKmaXPzfaqxOFG4q+xsvfAgX/kSndxT8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731432665; x=1732037465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqZQPsCIYOn8pJkWFSJPCD0PspSusOPrE3O05rrigFM=;
        b=SUs5rCQ+YLsksrH20+SCgrm/HeEyoiV+zNmVgrZADmAlU9Z+AxEu8VCvOP/8d0u+MA
         9xNdeZ6gueJnfLG6DJRtWPCaBOSNYkx5MmIs8QcPvaVfJO8z9WZVL7O7Z2QtgiMYtwR3
         NGw2QduXX1HagnyMh/ds1GGndbdPGV6B0UQOfw3YomgwcEcoJF1i7Mc3ZFA0j3ONN6Bg
         enDK/e5J81EDGeZucuvHhNp5EP7pcMbC/s7UMh+YCvtpfSsbahC9vq91oeedF9DqjuIt
         vlT1YPNTnZgWGuGE7Xf/192o/rD9eYoGptWz6vbWjX+t20mYNkSC8yCHbdPSFL/SNU9+
         F4pw==
X-Forwarded-Encrypted: i=1; AJvYcCVMtRDOd+xgI52RktWZxdNWkx+XR+VJC2g4vludZ2RVCMV5zYfPSC5Bn/pRoyiF2EWty+JxzTQghoHabQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGGAqP7vEJ+BuoVdUkI4ZvHfym7FWpuQhQ0CvNJ1gQiwPSCVs7
	Mc+ulB2QtgYRLLp+ZKcRNfJb89Q3RhoQzJT/vkM5Efq15yYXkE0yJ3V5s9/QgQ==
X-Google-Smtp-Source: AGHT+IGf8yPShJH+1DZ5FLZFiWVPiFYITT8lUprWPFqP6pNzp5dpZgWT6O1GD6oa8mKqfg1kEHyLBg==
X-Received: by 2002:a05:620a:191e:b0:7a9:acd5:1b21 with SMTP id af79cd13be357-7b331ef8588mr2517962885a.50.1731432664935;
        Tue, 12 Nov 2024 09:31:04 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac2dcebsm608292285a.7.2024.11.12.09.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:31:03 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 Nov 2024 17:30:47 +0000
Subject: [PATCH v3 4/8] Revert "media: uvcvideo: Allow entity-defined
 get_info and get_cur"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-uvc-subdev-v3-4-0ea573d41a18@chromium.org>
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
In-Reply-To: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

With the privacy gpio now handled as a evdev, there is no more need
for this.

This reverts commit 65900c581d014499f0f8ceabfc02c652e9a88771.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 20 +++++---------------
 drivers/media/usb/uvc/uvcvideo.h |  5 -----
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b98f4778d8aa..90bc2132d8d5 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1087,15 +1087,9 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 		return 0;
 	}
 
-	if (ctrl->entity->get_cur)
-		ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
-					    ctrl->info.selector, data,
-					    ctrl->info.size);
-	else
-		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
-				     ctrl->entity->id, chain->dev->intfnum,
-				     ctrl->info.selector, data,
-				     ctrl->info.size);
+	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector, data,
+			     ctrl->info.size);
 
 	if (ret < 0)
 		return ret;
@@ -2055,12 +2049,8 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
 	if (data == NULL)
 		return -ENOMEM;
 
-	if (ctrl->entity->get_info)
-		ret = ctrl->entity->get_info(dev, ctrl->entity,
-					     ctrl->info.selector, data);
-	else
-		ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
-				     dev->intfnum, info->selector, data, 1);
+	ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id, dev->intfnum,
+			     info->selector, data, 1);
 
 	if (!ret) {
 		info->flags &= ~(UVC_CTRL_FLAG_GET_CUR |
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 06c4d514d02c..6002f1c43b69 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -240,11 +240,6 @@ struct uvc_entity {
 	u8 bNrInPins;
 	u8 *baSourceID;
 
-	int (*get_info)(struct uvc_device *dev, struct uvc_entity *entity,
-			u8 cs, u8 *caps);
-	int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
-		       u8 cs, void *data, u16 size);
-
 	unsigned int ncontrols;
 	struct uvc_control *controls;
 };

-- 
2.47.0.277.g8800431eea-goog


