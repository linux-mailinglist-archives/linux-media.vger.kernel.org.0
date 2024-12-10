Return-Path: <linux-media+bounces-23110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E179EBDC5
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DFF828AF49
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 22:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933701F192B;
	Tue, 10 Dec 2024 22:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V6VEKau2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731F91EE7B7
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 22:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733869353; cv=none; b=Fn5REw+pUN7Uw3Ox9bouN/TWof+rbzkX3SHM+oDsCgSXKWMzLskquyWzaRzyaLT5695Clk6fwTo493R2kO7ZBtqQdXI/cjm6oCTVPo2n3dIqyjL6t33y+k76T9IhCeprG5bSJJ6yCfJ/QInJfe/Z2auWpRHlSfO8nPvJMoqOjKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733869353; c=relaxed/simple;
	bh=yv8i9nHRCz0vaaoDZJOFBzaD6vQsxKrtwXv9v5tS564=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HwRNxFPkiGfpb4AT1NvtxSukR6cCZkEznsccDm9fYXvZUh3IoUM0k5Sik07VrKrLDHPVgESASO4QfDoo5OeMy6KqnITOipbtkLvynY4qI1asEf1ncTOMpO0yC6/6/m0O17kBgyfOWLXaHYBLcW2E0MV9RaL+YJxj4hw6KAevue0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V6VEKau2; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4677675abd5so8384451cf.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 14:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733869350; x=1734474150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjQrugQYBz6Mf6XUxcZGSynpVjt6TTGZxVran2d8wNY=;
        b=V6VEKau2JlEXpdNMX38GBleTMYLXS2qBISlYRzGRklwl82BCVU5rvMSgYG71sB56EI
         pccp02n4V6Ho7Ma9zjKsYo56JgwV2WpyfJbGz7QRrCqK0TkQsanwxSEL27jhWhOHsVrU
         R7VDptPY2IQROe32yrN558AsZ3hBFNj1kpOFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733869350; x=1734474150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjQrugQYBz6Mf6XUxcZGSynpVjt6TTGZxVran2d8wNY=;
        b=FJOEiETO52j6MD4bAwdfXULm6wKCQQhT3sbeSa21hcYgux5pZapFAOYPQfgJUSH2aM
         EW3MW4jSMO24fB4G3Ot0EYdsYKZvmDrMTV55sUpaSfeBEE1t0sE94fRepqAZHvTqpxwP
         2JMTSbWFybcJIg2MyletZDFsyeCehVxGGVeXM0KkMgawe8oSvrN0jufI7sWuNMTXiRDG
         W9V2EkI95katcjPWSVTHPVoZk+0ZwfQCx0IdxWbJH4swfUSHorssO5N7xTYGb0+3zQbu
         FoYKZblxbCrYJBZ7S9fxjlyFpfo1zMiXRyF7JZcGSOO1iY06xzPxRgK5P8mJEG0VC/YR
         Sg0g==
X-Gm-Message-State: AOJu0YzrLq09YTbGvCnjSbagwBW5RCUSenpB699tS6PYC87Pf37pDGxf
	RzMOPk0cWKYs3oErNblPO9m8kx94+MuAp+fCi53XJ6bYQ/9g3yqpqL2IOIUfioC9dm1rimSeu7k
	=
X-Gm-Gg: ASbGncuAWL7j2MRNxF0aOClPGMqTT9/aD7mXHoDmj4HM7uU1q0ibi32sFPJQZYCCR08
	1ccSiTk2nbmMQX5FtQYnARyF6yAa8Hx6FQFjyJqUgv4u8EQkI81KhHJUzlvE/rW7cmMAHFqwrNF
	mYbA8/WEMPfViwOW5XhMci7hO0R+TYgReueHQY3mzAg8fOLDVqjrJB9zwGbcKnVQQ61/TinfOu0
	pbxpKtNlVV/ddW80vUxghV6b2duPqj8mxfUixAuakz+PknqXzIhAF4iES0znMZFZXJDeOwYqTOB
	obxivRCvAwzxnEgjzI9NZJ9yhjF8
X-Google-Smtp-Source: AGHT+IHXwNu2FHsl5zNm8GOLrnsaIJdyyD8xiUqBMDSYEmUuoHOfVqx8K6rcdS/IDyFjgfPy+EAgKA==
X-Received: by 2002:a05:622a:1187:b0:467:1e96:645f with SMTP id d75a77b69052e-467892ea223mr8140481cf.6.1733869350436;
        Tue, 10 Dec 2024 14:22:30 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467776034b0sm11232441cf.74.2024.12.10.14.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 14:22:29 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 22:22:22 +0000
Subject: [PATCH 1/3] media: uvcvideo: Return the number of processed
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-data-backup-v1-1-77141e439cc3@chromium.org>
References: <20241210-uvc-data-backup-v1-0-77141e439cc3@chromium.org>
In-Reply-To: <20241210-uvc-data-backup-v1-0-77141e439cc3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@kernel.org
X-Mailer: b4 0.13.0

If we let know our callers that we have not done anything, they will be
able to optimize their decisions.

Cc: stable@kernel.org
Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4fe26e82e3d1..7e2fc97c9f43 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1810,9 +1810,14 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
 	return mutex_lock_interruptible(&chain->ctrl_mutex) ? -ERESTARTSYS : 0;
 }
 
+/*
+ * Returns the number of uvc controls that have been correctly set, or a
+ * negative number if there has been an error.
+ */
 static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 	struct uvc_entity *entity, int rollback, struct uvc_control **err_ctrl)
 {
+	unsigned int processed_ctrls = 0;
 	struct uvc_control *ctrl;
 	unsigned int i;
 	int ret;
@@ -1847,6 +1852,9 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 		else
 			ret = 0;
 
+		if (!ret)
+			processed_ctrls++;
+
 		if (rollback || ret < 0)
 			memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
 			       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_BACKUP),
@@ -1861,7 +1869,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 		}
 	}
 
-	return 0;
+	return processed_ctrls;
 }
 
 static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
@@ -1910,7 +1918,7 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
 done:
 	mutex_unlock(&chain->ctrl_mutex);
-	return ret;
+	return ret < 0 ? ret : 0;
 }
 
 int uvc_ctrl_get(struct uvc_video_chain *chain,

-- 
2.47.0.338.g60cca15819-goog


