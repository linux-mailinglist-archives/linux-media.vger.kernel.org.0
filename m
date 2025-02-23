Return-Path: <linux-media+bounces-26722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A183A4112B
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237D1188D83B
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D84193404;
	Sun, 23 Feb 2025 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y7LuKBfw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D972220C005
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337169; cv=none; b=Xv/Grn6HawSOkmvAq7MN8LSNg6UtfvpVGQjTQQ9LZevl8Kie8thep4uv3iP74mkd3Yjzye5U2iWYWP2SQayKaciPO2rz+fFVFRbeXxPsH16MO1nGym6u4Fpb+ytlmUkD4+ACEdgNvEMFz6D19Etf4clnvcHlyb66lTDWyGcmY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337169; c=relaxed/simple;
	bh=myXjIaGjfoOSk4gWvfNUCnPKOkUfNfQoYFyPFWxU7TM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vd1CipRaah7Kqo3K6hgIBz5w0y/L9xd4H6jHfm3uzytg1gjmvUaVvTb5RESx7YV9Q4ZRf2dvdC6WPW2DikcIQ3Ai+OjtCSjuxMXRNGc7z7+AayLgyNEsuZmtUAk0hdzlgSaFBt3bsFRNJMd1Pa63VDaUMaiyFEOxkTWOagWB5G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y7LuKBfw; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c2303a56d6so22253285a.3
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 10:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337167; x=1740941967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnN0g4zN2JxT7rEykWa86K6e7OYYbd0erUw+cYCyMXw=;
        b=Y7LuKBfwBVse43QirI5wG+6px8nUAsOJqsT8yGvRBpoHvnxwzqtEutU61I8ka55yEB
         iyj+6olqdnwl3hUti4Zrc+pHYs8gQEljgeXIGMdl5zs0q3FCwXwjRld7mxaZMT3ElAhX
         6dPV9CInYQvi4zuyiPvm5/xjaqy/UlrZ58fAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337167; x=1740941967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnN0g4zN2JxT7rEykWa86K6e7OYYbd0erUw+cYCyMXw=;
        b=ksVtM82OsWycCez21xiDdkro5r4hmFc334xLyIzyBrLAwOug9RgYTXUU7pMTc8FaIf
         0L2KTXOjLWE1S2a2ej6ehekgWYoe4kSDm/hw3yqRMtpKK62+teE9vZHGKUU65n7pOzXG
         kgjW6kZev8a81Z8f3OPCz04bRSzYg1kj3q/qbb56lFSLH1GqUhlc4C8oPVWSYVQmOtP1
         EgwW41YGOFcQzoQLltjSuOIFw6pWXjFU7o/IUcADO6hQLRNHacMcBIzUVqCd+vQZFjCv
         PZFu4+zldMdzxHtsPjuSRyCG5mWnXhp/eI1vOW8rpk6R4/MHTTyt9L+LfON1HCVfFe1t
         6wfQ==
X-Gm-Message-State: AOJu0YyxNi15LZ0ewvK4+CHmkpmerICcLiGy3RJn+VSXkm1LBSAuBI0h
	xIvOazWcXXAOK/v0QWYybVQM15eDLNaPUN0tyTWZzlDZbJDUeFi/KpUpo7jW0A==
X-Gm-Gg: ASbGncvjek2rxgku0tE3TqvFfUiJCXZdvVK+AwzxD0zVjokmAouPp+AeiM3LI0zMdw5
	OXkZLXkcRJHSx2YCMWNQd91R/ims9kF12E5kdGuRioDXC3MFcLx99Jy+aSL3MbF5CpRCYyY/N8i
	ZaRnGlbDsOw8pCVnT/ixXgVXyw41RFkz38arunb5KAWoomOg9KOtMRj18Cw6MslNdOhLfpVTPI6
	GP+Ya+OclTCJnT6cjzCGxgfEcHepN/NtMY3l3VcrRj+EXxpV7pvO5s3f+B2JLY/Mzqraoi7B99A
	KuWm9amGPxKVhaQSaaaaqDhzQMBJe4jwNMqngwQtZ7UpFauJIt0NdtdPEU/Skrdg64zaXkNiXPM
	ZrYw=
X-Google-Smtp-Source: AGHT+IG6XQAhoRI9GvPepX/CjaG7nv07d/LfoiHN+LEQpa+mFjWVBGB/SkS22EGTKBolEf1SeYC0Ng==
X-Received: by 2002:a05:620a:1a1c:b0:7c0:c214:f2d with SMTP id af79cd13be357-7c0cf8ea897mr1355134285a.31.1740337166661;
        Sun, 23 Feb 2025 10:59:26 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:25 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:06 +0000
Subject: [PATCH v3 03/12] media: pvrusb2: Remove g/s_ctrl callbacks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-3-4292911cab6b@chromium.org>
References: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
In-Reply-To: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
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

The ioctl helpers can emulate g/s_ctrl with g/s_ext_ctrl. Simplify the
code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 7c8be6a0cf7c..ad38e1240541 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -574,31 +574,6 @@ static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *
 	return ret;
 }
 
-static int pvr2_g_ctrl(struct file *file, void *priv, struct v4l2_control *vc)
-{
-	struct pvr2_v4l2_fh *fh = file->private_data;
-	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
-	int val = 0;
-	int ret;
-
-	ret = pvr2_ctrl_get_value(pvr2_hdw_get_ctrl_v4l(hdw, vc->id),
-			&val);
-	vc->value = val;
-	return ret;
-}
-
-static int pvr2_s_ctrl(struct file *file, void *priv, struct v4l2_control *vc)
-{
-	struct pvr2_v4l2_fh *fh = file->private_data;
-	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
-	int ret;
-
-	ret = pvr2_ctrl_set_value(pvr2_hdw_get_ctrl_v4l(hdw, vc->id),
-			vc->value);
-	pvr2_hdw_commit_ctl(hdw);
-	return ret;
-}
-
 static int pvr2_g_ext_ctrls(struct file *file, void *priv,
 					struct v4l2_ext_controls *ctls)
 {
@@ -817,8 +792,6 @@ static const struct v4l2_ioctl_ops pvr2_ioctl_ops = {
 	.vidioc_streamoff		    = pvr2_streamoff,
 	.vidioc_query_ext_ctrl		    = pvr2_query_ext_ctrl,
 	.vidioc_querymenu		    = pvr2_querymenu,
-	.vidioc_g_ctrl			    = pvr2_g_ctrl,
-	.vidioc_s_ctrl			    = pvr2_s_ctrl,
 	.vidioc_g_ext_ctrls		    = pvr2_g_ext_ctrls,
 	.vidioc_s_ext_ctrls		    = pvr2_s_ext_ctrls,
 	.vidioc_try_ext_ctrls		    = pvr2_try_ext_ctrls,

-- 
2.48.1.601.g30ceb7b040-goog


