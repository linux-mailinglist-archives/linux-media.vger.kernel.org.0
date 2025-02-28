Return-Path: <linux-media+bounces-27234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E0A49A3D
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 14:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E37CB7A4D11
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 13:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CEF26BDA8;
	Fri, 28 Feb 2025 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YFsaHaZw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA1626B2D7
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740748125; cv=none; b=Fav8EdNpwxxIJIdViymEMLwyuuU7R29MKm7IC+SxRxJ0Cm55W/v5R/ojL1dNzAlUFiWW47v6FTPdCQhhbxph6k8tYAtmYppmml/aeF/NKMdMs4t2Cb9YRfr7o48OQ88Vx4P2NnVbTiQfJJZj8Y9Wqs42ZTgWnEJcb2MEh9S+h9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740748125; c=relaxed/simple;
	bh=jVfySmtCKc+rDgzWs0d1iuV0e5AynR7YjDkBSBs9NGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XimH9KWlSH0K9mRHhsxPqM4RKs59dFDFDUEl2J6o13j+pZ/bNR0/ThAMKfJALIHFjJQcujjAxxeL00WgS2oFEV+L1jyB6XwwOVxHv7Yz+AEvYPcBBgbusX7hOHSoyIsdMY7LW27GjeeJMC6LC7zXFZTiCI9QxR7L8L954DpdncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YFsaHaZw; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e88f3159e3so17204946d6.2
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 05:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740748122; x=1741352922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wu47y/gfGsHXETXnfAoCaDWBGszfC1szAfoQtY44QlE=;
        b=YFsaHaZwAS7/RSOvekzrehdKITfXj39H8qQLLq0o+DHWrVmlpe8Zq+RdcihRh/1zdQ
         jakjJKcDz5X89wVAvVhUCan5ov6Csa6JR/2ucF4b4cdYwpLCQ9EQl2YgesHjwSINHKzo
         CfhtABdnGR4j826PPhPE6UlhL6FBmco7wiT24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740748122; x=1741352922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wu47y/gfGsHXETXnfAoCaDWBGszfC1szAfoQtY44QlE=;
        b=cVpWKUikHEm9cJzQVrn417DLiCOvC34FCrC/C1Q+APPHQ+RMeWu6NTiU3oPu/05KIW
         y0BOKek7YJschyez9clvzjRZgGo+7lobS0GkQ6eRU6um3MAXjv90/NnmYDw8uwX83As5
         XxYcjCvbNnZMNjSgbELkaUvKqMGB7ztBVwC30NjSoWe7uP1It4h3rQe8pDBS2GdQY3lp
         XfxKASIuZbsaWxaO6jF31W8e1V2EUQGxac7/G5DUnlf8lKPYivOLC92Pz9zSXTnhR30e
         4V928gTvyo6/itnyWDfTuFJe+PeUenSi0oA/QHDCPstqEcpIM+6C00rxIBnLB3C9YPsz
         B93w==
X-Gm-Message-State: AOJu0YwaxyHMTkRMcHvVIRHmp0DLwHgd0JmrQRWfllVHDEUQylJzq3I+
	ITsb0TH4W09pIW424meE8ptipJ4b3ldGvZnhOWQGr8CGjgmE7STr3um08GefUA==
X-Gm-Gg: ASbGncvnT8EItyEqQ/+PDgrEjtMion+etl0YiVZ19pOrb8IroQOffUR0T7zD02Lb9tj
	RYKdKkppssqBXQRlwbchxfvBai5AQAqZQjDVyCEBthRq/PK4r7hQRrPL4r7jwYiu4XdTcbVeXBH
	WmtkDLjaSe6Y9uQOKtXT7lNONmSmoJ8SR3eUSMvMn7XdQI3HrRIRkquBqjcmDEOR5tCKh7wV2kx
	sToMH0HNrVsERqbe0JWVfxsXiS1N7UvMWHVFP8/Zm6OCIlOp6IbSnkOdaZZUFK6SkehRO57mst2
	RS/14uIgsbWkypu2IjtGHUZf13rzs+PgKsBHk+WOLYXvVdiV+WEhDasNPVYhOaHcmBI9IBzCGmS
	KT9M=
X-Google-Smtp-Source: AGHT+IGREZ8d3y7LZ4jLIKH/UvjI1lqtGi9/ApBsqfvwniiJKDUn2mxes6cCfftxvK2FRlPK1865eQ==
X-Received: by 2002:ad4:5c64:0:b0:6e6:6535:17df with SMTP id 6a1803df08f44-6e8a0cd3e3amr54758336d6.2.1740748122614;
        Fri, 28 Feb 2025 05:08:42 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976d9fe1sm21938046d6.102.2025.02.28.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 05:08:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 28 Feb 2025 13:08:38 +0000
Subject: [PATCH 1/2] media: vivid: Move all fb_info references into
 vivid-osd
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-vivid-osd-v1-1-16963a0a0ab7@chromium.org>
References: <20250228-vivid-osd-v1-0-16963a0a0ab7@chromium.org>
In-Reply-To: <20250228-vivid-osd-v1-0-16963a0a0ab7@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Slawomir Rosek <srosek@google.com>, 
 Hidenori Kobayashi <hidenorik@google.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.1

Most references to fb_info are already within vivid-osd.c. This patch
moves the remaining references into vivid-osd.c.

This is a preparation patch to make CONFIG_FB optional for vivid.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 10 ++--------
 drivers/media/test-drivers/vivid/vivid-osd.c  | 13 ++++++++++++-
 drivers/media/test-drivers/vivid/vivid-osd.h  |  2 +-
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 7477ac8cb955..10f5bef3f49c 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1410,8 +1410,6 @@ static int vivid_create_queues(struct vivid_dev *dev)
 		ret = vivid_fb_init(dev);
 		if (ret)
 			return ret;
-		v4l2_info(&dev->v4l2_dev, "Framebuffer device registered as fb%d\n",
-			  dev->fb_info.node);
 	}
 	return 0;
 }
@@ -2197,12 +2195,8 @@ static void vivid_remove(struct platform_device *pdev)
 				video_device_node_name(&dev->radio_tx_dev));
 			video_unregister_device(&dev->radio_tx_dev);
 		}
-		if (dev->has_fb) {
-			v4l2_info(&dev->v4l2_dev, "unregistering fb%d\n",
-				dev->fb_info.node);
-			unregister_framebuffer(&dev->fb_info);
-			vivid_fb_release_buffers(dev);
-		}
+		if (dev->has_fb)
+			vivid_fb_deinit(dev);
 		if (dev->has_meta_cap) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				  video_device_node_name(&dev->meta_cap_dev));
diff --git a/drivers/media/test-drivers/vivid/vivid-osd.c b/drivers/media/test-drivers/vivid/vivid-osd.c
index 5c931b94a7b5..043ffccbc6af 100644
--- a/drivers/media/test-drivers/vivid/vivid-osd.c
+++ b/drivers/media/test-drivers/vivid/vivid-osd.c
@@ -333,7 +333,7 @@ static int vivid_fb_init_vidmode(struct vivid_dev *dev)
 }
 
 /* Release any memory we've grabbed */
-void vivid_fb_release_buffers(struct vivid_dev *dev)
+static void vivid_fb_release_buffers(struct vivid_dev *dev)
 {
 	if (dev->video_vbase == NULL)
 		return;
@@ -380,6 +380,17 @@ int vivid_fb_init(struct vivid_dev *dev)
 
 	/* Set the card to the requested mode */
 	vivid_fb_set_par(&dev->fb_info);
+
+	v4l2_info(&dev->v4l2_dev, "Framebuffer device registered as fb%d\n",
+		  dev->fb_info.node);
+
 	return 0;
 
 }
+
+void vivid_fb_deinit(struct vivid_dev *dev)
+{
+	v4l2_info(&dev->v4l2_dev, "unregistering fb%d\n", dev->fb_info.node);
+	unregister_framebuffer(&dev->fb_info);
+	vivid_fb_release_buffers(dev);
+}
diff --git a/drivers/media/test-drivers/vivid/vivid-osd.h b/drivers/media/test-drivers/vivid/vivid-osd.h
index f9ac1af25dd3..883459552fa9 100644
--- a/drivers/media/test-drivers/vivid/vivid-osd.h
+++ b/drivers/media/test-drivers/vivid/vivid-osd.h
@@ -9,7 +9,7 @@
 #define _VIVID_OSD_H_
 
 int vivid_fb_init(struct vivid_dev *dev);
-void vivid_fb_release_buffers(struct vivid_dev *dev);
+void vivid_fb_deinit(struct vivid_dev *dev);
 void vivid_clear_fb(struct vivid_dev *dev);
 
 #endif

-- 
2.48.1.711.g2feabab25a-goog


