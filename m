Return-Path: <linux-media+bounces-31271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D9AA06D2
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 11:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BF665A60CE
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 09:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C052BD58E;
	Tue, 29 Apr 2025 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsBlTa9P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B727BF78;
	Tue, 29 Apr 2025 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918191; cv=none; b=u5UIPigtqJB5c2Sc5uPRrGscFnr2pAV54vo7M1b/NKKagMr7C15DRFloCca6QMYSX0Hae0Lutor632OdGmS4NTc4+C2oUmsiN2Nj4Mjx30jurA7jGXe2Uk4S5QIPiZcMm9CwT5EcaGokoqQvjG/eCXwGMnWvYWwhBy/jtL6QKYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918191; c=relaxed/simple;
	bh=NAEbP7fRomo4JfcwN55K3NaT+Q36Rxcp0RL+NF47DZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0uNVRUoWc7+aAXjpVyD+aEx1jLtS3j2MbBPb3fw5KxnZLmKHEZ6tI0SmuxbKjaSyKVtV9Oly9xwE5iqBxAqGxDOPWGjjWxUblYLx+XQ4qVwzlxMnnMQVQub5lUWzFQTEsZbuptwbIBBFNXSMildlIaQbSoZFeNTIVYLNZWCPHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsBlTa9P; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso26135825e9.3;
        Tue, 29 Apr 2025 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745918188; x=1746522988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQgqeIE20qcWUkjn5kpvuUTNELcnY3yRmwDJxRstXRI=;
        b=EsBlTa9PpWskTaY9mLpRYonOl1ClZ9fZwaPoGdV5PpBTzR0aiCFXkpWEebBfRIoSjS
         lt4qxgAdXt+sfq8KF3tFd5VgleLLFzCHglC400wWAHr7IZs4WV1mJqV8arBpioxGPpYQ
         H7nC6Tgd4kqT3u1pARp4RB/yEYfVJGnfpDCwi+kUhZY7ZKto67rOrKtkVyw+8JkIVpm+
         lD9J4n+w9/DP2wWKo+foffCthLcvKp5kNQfIszLyZvWwsbrCrvaIAbrul7/fh+Z80BVh
         dF5dj5zrABMzXShd1Fpu2gfnMAzfPVaRZL/ginjb4DZvs8apiRQTV7hQhPNGVF3Fl0AE
         r0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918188; x=1746522988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQgqeIE20qcWUkjn5kpvuUTNELcnY3yRmwDJxRstXRI=;
        b=CfejvQ7vhinEOPWpP6eQOcqPy2qCwhcnwBxhPuF0mXMk1iMnAU0+hKtb5tKdxmzL3C
         0NgAsj1ds0WD4CXJxZMu4g1KMywSAkau7Zv+8vt38XRcTiencFzRYPbEz178A2Z/pBbw
         xuQAT7OCoemvUUGrlD+ZuVDF8oNlGri1TnyFaoJ0aWY1btdre/M11TS8yjI18jEkFI5T
         pGZBbtjMQz8RhfAZKZKAv921pGnX64oJbIUfMJxEISEt7ku1wpDSt4dCYpp3mIx6WL/U
         5Fj4yzsTzjgbfl3Lk3NT4RfY9+okgpaYosx65YjP2yE6zphvblhi0pkxh58IXYtN++Yo
         WEBA==
X-Forwarded-Encrypted: i=1; AJvYcCV4qaOLdM1mHf4Yahr3w6hxxxNiRufxIqA0BQdeFZtSMfdB2i+sTOqQ9MgWOH5WqzkSjNDqz2ZfkUswVbTTQ1rL6yg=@vger.kernel.org, AJvYcCVR5v9v2ZDTKSInm5IJnYVhmLoe/4vOHvaG14p/nbbQnka4CLGeh3+DX+lryy2a++Aolf0si/6NbOCSfeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHh/bYNFLYk6x77qiYSMB6fe9ojzysmj0HI5i2/mCcxnM9X7zD
	d9yhV1mYtxll3GqMhkxfQu1PIelc9JQjLFqjc2gSMuW123qJah8j
X-Gm-Gg: ASbGncvRakgGmGA1o6wTrfs1Gsxui0VeGbRxbOpHMgg7RFPn0a23C05t+354KyI5Inz
	SMJ5RPJt0UYv5aEGsYj/Lzizd5Ww4UcODBvdw1d5f1sWOtBM69e9/1miyaReEmjOUme26NTL1ov
	iO2LbjwfUVusi6z7QG2Wun/vfP/lgqf0QkMGxKhUcFdcti4LYWY7S9KvlfCj05fMqu0qoNoBF3P
	CxN4tfvjJK0XhC9VsJhqor30wT5RR8NVxtH1Wcma2j9LeiWQU2D9J0iTiK8qc0KBz8TU5lLW0++
	wSdOQ6b1kyZS2wKOSff4uXj7a8VfzX4b1I85YAe5hjxZMnkmkEKVrfLWH4+qEwIe+A==
X-Google-Smtp-Source: AGHT+IEWPS97pa23Q+r0qqTjDqX42MUH8p1K2+P5cj7Z5U4KR39HXiA+sKRSD0amTVgv0wVaS/puXg==
X-Received: by 2002:a05:600c:1c96:b0:43c:fb36:d296 with SMTP id 5b1f17b1804b1-440ab845facmr89778095e9.25.1745918187708;
        Tue, 29 Apr 2025 02:16:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2ea7:2f5b:5fec:29c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1ddsm151103945e9.30.2025.04.29.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:16:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 1/2] media: renesas: rzg2l-cru: Simplify FIFO empty check
Date: Tue, 29 Apr 2025 10:16:08 +0100
Message-ID: <20250429091609.9947-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Collapse FIFO empty helper into a single return statement by removing the
redundant `if (amnfifopntr_w == amnfifopntr_r_y) return true;` path. Make
`rzg2l_fifo_empty()` directly return `amnfifopntr_w == amnfifopntr_r_y`
to improve readability without changing behavior.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mountain/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 067c6af14e95..3d0810b3c35e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 	amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
 	amnfifopntr_r_y =
 		(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
-	if (amnfifopntr_w == amnfifopntr_r_y)
-		return true;
 
 	return amnfifopntr_w == amnfifopntr_r_y;
 }
-- 
2.49.0


