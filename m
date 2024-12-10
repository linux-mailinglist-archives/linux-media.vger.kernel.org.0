Return-Path: <linux-media+bounces-22988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 954499EAC01
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D690D165741
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8443DAC00;
	Tue, 10 Dec 2024 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iGAU9YjD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C4423875F
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822933; cv=none; b=Q3tOCCbIik5UyY99rOwiejmM8EzR1Ue4GD/Dtc8IWyS6REQCPoxNmt5kuGEu7fp/2C/YpgB6f7R7r1ph56mieBQNPeLmOHUtvKQfLSynaW+M8kzZWug3NOpIvc9vtE3Dc0L0ARbOT9Uf60KfZKfrxEFamJVt0/BsD6dshfjrno8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822933; c=relaxed/simple;
	bh=5tAoo54TU4GQ4hW7pLNn7ok6ge350p6usP0YhXYzePE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVvaYWpZzYBc8TK41zfQG+antZP2kRNE2JFfgSUq8SWJcbU+hXahoe7Dw8wYm+sF+uxIN+BbL1OnTcxF1Umvpc90UjLLFQ5avSZntnbPEeUWIWSiUdc8CXc5+OktF5GpfLCmK/b5MjTVVmntrSg82kyNlSXIJurVlBKV/SuyQ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iGAU9YjD; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46774573043so11639701cf.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822930; x=1734427730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjCxwHlk//pWYcvx6fmU+J931W36lgHNKb5tiH7Iy4s=;
        b=iGAU9YjDnIzXhrbyfzJLjzDnmsRh8lJ5huF7tkIVtqpjn0M7q7m98qPbyOHaHnT9M+
         cXaIIgVffgqFTcxqwaSXwNkntAzMM+Alr8zMW4MZBlWWT8zeIyAMOeSEWkFWLI6uG4Cr
         oO70sgvAUcTTItRfEHqtAJQLWq59K+uPVxOeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822930; x=1734427730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjCxwHlk//pWYcvx6fmU+J931W36lgHNKb5tiH7Iy4s=;
        b=XWHTy3wUUrALhO/25k8dnv8y3s1LzoRV0hn05bKuSD1coOXEcVriSNl/szUyMBl1aC
         k1wskGzx9BkA/qzCxKBCKvtq3R5lLzYdm33UeCtL6MoiPhLY+G5W0xSzKJo3z3JsdAZP
         jcYhHkwrJBLkTO6/1E+bi145TpmKc3z7INcJhKHXbIUk7MD9JHKuaRZL0Tt8WBFtRr/D
         +5Cb7Q/BGbkZhyPrPxsUaNddjIny4dCH36qctW+iaHOEGiPoa6aks1KVLQI8M5FEA6ha
         UjfoSLLEh7ZVGf0eQN90W60uu4wuKuMe2T+QlM+JXzu9/2cfc/g+GXWKxN7fuKrOuRNi
         vNxA==
X-Gm-Message-State: AOJu0YwwbVEONl9unQporFHQWBbT0tgKvDtYdB+mGoMb3s8Now2HrgR9
	Oa8Toc/OV9pcyz1kWXS+wsxrjSGAAodMiTf3Gqoqfc3/CuTNlt66mMlft9kC8Q==
X-Gm-Gg: ASbGncv0tv5YBqDAoADiKqbkNCGQTp4ZxfBdFVxzndOmkHlOYjQgTOwvjQ1kk/qzRmJ
	Tps0/rkliSfO9tG48JZcjNO97JF9b6+dJmyIbLJN0kl8aheK6b4160gXQtPUJlE0OqPNOY61MeQ
	n7Uxi+7wz9WILFYU6pNFHBBCvwsNsxhC7gjg1hE8wYYYVW1LBk0+Ho8gc5bgQ7tmigLOtODuUio
	d+NtfT7WR+/1N0chG2M390G9SKyQeiVoMRkTH+3l1Lm8yMBtfqs5zgfSw9Te7na1rWETRp3H3EJ
	Y12+sOlhV37Rtn2cMBrZZxkahCFP
X-Google-Smtp-Source: AGHT+IHlEaOPjN93sA8cjSBRqg2/WMxOoAfLZHozJqTzhAKHeUhuWeLsI2/xEgcPjttaJynBP3QLKg==
X-Received: by 2002:ac8:59c5:0:b0:466:a06f:ae0a with SMTP id d75a77b69052e-46771f5b0bamr69413111cf.32.1733822930286;
        Tue, 10 Dec 2024 01:28:50 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:49 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:45 +0000
Subject: [PATCH v2 01/11] media: ioctl: Simulate v4l2_queryctrl with
 v4l2_query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-1-c0a33d69f416@chromium.org>
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

v4l2_queryctrl is a subset of v4l2_query_ext_ctrl. If the driver does
not implement v4l2_queryctrl we can implement it with
v4l2_query_ext_ctrl.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   |  3 ++-
 drivers/media/v4l2-core/v4l2-ioctl.c | 37 +++++++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5bcaeeba4d09..252308a67fa8 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -572,7 +572,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	   and that can't be tested here. If the bit for these control ioctls
 	   is set, then the ioctl is valid. But if it is 0, then it can still
 	   be valid if the filehandle passed the control handler. */
-	if (vdev->ctrl_handler || ops->vidioc_queryctrl)
+	if (vdev->ctrl_handler || ops->vidioc_queryctrl ||
+	    ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..7d615ebc511e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2284,9 +2284,11 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
+	struct v4l2_query_ext_ctrl qec;
 	struct v4l2_queryctrl *p = arg;
 	struct v4l2_fh *vfh =
 		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	int ret;
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_queryctrl(vfh->ctrl_handler, p);
@@ -2294,7 +2296,40 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 		return v4l2_queryctrl(vfd->ctrl_handler, p);
 	if (ops->vidioc_queryctrl)
 		return ops->vidioc_queryctrl(file, fh, p);
-	return -ENOTTY;
+	if (!ops->vidioc_query_ext_ctrl)
+		return -ENOTTY;
+
+	/* Simulate query_ext_ctr using query_ctrl. */
+	qec.id = p->id;
+	ret = ops->vidioc_query_ext_ctrl(file, fh, &qec);
+	if (ret)
+		return ret;
+
+	p->id = qec.id;
+	p->type = qec.type;
+	p->flags = qec.flags;
+	strscpy(p->name, qec.name, sizeof(p->name));
+	switch (p->type) {
+	case V4L2_CTRL_TYPE_INTEGER:
+	case V4L2_CTRL_TYPE_BOOLEAN:
+	case V4L2_CTRL_TYPE_MENU:
+	case V4L2_CTRL_TYPE_INTEGER_MENU:
+	case V4L2_CTRL_TYPE_STRING:
+	case V4L2_CTRL_TYPE_BITMASK:
+		p->minimum = qec.minimum;
+		p->maximum = qec.maximum;
+		p->step = qec.step;
+		p->default_value = qec.default_value;
+		break;
+	default:
+		p->minimum = 0;
+		p->maximum = 0;
+		p->step = 0;
+		p->default_value = 0;
+		break;
+	}
+
+	return 0;
 }
 
 static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,

-- 
2.47.0.338.g60cca15819-goog


