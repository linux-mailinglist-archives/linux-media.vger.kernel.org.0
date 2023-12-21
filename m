Return-Path: <linux-media+bounces-2831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B53981AC97
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 03:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD4531C228FA
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 02:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAA0258B;
	Thu, 21 Dec 2023 02:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LF6RsNS/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3481C0F
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 02:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b9dbbaa9a9so249835b6e.2
        for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 18:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703125366; x=1703730166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UO+2TdoS4we9dd2Hdft9264jQMDRApGFf7W/pstXFA=;
        b=LF6RsNS/3q+nuBpa+T6E5T1fOqyq+SBFSLH6gKBYS9WW/3gRT9i4SLKVRAz/z3PK9E
         MsraxVsYh952s1WayadWjJuwDBzAyW24rfXL/04ZEufgj/UATW7/HmcKROGL3PLcLWKq
         83qg8hiW8Ak2/JkVZPkKLsr8yfUdixX1PJCManfojMKulkx1JsVrdBHpWdzCSHk5h9Dp
         fq7XwXgP3JJ8z2kTMBL1sxxUC5gx0PWk7ute1lVnxNSAaUyG7GNRZIkqoD27s5g3S88x
         XEMGkPGXOZeM/nEkLC2XT+0AuVbRrmmSXPAeDz3GMH0d9S4OCf6hSTTbAPl6Hh4Zjb3T
         zClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703125366; x=1703730166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UO+2TdoS4we9dd2Hdft9264jQMDRApGFf7W/pstXFA=;
        b=mhtOa7TVtJuNoclxvFaWuuALGZ0nFjsD/4q3kRrhnuAvmAx2a13h91G0jgvqYxiTzy
         FlvJRntcfwLJAxZcu9le7CybBCHUSDMOvKUWgJCS/Lrh1vBLVMnvlB0SKctT7EPmBJX2
         nzTMNHPx0FwDH831E07ZX1KbUD3x5gAfTxD9flwZzfyHRK7xWv9UXvspBmJZor/diUW7
         HAoTsZkdCT3OZMQSUJ7P1FCw6mU/dxNW1/GdGnxlg6AZk8uL6FXsP6j3m3NXNR+fd49R
         YqAaumMZ5tLUmQkccDAz65YIzvHeyytxEFY4SYVIE+7PTIw6kLEtdG71z4P9LDS+Wq/y
         BinQ==
X-Gm-Message-State: AOJu0YyyduijIVx72O9nMIaLubSXIIpyWvV7+5PoW1r6P/3Bx/kAHwrX
	NmdCxQ6TfB912wK5/iUIjM0=
X-Google-Smtp-Source: AGHT+IGDx7oLyZy/y/sAvRBNOhsjdeayPDjz4NmsYaww4XU5zrbT/MOSyoAvU+IjkgDBAyoCrpkBbQ==
X-Received: by 2002:a05:6808:1902:b0:3b9:e566:d4db with SMTP id bf2-20020a056808190200b003b9e566d4dbmr30026790oib.78.1703125366140;
        Wed, 20 Dec 2023 18:22:46 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id e3-20020a170902b78300b001d051725d09sm389875pls.241.2023.12.20.18.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:22:45 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/3] media: dvb_frontend: Use wait_event_freezable_timeout() for freezable kthread
Date: Thu, 21 Dec 2023 10:22:26 +0800
Message-Id: <20231221022228.548473-2-haokexin@gmail.com>
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

A freezable kernel thread can enter frozen state during freezing by
either calling try_to_freeze() or using wait_event_freezable() and its
variants. So for the following snippet of code in a kernel thread loop:
  wait_event_interruptible_timeout();
  try_to_freeze();

We can change it to a simple wait_event_freezable_timeout() and
then eliminate a function call.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/media/dvb-core/dvb_frontend.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 9293b058ab99..1f34441cc09a 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -679,12 +679,10 @@ static int dvb_frontend_thread(void *data)
 	set_freezable();
 	while (1) {
 		up(&fepriv->sem);	    /* is locked when we enter the thread... */
-restart:
-		wait_event_interruptible_timeout(fepriv->wait_queue,
-						 dvb_frontend_should_wakeup(fe) ||
-						 kthread_should_stop() ||
-						 freezing(current),
-			fepriv->delay);
+		wait_event_freezable_timeout(fepriv->wait_queue,
+					     dvb_frontend_should_wakeup(fe) ||
+					     kthread_should_stop(),
+					     fepriv->delay);
 
 		if (kthread_should_stop() || dvb_frontend_is_exiting(fe)) {
 			/* got signal or quitting */
@@ -694,9 +692,6 @@ static int dvb_frontend_thread(void *data)
 			break;
 		}
 
-		if (try_to_freeze())
-			goto restart;
-
 		if (down_interruptible(&fepriv->sem))
 			break;
 
-- 
2.39.2


