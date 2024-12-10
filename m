Return-Path: <linux-media+bounces-23008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923C9EACCD
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26FC516658E
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B80215793;
	Tue, 10 Dec 2024 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="euKxpdUE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC422153E8
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823780; cv=none; b=DCRaxgXPQMxN5LvTVCP14ZNXwHhU5j6N0iuG+mNVQWrZa17YNQzhm+cUPP8jcWSstbicZQFbd9suVCvA2hUpfn5+Qf1elziArEgzcmX6GrgjbiVIkm3HNpd6G2Wky9KF59AjYG/NzRaVYq11NFW41F7ugnVN89KnEtvy3bynX1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823780; c=relaxed/simple;
	bh=7tx9tY1TZ7Mz0s7zOjD3n2wpSrIQUzX0lYUD2DrQrH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeCxhWSjQoie5hDzEWAUMpOSsLhSZmTlsI+IChV4435rMDCZ0hLQ+rLtnDvm6c4uGFgvAS9gHLmyHXWB4l326fe3Jcjirrf1G6X/X55MBhF3YvHtDDdrPIR63HsvCAfdn1JgTAM8TRt7nqcvHByWypOV++w1y3GE6dKtLzzPDyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=euKxpdUE; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b1b224f6c6so567150485a.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823777; x=1734428577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0JByQfuAg+uD0hv4jRjMFUtllhDg1QrDpBOUHpuPvE=;
        b=euKxpdUEsJYHEKCJGkqnp1gCNHgT167YD9udhT/UygtsJyV1glI6qwyugzxU2y/GWI
         PHfG29ebCrVh3G4OCRM7Mgg2WEI/jip3dl/a/TMZ+n9CxAqBxbhs4hymXrggUpd5CtuC
         hCIrHihTL/1+yC7ms9c+CvkThFkodQ7jlBYu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823777; x=1734428577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0JByQfuAg+uD0hv4jRjMFUtllhDg1QrDpBOUHpuPvE=;
        b=AJJw/fNeyXbqqoYfIMo8e4qtkRtNa1hbEMiINY9U2IWI3mho7ZUjVagVLFevQv2J//
         FRR6OIy0tflEHK4Y5epNtqDLtrP2pPPPlfGPx8RNRgNJyEzDP5IhbjY9t0x3lZUzxQXf
         pxiKZqCpt1kUAoZEZmrNocd1DaJpcjAW3Wwn3tyzjhDmQlGWIN0F0PSygUZMR0WI9USk
         zFEjQOY3g3z+KIVHCX7TEXn2Y3vws5yFTJae+7m1vIA1NZ/bv3DvZ0aJGL6C5vJpu3qm
         WAAwDHxXmB/X9maXD3M/ROEMBIdTlJvI/5PZmslA32/NQnksa5H+Hk0onrkHpTA37q03
         xisQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH6xixUJ+8qAInEvYFTcarSmCNxRR99rD6JnF/BERL+W2B497uuyPXEKj/UIZgdV1BuARS6bJNWU492g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMPzbD2sAnC55rllU1TysuwX+b1sDVyWpV1yup1XYJB4PLHg2
	A3H25lF7C6HvXDDAV5uyqWhdR1sHO1ZPEZrHOlagO+AAhnI2gIyTOpLp2Nux4lwRrPrGwPSrWXo
	=
X-Gm-Gg: ASbGncuU1ayGVziWpP0Ka01Ea7At4MAjGVCStU3OPLRjRNakRulfSj9+4Afz5M6tZYP
	PgLRkxQrfYBxk4sJeUK1YYmc9XMen8CMcKvA08SEM9DEXXYy4t4lhEkJlW7TOm7Mwd8ZUAqHcy5
	mmw0AU7FD4s5yC5nGP+OkQBoZbH3CXG4b1dzEqYMk0Zk6Q4cpwznNCabN53GBlyuIS90hanct20
	WFnAU6d8xJvYisp7Bd6oHzvefqr0cH8ANgLtn0kKWXkTLdWOsLb4rT0tdaJLFu8TY9Mcbmk3MOz
	L33V6pNGPvILQJG/UrQDVB7xT0A+
X-Google-Smtp-Source: AGHT+IExR45IaZ1efaic3FpvsqoapdjA78ZUgUcbHZEtkDM1i3ZvkPfWr958oENOEkerIrjSg+Bv6g==
X-Received: by 2002:a05:620a:1922:b0:7b6:d910:5b1a with SMTP id af79cd13be357-7b6dce94fa9mr608857985a.42.1733823777521;
        Tue, 10 Dec 2024 01:42:57 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:42:56 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:44 +0000
Subject: [PATCH v16 08/18] media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls:
 handle NoP case
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-8-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

If nothing needs to be done. Exit early.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 02fd5cbc3474..65dbb53b1e75 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1081,6 +1081,9 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	u32 which;
 	int ret;
 
+	if (!ctrls->count)
+		return 0;
+
 	switch (ctrls->which) {
 	case V4L2_CTRL_WHICH_DEF_VAL:
 	case V4L2_CTRL_WHICH_CUR_VAL:
@@ -1121,6 +1124,9 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 	unsigned int i;
 	int ret;
 
+	if (!ctrls->count)
+		return 0;
+
 	ret = uvc_ctrl_check_access(chain, ctrls, ioctl);
 	if (ret < 0)
 		return ret;

-- 
2.47.0.338.g60cca15819-goog


