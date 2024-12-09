Return-Path: <linux-media+bounces-22957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 203179E9F77
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65F37282190
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C66B19924E;
	Mon,  9 Dec 2024 19:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VCwtBMaI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048E157A6B
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772339; cv=none; b=tUfY3A4USSGlBEyNCCc3kcJe+mUILvr3MfEGTgljiNcrK2AZKGMCQc+kJx1Mo8Sm254Ae6XGaTjDM6da1KNk9dzw2WaTneoB38tb42J4uMl65u98tLxez/ZssPKHAtj5FnrJsvCU0aaQWgt34HMu1Ea3VGqtjBr9mqnfP61n0EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772339; c=relaxed/simple;
	bh=n8ESl2FNmzgV2J4Gu+GXBLuTnzpMfyubm8vIAlksLz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBbTC7+RfIzjCX27UfB6Gd/ZouEYUdlliWZLkaoXVc0+CqMvQIT8l6Up8GGwSLKzvzfxpsjX+LHwyVFeecylhuKtk06wQRp6dACTHH2S74ogG8Zh0KDfjH/WJaw1g5i70qWTC+MzseCP4wi5H8X2sAvxwjH39VRoHQD25jnLeYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VCwtBMaI; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6da2d7884so61624185a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772336; x=1734377136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42cU5HndT5BBlsrtO6ikMSsiagZ6GECUgrygXPNYYzM=;
        b=VCwtBMaIEtcZLSJ5GhjTDwfRKvtrAASRUt7liqs5t+EgdA94NFfjpxx6RxICVoXAyA
         LUWmM+XpJu0S1EMNT2pUI1FoUoZxmm+8Atlvz1EgJYCPCp19CgBo4iWXQU1LTVZ1K6xw
         xqu7T38ksx5lObjlDtodsuttPf9hhHMwVWixw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772336; x=1734377136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42cU5HndT5BBlsrtO6ikMSsiagZ6GECUgrygXPNYYzM=;
        b=bAo7Ql3obKmpvuQFhChNUS8w5quvoTwvprAkCn08RMf02+eUx2dSEr7xpyaMkHg9if
         XGYixyiiTcxPcHF4QyrZPfRxrtaebXJcm7vdumTnFmh8f1lLO2LNrTpnxMrinZV8mbVP
         I2hpRES0IPEdRG8Y7FbMdZlTXmEz/ExhD9FmDxN+jwvWukodih/7dhjWLUlz+dngfGM/
         t9+4kDtcmPF+zs4D50VLcS3G9zhlw0YxrmXzK+5yuD3syv/u0CA8x08TvDfkC5NH00U1
         VbDsJoyzBn0fjwm5Z9xCfQgGP4Gbm46dhb+MZ7KDFlkt/63nJ19fYNXzTPv1MLBRtKrF
         /l7w==
X-Gm-Message-State: AOJu0YyyeRchlq4mmWJ0xr7vf+TKk8b0pmj8Tnt6aphUfBlrBkbIvPsJ
	zWA2DEu75/JxypAQAne6MWxW/zGhc2UXRBB1g38fin4KYgBIECZ5G1Mjn+a+8g==
X-Gm-Gg: ASbGnct1rKY1g+aDb3nNp/cv14amK1wPGZ1XSagoUHq+jSKCvjaKmRmfOVPfkZ2/uC0
	xpSgAX3nKhoefuxmMBm0Yx7anxxA0lUrhcdbLqpjMzQzNW36cpLPuJLJfpxU5esyOQjvmlrnGDs
	cs5VPv9JGRt62C871pCRmF4f4l8W9HKOsL45uGmQCQNpxIoBrfZIFJiesl2u1cgOKTB6mDVS8e0
	boVcT0U9AR9Q8V3JbI3rKlhLgUs/5Tul7jObbswROGfgUQVYVPgYokyOJa58MjbbgWnY+dB620b
	ykWg5bMV3F5HkXGFJQhtmOBJ
X-Google-Smtp-Source: AGHT+IEy6l30xGUpPrtDhWxzqtb+SOk5CYgv2g/6hAF9Khw34+20F7wqboI2TcspSBsyb30HCeEv+A==
X-Received: by 2002:a05:620a:261d:b0:7b6:cbe5:4072 with SMTP id af79cd13be357-7b6dcee4214mr257887485a.61.1733772336321;
        Mon, 09 Dec 2024 11:25:36 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:35 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:33 +0000
Subject: [PATCH 02/10] media: pvrusb2: Convert queryctrl to query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-2-deff7acfcdcb@chromium.org>
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


