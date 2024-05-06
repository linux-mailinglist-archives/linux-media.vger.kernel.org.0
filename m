Return-Path: <linux-media+bounces-10931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 976DF8BD6AD
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 23:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EDE4284175
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 21:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D3A15B553;
	Mon,  6 May 2024 21:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="crnIXjPE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD2715D5B3
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 21:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715029835; cv=none; b=nbY3jjoVFIax46j4cieWK86DL+8+DSKqF3lsIKKfmgYzGluze0htJgAAiDaEqRrH0F9gbzBESDxDSJ43vph0mq6KspnCTNTQ/u66/2vFzGxVNu5aDH5r9wwv1syhEonHnXQQHhTeWUYJQsJ6EnKfd+AeUfaYQYNNA5zQ+Qs/bCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715029835; c=relaxed/simple;
	bh=E2Y7TzdEbh5vcibAf3xlTX0c6fqY+SvR327dj3nMUZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCBydrJ6pxdxsEdksFDw8x8eKP2JLEAgiLxVrJT07hKBJKNrXiBWBA2a96/x6RsOF69aV7oV7VJqsrkwMJ/0MFNivvWilHH1THCKyNmUd/3zagYGFmTTAmcRhmP1ntJxqIvB63BsiJGDEmtULGLM1bVaFQj0RNOur0be5WQNUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=crnIXjPE; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-22ed075a629so1467928fac.3
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 14:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715029833; x=1715634633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9QNMPvGLAYBnNPSn0ftFG2L7lyXZe/71ldtmrt+Bjs=;
        b=crnIXjPEFYnavZcwoQrYP+vp+BmvG3hM2cC/Ep6tWEwY9ttDlIpZq5UwExUamvriuS
         rJIom+3YzKN6oGcak4w/qCWRWVtlTXwl5qUVqmcF1D3IOxb0LkUMATiRd9tTwX6TJXok
         9COPGp8OSZh2/FyJr/IYaOmXd4158oNvBn0Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715029833; x=1715634633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9QNMPvGLAYBnNPSn0ftFG2L7lyXZe/71ldtmrt+Bjs=;
        b=A//AHhRuJeLrHMY0p5NtpJUi1xwMPrMNVW/Deboes0LfZbhGjnwkwfki/5m5ZvrfAD
         K+lIpdV30osSPltOdKmG1JpYMDijkZqaFmwV0AnM6+xRXQdqH3XcfECTapuJ34jaeKy/
         kXzWFyID+zEnvdGL28Hj5DjT9wO8UqByBQz6/65BWYnUyeGKlMU/v+N+djasiX6tBmcY
         pqhXRxCHzHsZqCFKDxtAFyJgozWGJV/6HPrRNQNHnOdK1MY9sDrYmRGT6LfN20dEkgyo
         N5bGXe3vZ+zSQNwYHeqIac+oD8KjOPaZMY4/kZEktQtGuSlAycJodCb3s0ZBcuwMyEIK
         TFVA==
X-Forwarded-Encrypted: i=1; AJvYcCUCosBZGcY9Woe1Z1VyOIWRbKfAsD77dZP9CFbxE21N7ja9eP2tJnU8ulhfY8hpaRS4s7P8KDweadU/ImZcZ3tYColatjuDPe3KtgI=
X-Gm-Message-State: AOJu0YyMy5BQ0pNPMde/JlH2MWpG+sHY0Yevhg9Qjt4i2y45DUD/NTyz
	tPmjtSfJ9DjpfXBc0Ezk+oGzuUDvJsCmuen9y/lv78rQRo+BJGoV9S3061cLqA==
X-Google-Smtp-Source: AGHT+IFYjs3nRF6SaoGCfVOA1vP4x0YulqSRg/VGAqs+ro65Kw9a73H+Z1IGlXP/lC5je220W3Ok6A==
X-Received: by 2002:a05:6870:2007:b0:23d:41b7:6f10 with SMTP id o7-20020a056870200700b0023d41b76f10mr14015836oab.31.1715029833192;
        Mon, 06 May 2024 14:10:33 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id pa20-20020a05620a831400b0078f13e59dc9sm4224921qkn.102.2024.05.06.14.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 14:10:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 May 2024 21:10:30 +0000
Subject: [PATCH 5/5] media: drivers/media/dvb-core: Refactor
 dvb_frontend_open
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-cocci-locks-v1-5-a67952fe5d19@chromium.org>
References: <20240506-cocci-locks-v1-0-a67952fe5d19@chromium.org>
In-Reply-To: <20240506-cocci-locks-v1-0-a67952fe5d19@chromium.org>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, 
 Jarod Wilson <jarod@redhat.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Move the shared frontend logic to its own function. This allows using
guard() to handle the mfe_lock mutex, and using lockdep asserts.

There is no intended change of behavior in this code.

This fixes the following cocci warnings:
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 116 ++++++++++++++++++++--------------
 1 file changed, 69 insertions(+), 47 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 4f78f30b3646..d04a6092f1ba 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -30,6 +30,7 @@
 #include <linux/kthread.h>
 #include <linux/ktime.h>
 #include <linux/compat.h>
+#include <linux/lockdep.h>
 #include <asm/processor.h>
 
 #include <media/dvb_frontend.h>
@@ -2760,66 +2761,70 @@ static __poll_t dvb_frontend_poll(struct file *file, struct poll_table_struct *w
 	return 0;
 }
 
-static int dvb_frontend_open(struct inode *inode, struct file *file)
+static int dvb_get_shared_frontend(struct dvb_adapter *adapter,
+				   struct dvb_device *dvbdev,
+				   struct file *file)
 {
-	struct dvb_device *dvbdev = file->private_data;
-	struct dvb_frontend *fe = dvbdev->priv;
-	struct dvb_frontend_private *fepriv = fe->frontend_priv;
-	struct dvb_adapter *adapter = fe->dvb;
-	int ret;
+	struct dvb_device *mfedev;
+	struct dvb_frontend *mfe;
+	struct dvb_frontend_private *mfepriv;
+	int mferetry;
 
-	dev_dbg(fe->dvb->device, "%s:\n", __func__);
-	if (fe->exit == DVB_FE_DEVICE_REMOVED)
-		return -ENODEV;
+	lockdep_assert_held(&adapter->mfe_lock);
 
 	if (adapter->mfe_shared == 2) {
-		mutex_lock(&adapter->mfe_lock);
 		if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
 			if (adapter->mfe_dvbdev &&
 			    !adapter->mfe_dvbdev->writers) {
-				mutex_unlock(&adapter->mfe_lock);
 				return -EBUSY;
 			}
 			adapter->mfe_dvbdev = dvbdev;
 		}
-	} else if (adapter->mfe_shared) {
-		mutex_lock(&adapter->mfe_lock);
+		return 0;
+	}
 
-		if (!adapter->mfe_dvbdev)
-			adapter->mfe_dvbdev = dvbdev;
+	if (!adapter->mfe_dvbdev) {
+		adapter->mfe_dvbdev = dvbdev;
+		return 0;
+	}
 
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
+	if (adapter->mfe_dvbdev == dvbdev)
+		return 0;
 
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
+	mfedev = adapter->mfe_dvbdev;
+	mfe = mfedev->priv;
+	mfepriv = mfe->frontend_priv;
+	mferetry = (dvb_mfe_wait_time << 1);
+
+	mutex_unlock(&adapter->mfe_lock);
+	while (mferetry-- && (mfedev->users != -1 || mfepriv->thread)) {
+		if (msleep_interruptible(500)) {
+			if (signal_pending(current)) {
+				mutex_lock(&adapter->mfe_lock);
+				return -EINTR;
 			}
 		}
 	}
+	mutex_lock(&adapter->mfe_lock);
+
+	if (adapter->mfe_dvbdev != dvbdev) {
+		mfedev = adapter->mfe_dvbdev;
+		mfe = mfedev->priv;
+		mfepriv = mfe->frontend_priv;
+		if (mfedev->users != -1 || mfepriv->thread)
+			return -EBUSY;
+		adapter->mfe_dvbdev = dvbdev;
+	}
+
+	return 0;
+}
+
+static int __dvb_frontend_open(struct inode *inode, struct file *file)
+{
+	struct dvb_device *dvbdev = file->private_data;
+	struct dvb_frontend *fe = dvbdev->priv;
+	struct dvb_frontend_private *fepriv = fe->frontend_priv;
+	int ret;
 
 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl) {
 		if ((ret = fe->ops.ts_bus_ctrl(fe, 1)) < 0)
@@ -2871,8 +2876,6 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 
 	dvb_frontend_get(fe);
 
-	if (adapter->mfe_shared)
-		mutex_unlock(&adapter->mfe_lock);
 	return ret;
 
 err3:
@@ -2892,11 +2895,30 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)
 		fe->ops.ts_bus_ctrl(fe, 0);
 err0:
-	if (adapter->mfe_shared)
-		mutex_unlock(&adapter->mfe_lock);
 	return ret;
 }
 
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
+	guard(mutex)(&adapter->mfe_lock);
+	ret = dvb_get_shared_frontend(adapter, dvbdev, file);
+	if (ret)
+		return ret;
+	return __dvb_frontend_open(inode, file);
+}
+
 static int dvb_frontend_release(struct inode *inode, struct file *file)
 {
 	struct dvb_device *dvbdev = file->private_data;

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


