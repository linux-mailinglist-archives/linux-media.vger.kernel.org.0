Return-Path: <linux-media+bounces-2832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE6E81AC98
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 03:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA83286611
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 02:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9864185D;
	Thu, 21 Dec 2023 02:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3NEz73u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF53C0F
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 02:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28bd31683a6so262084a91.2
        for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 18:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703125370; x=1703730170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8U74JSUiFPUq6aX251EH/7awoyRYogfb0vLzXz4t6r0=;
        b=C3NEz73uq6HQnLUyyS/tmfg9mBzU8tuseCAZQwzsGPV73fbC6ruZHkvvMo8AMO4fDw
         el1UJlRAFY2j1kJzV7Vsq7xlESUQqt1Y5ERxDlaWEQ81UPs3Sk60bOK5sZzRvQue1xdT
         7ZsfDhME+HzQT1w5msFInmGSnuYWM1zWpcqX79H7DzqSXfSC92bENCVPlrxjT07sDxyY
         Yg2FR1fk60s+jeWFW7wt15mEPUBaGTVnCXTtkqEBuy4uyT2cOm75X5SLhAqu3vrGMmt7
         4rkAb2shxMfZk2hK63WS1YclSOBU7sig5VL06aBrJATlWzLFF3NkKb1HQ/L9+YTpIC0b
         lazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703125370; x=1703730170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8U74JSUiFPUq6aX251EH/7awoyRYogfb0vLzXz4t6r0=;
        b=WgtrXv0upzBxyp/gAKEkKZGxVkqv7zW8PfCPftFbhDJsei4Z5z0UyRQrORPQyS4u1O
         uB9zt6Oafx/+/fU9lp03+zXjWaKuLH85ihCRyhT9bAlOc+o7P0XGwuXua5gEh/CqXDsP
         1zfXBUh6r2IOKOz0A7uvWvoiIbNXdoV+F+iZuj1XoGA3p5/qkrrJxKRqyfmX3ez+/b70
         a/a2kE57BhGXJoFDeP/OAR61zqwxxzRGqduSLo4LPGlYYjwW7tfBucptsh4OZOMSA7cH
         r0aAnoW7A7K+yqGXsyA+47bscdkLOwyQYv+RpB3ri9XnPRSs4d5jlsa+fvS4q7SSG0X4
         FWNw==
X-Gm-Message-State: AOJu0Ywf0WkF9CYgGmkOZ7/RBGfWp0gAR1TRWBCkuIc+jllUIRDZLySH
	tZCyB/mOtOg0qteaO4DXVDk=
X-Google-Smtp-Source: AGHT+IFf5EGXSOF1pa3ZoJCX9WENVMQL7ohlYN5+hoBVEW4+5UGF4+4MdyQtofede2y5q37emcU6FQ==
X-Received: by 2002:a17:902:d509:b0:1d0:c0d3:5b8 with SMTP id b9-20020a170902d50900b001d0c0d305b8mr26775817plg.71.1703125370482;
        Wed, 20 Dec 2023 18:22:50 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id e3-20020a170902b78300b001d051725d09sm389875pls.241.2023.12.20.18.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:22:50 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: msp3400: Use wait_event_freezable_timeout() in msp_sleep()
Date: Thu, 21 Dec 2023 10:22:27 +0800
Message-Id: <20231221022228.548473-3-haokexin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221022228.548473-1-haokexin@gmail.com>
References: <20231221022228.548473-1-haokexin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The msp_sleep() is nearly open-coded wait_event_interruptible_timeout(),
and a freezable kernel thread can enter frozen state during freezing by
either calling try_to_freeze() or using wait_event_freezable() and its
variants. So we can reimplement msp_sleep() to simply invoke
a wait_event_freezable_timeout() and then eliminate a call to
try_to_freeze().

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 20 ++++++--------------
 drivers/media/i2c/msp3400-driver.h |  2 +-
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 0ed8561edfee..205bdaf553ca 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -309,23 +309,15 @@ static void msp_wake_thread(struct i2c_client *client)
 	wake_up_interruptible(&state->wq);
 }
 
-int msp_sleep(struct msp_state *state, int timeout)
+int msp_sleep(struct msp_state *state, int msec)
 {
-	DECLARE_WAITQUEUE(wait, current);
+	long timeout;
 
-	add_wait_queue(&state->wq, &wait);
-	if (!kthread_should_stop()) {
-		if (timeout < 0) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule();
-		} else {
-			schedule_timeout_interruptible
-						(msecs_to_jiffies(timeout));
-		}
-	}
+	timeout = msec < 0 ? MAX_SCHEDULE_TIMEOUT:msecs_to_jiffies(msec);
+
+	wait_event_freezable_timeout(state->wq, kthread_should_stop() ||
+				     state->restart, timeout);
 
-	remove_wait_queue(&state->wq, &wait);
-	try_to_freeze();
 	return state->restart;
 }
 
diff --git a/drivers/media/i2c/msp3400-driver.h b/drivers/media/i2c/msp3400-driver.h
index 2bb9d5ff1bbd..7d391714ea52 100644
--- a/drivers/media/i2c/msp3400-driver.h
+++ b/drivers/media/i2c/msp3400-driver.h
@@ -134,7 +134,7 @@ int msp_read_dsp(struct i2c_client *client, int addr);
 int msp_reset(struct i2c_client *client);
 void msp_set_scart(struct i2c_client *client, int in, int out);
 void msp_update_volume(struct msp_state *state);
-int msp_sleep(struct msp_state *state, int timeout);
+int msp_sleep(struct msp_state *state, int msec);
 
 /* msp3400-kthreads.c */
 const char *msp_standard_std_name(int std);
-- 
2.39.2


