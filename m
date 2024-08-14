Return-Path: <linux-media+bounces-16305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB36951CAE
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 16:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7261F23A61
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 14:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A101B3735;
	Wed, 14 Aug 2024 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DB1WRNnI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0931B32A6
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644631; cv=none; b=X1pctCo5AZZ/srhJmnewd9b/p9uPZzRau1s+YKGiG8A9JRHE/d3wx/8Tv+vk0vmrfjAZ65kjlIIqnQkaveSrRgsPa7CMjp8Rqcf9qaKyztf8kpS7+rvc0eIvCrIf6lULQxIkAOxD/J88hdm4/Tlrqrn/jJkj/hSWV5FdLAdms9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644631; c=relaxed/simple;
	bh=4gn8bYoICNRPD5yYaXqN7k4ps+ZaI5ktDDh23/kBYnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LYEzrw6AOZTqU2JzDBiyvZANurrEqqh6rXQvac+oWliV5o28+tC6Nyh2mcYXkNu+e3KwrktRIQcBig6ogb2NhSi0HG6BTHHiKE1YxEI9ouLAArP2bKkOvjR5ghFNE5zpMb5TlIEjvRxQlnGcaEDdNlPR688UNGQOqcNLli+syMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DB1WRNnI; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7a1d066a5daso420113185a.3
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 07:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723644629; x=1724249429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54a5u/AIPf3FUAW8TNrqnrThXWk83FvG6faGGYYzLrQ=;
        b=DB1WRNnIlvhxurNUWgR+OE5VSZXk0ZEjvalmFRPFIo9xZp4lxnKLG8aCRC6+cPFXJF
         4f5vc2x3XkTOMr4i/MLhPzlqBYiXSU5/4WiAAohhXiYJ30AUlfKBd5+ukIwTGHVWKo6Z
         5IlDSJukIbgxCcfZFzAp8PI8hzA2LAdKZ6Lx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723644629; x=1724249429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54a5u/AIPf3FUAW8TNrqnrThXWk83FvG6faGGYYzLrQ=;
        b=Bg0BI93U3qrmEfpshUPm+AU8yMHYM64LDq+AfuT2YSWYgtPnMvikGA9RbEIHmZN6Eb
         EjbWJuTTeU/vbMuAX2oWfB7LAkDtF/XsgxZJPSuce2k1DYBuicF+jRwHQzwBAVWuoKSE
         OLqAjJ71y2MuEBtNTfPhca1388kxU7jm9nAsW6dsMQbY+33zG7+9+QXW9P1sOp3UtdUe
         tv2zK8dW/s+X55jl/QRMY3m4k05W4W/0rI00RRBx202hNegtj2aN+2DC024E7b312m0I
         U3IN8MrHgkk8XSiLt5eYpOZymJfzUwoTIkCYswPe0ftNznro36CwfdinMAHtRmcgrwSP
         NsBw==
X-Gm-Message-State: AOJu0YwBn1T4PhrIjZMTMG4NJfKw3Pz+y9h2yGhHMS2K/fAe8Q0oUdzN
	xFbE9SnmlwA3lKdE7bq8KicGZjMRd8WxPA0wqBiq41se/L02CF8epJIFy6XGE0SS+/zTkKH3Cn4
	1AB+e
X-Google-Smtp-Source: AGHT+IGoc+E8kKrWo1+MczAL0858Q7D1ror/nkleb+dMvRF8IpoDO/rkwov2Dl1lO/HtMEEoy1wPXA==
X-Received: by 2002:a05:6214:225:b0:6bf:6375:397f with SMTP id 6a1803df08f44-6bf63753b38mr12558086d6.25.1723644628736;
        Wed, 14 Aug 2024 07:10:28 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82c61637sm43861036d6.7.2024.08.14.07.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:10:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 14:10:23 +0000
Subject: [PATCH v2 2/2] media: drivers/media/dvb-core: Refactor
 dvb_frontend_open locking
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-coccinelle-followup-v2-2-88b4e4a9af56@chromium.org>
References: <20240814-coccinelle-followup-v2-0-88b4e4a9af56@chromium.org>
In-Reply-To: <20240814-coccinelle-followup-v2-0-88b4e4a9af56@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Split out the wait function, and introduce some new toys: guard and
lockdep.

This fixes the following cocci warnings:
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 58 ++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 21 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index e81b9996530e..7f5d0c297464 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -30,6 +30,7 @@
 #include <linux/kthread.h>
 #include <linux/ktime.h>
 #include <linux/compat.h>
+#include <linux/lockdep.h>
 #include <asm/processor.h>
 
 #include <media/dvb_frontend.h>
@@ -2826,6 +2827,34 @@ static int __dvb_frontend_open(struct inode *inode, struct file *file)
 	return ret;
 }
 
+static int wait_dvb_frontend(struct dvb_adapter *adapter,
+			     struct dvb_device *mfedev)
+{
+	struct dvb_frontend *mfe = mfedev->priv;
+	struct dvb_frontend_private *mfepriv = mfe->frontend_priv;
+	int mferetry = (dvb_mfe_wait_time << 1);
+	int ret = 0;
+
+	lockdep_assert_held(&adapter->mfe_lock);
+
+	if (mfedev->users == -1 && !mfepriv->thread)
+		return 0;
+
+	mutex_unlock(&adapter->mfe_lock);
+
+	while (mferetry-- && (mfedev->users != -1 || mfepriv->thread)) {
+		if (msleep_interruptible(500))
+			if (signal_pending(current)) {
+				ret = -EINTR;
+				break;
+			}
+	}
+
+	mutex_lock(&adapter->mfe_lock);
+
+	return ret;
+}
+
 static int dvb_frontend_open(struct inode *inode, struct file *file)
 {
 	struct dvb_device *dvbdev = file->private_data;
@@ -2840,19 +2869,16 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	if (!adapter->mfe_shared)
 		return __dvb_frontend_open(inode, file);
 
+	guard(mutex)(&adapter->mfe_lock);
+
 	if (adapter->mfe_shared == 2) {
-		mutex_lock(&adapter->mfe_lock);
 		if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
 			if (adapter->mfe_dvbdev &&
-			    !adapter->mfe_dvbdev->writers) {
-				mutex_unlock(&adapter->mfe_lock);
+			    !adapter->mfe_dvbdev->writers)
 				return -EBUSY;
-			}
 			adapter->mfe_dvbdev = dvbdev;
 		}
 	} else {
-		mutex_lock(&adapter->mfe_lock);
-
 		if (!adapter->mfe_dvbdev) {
 			adapter->mfe_dvbdev = dvbdev;
 		} else if (adapter->mfe_dvbdev != dvbdev) {
@@ -2862,34 +2888,24 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 				*mfe = mfedev->priv;
 			struct dvb_frontend_private
 				*mfepriv = mfe->frontend_priv;
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
 
-			mutex_lock(&adapter->mfe_lock);
+			ret = wait_dvb_frontend(adapter, mfedev);
+			if (ret)
+				return ret;
+
 			if (adapter->mfe_dvbdev != dvbdev) {
 				mfedev = adapter->mfe_dvbdev;
 				mfe = mfedev->priv;
 				mfepriv = mfe->frontend_priv;
 				if (mfedev->users != -1 ||
-				    mfepriv->thread) {
-					mutex_unlock(&adapter->mfe_lock);
+				    mfepriv->thread)
 					return -EBUSY;
-				}
 				adapter->mfe_dvbdev = dvbdev;
 			}
 		}
 	}
 
 	ret = __dvb_frontend_open(inode, file);
-	mutex_unlock(&adapter->mfe_lock);
 
 	return ret;
 }

-- 
2.46.0.76.ge559c4bf1a-goog


