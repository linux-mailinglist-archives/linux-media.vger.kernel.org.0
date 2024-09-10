Return-Path: <linux-media+bounces-18125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DE3974145
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 726E5286B86
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA5B1AAE11;
	Tue, 10 Sep 2024 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ns034Poe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB571A76CC;
	Tue, 10 Sep 2024 17:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990869; cv=none; b=ZPaXIWRgZnPH/cpFDMVlnQMV+vI3VQikTcLqL8Eqlo6NvQvXszDeUPJiNIptI3zQbu1YrLYOS8FhbLirjCvBsTvkNCau3EHAbtZ1YZumQ0GPQlnVkPUBrR1wbswkZDkqgYoPxqAm4xyqXdm7r6PcCC0+ivuEwRIpKJeLnJBMBPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990869; c=relaxed/simple;
	bh=fysTbBluWwxIoblGwfgowX2kfVUVH1+43tNJySTN42s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ezohTmA/o2l9RZuE1VwaQSCg9mqm/bMZMhoVOjUnaTnhRyozqS05Pb6e2KnKugSZy1jdLZH72pA34V1Bq3fq3DPy2o0pXM8EUREX+lTLjik46kN02zzr4+3z5SXJtjYzSM/DlOvddCMuDLcXW5YNFPF6ZMb24KVPy/DwaKdo+2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ns034Poe; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-536584f6c84so5961227e87.0;
        Tue, 10 Sep 2024 10:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990866; x=1726595666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9js1uW4BriZI3v7lrk19RwKKXrIt1Jzw13AJ+bvanI=;
        b=ns034Poe+6cLqFpJUuszAK1qF57u9N77P1kETCrFP3iJrLgK7YfexbM7HYVLfEhhva
         sBGMIgXM7fF0IF2unNSLC+DxaQ8R+te6uIelAC6nS4ehUXfHtFNODKv9k11ECtUU5bJ9
         thk/z94h5fFXpls13gLJqzyeda+0DonkBbD1BNQrHbI3z+HqrJeEvfabUeyAUzSKsD85
         hAA6fU+d2NQ3AvS7W/GIJSZI0RFgtFyhn3EznwpecElaayuhjZ25bM7mWbaF7Jt2IvDJ
         421OlpMrS0wiUnyVlMgg0+gcvNNP3c0II43Ucovpn7u2sV0w8BvFUW+lF49jbcKzo2+7
         mGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990866; x=1726595666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9js1uW4BriZI3v7lrk19RwKKXrIt1Jzw13AJ+bvanI=;
        b=QCWimwi5StmsSqmWQp8of+U9fN0bWrrJACp5ILa7jE57N1XYUoR6MP5gVDTzutJ/0I
         AW0vettvxO7l2WR5erncsdcHOZt090E8be7RbQFTmjDGv/nQfpoqcUo2BOTr3xMLxikp
         +zZ9w2xo8rIM6Vitk81uHCSTpMp3i0lufuJ9jWn235kxc+GY1ONz0/aHGMk1HAErxFgK
         1r5goVxPMDvsphXy5dxNxPDzli0sMO0y3LE0rznajnwUWGLPfmnC6NbPjeXb/SY3J27J
         JQFksn8Xk3wZcrpTp4agwquoFzRd0mFpZLmMkmCGvv+7wYqZqiJKNysYamgbN9PA3Jhp
         HWrw==
X-Forwarded-Encrypted: i=1; AJvYcCVXDAeLqwAT7wY3lHN3R631PZGgLiKTpH9sTUKqHKfWSV/xxMwVKUUarQkbE3OZnSW0FJyNv4MOVtdcRcc=@vger.kernel.org, AJvYcCW/9lg2eQfFfcfcclExSZkKjjOCyDTw1xoWydDRhjBnjLrNtlxFd0zGAyHdleuHJnRTuZpsvroCL81aFgzj/leaKhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH2T4r4yjjBk/Jh4k+VuP3E7kfSwV87fbLBLJTxw6KLV5T8JMk
	0ThETjnL6tE4w3o1EaiWYWFuRKknaPwSCsNJlaY2w2VsusGg8rfeTetBqg==
X-Google-Smtp-Source: AGHT+IEREf+WU0yRXHL06gqx8AE/VmaRJSZnjgkdg3Xqu0e2wgQkC0P/XTJozFs7x2cnhljfKgQuuw==
X-Received: by 2002:a05:6512:2388:b0:536:55ef:69e8 with SMTP id 2adb3069b0e04-5365856ca37mr10504076e87.0.1725990866291;
        Tue, 10 Sep 2024 10:54:26 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 07/16] media: platform: rzg2l-cru: Remove `channel` member from `struct rzg2l_cru_csi`
Date: Tue, 10 Sep 2024 18:53:48 +0100
Message-Id: <20240910175357.229075-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the CSI virtual channel number from `struct rzg2l_cru_csi`.
Instead, pass the CSI virtual channel number as an argument to
`rzg2l_cru_csi2_setup()`.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 69cd45b26951..b21a66e2ce5c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -72,7 +72,6 @@ static int rzg2l_cru_group_notify_complete(struct v4l2_async_notifier *notifier)
 			source->name, sink->name);
 		return ret;
 	}
-	cru->csi.channel = 0;
 	cru->ip.remote = cru->csi.subdev;
 
 	/* Create media device link between CRU IP <-> CRU OUTPUT */
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 8fbd45c43763..4fe24bdde5b2 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -53,7 +53,6 @@ enum rzg2l_cru_dma_state {
 struct rzg2l_cru_csi {
 	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
-	u32 channel;
 };
 
 struct rzg2l_cru_ip {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 7cd33eb1939c..9ab7ef33c9da 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -301,7 +301,7 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 }
 
 static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
-				 struct v4l2_mbus_framefmt *ip_sd_fmt)
+				 struct v4l2_mbus_framefmt *ip_sd_fmt, u8 csi_vc)
 {
 	u32 icnmc;
 
@@ -319,19 +319,20 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
 	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
 
 	/* Set virtual channel CSI2 */
-	icnmc |= ICnMC_VCSEL(cru->csi.channel);
+	icnmc |= ICnMC_VCSEL(csi_vc);
 
 	rzg2l_cru_write(cru, ICnMC, icnmc);
 }
 
 static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
-					   struct v4l2_mbus_framefmt *ip_sd_fmt)
+					   struct v4l2_mbus_framefmt *ip_sd_fmt,
+					   u8 csi_vc)
 {
 	bool output_is_yuv = false;
 	bool input_is_yuv = false;
 	u32 icndmr;
 
-	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt);
+	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt, csi_vc);
 
 	/* Output format */
 	switch (cru->format.pixelformat) {
@@ -466,12 +467,13 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
 	unsigned long flags;
+	u8 csi_vc;
 	int ret;
 
 	ret = rzg2l_cru_get_virtual_channel(cru);
 	if (ret < 0)
 		return ret;
-	cru->csi.channel = ret;
+	csi_vc = ret;
 
 	spin_lock_irqsave(&cru->qlock, flags);
 
@@ -489,7 +491,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_initialize_axi(cru);
 
 	/* Initialize image convert */
-	ret = rzg2l_cru_initialize_image_conv(cru, fmt);
+	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
 	if (ret) {
 		spin_unlock_irqrestore(&cru->qlock, flags);
 		return ret;
-- 
2.34.1


