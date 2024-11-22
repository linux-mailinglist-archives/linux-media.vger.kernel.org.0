Return-Path: <linux-media+bounces-21847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FC9D6166
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 16:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC1C92825DA
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 15:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9FE1DEFFC;
	Fri, 22 Nov 2024 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2rZWVwi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230D11DED42;
	Fri, 22 Nov 2024 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732289628; cv=none; b=lRM0TzBuvuE605DhNa3/ZQxXVI/8riGuO7Pembh0Beisj/FWiuWWZFv9TJ0ZXDlV2FAGtEHo2rO9hSvEkbiMgzHeixRu/vnieuwoKhVR/aToBH7B7usqiwXxRm1wrIIDkiiMlvb9vs5Ascpl5Welck+B82+KixBkpfNfR4ncTJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732289628; c=relaxed/simple;
	bh=xo4+kV5E+2M6xeLkNvQZ0TIbYdb7KdEbAANZfKC+f3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c2pG96Rp9rk0gdE0MaRwCQn5QWOj7Zza8eQmzlCf8PMk2DHOr8+V0475NVG3l0DF23Bw7KxKam3d500ZRRgQa5qdchxN/6hdCqfiTuMU+W50/pejBcvZnCxFzG5oCwNZ++LEHQPuySqrCEZxsaEcjzYh1U3Nl5KrCPS572Cr9FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2rZWVwi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316cce103dso25838225e9.3;
        Fri, 22 Nov 2024 07:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732289625; x=1732894425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLiYpBi20EG9O8tFy3xQ55Bkp776aj9iVlBPP58TR1g=;
        b=T2rZWVwi4m5mjRDGhpEojcoeCQrqwHJJ8DbeIw7D0/EBarYhJDRDDFlfEsX2cg1YR+
         mdKqgN3EKDIbKefbqCXbTQ76+ibhfrHctt9teXZ46wVUkeE3jZ3DXSthZJdDehzqGhjE
         ILdk2qzUEsjuwYmhrW2Db9b8sx5nyDKYA21eN6aOrHoMNcFXZpQGM5uLNkVd/cW932E4
         sdCFu3VYDlcadWV4S96UECQgaHRTav75Vdo+1XmBueaZS9MF7EeZaF4ApGND3MmVosqs
         t24JzvN5gWROCeJBjihxr6II2KnjgEukM9/oOLuvka4FdaGrfSx4DyTdLLFUdcbOfl3o
         HCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732289625; x=1732894425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLiYpBi20EG9O8tFy3xQ55Bkp776aj9iVlBPP58TR1g=;
        b=c6erKjwUTVZktFWS4XkJKJy8/wT9zmKzQQpUO5mPC6zTSXoOE8lVA7JndIW6hwUaUi
         n5F95vEFB0O2whtz6AWUA8qdicnfuuuuZk62LjcTvoeFO8ENThvCNb/Ql3lKfurAtkdl
         C7Nt1FZe5ZKRyWI/0jYy8dXVewvEPibpW3QNhp8x8ODhq/gPcrmHCpU5hAFnBErJah65
         KMhdD9tHVf5M92JyXqMabIgI4sLzbjgCl0fqYyc62HTiOxf9RFx0m2JLCrlJUePnd4E1
         g4btg2YcPdgbrKwUjALg3ayS/bILDsCMEfw97+vYryIYL+liY5hG4rcQF6HTMa52r2Vi
         H8DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVItvTCLIXMppkEKG1e4wGNhblDKI0ZU/P8b+icQOz7qP0JsyltZBAyIuUtHcaxFh9E8p8EcVCRxNCkyEQ=@vger.kernel.org, AJvYcCWnd+OVrIqo/RAEKK/5bkkWGwphXyxSW4nklyb8IYirGmJTTa4awrSpIOYDMJQZPAoFmf1vUFKFIV2yUV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwabbMGfySWsGW81CXc2VTf21HlNklVzHPua5sAlQ6KsV0/fBDZ
	rzCZtLQ/ScC23hi0/42xxyJLe8ZuQgEgpDCSKldncmJurBTc7h63
X-Gm-Gg: ASbGncsgCNO5cneznXBgE6SQcVUgb/YEHcg5TKPWK63c74BjxopDa/Xr3rW/aTgbvSs
	pq5Y1fgxVs+kpPWmvy1ZoVCI7kkLW/XYBFkU+Ug+ythb0isM8+nHgtugDGK8YFpvXyp9lH+nEVR
	sdS/TdkTVXPXaVmQRYmPGONZXeF7qdJ4RRH9HNqQ/tN39fP4OaJaUgw9UrVUG3OIkQnICkEuket
	45oY4CIyuDFjJ9QqKZdWCNLQc7n8SSzwOfs74npRZ7cbpe/j12Bcd8B4kYZbA1d
X-Google-Smtp-Source: AGHT+IF3Jtg8QbMZ7RR1dlvXDquSxeBjyFrAYm5xZbRfvAhnQ6d14MlqNDynyDcQWJfM7FtpW0xlXQ==
X-Received: by 2002:a05:600c:1909:b0:431:9a26:3cf6 with SMTP id 5b1f17b1804b1-433ce41047fmr34406135e9.4.1732289625323;
        Fri, 22 Nov 2024 07:33:45 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.131.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d395asm93484475e9.19.2024.11.22.07.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 07:33:44 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l: subdev: Use dev_err() to print errors and clarify
Date: Fri, 22 Nov 2024 17:33:39 +0200
Message-ID: <20241122153343.237308-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error values end up being returned to userspace, it makes sense to
have some useful information printed when debugging them, even if the
reason for the errors are bad configs or internal driver issues.

Replace dev_dbg() with dev_err() for errors.

Also, when using complex pipelines with multiple bridges between the
video device and multiple source sub devices, printing just the video
device name for each error does not provide enough context as to which
operation failed.

Add sub device entity name to the messages where possible to clarify the
source of the errors.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4f0eecd7fd66f..d51b4594d11c5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2303,20 +2303,21 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 				    &found_streams, &enabled_streams);
 
 	if (found_streams != streams_mask) {
-		dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
+		dev_err(dev, "streams 0x%llx not found on %s:%u\n",
 			streams_mask & ~found_streams, sd->entity.name, pad);
 		ret = -EINVAL;
 		goto done;
 	}
 
 	if (enabled_streams) {
-		dev_dbg(dev, "streams 0x%llx already enabled on %s:%u\n",
+		dev_err(dev, "streams 0x%llx already enabled on %s:%u\n",
 			enabled_streams, sd->entity.name, pad);
 		ret = -EALREADY;
 		goto done;
 	}
 
-	dev_dbg(dev, "enable streams %u:%#llx\n", pad, streams_mask);
+	dev_dbg(dev, "enable streams %s:%u:%#llx\n",
+		sd->entity.name, pad, streams_mask);
 
 	already_streaming = v4l2_subdev_is_streaming(sd);
 
@@ -2333,8 +2334,8 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 	}
 
 	if (ret) {
-		dev_dbg(dev, "enable streams %u:%#llx failed: %d\n", pad,
-			streams_mask, ret);
+		dev_err(dev, "enable streams %s:%u:%#llx failed: %d\n",
+			sd->entity.name, pad, streams_mask, ret);
 		goto done;
 	}
 
@@ -2403,20 +2404,21 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 				    &found_streams, &enabled_streams);
 
 	if (found_streams != streams_mask) {
-		dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
+		dev_err(dev, "streams 0x%llx not found on %s:%u\n",
 			streams_mask & ~found_streams, sd->entity.name, pad);
 		ret = -EINVAL;
 		goto done;
 	}
 
 	if (enabled_streams != streams_mask) {
-		dev_dbg(dev, "streams 0x%llx already disabled on %s:%u\n",
+		dev_err(dev, "streams 0x%llx already disabled on %s:%u\n",
 			streams_mask & ~enabled_streams, sd->entity.name, pad);
 		ret = -EALREADY;
 		goto done;
 	}
 
-	dev_dbg(dev, "disable streams %u:%#llx\n", pad, streams_mask);
+	dev_dbg(dev, "disable streams %s:%u:%#llx\n",
+		sd->entity.name, pad, streams_mask);
 
 	if (!use_s_stream) {
 		/* Call the .disable_streams() operation. */
@@ -2432,8 +2434,8 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 	}
 
 	if (ret) {
-		dev_dbg(dev, "disable streams %u:%#llx failed: %d\n", pad,
-			streams_mask, ret);
+		dev_err(dev, "disable streams %s:%u:%#llx failed: %d\n",
+			sd->entity.name, pad, streams_mask, ret);
 		goto done;
 	}
 
-- 
2.47.0


