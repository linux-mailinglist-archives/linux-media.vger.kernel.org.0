Return-Path: <linux-media+bounces-30243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2497A89E51
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C57FD443134
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 12:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA54A2949FF;
	Tue, 15 Apr 2025 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLOp8zQX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59D22F01;
	Tue, 15 Apr 2025 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720800; cv=none; b=Yz/v5myjtyt84jnPWejjKHxzGu3AQtgD7ct5vpfvUi9Xl3DxhfVUaNGkww0Fl5YOWAJDmDOPX90iWgqtQ2UEjtBae4ug5/VKFirAEmfttXY3HAtmqAdQ/msix/4jJa35jn24aCLP0zrADFyFCbakm30tN4HKAsrtYR1mWNXQBd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720800; c=relaxed/simple;
	bh=t1kou4M8X297Aad+caa6GBhyKnczwsX+gDFBhuB55m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pTzQl/vKIMOgyKWJypgWZxptQUQT3pPexZKtX+ArmL48m+qWB/kyzkSgxk95Nw6KZM2F8asNgtdPx+3Niz0t0fzYlJs7OgVz6X135p8dmllAyOLSghoHjwP6M5dxx5/0k5Dik0hylKRWJx7fFf8ZReZa78wcxf6rXZpyYr0kODo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLOp8zQX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39d83782ef6so4213266f8f.0;
        Tue, 15 Apr 2025 05:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744720797; x=1745325597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9hVPDb1RM67wHiurj3uzHcX5sDObVhpjzOPgy4uCpM=;
        b=eLOp8zQXtLgEDVA8f/UjsKvxT28iqgV3CKJDV1nG4Hzp+0YMn52mVLsqtCmH+tf+nC
         1gefJyHu4iLJXMNvII4lpEVKX86Agz9uH8TQrsBitNUxK+xm0/R42Bm8UrLoPzze4Dt4
         POoRQOBX3eRuKSStYCnZAi1L8CbB75GMf7uODBELMQNZ86dEzWUeEl1f6WyO662cBBJ6
         P173HKcoKE4gq6/QTdM/ZOTg4jY8zoTTJ/UIT4V8OHjITgGhGW2Y8l+fJluthmq+Mudz
         UJK9GEwveozJSI27i0FQVvlFxepGncudNMw1AKS7ScTUnSWGrb23ARnznKOsoKvmS5nV
         x1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720797; x=1745325597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9hVPDb1RM67wHiurj3uzHcX5sDObVhpjzOPgy4uCpM=;
        b=EL8ECfq8wgBwLEWLlaMVe1gQ+Tu9tMQzzy20lmVC+V6O/1R3bKdCYvoTGcw3asog/w
         mj+SAQcO01mYiS0UTHMzyOwzj3nQDAncPX2CrWzSuxNNXY3d28163YENOUS1+HtFP/7U
         P9v0qbMNI3K4J8lc4S/Bm/calkdkFs31zYzpT+jF4MGXUNLrWlFPRv7JsKVHdp5pmNZv
         grbkl4F6PDzBIPhArximbsxOwqlD4YVYU9wVpuMAv3t4WM/FYtBdn74sZ71eMXPwsPjk
         FpTNXhD3kn2LvomRAFTP8Bn2nWzssvGHZ0yu7XCe37i5CpgWkKrIZ4a1zIqFhnOksCzM
         jjcA==
X-Forwarded-Encrypted: i=1; AJvYcCUKhOwXUtbVr/Vp57VFggLcOCQAUAfyWwUsI4QhZVKm3RdxK5iARyn2YdSBBdb9BHJPA2q+Sbp2qrW8hWdS@vger.kernel.org, AJvYcCXhE39mvXDD+U2Lqpp3BL5MznLiFrXv7dirExAhkMm9ODyNldyThgGvg9gclz7mYSzH78v1dRdA+VJHshYty0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV+4ov5TZ765dCWgYaF4NONV7yspBoXWjZUDrLn+TxVDAaiRMR
	8GRIZutyx3XUWB/ffsSohVVNhK8KIME2zK88xPpfiwOG9FpIrfxl
X-Gm-Gg: ASbGncs1EF5OEdVWoiPxYKGVzkmMFgdAU0LQ1RiJqZTjvnbh5pmqQD0QPNDYk3z81no
	lEqr6JV93LoVeNIXQ74zH/uAphDtTUInsJaHnR+NQAT/wrGN9FSt6qdEBE5ESBXG3xxGuwTlHel
	u74hsX8BdL/XJWzTHA2VsWAyFQQ5Hs7d78vm3wii8Qwqrc/fLE++56R1L4ODQz89Os95P+3UJke
	lD9RkMlygBJ7/5SGCzynG763trxB15Fbg1pPts1oVWgWCGwEc85zOYN+bs1u6t/ZwPYFRxIk2dG
	gQUsulg5C0QDGrGCTwCFJZ9XBn5s7uSXDcSInAS3zi9kurUdukrKeOU=
X-Google-Smtp-Source: AGHT+IHYSdt9pTasjIPhxubmU/E7a5prFsj10ow1xBwQi1o756hKjk73AI9GctSNBy9NpEjOxkAqtw==
X-Received: by 2002:a05:6000:2582:b0:39c:e0e:b7ea with SMTP id ffacd0b85a97d-39edc311dabmr2526257f8f.20.1744720796513;
        Tue, 15 Apr 2025 05:39:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:a041:e0ba:3a00:c718:382c:d2c:5124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979663sm14547128f8f.51.2025.04.15.05.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:39:56 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Dr . David Alan Gilbert" <linux@treblig.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] media: dvb: Fix typos bloc -> block
Date: Tue, 15 Apr 2025 15:38:55 +0300
Message-ID: <20250415123952.16802-1-algonell@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some typos in comments / dprintk messages: bloc -> block.

Fix them via codespell.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/media/dvb-frontends/dib7000p.c | 4 ++--
 drivers/media/dvb-frontends/dib8000.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib7000p.c b/drivers/media/dvb-frontends/dib7000p.c
index c5582d4fa5be..b40daf242046 100644
--- a/drivers/media/dvb-frontends/dib7000p.c
+++ b/drivers/media/dvb-frontends/dib7000p.c
@@ -2630,7 +2630,7 @@ static int dib7090_set_output_mode(struct dvb_frontend *fe, int mode)
 			dib7090_configMpegMux(state, 3, 1, 1);
 			dib7090_setHostBusMux(state, MPEG_ON_HOSTBUS);
 		} else {/* Use Smooth block */
-			dprintk("setting output mode TS_SERIAL using Smooth bloc\n");
+			dprintk("setting output mode TS_SERIAL using Smooth block\n");
 			dib7090_setHostBusMux(state, DEMOUT_ON_HOSTBUS);
 			outreg |= (2<<6) | (0 << 1);
 		}
@@ -2654,7 +2654,7 @@ static int dib7090_set_output_mode(struct dvb_frontend *fe, int mode)
 		outreg |= (1<<6);
 		break;
 
-	case OUTMODE_MPEG2_FIFO:	/* Using Smooth block because not supported by new Mpeg Mux bloc */
+	case OUTMODE_MPEG2_FIFO:	/* Using Smooth block because not supported by new Mpeg Mux block */
 		dprintk("setting output mode TS_FIFO using Smooth block\n");
 		dib7090_setHostBusMux(state, DEMOUT_ON_HOSTBUS);
 		outreg |= (5<<6);
diff --git a/drivers/media/dvb-frontends/dib8000.c b/drivers/media/dvb-frontends/dib8000.c
index cfe59c3255f7..ae438bd80317 100644
--- a/drivers/media/dvb-frontends/dib8000.c
+++ b/drivers/media/dvb-frontends/dib8000.c
@@ -1584,7 +1584,7 @@ static int dib8096p_set_output_mode(struct dvb_frontend *fe, int mode)
 				dib8096p_configMpegMux(state, 3, 1, 1);
 				dib8096p_setHostBusMux(state, MPEG_ON_HOSTBUS);
 			} else {/* Use Smooth block */
-				dprintk("dib8096P setting output mode TS_SERIAL using Smooth bloc\n");
+				dprintk("dib8096P setting output mode TS_SERIAL using Smooth block\n");
 				dib8096p_setHostBusMux(state,
 						DEMOUT_ON_HOSTBUS);
 				outreg |= (2 << 6) | (0 << 1);
@@ -1612,7 +1612,7 @@ static int dib8096p_set_output_mode(struct dvb_frontend *fe, int mode)
 
 	case OUTMODE_MPEG2_FIFO:
 			/* Using Smooth block because not supported
-			   by new Mpeg Mux bloc */
+			   by new Mpeg Mux block */
 			dprintk("dib8096P setting output mode TS_FIFO using Smooth block\n");
 			dib8096p_setHostBusMux(state, DEMOUT_ON_HOSTBUS);
 			outreg |= (5 << 6);
-- 
2.49.0


