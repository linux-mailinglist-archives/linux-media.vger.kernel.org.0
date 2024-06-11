Return-Path: <linux-media+bounces-12939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A592903995
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7D892882F4
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 11:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A5A17C226;
	Tue, 11 Jun 2024 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L0BPhBOh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A3B17BB34
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718103790; cv=none; b=nslCZvVXuTI9xuATmS9PgzTdcVvHKWRkYXzWwWP0SAsPQ+qUX91gN+EAbG8vQLw/tYcJ4E8nvB03NBreBgSXw2JeIzGbkCHd1rUTph8JKBHo6rndHkYhTol1dt5EpiZ0hxuYwzVayMXLkZQz39cd5xGVriuRnT+ViWX/J3D9MVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718103790; c=relaxed/simple;
	bh=z/3u4/mWtXaPcqUEJIVVVhgfYJkjuHSN+7Gt1mr2kZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZmrQUbO29ijvYRNSU8/4+izphSYDg+kKA/pE1wFRW6M+Du4QdTmC5E7AKQ3Aye3TgkUfs7iUuO9hQsIiAvL+G0gtAminMYqkBkeiRjBuyEEOxirrFeGW5yyL6iaS6msDLwterTjrbgDmf1dQDFz5xX/Y9cKOTsOc7zlRRUgUPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L0BPhBOh; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-627f46fbe14so11349427b3.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718103787; x=1718708587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzS9f1WNBiNXaOeMPoSMQIzT/9CqhSNtVDMpqgWPH5g=;
        b=L0BPhBOh0I1GV8CWvJsX4am0HYFH0l+mhazYRotbgzxUPkUBU7IwIX0d0FOKGV2gkI
         tB933JVT3+K6X27dAV8wxfhrjTI1a64/kZCBWlp5BE8cF68pU6rhuiQcvvJeyZXCTi7p
         OMRaZzpyCSscbiuuf7t8eFpqc+K9lbKRtupRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718103787; x=1718708587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzS9f1WNBiNXaOeMPoSMQIzT/9CqhSNtVDMpqgWPH5g=;
        b=MfrrHqCR0/NMaN378qqfbsorcU369DjPBTkT+kNNxwYBAdN5z51+qXEEvE/sRad86Y
         R3Ne5r2aU83A67yfmP8au4J0RJVGnI4x3zjudZqvt35uBT3ILT+t3/ltz3TfMBwvTS/O
         3KxkL2AKQknLdp1CHjDPkL5B4z7nJBqKVsSpKSLxtiVSxN0TydB7Sbba7LvqylNhViH9
         /fD5eMkj3VhipondiVNe0+XzDMG3ly1PBeFL6bilVh6bKvsYHvvONr+QfC4sivaaAvyY
         KQAEUbzAacnz+VjyCp/3oXpRmV+lp/UGXaiNmnm1DxQBKHRMBFT3mc0yLWoaSY4QcxtG
         wM4A==
X-Gm-Message-State: AOJu0YxtaMjbyO0ksPZFnyAeZytQ6YmO/T47wbtavufRAMOgQ0WfDeE5
	OEXwf5ZMw7yT8Kkk63fg/Uu2/b2B0h65zj6WEkB3jS78EDReHwT8KCUSSrZBUdffh26giHq6j9c
	j3twq
X-Google-Smtp-Source: AGHT+IFyq6p5dM3GRR26JfJcXHtL1hQfZTEfRKi/7qD6W4L5jN1i3I7FjtVlsJJcSDOGRawrkNvnyw==
X-Received: by 2002:a81:830e:0:b0:617:d864:7e0b with SMTP id 00721157ae682-62cd56afba9mr111896707b3.47.1718103786021;
        Tue, 11 Jun 2024 04:03:06 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b08bf006f4sm6392076d6.90.2024.06.11.04.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:03:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 11 Jun 2024 11:02:58 +0000
Subject: [PATCH 2/2] media: drivers/media/dvb-core: Refactor
 dvb_frontend_open locking
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-coccinelle-followup-v1-2-df2de9c2f320@chromium.org>
References: <20240611-coccinelle-followup-v1-0-df2de9c2f320@chromium.org>
In-Reply-To: <20240611-coccinelle-followup-v1-0-df2de9c2f320@chromium.org>
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
 drivers/media/dvb-core/dvb_frontend.c | 59 ++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index e81b9996530e..a7739f5e78cb 100644
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
+			       struct dvb_device *mfedev)
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
@@ -2840,19 +2869,17 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	if (!adapter->mfe_shared)
 		return __dvb_frontend_open(inode, file);
 
+
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
@@ -2862,34 +2889,24 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
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
2.45.2.505.gda0bf45e8d-goog


