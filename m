Return-Path: <linux-media+bounces-22994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8379EAC12
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14BC8168B47
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2731DC9B7;
	Tue, 10 Dec 2024 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y+6h7vWe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB2F2080C1
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822943; cv=none; b=XF0UIrvvO4LUxk48piRWUeWY0/8N7QrR3JYsoTIpr0RDJoDtZckOiS72zz9hq6Ks3rS5rIaCDmylEqKCxulr2U67lXlTu+CVzD7qKr+yI4yrhtcW/xSMJezDxPSe0IqiGJkgwZQYRpeAQHVudnl5tWZTVUA3DtuHZ843iumpMNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822943; c=relaxed/simple;
	bh=UCSCdBd2wYaTg2mVCWPKK/8ZcXTPSRHtCpuikvCx6bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJSiKA1982jNiyR/l2l82h/+Wtp6bHq4+qPfVBBGE/mf2SJwV2EYXu4QrLBKhZVgEkIvJHa/38w+WhxZtUrdOAPWrG0v7F8VSSPdoEOMrqhONU6v41jDD85Af6iSNX0AFbuP+OGg9qpwMM4bPM8yJcIX4csXHLqqisaV+rZ9UWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y+6h7vWe; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46772a0f85bso9245901cf.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822940; x=1734427740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiogjbYyyp3CBgcBMLahUXd4YrS+7xUetAO4W7bj77A=;
        b=Y+6h7vWe5HAwwUqdm1SiV73n5I0p+/eicUZJq4BZzI/h84HiUwA6ZaJWoqnhbOqMfa
         56eh9lXWDEd4YsaXcEVAHSx5ZIxqZpROJBdcQK03trWPYLcJnVf1/JKogft+KSwBlxSY
         Kan4qOh8bzm6BXTkW2nMgOGuBxWZ5uG8efAik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822940; x=1734427740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiogjbYyyp3CBgcBMLahUXd4YrS+7xUetAO4W7bj77A=;
        b=KCCBzqVNVi2M3t381XfxIihAAZPC7V7WS+YEO59Ct9+N0uYsEiSBe4pQMeRyw2If0v
         F95znQGP0OskrM65ea3QhQ/Nmy78QR7Zc90Lqh7psepLSbQCBGl1o0TB0jsg4OGfinh6
         Yk7BMaPVD+1WjTUBSARk3tF09rRThk5pSGS84n1dSrvH9xQZN1RNe9fgLa14xrwzk6ON
         /3FHAS5C8Rix+WOubiiLih+gzb5ThoV7Z7W1HtHOCjoxW8zZfmDD6pVhBxVh96NKvldp
         pLBRtLIaNrXucGWWh12UgU/dbV5B/2bVXQJXSEWUVf+yl+jk8jqACX1rJmMng9Wc3slH
         SR2g==
X-Gm-Message-State: AOJu0Yx61PZxyUyR+mGhZeoWkZOJiFFnnrfBxUfsKZzAudVf65RSggR0
	yTPGSIBGpo5s0g390HlhaaAvBpaZky6GZ26mLldpn+iTM2tO79+qAFtLWsnqSg==
X-Gm-Gg: ASbGnctrAV45ENY4nFpuiQnhqeFuIELAlsRT5Lge/eMBNBHtWrr0G48NhV/a2qTHYk+
	a8TvmFCdz7a0uwt6jPlWYCt/qPB640h2cQ6YLE1nSXg4Y9WZsqM5eBs878Txeusp+VIGA8LOSOr
	iIE79MM6zA9QHbQXss5fkbkeGiZQMzw3txFlpnPfJ6OPpPI9U5ccKoDMhc3j9Ox0Yy5SP+R3i1l
	kcMddkeFWrL38xFVz0ha/xJf7RDxuE6ZC20iIIFghg9rngEMbNHU0lzllD/SDjIniwMJ/qRenYt
	aIti0XAtuFcOegtvSZXOZwhN+8Xp
X-Google-Smtp-Source: AGHT+IF8s1VwNRHBCKTet1sDHMwDl1DPA/dKCCMhA10gvPO+iNrMX8TslNymChXUWbVD4blpu2r8gA==
X-Received: by 2002:a05:622a:4a1a:b0:467:681c:425f with SMTP id d75a77b69052e-467681c44famr119359851cf.4.1733822939993;
        Tue, 10 Dec 2024 01:28:59 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:51 +0000
Subject: [PATCH v2 07/11] media: v4l2: Remove vidioc_queryctrl callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-7-c0a33d69f416@chromium.org>
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

All the drivers either use the control framework or provide a
vidioc_query_ext_ctrl. We can remove this callback to reduce the
temptation of new drivers to implement it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 3 +--
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 --
 include/media/v4l2-ioctl.h           | 4 ----
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 252308a67fa8..5267a0686400 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -572,8 +572,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	   and that can't be tested here. If the bit for these control ioctls
 	   is set, then the ioctl is valid. But if it is 0, then it can still
 	   be valid if the filehandle passed the control handler. */
-	if (vdev->ctrl_handler || ops->vidioc_queryctrl ||
-	    ops->vidioc_query_ext_ctrl)
+	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 7d615ebc511e..f512d62ab0c6 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2294,8 +2294,6 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 		return v4l2_queryctrl(vfh->ctrl_handler, p);
 	if (vfd->ctrl_handler)
 		return v4l2_queryctrl(vfd->ctrl_handler, p);
-	if (ops->vidioc_queryctrl)
-		return ops->vidioc_queryctrl(file, fh, p);
 	if (!ops->vidioc_query_ext_ctrl)
 		return -ENOTTY;
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index bdbb7e542321..013996c33a9e 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -193,8 +193,6 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_G_OUTPUT <vidioc_g_output>` ioctl
  * @vidioc_s_output: pointer to the function that implements
  *	:ref:`VIDIOC_S_OUTPUT <vidioc_g_output>` ioctl
- * @vidioc_queryctrl: pointer to the function that implements
- *	:ref:`VIDIOC_QUERYCTRL <vidioc_queryctrl>` ioctl
  * @vidioc_query_ext_ctrl: pointer to the function that implements
  *	:ref:`VIDIOC_QUERY_EXT_CTRL <vidioc_queryctrl>` ioctl
  * @vidioc_g_ctrl: pointer to the function that implements
@@ -461,8 +459,6 @@ struct v4l2_ioctl_ops {
 	int (*vidioc_s_output)(struct file *file, void *fh, unsigned int i);
 
 		/* Control handling */
-	int (*vidioc_queryctrl)(struct file *file, void *fh,
-				struct v4l2_queryctrl *a);
 	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
 				     struct v4l2_query_ext_ctrl *a);
 	int (*vidioc_g_ctrl)(struct file *file, void *fh,

-- 
2.47.0.338.g60cca15819-goog


