Return-Path: <linux-media+bounces-16304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 234AB951CAC
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 16:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82AEFB2392C
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 14:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AEF1B32DC;
	Wed, 14 Aug 2024 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gLu8p6SJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217A1B32C1
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644631; cv=none; b=IjhfQ6e+QS/8cRe39VO6/CQ2GNh+erS1vtRwmn+XW41t70qCeJTrm7TN2HDhnK0p76KxTW3xFnXgg/pcKKSnKoMZfXk6i3+llozPvXzs9aXlUFSMIFlEJnfau4M/cIQcPextrQQX8KJxvMrobuXKjipcjFS3sfUD5YXeP8VFb8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644631; c=relaxed/simple;
	bh=p1d0PwsGi9ZIQzfl23z0qmpUMB44j2s2TwRUGtvJ61k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsZ3FGE0Ap7Moa7yx0Uae2kZ/9B8jYgG/Dk2GLn6Y0g5QjAVgPm09nXvnIN077aQhddO6N3GOM7uFGEdQGSqcmDxuz3h4Yb8wDnPwE64/H7DCJlZvGKGPy9OWxm7PHLLUX2MiQ81OJPSS2SlxBQwZRXxo+Hi/bC6lh8azMNnZc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gLu8p6SJ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-44fdde0c8dcso37173071cf.0
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 07:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723644628; x=1724249428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+MnvoDMkIDZgtH/+nAB3DNM4UvBw/qkbvF0T8ogQzM=;
        b=gLu8p6SJ5cnCC/Pvk7rQtaTqjCkNvx3VaJzzlp/t1T6zrg1Lewrfudu4Li7EqnovMc
         yqOqcCFdwqj7kyAiyLRq0pq1LyCZWqDmQzyLH/6KaDrlwKBnpDCEZP7meecDnY7bRh6q
         UIhP2MlZR0T0CJv31iQkgZtkyhWWxUGLjzHAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723644628; x=1724249428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+MnvoDMkIDZgtH/+nAB3DNM4UvBw/qkbvF0T8ogQzM=;
        b=InfMpyi/zbiOrfS6tES/kg2o6wlwPyWHh0Y2MmaUAROT98GXHgU9/gKNvkNs9JX+Lo
         QQISahnZWNisVDSVGd/rA5qzk5m6HctxHP9o0DGf7v+2XphG+52Ye5ymM0CLvY0FoL1M
         jPlyJBGY4JrJlPNytfUnHWHjBfb5H5/BVHQ+3FZoiBOIvplqmVmb+R4wPx0xfLPpfaFL
         qw/rKzVrQCPdosf79wB97exEYgPGp48IWJnd1J9+gEgc6Tvi58oAB+zvcGBr3oTJFWnw
         yTLxbRa2s92pQ5O5uKVWwnjcOuRaZn9nP2mi281b5UOvlE76J4Ts3oSrS0B+1YLIA1iD
         V0sw==
X-Gm-Message-State: AOJu0YwtMEBoY2fHBTnjiSZD1TdQ31SBAn0VnJLq3dYFxET9JyTzY5nI
	wov9ifo+DumZKnwEz4Jly0Tx4+k2C5Sewfh8B54eX7Gxk6pIh8MDqoHVdz7y4q3mLHoLxU1YMzg
	gHsNN
X-Google-Smtp-Source: AGHT+IGKGbuNG7hmYX5BMf9s5t22zLanCeUhBuhAdconaflpMOvPAASHFkv4KPsCl1wH4eumOOYE+Q==
X-Received: by 2002:a05:6214:2f08:b0:6b7:ab98:b8b3 with SMTP id 6a1803df08f44-6bf5d1f954dmr27328656d6.34.1723644628071;
        Wed, 14 Aug 2024 07:10:28 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82c61637sm43861036d6.7.2024.08.14.07.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:10:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 14:10:22 +0000
Subject: [PATCH v2 1/2] media: drivers/media/dvb-core: Split
 dvb_frontend_open()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-coccinelle-followup-v2-1-88b4e4a9af56@chromium.org>
References: <20240814-coccinelle-followup-v2-0-88b4e4a9af56@chromium.org>
In-Reply-To: <20240814-coccinelle-followup-v2-0-88b4e4a9af56@chromium.org>
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
2.46.0.76.ge559c4bf1a-goog


