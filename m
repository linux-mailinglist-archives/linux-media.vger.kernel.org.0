Return-Path: <linux-media+bounces-22996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 072609EAC18
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3CBE163302
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB13215772;
	Tue, 10 Dec 2024 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nI3V1Dp7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50AA210F4F
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822946; cv=none; b=eAevMBQB7j2HAp18A6CGcIY9qJQRdNcYfWZ0deAt6WbL+nnTYyxGqOGwF+/rzC1Ru8d0fbCHq5E4sqPqC+54Tsgy/VuHc23/sh38AT4DOAT9V7wfEEQL4CwfYoGc7wiDi0cBFZn3GqdtBBDQiQ2fPQ7fmOiy5Aupjkh8pCZVEp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822946; c=relaxed/simple;
	bh=YVfCDMG+ewVwUxyDDbbSOUAdz+veaEMx7LKaz5GBLvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQZRJTmCl7I8SdtfPxVxqg0BrdW8O1enk+RlV8ZD0mWx0Ncn2aNQ8HBkrZq2ZMelGpNHRv3MbVhF4NCNOv7MvnhoNE68cwawQZsB8tiEbB994NSK8W+/Q2o+D87InHyDfHab2B00KuODXHSqmvzQIxM22Qee8U1PPEYURN1qzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nI3V1Dp7; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46772a0f85bso9246471cf.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822944; x=1734427744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2k1H7nZ6EFiaX0ZIjONbwuF9mUJ/0XMhcmQKMZ+rwA=;
        b=nI3V1Dp7T0hfEQYxkJOLGF3kHpJwE/kPQJq15igQrTvDIaJiCzc5dMhc6RKUrx/NNS
         jHr4dVxFO8rIn8MfxnRRNzWnzomQEK+kpzFdxFHGNH7pKUMDXazoNOfg1dfuOfOHP8mo
         DdrFgR+7bnebnWUPSupBGUfIh+5Xc0ueLdMwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822944; x=1734427744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2k1H7nZ6EFiaX0ZIjONbwuF9mUJ/0XMhcmQKMZ+rwA=;
        b=Cr7rrPf0FXM0Lr1QrLS3NqIDuwdSd2/pslVXyEYl1KXKfl8W/Vd/7xfpRxoF8QdPPy
         UgLlx2GaMF1PMkqwr8m2XmJhiAsfN6xxw1nH14T/X9iTrK4G4OWCQtpM29vtnYV20MTO
         7+6sC0YrMD9ScSnYkAnHsMlEH88zWcf5k3XMjJSKDVyRwOQv0Kg5vSgEn8MVFsJ284Fk
         sTJHkNzUzB3HcXH9YCiUXD1iSfTwmQSt5WYAJCPGftD3/xxaC5qQGEOIuBSLBgvz6Cl3
         Y5qGiaOtvdmIC1LrqfLEfSHM798VEmzu5q2I6HdEkkyOlb7pRP7iEiO71BG0CvjlUAS6
         iFmA==
X-Gm-Message-State: AOJu0YwNwkXIF/bB/dMTy+MkmwUFUwoq++YD7/y2hsmtnljHAQ8dQPpz
	24m2RhYnhtkHD9G6Uqlin+oQC1RK9zAg0yLWiIsR9NxPcQLkBtgHX0vo+v9Rmw==
X-Gm-Gg: ASbGncuBVa8OpabFZRkuAmrxn0lCe7HAMLbdpF++Ll5jAI+pPKc7XaW82opvGmoumJT
	xvDRENF+oDCtam6qJsCuAC5EvgfT9ugoQjQLr1af4aBE6y329mJ6yrkkdw/DtjohX934b7Jts4H
	cnVHlUwdVo+cTYyf+77i1dPmALDxVYxS3Uhf9626waHIa4JjZaeyXHLRlhAmZ58AjHewZO733Zg
	2NKTUE1yLCkH7h3Y1sb+FLcSQhZxJS9xHfw6srM04tAVlKiOnvhdDaPSqd7Sjb/x3YUCBaSp0u2
	CUNgLGxmGpH1UHEH7oCeqBI8kpTh
X-Google-Smtp-Source: AGHT+IEmJjvoC2m9o25B2ktE1e5ZVohikSh/O5M+IBIs1ll7GIWjhNrYVUCYVVrSS3n3G9mzLPzHbQ==
X-Received: by 2002:a05:622a:8e16:b0:467:4efa:c45c with SMTP id d75a77b69052e-4674efac5e3mr148764831cf.29.1733822943719;
        Tue, 10 Dec 2024 01:29:03 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:29:02 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:53 +0000
Subject: [PATCH v2 09/11] media: cx231xx: Replace s_ctrl with s_ext_ctrls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-9-c0a33d69f416@chromium.org>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The v4l2 ioctl framework can provide support for s_ctrl. This the last
driver implementing s_ctrl.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-417.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index a4a9781328c5..3c1941709ebf 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1538,17 +1538,24 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 	return 0;
 }
 
-static int vidioc_s_ctrl(struct file *file, void *priv,
-				struct v4l2_control *ctl)
+static int cx231xx_s_ext_ctrls(struct file *file, void *priv,
+			       struct v4l2_ext_controls *ctls)
 {
 	struct cx231xx *dev = video_drvdata(file);
+	struct v4l2_control ctl;
 	struct v4l2_subdev *sd;
+	unsigned int i;
 
-	dprintk(3, "enter vidioc_s_ctrl()\n");
+	dprintk(3, "enter vidioc_s_ext_ctrl()\n");
 	/* Update the A/V core */
-	v4l2_device_for_each_subdev(sd, &dev->v4l2_dev)
-		v4l2_s_ctrl(NULL, sd->ctrl_handler, ctl);
-	dprintk(3, "exit vidioc_s_ctrl()\n");
+	for (i = 0; i < ctls->count; i++) {
+		ctl.id = ctls->controls[i].id;
+		ctl.value = ctls->controls[i].value;
+		v4l2_device_for_each_subdev(sd, &dev->v4l2_dev)
+			v4l2_s_ctrl(NULL, sd->ctrl_handler, &ctl);
+		ctls->controls[i].value = ctl.value;
+	}
+	dprintk(3, "exit vidioc_s_ext_ctrl()\n");
 	return 0;
 }
 
@@ -1627,7 +1634,7 @@ static const struct v4l2_ioctl_ops mpeg_ioctl_ops = {
 	.vidioc_enum_input	 = cx231xx_enum_input,
 	.vidioc_g_input		 = cx231xx_g_input,
 	.vidioc_s_input		 = cx231xx_s_input,
-	.vidioc_s_ctrl		 = vidioc_s_ctrl,
+	.vidioc_s_ext_ctrls	 = cx231xx_s_ext_ctrls,
 	.vidioc_g_pixelaspect	 = vidioc_g_pixelaspect,
 	.vidioc_g_selection	 = vidioc_g_selection,
 	.vidioc_querycap	 = cx231xx_querycap,

-- 
2.47.0.338.g60cca15819-goog


