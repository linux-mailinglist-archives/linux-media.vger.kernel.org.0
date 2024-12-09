Return-Path: <linux-media+bounces-22964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908FB9E9F85
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F717282590
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F344319E7E2;
	Mon,  9 Dec 2024 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UGur48/o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616119CC24
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772346; cv=none; b=jXxs3v+UvQaK+fSRWVXEkHcBdAWl+bYa8b1BcOKTCAPIaOcNUsdbTLgBbAdzGQx4deiBETnlsSq+/V3aV7ard7IdGDiqWJ/VtTUriBFAGOPVmxiWwIUru2kyTilkUBteXo1IriU400fF6qPmGO0QJY/SbdQh0xIQMIYhTXyMyew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772346; c=relaxed/simple;
	bh=YVfCDMG+ewVwUxyDDbbSOUAdz+veaEMx7LKaz5GBLvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ro/0i8+TDXjP0mkA4thYagKDaUlPUlzdZzzjTaN1bQIhICh6Sdaj2UpObWJdwrHIWQzm2Ls9JOKrYJ7xOMt/dH+V9PnV+oPVd3BIR7yhn6EvsiqrtS6gdWqPz5CMRaC06m9Tx1Q+08mcegBWBD3Vr/Q3+RHlO44jAfsCjSyjI4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UGur48/o; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6d07c7d84so131705585a.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772343; x=1734377143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2k1H7nZ6EFiaX0ZIjONbwuF9mUJ/0XMhcmQKMZ+rwA=;
        b=UGur48/ozXYn0XUNvTuW8/Z0MIoh8wjLTbHOlPf57pyiN/ifs6VG8YP5cmqNzhhwKL
         8n0kabYc0ADcrqNCo/IpJbyKSpasFP90PxKGRoaVaOieWY8njQsmXEhvoTH55DneoxM9
         ZQRWOoJJokP5fSef33mBXg8o5Qhg4IVuUf4Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772343; x=1734377143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2k1H7nZ6EFiaX0ZIjONbwuF9mUJ/0XMhcmQKMZ+rwA=;
        b=nSizvh0L5RVVD5WR+SPalsX90rd1y+jNJzhnlBF97qX6N/v4qS9K7OqfFHfKG5Hznz
         pNbVW6sExxqJOIq8ZEuPyIG2AKZBeTKXQuWmI3eQXEpP+IITLRFwIc18x8ueVkbnuvpZ
         QE/+dquF1dDLZ/wyPPa/avKyiq16NJMSb0woWzHnTot76b2uNHjmrJIzQ2dzxTJ5v56m
         mkw8nr4295M0ibbkAOKP10c7tpI/liz8453eUFlVmY3+o+4jF5gzcnuHGvXoD6skcj0I
         cujKtaSn+3Gzv65pnMIwR0ld0x/G5XYEafgQ9ypw7HXY06cdxc38ib/8vQYz4k/j+jKK
         HMfA==
X-Gm-Message-State: AOJu0YyveOb5gj2YBMl7C0kGphgPheVSs9k5NUWTQiFCqIaK6vVqoPf4
	KCpZ0t9eNJt8VqyVLlq26UUhhDPU4+b+Dc644VsmFZrXGxUVYooNm+Z5iJwr+g==
X-Gm-Gg: ASbGncvWYribwMrzWE8vduVCvbmwFNo96xa5cTe7rp/+s8UmrDQzaB3RYgz80PbiXwr
	xrvZE0WeXhU/NK/Ff3rliGBCtmzJ3E9d1L3EySPiUySdUY09LBeaNlQgU5jMxc7LdbQ4oOVFUQt
	vyAaQlu/QM9o65QYeGKYy9GrFVFWhRZzpelk3d0YfUCpZI1V6uIZf+jjuaU3xIk+vupbLrOL4Nv
	3iuf/wUgvga1PqSGH99nrcdExs5gGfFn0t5MAKaEvkbQuBJBAyXkm5u+bcm7wTkv9fRVd1jm7fe
	oe4fzTihYSvnYJ1ePiKj/OfY
X-Google-Smtp-Source: AGHT+IEEiNvdKrQR0ZlgT/dI9fWuGcmjgZ2kgyinLriV9vaeViM47DQlUbu8twZBqoLXdUvISKJmXQ==
X-Received: by 2002:a05:620a:1918:b0:7b1:48ff:6b3c with SMTP id af79cd13be357-7b6dcdfe7c9mr246350985a.16.1733772342811;
        Mon, 09 Dec 2024 11:25:42 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:40 +0000
Subject: [PATCH 09/10] media: cx231xx: Replace s_ctrl with s_ext_ctrls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-9-deff7acfcdcb@chromium.org>
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
In-Reply-To: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
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


