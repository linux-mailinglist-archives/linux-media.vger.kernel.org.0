Return-Path: <linux-media+bounces-29578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C33DA7F462
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 07:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 460363A9057
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 05:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A7923ED60;
	Tue,  8 Apr 2025 05:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMwzWT0t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE76322B;
	Tue,  8 Apr 2025 05:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091341; cv=none; b=CvxDxP7weKLQOxAHN3AYtEw3xeZlkyH8gt1lWXTS3W+nTuLGrUoGK/JKK3w1t00dxGgIGic6JeMujhQUFAJ4uFHPzl3pwc+yzxwyG/S3bRWys9F9opfdjVcl0ZbrqERgf/TkgW8Qw+QcsUD2PWXJQHgXYUnKpZWJztbegdjppt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091341; c=relaxed/simple;
	bh=RS4y4uVxjaKGuaK73r43Jh0t8huEq2LPiqqw/cBwPQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mgYLw6LciZTw2ANJ+tWkKcVvVU+iVPwEfxdJ9akqNlwoh/MoZMSaC7HlyeCIFoJrmtIDzQ5EsLxgZnQQ15YnqxH9cuO3SkeV4Mod52dZGA46Bc78QnlOhUjiWGszTj6kA5j1Ry/Gv//7QMo8DcIRJ7ZhAxzoQzZt7jbOow+dpC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMwzWT0t; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22401f4d35aso56427965ad.2;
        Mon, 07 Apr 2025 22:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744091339; x=1744696139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMh/1IYC1/u6DKKOw2ms/3tpOZM3Bu58eEc2wmPyXZA=;
        b=TMwzWT0t1kJaJ12bAx+yW+B4ZPNChVtJVyrzCanBeFOdNX41gliYa/iCqDkJFFua9p
         28dxiiO9pqpg65MtInC1yT+bUYeU6HVbJH3ovU57ZmWGSV0vsZcTmjWqsUZzQdTd0HBM
         xjDfdpeqtRC7aC3QIoCLBD5frVcFtGrYe630R6Ouxm7UztjpWIQLfAbgjiuxtwpjI0S8
         HdT4QMAsXRmt3czoxf5vs8A02n92viOmmcbBbLNtLs9fA2agZukQYEynXynMs0gmRUOH
         ntGGaxMxpKBgeQFv2pNq3sBvx4DOdcfM4GpO6IpfAasZwevqYopAja/HmoesnHCQtzDk
         XfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091339; x=1744696139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMh/1IYC1/u6DKKOw2ms/3tpOZM3Bu58eEc2wmPyXZA=;
        b=aV+0hxUdmHbvXZ4mrd5QQk0PrX/A+A3MKDizS8cYa8vWBasjBBWSOEVMejoeRCrSxR
         U6T+JYs6kvD2BrKH0dAzGl+52fdaThoNyrRFx8Bi4Fquks9oKnSZGLcy1aaFwBXmtcZi
         0tV8v+B3nQV8mZUdMwgZ9No1UWYrh6pLyNnKSrwCu3UP/0Y9dpSF/ALvAbPdy2lDT4PX
         Q2jmgvYXDvGKe/CcYYbyzvloxCqa603WdsY3pT3u502pEtA/6Y2NKbSPFpnkAdkWGcGM
         vknufzbFyEwzToJggcGMHVfQjqYlI5lub9ddXOYGo4y15gOgY+az+RrLyntA8PvaNAn4
         6WqA==
X-Forwarded-Encrypted: i=1; AJvYcCW83M9z65MKI+DXs532eVAoNj4Wq99toPZ9IysdHmDs7zl8dytdh2bLZ1c8W74tuseSJCkw4mTX8vcVIyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJXjDGJoUaIcyX5L8CQraS2419Z/NPXBigqifLTTlY2sOyNz0W
	iAWklryTDTP52ZByGBtlcTEiRWJ3UtH6Sjydr5v1UyoOrFxOunciv1p9xCBh
X-Gm-Gg: ASbGncv9ZwKS7XQzT350RCLEcnkv5kEy5lKxcJ94odkhjxyiPY6lmO/gyxK+/drsNBE
	p8KuYbQ1rJVDjde2j9sEZo1t/sWBY3GLyogErianBClOz5gbhz/L0GMWITQ2Pn6ibsM6ddVk8RC
	uTXkFokntOnTxW03aoTpgGXgaHVaGklVsD7TLEElUVtVJbElstojyLS/t091LaxtFV5fzBzXn09
	XxZRrd8tMEeDHauodfbrFaqSdjqGM6V9fkUggDVoMRa9rjcWd8U0yi4vqYn2wmRczcaGGU9sPEz
	qRK5wAtzePdNoC6Jx7MxNmFk6HtZ9OJf4QGvgMDV0mwr1hDnTM/ZaWGXa/ZKfz9vIGUhsRF8Ay/
	wSC/Y4OBBfw+dbDVl
X-Google-Smtp-Source: AGHT+IEHFO5C7dTJpKvZbOu72CFtYS1ry7Pw+NiDt85wQoNOEA4vc4Tej0qtHWHx8Lq2UnSIkPjYpQ==
X-Received: by 2002:a17:903:2310:b0:215:bc30:c952 with SMTP id d9443c01a7336-22a955166d3mr144831445ad.6.1744091338760;
        Mon, 07 Apr 2025 22:48:58 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c27b3sm92124515ad.97.2025.04.07.22.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:48:58 -0700 (PDT)
From: Michael Chang <zhang971090220@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org,
	zhang971090220@gmail.com
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND] media: nuvoton: npcm-video: Fix stuck due to no video signal error
Date: Tue,  8 Apr 2025 13:48:39 +0800
Message-Id: <20250408054839.3420989-1-zhang971090220@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the issue when start_frame and detect_resolution
functions are executed at the same time, which may cause driver
stops capturing due to status of no video signal error.

Signed-off-by: Michael Chang <zhang971090220@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 024cd8ee1709..234fdec04f74 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -863,7 +863,6 @@ static void npcm_video_detect_resolution(struct npcm_video *video)
 	struct regmap *gfxi = video->gfx_regmap;
 	unsigned int dispst;
 
-	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 	det->width = npcm_video_hres(video);
 	det->height = npcm_video_vres(video);
 
@@ -892,12 +891,16 @@ static void npcm_video_detect_resolution(struct npcm_video *video)
 		clear_bit(VIDEO_RES_CHANGING, &video->flags);
 	}
 
-	if (det->width && det->height)
+	if (det->width && det->height) {
 		video->v4l2_input_status = 0;
-
-	dev_dbg(video->dev, "Got resolution[%dx%d] -> [%dx%d], status %d\n",
-		act->width, act->height, det->width, det->height,
-		video->v4l2_input_status);
+		dev_dbg(video->dev, "Got resolution[%dx%d] -> [%dx%d], status %d\n",
+			act->width, act->height, det->width, det->height,
+			video->v4l2_input_status);
+	} else {
+		video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
+		dev_err(video->dev, "Got invalid resolution[%dx%d]\n", det->width,
+			det->height);
+	}
 }
 
 static int npcm_video_set_resolution(struct npcm_video *video,
-- 
2.34.1


