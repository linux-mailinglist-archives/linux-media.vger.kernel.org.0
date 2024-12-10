Return-Path: <linux-media+bounces-22989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D609EAC06
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B19C0188190A
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86BB78F3E;
	Tue, 10 Dec 2024 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SxTnZMvX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB443DABF9
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822935; cv=none; b=Kd/0oA8S7w2VQVaVBrgGXGUBvHB3/KSat3X2D0BT8xJFDGU7T9mf1xNWZmQvn1X9p72JSVGgCbguuhLQsFXb82MDK/v18W0Rfxp+Xtgl38F13QSfOcZVkU/hnrGN9Cfdpx5ekcZDMA2JX6WMlvaG5MzfGdmsePtZ8ickRWbeq/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822935; c=relaxed/simple;
	bh=n8ESl2FNmzgV2J4Gu+GXBLuTnzpMfyubm8vIAlksLz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/mXmCE+l/hYoYrcNNIEoCNhBoRqJd3tJxWR7o25RuxMtsY0+nmBsyGQBWCI7zk6iPyYjcODYkvsI+xi++A/Ysg0v7Bj7I4Wv17xzEdGWufRh5pPUtK4HUU9AkLdqPc7N6BzdeN2GnyjqtkZd5VNDCeFpYZPU5ED8ALGinynh0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SxTnZMvX; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4676aad83d3so15005691cf.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822932; x=1734427732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42cU5HndT5BBlsrtO6ikMSsiagZ6GECUgrygXPNYYzM=;
        b=SxTnZMvX8xgruBlCJAHo3R2iSJR/rFt8/xdCpRfr+4ZkBk+0Kcnue6wVp2QgSuTZPt
         g0Oal51JT0Wp/sQdsqLjPsikgq1gTy/GrYx9/KnhGR6A21o5+cGUWlhKwYnGv1/PObbU
         DbKVgP77kLZ7d89iJjCSR79N7MgLET26Zqd6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822932; x=1734427732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42cU5HndT5BBlsrtO6ikMSsiagZ6GECUgrygXPNYYzM=;
        b=XIOEjgDMPKUm6Pd0plEwsT7txVtBss6+DNzfF3u6YAydJ0YmJNxAG0ExDQkN0V8jOh
         Db870wyRcln5twHws90CJKZoxZIXYPjmj0y63/7n8dDppCpfr/eD6PQUqtm+59y59Q13
         wPqLcKdl45IPJD9yw+8Y5YlhwLvuF8H3IwDlaUlnyGODqCjzf8WT4Wh3wP3lppTEwJDc
         ZDLShJnekCymhQalw/OhzmlosR7J+jLpcWjzBxdyvkcFjNYrHLv64ib0MGd/YsQi8SMi
         NF6qndK4bEQCZdzMnthl3o+ANwcLIEuKGwnrVTPf1fEom6yKHXQ5JtVuKvb4LvuHsAhi
         ee4w==
X-Gm-Message-State: AOJu0YzqgwV+AgRlFS4y4CWiZXXtPHrrzAsQf6BimqI6ruRQaLDpboOn
	1wdzw4rRUQRuVNc2MqCi391Ozupt8pU0b+M7gLEqloBG3pZVa3PwSME2/wbNug==
X-Gm-Gg: ASbGnctRpGO1BbnVvsYY+t6LVcMhSqZmwPJCVW0i6u44ttz0ZOvJz+3sIEZav7sI1zl
	lb3JBMK4u6DYMyiU9vweuOUQmkqYitEO8gpmll31tx3b5YeFn/UKKUmcG4g2zO8hRrH9kPZe4zc
	2V25MZBBqHdzhxG8Qjd+H6iOc27mSOpXzD1y4gbAEBBZDwH6d8qjZ1yiPTuunBllKHBH+rgng1Z
	lQtbg16T3abV8ym7ocy7u9DGocWIpOHQJ5wkUVJIOGB9PgMTFP5+DI/F2u0nYWq2YxjB5XbQtJG
	9ysY7bf6u03TexQVHNs0WlEcizfu
X-Google-Smtp-Source: AGHT+IEnoOn63V/B5cYU2djMibYmXdFhIdrVCbSMu3sxT5u6BPOOJNCg12HGpwhTcUzr8+E2oUFdNA==
X-Received: by 2002:ac8:59c5:0:b0:467:5e71:73f5 with SMTP id d75a77b69052e-46771ff47cbmr61831041cf.34.1733822932248;
        Tue, 10 Dec 2024 01:28:52 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:51 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:46 +0000
Subject: [PATCH v2 02/11] media: pvrusb2: Convert queryctrl to
 query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-2-c0a33d69f416@chromium.org>
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

The driver was missing support for query_ext_ctrl. Instead of adding a
new callback for it, replace the current implementation of queryctrl and
let the ioctl framework emulate the old function.

Most of the fields are identical, so the change is pretty simple.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index d608b793fa84..7c8be6a0cf7c 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -497,8 +497,8 @@ static int pvr2_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 	return pvr2_hdw_set_streaming(hdw, 0);
 }
 
-static int pvr2_queryctrl(struct file *file, void *priv,
-		struct v4l2_queryctrl *vc)
+static int pvr2_query_ext_ctrl(struct file *file, void *priv,
+			       struct v4l2_query_ext_ctrl *vc)
 {
 	struct pvr2_v4l2_fh *fh = file->private_data;
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -521,13 +521,16 @@ static int pvr2_queryctrl(struct file *file, void *priv,
 	}
 
 	pvr2_trace(PVR2_TRACE_V4LIOCTL,
-			"QUERYCTRL id=0x%x mapping name=%s (%s)",
+			"QUERYEXTCTRL id=0x%x mapping name=%s (%s)",
 			vc->id, pvr2_ctrl_get_name(cptr),
 			pvr2_ctrl_get_desc(cptr));
 	strscpy(vc->name, pvr2_ctrl_get_desc(cptr), sizeof(vc->name));
 	vc->flags = pvr2_ctrl_get_v4lflags(cptr);
 	pvr2_ctrl_get_def(cptr, &val);
 	vc->default_value = val;
+	vc->nr_of_dims = 0;
+	vc->elems = 1;
+	vc->elem_size = 4;
 	switch (pvr2_ctrl_get_type(cptr)) {
 	case pvr2_ctl_enum:
 		vc->type = V4L2_CTRL_TYPE_MENU;
@@ -549,7 +552,7 @@ static int pvr2_queryctrl(struct file *file, void *priv,
 		break;
 	default:
 		pvr2_trace(PVR2_TRACE_V4LIOCTL,
-				"QUERYCTRL id=0x%x name=%s not mappable",
+				"QUERYEXTCTRL id=0x%x name=%s not mappable",
 				vc->id, pvr2_ctrl_get_name(cptr));
 		return -EINVAL;
 	}
@@ -812,7 +815,7 @@ static const struct v4l2_ioctl_ops pvr2_ioctl_ops = {
 	.vidioc_try_fmt_vid_cap		    = pvr2_try_fmt_vid_cap,
 	.vidioc_streamon		    = pvr2_streamon,
 	.vidioc_streamoff		    = pvr2_streamoff,
-	.vidioc_queryctrl		    = pvr2_queryctrl,
+	.vidioc_query_ext_ctrl		    = pvr2_query_ext_ctrl,
 	.vidioc_querymenu		    = pvr2_querymenu,
 	.vidioc_g_ctrl			    = pvr2_g_ctrl,
 	.vidioc_s_ctrl			    = pvr2_s_ctrl,

-- 
2.47.0.338.g60cca15819-goog


