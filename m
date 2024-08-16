Return-Path: <linux-media+bounces-16378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2939548C1
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 019D21F24A5B
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA7B1B86F8;
	Fri, 16 Aug 2024 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nxtqWHW+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67061AE050
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 12:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811435; cv=none; b=JkZ1eIGexZBYw9qRoDigZCoPsb9m1C0de0Zb9W57Og4sJeg23rj6u56pB0ng8P1vcBr2N+vnV2VmLkPL3FhXlMDqbyrwfXBwwtj6hwa8k04AZ3jJFNBETPVw4DqjFz9WpbIiuT8abUB6SSCm7EXwhjR/pGNZ4hH93XKDya4K6pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811435; c=relaxed/simple;
	bh=AZKrq35caHyUC1AOx2BHGxje6p+Qp28K1jvfGAPDILk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhd32vJva8UOboHqA3tkO4J0HdlBxo5mYO/Ee/D/Qmr2bKPlBzG4PAsrM+o7r5VMxwOkxCu2E6EhH3EfWQBjZyrNvv5IPXdT/S0NqtG7U0tqr3LozHOEUfK2E/gyotgsgumJQ/lxYas+IlAr07M1wXtxoKyl4mm5RACjMlQBs44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nxtqWHW+; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3db1e4219f8so1134694b6e.3
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811433; x=1724416233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/QU+rV1Nd5TU+U1vgju3PydQyZ7PV27wGq420iJA4U=;
        b=nxtqWHW+NdFExhTogcJpuiRR5ruNEwhEz37Ks31wkc/EUTuKY2FXbrDhTbtbesj9KF
         Sm3UZLFA4/FAMHEiP/fuB/bUTZUij9CQehcSlJHlEcUtoQloIokp6PYmrMERt7l6ouDK
         QXNwmbtoWry3B/jC7wzIc+czsYDQH6JMwBoRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811433; x=1724416233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/QU+rV1Nd5TU+U1vgju3PydQyZ7PV27wGq420iJA4U=;
        b=Lp/CLmFY2zSQDzuEDRwU0kVyQ8EdAadChX+TGiaGXBrv5Lfjm3fGJOVKZU+vMAhcIP
         GR26YGVBm5OoKNyuNeJw8reF7wPSfwOjE20hffjK4r5GOIXC2iGoDIL+1/pkxMbkdVbb
         ey5DHFz1DGqGtu5qG+g5tk/HzMkB2wHfOPl8f41T2HxhTBtDf1o3e5BvJ3B9iZOPQlbb
         A5og81nD4ynBPPekGyL9ebSzkESbn/vbmescNEQFFRAcZpWznHIyAXuHAYD8pXCiZaF6
         SdldfKmRN67IrivCs/NVfqAooZbL/olDgjAc9YfTBmzlQzdmDfnDLJIFP5hiRcPGxBeS
         hqhg==
X-Gm-Message-State: AOJu0YxyWl+q0JrkqG80DvRbhD3mTA2hg1/sukmqUI+pEEB51+Dssr/l
	iwP+KufzbLkjA8wUwr2NVXowDW+BVg0qrcORaonH1XCstLcoK+QZ5A2BcMTE4g==
X-Google-Smtp-Source: AGHT+IHjyuDdk6080uZHYBYL0mtSfgS+GpjPjfdGO3VjFw+1uuHfaAIvPhfZJz4zvTAfrCYH0dFSAw==
X-Received: by 2002:a05:6808:d50:b0:3db:37ff:42b2 with SMTP id 5614622812f47-3dd3ae3881amr2338824b6e.45.1723811432555;
        Fri, 16 Aug 2024 05:30:32 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45369fd9e39sm15853051cf.2.2024.08.16.05.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:30:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:30:30 +0000
Subject: [PATCH v3 2/3] media: drivers/media/dvb-core: Refactor
 dvb_frontend_open locking
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-coccinelle-followup-v3-2-79fbc2742fa8@chromium.org>
References: <20240816-coccinelle-followup-v3-0-79fbc2742fa8@chromium.org>
In-Reply-To: <20240816-coccinelle-followup-v3-0-79fbc2742fa8@chromium.org>
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
index 26d1e8cd2108..16d21ec6ff35 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -30,6 +30,7 @@
 #include <linux/kthread.h>
 #include <linux/ktime.h>
 #include <linux/compat.h>
+#include <linux/lockdep.h>
 #include <asm/processor.h>
 
 #include <media/dvb_frontend.h>
@@ -2841,6 +2842,34 @@ static int __dvb_frontend_open(struct inode *inode, struct file *file)
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
@@ -2855,19 +2884,16 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
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
@@ -2877,34 +2903,24 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
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
2.46.0.184.g6999bdac58-goog


