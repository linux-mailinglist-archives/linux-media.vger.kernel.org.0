Return-Path: <linux-media+bounces-3052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7913481F65C
	for <lists+linux-media@lfdr.de>; Thu, 28 Dec 2023 10:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363F9283BD3
	for <lists+linux-media@lfdr.de>; Thu, 28 Dec 2023 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CA26ABC;
	Thu, 28 Dec 2023 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HGtaXCTW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AE263A8
	for <linux-media@vger.kernel.org>; Thu, 28 Dec 2023 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bbc7746812so922507b6e.2
        for <linux-media@vger.kernel.org>; Thu, 28 Dec 2023 01:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703756388; x=1704361188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cE0PHPIX9V+Td6mS/CWtPhPTpSAbOD3GNR/J2y9uxsE=;
        b=HGtaXCTWSc5xmYeGmFWcNgiFhRBXHHeg4yGCp0vs0GOy4mpHthhwmQ7ejvF3FBs3+r
         UDEnutDOzcUCoytdQtiTg1EsQmjM7+AT9Ti4HPreWU/UIe1cdmmNtiHkBUoa/GE7kIlK
         fZtczkp3dDgOm0KScLJspmINHrYqVYpV49ykE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703756388; x=1704361188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE0PHPIX9V+Td6mS/CWtPhPTpSAbOD3GNR/J2y9uxsE=;
        b=XVZempfW56RnarRXiCFBRExYkEGvPe2HaqbgjZsp8ssoQ9r8hK75NWG0YB7hO0Z3dG
         K7WPR6qyVNrqO2fEU8niVH+eY2dRuibUdxhMhuh/LwoT0sXHdI7qnXyxK8yoKmcY8vTj
         Gpujx4wYA0n9VNBt+RT1bdPYV9t2c7LTEynVkljwwy/1TDwZerkJ5sxu1dm+Z6CzgeOi
         NuI5ZjPbJhh1ch8VWk0fR6RFqR1f0rVg5V0C74DSOETFxNXDZT+V63cxCW1QQdGy5sko
         itctAVh4+HcnDdx8o4VcO663mY0d+ZVfNbSkMcqJdKfH7s6fjmWishPHt3tE/gbn2EVJ
         goJw==
X-Gm-Message-State: AOJu0Yxpx6OtYB5Zd9SC4aNVdUFxm1VeScnatfgSJRMlQBIl6qRMPrYQ
	0FYYKhfMEYbp5fk+Bb3zN/dcnCOPzXkb
X-Google-Smtp-Source: AGHT+IGbTuminLgcOnQUlBuq/CiKyVma7NOCX/U/Njm22uBcvNNUExq8KzkUlA1MXS1N922Upoikog==
X-Received: by 2002:a05:6358:340f:b0:174:dc11:4827 with SMTP id h15-20020a056358340f00b00174dc114827mr5349757rwd.51.1703756388166;
        Thu, 28 Dec 2023 01:39:48 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5411:cc6a:8ad4:c73c])
        by smtp.gmail.com with ESMTPSA id rs16-20020a17090b2b9000b00286da7407f2sm17910570pjb.7.2023.12.28.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 01:39:47 -0800 (PST)
From: Hidenori Kobayashi <hidenorik@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hidenori Kobayashi <hidenorik@chromium.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: ipu3-imgu: Set fields before media_entity_pads_init()
Date: Thu, 28 Dec 2023 18:39:25 +0900
Message-ID: <20231228093926.748001-1-hidenorik@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pad's flags is checked in media_entity_pads_init(), so it has to be
initialized beforehand. The ops initialization is also moved together
for readability.

Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index a66f034380c0..3df58eb3e882 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1069,6 +1069,11 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
 	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
 
 	/* Initialize subdev media entity */
+	imgu_sd->subdev.entity.ops = &imgu_media_ops;
+	for (i = 0; i < IMGU_NODE_NUM; i++) {
+		imgu_sd->subdev_pads[i].flags = imgu_pipe->nodes[i].output ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+	}
 	r = media_entity_pads_init(&imgu_sd->subdev.entity, IMGU_NODE_NUM,
 				   imgu_sd->subdev_pads);
 	if (r) {
@@ -1076,11 +1081,6 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
 			"failed initialize subdev media entity (%d)\n", r);
 		return r;
 	}
-	imgu_sd->subdev.entity.ops = &imgu_media_ops;
-	for (i = 0; i < IMGU_NODE_NUM; i++) {
-		imgu_sd->subdev_pads[i].flags = imgu_pipe->nodes[i].output ?
-			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
-	}
 
 	/* Initialize subdev */
 	v4l2_subdev_init(&imgu_sd->subdev, &imgu_subdev_ops);
@@ -1177,15 +1177,15 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 	}
 
 	/* Initialize media entities */
+	node->vdev_pad.flags = node->output ?
+		MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+	vdev->entity.ops = NULL;
 	r = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
 	if (r) {
 		dev_err(dev, "failed initialize media entity (%d)\n", r);
 		mutex_destroy(&node->lock);
 		return r;
 	}
-	node->vdev_pad.flags = node->output ?
-		MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
-	vdev->entity.ops = NULL;
 
 	/* Initialize vbq */
 	vbq->type = node->vdev_fmt.type;
-- 
2.43.0.472.g3155946c3a-goog


