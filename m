Return-Path: <linux-media+bounces-25568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F21A258BC
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 751AE1888430
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F2220550D;
	Mon,  3 Feb 2025 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CsEJXWYg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C8F204F85
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583759; cv=none; b=YMWUApp/MgDGO+5q/DuUr6gVup2d21H3GmRbewBP7ivfwpfzF42DNOWlBR6D7cbAQsFRv/P0sgqTQngFToXsgYgyb0WU1W8+mLL330mGiqMWS4GKjtk4BpFt+qGdoWFCF21OSg4MxwZXZuXPnaXTEqAQnNqSQdoOVDmAw3+dugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583759; c=relaxed/simple;
	bh=MAIrdEevNn7N12nkJ1J1RhnEvLIu/5K6r/M3d+E6MoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhmfbWoyVzb6MCenMHifE8wXeKcPCxnr5pYwY6KyrYzxvEif/dGGPffp3DwaUp48QVWRmCO5Wsh70MwDpiXXNpg2CDTkMR6JcIDBetod11mTifXHxpZ8fYRIj9yO68RBGtx5GKs8EQUyLeA1IX99PMTM1EsiC0bhN65HEEqbDxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CsEJXWYg; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c61388e68so849043241.3
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583756; x=1739188556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxX88IJj+cJJK7Q7MEUbEa8fVnW5ArFeBowg00h7XKs=;
        b=CsEJXWYgldD2LqG72HuJmn8hlXYa+GsEfoU4bcfGOYHIknaTvOPvr0e+ye3N9WtitD
         ORI38yqoKz8YPikCRgxvE74Y2as/mEtnDyVWMqtZhVP1Hk1N+3bElHjodbRUCEr7YJ5q
         O9PSEqikjveK3UpikZE5DgyH1ymnD2oblG7GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583756; x=1739188556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxX88IJj+cJJK7Q7MEUbEa8fVnW5ArFeBowg00h7XKs=;
        b=bZhYqPo2yix1R/RrWzSnRw4Eedi6TjWkHwQy/hmkMEOB9M94YcGoQXlKvRdpBXhlTE
         fVX6HvWu/wh5xUSDYr6xZJiCUnZP/sb6CgAD9y439Bo2f+XlAcLBB/e7W9oCOviVoKvZ
         u3st1sAwQI7QMl/AovvSQjl5cwInemJMsqSS9VLLQRopJZi72Ec90JIlsF1XmaHuptDV
         Y/ZfYQv496zui377lZ23eOZkg+smd6AUJ7yILVW6aKyYUF+zvveqw8LMfaY/OP0bZXQT
         gqm639Z8mEHMVjoBZz3QFvnrNetNUBn9XMGIN4V6DFkRHXyNOdFEjVdg8vlA3tRYOrEh
         8Piw==
X-Forwarded-Encrypted: i=1; AJvYcCWHXTh8QDjQwnDNivxb1HdeV1nu+mFcNt0vBbZQ+88HeQOHdpTza6VCS2FFrRP9WGlMFQtUyj3GKFkdBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjDe1jXax2F+rX2mxXBxpRPRh8me6gQ/4pJAjLYSiEYuRUzO2a
	W6es3AuEc7eAIYceqjq4bnbC6KIEqtMV77Tt2MWQJjqrfzRRNFnSKi5z8DpQNQ==
X-Gm-Gg: ASbGncuHTi1DO+T1Ob2dCyo5OboZWw8orimxNzJH0OkeI7uWVfdjcwOfgYJX8PnmOvL
	CFYugdyLIdliqJe0IMrTvbxCgeq/RhB/evfbcubW5oI9OAwFgq47W1+5NR77EeGdAP56pXc1ss4
	7LCGeKO51uidNCQviuKQMP5abcyS2pzuDRXIAbs9V+8ecXRpQjhmwS4XGW2tvupBQEmgokmCVFf
	Z1C3Tv6bdoAfvuxml+RlUmgzg3qvCjOjVvdECf5kmgjuNlCL3FlmOhRV736KFHh7LBF1wi8SXFn
	Ov5/yjGesO/PqPwLpcJ/un2su09U4szDL7+CdNk6a3zTxIUv9gYMC8tGao5CmuVmwg==
X-Google-Smtp-Source: AGHT+IEK9q1tPQQgkuLEv6EU9rWEmJulUzWiAbWq4EJZ+pG8GCm2x+nnTJsHB8Vnf7iHLALMqu2m9A==
X-Received: by 2002:a05:6102:2c0f:b0:4b2:bc6b:c845 with SMTP id ada2fe7eead31-4b9a4f0da6emr14805180137.6.1738583756605;
        Mon, 03 Feb 2025 03:55:56 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:55 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:43 +0000
Subject: [PATCH v17 07/17] media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls:
 handle NoP case
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-7-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
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
index 9493ab375f07..4025811fb9e7 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1030,6 +1030,9 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	u32 which;
 	int ret;
 
+	if (!ctrls->count)
+		return 0;
+
 	switch (ctrls->which) {
 	case V4L2_CTRL_WHICH_DEF_VAL:
 	case V4L2_CTRL_WHICH_CUR_VAL:
@@ -1070,6 +1073,9 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 	unsigned int i;
 	int ret;
 
+	if (!ctrls->count)
+		return 0;
+
 	ret = uvc_ctrl_check_access(chain, ctrls, ioctl);
 	if (ret < 0)
 		return ret;

-- 
2.48.1.362.g079036d154-goog


