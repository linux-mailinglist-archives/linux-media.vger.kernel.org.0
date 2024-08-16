Return-Path: <linux-media+bounces-16377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B939548C0
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 669BE286D80
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDBC1B86D4;
	Fri, 16 Aug 2024 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HT0b2Ao3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C77019A281
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 12:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811434; cv=none; b=ugUvNA0ajC99u03x30LoIdGb3M1VXtHDU5HBLl3PA0IqrDsBa6fPSIgh6u2mUQF09lbXDozLSCrGwrBb9dpXrSJLhi/Fp6E13VkLGR+7YLKCRsdC2U0jPqyRIzr0nxfNPQ4XJj7l2p3mihSe2+2eXXyXiKvSV3T+gl/65BmEM3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811434; c=relaxed/simple;
	bh=568YwfJwS19eXY00SNElYpfCguoOx4QLLp+DlESW9is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJ9eY4YG06avX+ZWEycyEnuZ7y8evubyymrwPRH2voOJzVM9rxHAyjKvLVPUTD7dRVyS7FWaA8mv9KNw0C7854AnAP6c7an6aIqwaHhO7pCjmslHYo6LhBh96/pDpok5CP2RfdTB+UR8MWgzswYwA+/biD0Ni08JxjCcslQIIgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HT0b2Ao3; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-45006bcb482so10299501cf.3
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811432; x=1724416232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9+z6gpUkXqdscNtaq7xrhbv4UjN8Jhn3DWImgjgzCA=;
        b=HT0b2Ao3kkXG2qbVTWRBT065VwQi+FYTkWzxGX+HzM5WVkryR0kUtnmjlVZiHZ59AI
         C6jDOjCZ+VcFml0EvzQWbcwG7L6vg0gA3BbJ7yV1+BZ3FWMz0cl+Bz/Bm3UGeqrbHC1I
         u4XAskt6hUlwjHHJGqFsLxsrrtBlQUx5DiW2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811432; x=1724416232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9+z6gpUkXqdscNtaq7xrhbv4UjN8Jhn3DWImgjgzCA=;
        b=T+cpuStgzgVh9Ph5Khj8wO8CQyRednaFMH4Q0dQxEdp7Xfdl2X7t4tKqrwTvxkCtQj
         lDf8sN6yHqV3kXQaLLVfMahAOugxZCg6VFxrRdMtvtlFOg88swqymlZwzP6JyKvgWIj4
         gAJQUTTAxIC0V0oQgEMe6UmRpSosxkgKtEE6XifC+uDk43RQaUk1oMNlbGcTb0xvPcRM
         456ktyJ5Nd/TZ0wMNF4VGB8eqjtgttZ9QfE4b3AIM6WrZ4UU+HvtxI1rq/KEl+/2E/q0
         T5l+mJ1gF+FYOKK3184OZhtAXyVq3O/xanaTtEC6pEGGV48bsF6vKK58XOP9qGdbPgpv
         QOCw==
X-Gm-Message-State: AOJu0YyS1J356Lzba6PItI+VgS8aoMp+OGoVPI8XQqYhiKaXby1+kLlm
	ogsGzZv+eoNV4TWCEIVXFMGuoYnfoqjDYeYAtmjY1WKE/IQQYBi+MbPyJ84bJA==
X-Google-Smtp-Source: AGHT+IG1ysskNar2G6UxqNwrChFpnXW+yrLaTjloZETNU435Cn2/Ocy8z8Un46AKaDseQscvtgw8oQ==
X-Received: by 2002:a05:622a:1f17:b0:44f:e753:c541 with SMTP id d75a77b69052e-453742fa038mr32797401cf.37.1723811431966;
        Fri, 16 Aug 2024 05:30:31 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45369fd9e39sm15853051cf.2.2024.08.16.05.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:30:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:30:29 +0000
Subject: [PATCH v3 1/3] media: drivers/media/dvb-core: Split
 dvb_frontend_open()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-coccinelle-followup-v3-1-79fbc2742fa8@chromium.org>
References: <20240816-coccinelle-followup-v3-0-79fbc2742fa8@chromium.org>
In-Reply-To: <20240816-coccinelle-followup-v3-0-79fbc2742fa8@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Move the actual opening to its own function.

Not intended code change. This is a preparation for the next patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 148 ++++++++++++++++++----------------
 1 file changed, 80 insertions(+), 68 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 4f78f30b3646..26d1e8cd2108 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2760,77 +2760,25 @@ static __poll_t dvb_frontend_poll(struct file *file, struct poll_table_struct *w
 	return 0;
 }
 
-static int dvb_frontend_open(struct inode *inode, struct file *file)
+static int __dvb_frontend_open(struct inode *inode, struct file *file)
 {
 	struct dvb_device *dvbdev = file->private_data;
 	struct dvb_frontend *fe = dvbdev->priv;
 	struct dvb_frontend_private *fepriv = fe->frontend_priv;
-	struct dvb_adapter *adapter = fe->dvb;
 	int ret;
 
-	dev_dbg(fe->dvb->device, "%s:\n", __func__);
-	if (fe->exit == DVB_FE_DEVICE_REMOVED)
-		return -ENODEV;
-
-	if (adapter->mfe_shared == 2) {
-		mutex_lock(&adapter->mfe_lock);
-		if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
-			if (adapter->mfe_dvbdev &&
-			    !adapter->mfe_dvbdev->writers) {
-				mutex_unlock(&adapter->mfe_lock);
-				return -EBUSY;
-			}
-			adapter->mfe_dvbdev = dvbdev;
-		}
-	} else if (adapter->mfe_shared) {
-		mutex_lock(&adapter->mfe_lock);
-
-		if (!adapter->mfe_dvbdev)
-			adapter->mfe_dvbdev = dvbdev;
-
-		else if (adapter->mfe_dvbdev != dvbdev) {
-			struct dvb_device
-				*mfedev = adapter->mfe_dvbdev;
-			struct dvb_frontend
-				*mfe = mfedev->priv;
-			struct dvb_frontend_private
-				*mfepriv = mfe->frontend_priv;
-			int mferetry = (dvb_mfe_wait_time << 1);
-
-			mutex_unlock(&adapter->mfe_lock);
-			while (mferetry-- && (mfedev->users != -1 ||
-					      mfepriv->thread)) {
-				if (msleep_interruptible(500)) {
-					if (signal_pending(current))
-						return -EINTR;
-				}
-			}
-
-			mutex_lock(&adapter->mfe_lock);
-			if (adapter->mfe_dvbdev != dvbdev) {
-				mfedev = adapter->mfe_dvbdev;
-				mfe = mfedev->priv;
-				mfepriv = mfe->frontend_priv;
-				if (mfedev->users != -1 ||
-				    mfepriv->thread) {
-					mutex_unlock(&adapter->mfe_lock);
-					return -EBUSY;
-				}
-				adapter->mfe_dvbdev = dvbdev;
-			}
-		}
-	}
-
 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl) {
 		if ((ret = fe->ops.ts_bus_ctrl(fe, 1)) < 0)
-			goto err0;
-
-		/* If we took control of the bus, we need to force
-		   reinitialization.  This is because many ts_bus_ctrl()
-		   functions strobe the RESET pin on the demod, and if the
-		   frontend thread already exists then the dvb_init() routine
-		   won't get called (which is what usually does initial
-		   register configuration). */
+			return ret;
+
+		/*
+		 * If we took control of the bus, we need to force
+		 * reinitialization.  This is because many ts_bus_ctrl()
+		 * functions strobe the RESET pin on the demod, and if the
+		 * frontend thread already exists then the dvb_init() routine
+		 * won't get called (which is what usually does initial
+		 * register configuration).
+		 */
 		fepriv->reinitialise = 1;
 	}
 
@@ -2871,8 +2819,6 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 
 	dvb_frontend_get(fe);
 
-	if (adapter->mfe_shared)
-		mutex_unlock(&adapter->mfe_lock);
 	return ret;
 
 err3:
@@ -2891,9 +2837,75 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 err1:
 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)
 		fe->ops.ts_bus_ctrl(fe, 0);
-err0:
-	if (adapter->mfe_shared)
-		mutex_unlock(&adapter->mfe_lock);
+
+	return ret;
+}
+
+static int dvb_frontend_open(struct inode *inode, struct file *file)
+{
+	struct dvb_device *dvbdev = file->private_data;
+	struct dvb_frontend *fe = dvbdev->priv;
+	struct dvb_adapter *adapter = fe->dvb;
+	int ret;
+
+	dev_dbg(fe->dvb->device, "%s:\n", __func__);
+	if (fe->exit == DVB_FE_DEVICE_REMOVED)
+		return -ENODEV;
+
+	if (!adapter->mfe_shared)
+		return __dvb_frontend_open(inode, file);
+
+	if (adapter->mfe_shared == 2) {
+		mutex_lock(&adapter->mfe_lock);
+		if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
+			if (adapter->mfe_dvbdev &&
+			    !adapter->mfe_dvbdev->writers) {
+				mutex_unlock(&adapter->mfe_lock);
+				return -EBUSY;
+			}
+			adapter->mfe_dvbdev = dvbdev;
+		}
+	} else {
+		mutex_lock(&adapter->mfe_lock);
+
+		if (!adapter->mfe_dvbdev) {
+			adapter->mfe_dvbdev = dvbdev;
+		} else if (adapter->mfe_dvbdev != dvbdev) {
+			struct dvb_device
+				*mfedev = adapter->mfe_dvbdev;
+			struct dvb_frontend
+				*mfe = mfedev->priv;
+			struct dvb_frontend_private
+				*mfepriv = mfe->frontend_priv;
+			int mferetry = (dvb_mfe_wait_time << 1);
+
+			mutex_unlock(&adapter->mfe_lock);
+			while (mferetry-- && (mfedev->users != -1 ||
+					      mfepriv->thread)) {
+				if (msleep_interruptible(500)) {
+					if (signal_pending(current))
+						return -EINTR;
+				}
+			}
+
+			mutex_lock(&adapter->mfe_lock);
+			if (adapter->mfe_dvbdev != dvbdev) {
+				mfedev = adapter->mfe_dvbdev;
+				mfe = mfedev->priv;
+				mfepriv = mfe->frontend_priv;
+				if (mfedev->users != -1 ||
+				    mfepriv->thread) {
+					mutex_unlock(&adapter->mfe_lock);
+					return -EBUSY;
+				}
+				adapter->mfe_dvbdev = dvbdev;
+			}
+		}
+	}
+
+	ret = __dvb_frontend_open(inode, file);
+	mutex_unlock(&adapter->mfe_lock);
+
 	return ret;
 }
 

-- 
2.46.0.184.g6999bdac58-goog


