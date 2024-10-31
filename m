Return-Path: <linux-media+bounces-20647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E679B7BF7
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 14:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD71FB215DD
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 13:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BA619F119;
	Thu, 31 Oct 2024 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VsGkBYlh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82FF19F41D
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730382204; cv=none; b=QjV5RgAcjUhJ1/bxXxAYNxk7ScwqASo2C46oXX2FxhU8JoTjQA9jSrnayqy5ROncFrnk/8Fist6CDvlchQYxVyq0bHwXkPPAJzOltLcsoEbzcDcOWXOoNRsQf13+OhaDKALMIt0nEAEGvZzkDZBfjgaVIN/FxJ2yxe78Ms2RH+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730382204; c=relaxed/simple;
	bh=r3cKMGuzvlyf7oZXpFVuSyLONf4V4QntadWBkgpHKW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pGhsG+skRWaUsL39WiIjp9kyTA4CLmzQjmZRHDa03ltH0g1VKVj56H4Wz51/KfNrGxk91OHaHrlfit9lZ+N4ebXIC0n8pa+umwz6E59hpw7Z5QbEXRzNSVrYVEMAwX3aE2GaG5fT3cgtfNmgxmuUy+pzvT5XI3Af6sp1cBWLiA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VsGkBYlh; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b175e059bdso62885385a.0
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730382202; x=1730987002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hyFrzunuXID7p8XmCUxXoJYk5Y1+TQzbwxm4l0OgWU=;
        b=VsGkBYlh7Yay80iNsY667lKvYz8v4Rz/pIywqFMfoc7wnpPg1cJyLQyTmJWDJhCDhh
         HphflXg5eN4TeEhK+3WwrQnarFAKQKXaHdgQuvUzN/jahM517JnlcYBNUYJ/lEIljhjn
         tR6EzjaHpdLswNkH+uLLgotPLAn5F4qv5oV7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382202; x=1730987002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hyFrzunuXID7p8XmCUxXoJYk5Y1+TQzbwxm4l0OgWU=;
        b=DNOT8GwVSY+mhHErIEu8WnI2rtZAljS1QvnS05PyV6e2AoJUqmc6VHOCD8YRCGbvwu
         YBTbTfATh6kDVVB5RvwzJiMxSO4oDweM/sIiRFqL+IN1M+M3FvhkMA1WuhUsYDZJFWbI
         pL979dpoC8Wyds9WY2qlCUK2WaXaFiIgr/+FL2MrLC0uGqU/Uh4bN9T+IhAAkCXaU+f9
         XYZhar5f13MzAu6tEkDtpsshUcA4FFuqerRhK3Jb6l8OzoUqCy5vAiznFtEaxbS8vgwY
         um98oXKRFr164AGl8AVe9xrmdcZrqTPdbXQYo3JeeYUpikLsxr5Z01c4rXh6pwmNGVwY
         8o0A==
X-Forwarded-Encrypted: i=1; AJvYcCXb9gAwgdlQ+3tmiSlCPjWadrvNFWUtiZRSu4kWbeh7ahLFboJoMhaIeWdEl4tdQpKbNGJlfY54svHhdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyaXDGc2YnCBZVrr96iYOwL3pPS4WnbuWlhzkQzlgS3p+T0Yd2
	3hHMIqCUPMrjJ8IJDnaqhnmua8CPbM3UyBNcSqkUzUE1L2CvNlKc8lUFe+175Q==
X-Google-Smtp-Source: AGHT+IFQBhegKb92TUDsGHpJ1V5uuBp+Av0If9F1wL4bXo0VO6kBdOYFLyoOZMHLmRmjD+urxE18NA==
X-Received: by 2002:a05:6214:2c07:b0:6cb:ee38:1bf8 with SMTP id 6a1803df08f44-6d1856b1236mr311999496d6.13.1730382201749;
        Thu, 31 Oct 2024 06:43:21 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d354177d2fsm7837776d6.107.2024.10.31.06.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:43:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 31 Oct 2024 13:43:16 +0000
Subject: [PATCH 3/7] Revert "media: uvcvideo: Allow entity-defined get_info
 and get_cur"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-uvc-subdev-v1-3-a68331cedd72@chromium.org>
References: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
In-Reply-To: <20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

With the privacy gpio now handled as a subdevice, there is no more need
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
index 1827f4048f5a..37991d35088c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -243,11 +243,6 @@ struct uvc_entity {
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
2.47.0.163.g1226f6d8fa-goog


