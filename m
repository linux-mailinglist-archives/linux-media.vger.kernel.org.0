Return-Path: <linux-media+bounces-12938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2B9903993
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B571F26077
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 11:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2011917C208;
	Tue, 11 Jun 2024 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RBPI+5fi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F917A930
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718103789; cv=none; b=bq+3zWc4mFZHe2Ts82eujR+7vyo8GfAHXF9GiUVA7GmugkGyVKdLVWa8JxbzAaIQL/8SeNr4EHEDmyR6nlWFsX0rAh7AuSz6ntw+GVuBxli8lQzm0ByKN8g52j0Nl4yuNrl1o/F7Qgr1Alev/kySlK/ADlI/3n1UGzHTWxIGmuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718103789; c=relaxed/simple;
	bh=axQU43Aml76H/iOKeENoFQKWJ7/gXB7cHl8R20BADw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8v0sbCzUPFNVIl8+bwcZoH01H9dqAVz6XCeFwuH5CyhfDh3F2ZvCHs5VuPZ30uIkxzcZlYh0cr0JoaptrKglFwNo9RJrOCc/h1W3cnaNGKKqgB6+ab8f1HQXVYuDNxNnM59rJWvVKcs/maLn+MNUIxG75OEE3HGo9IhZKdA9rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RBPI+5fi; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-628c1f09f5cso11646597b3.1
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 04:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718103786; x=1718708586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImkowAObGGvWARM8qyLmBbLia+4Yl3rwgPb+hZwmCUk=;
        b=RBPI+5fi+7ZtMQlr8m+cof2zBRR1hqx/EWUmps6wAv/Fg5AYKOj73UnB22sTrKSiG8
         IBdUVb8iawNejjSzj2wF6IXvmN3mk7RlXQ/l0HoWoAYHaSwHD3o83LwdSxRYqNzF69Mq
         lX3CTDy+ci3KdBSMdyTa58+jvRTLZlrvbOQeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718103786; x=1718708586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImkowAObGGvWARM8qyLmBbLia+4Yl3rwgPb+hZwmCUk=;
        b=APn2owwuL9y7JJL+Jkjhoj4ljmDzLb8+EWQaf6G5nibptOkUDqUrStrr9Ktlhzx895
         zHG/ep8iAFQW/upOKiPid/x0VpsEeTNWf17xnpFArrjfIStSGKZYkdpsHJ4cCwHejREp
         vGYbhTC+uXY+jwHr6RWsk4GuVfA1b8HbzBkMg11ZtxyS8P2laYm+ne78+MEoICw8oQ7f
         LL0YyA578JBhGHUQvtY7ovJrMHqPSRYjlf5+8+SiwCKF7YwzMbSXmc6skGt0292aZvdu
         yTuiMnbbqhsSSYEfkG6tf4my8zwtO28dv5z8llJVTLwztTG/eI0BxDnLvFQHz8i9MkrQ
         BufQ==
X-Gm-Message-State: AOJu0YxI6edufSLSr9DGRNrsassWvseNhcQPvGf6bLxgHI+1xkBJCV+f
	3LV0N0KE/P/5uUwgVwxNhU7VL5zbcOF8zQ9PPICQIsn9gYMgEZC2vYn0s3yFrEDXEPmuThOYK6N
	GWtJF
X-Google-Smtp-Source: AGHT+IGKfgJjl5AbFdYEmHwgB4UA+CO9/L0Ej5JUQlX4Aq+awTo2bU562C9zspGvacUwumd87j7oSA==
X-Received: by 2002:a0d:d442:0:b0:615:4e88:c02d with SMTP id 00721157ae682-62cd55f46c1mr126934237b3.23.1718103785263;
        Tue, 11 Jun 2024 04:03:05 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b08bf006f4sm6392076d6.90.2024.06.11.04.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:03:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 11 Jun 2024 11:02:57 +0000
Subject: [PATCH 1/2] media: drivers/media/dvb-core: Split
 dvb_frontend_open()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-coccinelle-followup-v1-1-df2de9c2f320@chromium.org>
References: <20240611-coccinelle-followup-v1-0-df2de9c2f320@chromium.org>
In-Reply-To: <20240611-coccinelle-followup-v1-0-df2de9c2f320@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Move the actual opening to its own function.

Not intended code change. This is a preparation for the next patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 143 +++++++++++++++++-----------------
 1 file changed, 70 insertions(+), 73 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 4f78f30b3646..e81b9996530e 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2760,80 +2760,13 @@ static __poll_t dvb_frontend_poll(struct file *file, struct poll_table_struct *w
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
-	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl) {
-		if ((ret = fe->ops.ts_bus_ctrl(fe, 1)) < 0)
-			goto err0;
-
-		/* If we took control of the bus, we need to force
-		   reinitialization.  This is because many ts_bus_ctrl()
-		   functions strobe the RESET pin on the demod, and if the
-		   frontend thread already exists then the dvb_init() routine
-		   won't get called (which is what usually does initial
-		   register configuration). */
-		fepriv->reinitialise = 1;
-	}
-
 	if ((ret = dvb_generic_open(inode, file)) < 0)
 		goto err1;
 
@@ -2871,8 +2804,6 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 
 	dvb_frontend_get(fe);
 
-	if (adapter->mfe_shared)
-		mutex_unlock(&adapter->mfe_lock);
 	return ret;
 
 err3:
@@ -2891,9 +2822,75 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
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
2.45.2.505.gda0bf45e8d-goog


