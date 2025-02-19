Return-Path: <linux-media+bounces-26406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37317A3C83A
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 20:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC1937A51A1
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 19:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B45214A9A;
	Wed, 19 Feb 2025 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJtXkNMk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBDC1BC099;
	Wed, 19 Feb 2025 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739991921; cv=none; b=bjuTOdIpkWyS0ixsAKRHcIbqqS9uGrxZznQ+IydkLf5r7r6p2ClnX+F573yz4yVtF+EDHbB6YJX5Yh0jb++gTSH47qzoRYqp6c7qtSxwWZmeBGUT9WJ0KPrZ6N/SW8P5RpIZZe/qqiE/IsECTjUqO84O9qF2bEtwLtPayeBOMmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739991921; c=relaxed/simple;
	bh=ztyb2fXwunLfalIiPtae00a+lEGWhwQCiGz2vFyFqN8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a3fS9QW9BkjY5iGGNxohAqjQressCIE3O3o4AwRpYdhHJ2TofrjqGkHeMEgqg7tBA6s62WHlG9I3hvXGE8PvAx4IJRrDeXFUG8BSTX3eqtaQAkdvNugR7QQCJxRA5Zsy4wyLA0CPhSm7RiwQVy9T8tqZdBkya/Y1B5EHApmKLHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJtXkNMk; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e679353108so134036d6.3;
        Wed, 19 Feb 2025 11:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739991918; x=1740596718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VRvAkhsGhUk7jbKy01PWTBy1d/q6DACp1Xpa84XmA00=;
        b=JJtXkNMkBDN/h/POjp9ZHGAbMmYdMVPM7w0/hdnUwudvyJSdbbY59BZHTZn0lIqoy3
         paVuVciiddqyJ0gkNipwDmRTn0nu4/SZIK8aPvjCP3r24ZSdN27Pp5HvXOEDH/PE3OnO
         KboPL70GVijzxg/eni6rqqqUFimq2G7HswcNUYdid7Y5DedzJvbC1ey7SLich6xU1zl7
         7iVfUL3pBxgAqIiXyMe1RqbKuIesEe6t1KfkPmu6Lc9Ozyc8uv/ezk7l+jaUWteVT4gX
         1fwZfjc+6sv2HpGwGgpPisIYfSKAYnVfIJS+cxiAKZhvQ5MR+vSNn5rEGe8hl52KRJSA
         hdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739991918; x=1740596718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRvAkhsGhUk7jbKy01PWTBy1d/q6DACp1Xpa84XmA00=;
        b=w9AmaPDhvPuKOjXH1ZNCvajwu6Yb7CAkDVN4AkZA2E9Kad7gvXAxvdm52lXpOtH3+2
         qYeCHc9zixss7FGq8y+OtqTNMUaRT4Je8t/uji11LjNRA+hmjLV4OgkIgdtOFsjF0mfy
         fQwoK2cY4BEdi78kA2DGQrA7O7G7I4F92UBinXCQogB/91j4G/PBY9+Fepy8UFA8q6fz
         RC0rTso0aNqDmKkR9GqT+y/QKA893ngLhQ9XlXny0L+MedEcWOSjvKlG6oHnLhkyzL2S
         /bxZRbM4jdpoEfGbGVrI0jjhFgs2qfn/FG4X0frGDYggBfIqbiXC0gok72jl9Z0Ubvwt
         VrZA==
X-Forwarded-Encrypted: i=1; AJvYcCVsBjkj3dcfuC6XkN+K9VeRF6KWV4eAVtmEjPGynj4sFOxzMgqRDgL1T0g36/oVEHSs5UKG5pQgrbgWJYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYnjzCU7pRI9eUVxjsHhnw0iT+xr8/YfA+pIHWSO1C3UHYauU
	QFrUGuhMMEWEzkKGrvUOZ7cP2obRlJs1YIo+ZRR3w83YCxPiMoZ0
X-Gm-Gg: ASbGncv3DUs/pyk/e8GDKjc7cNTo2dtn3hNMU2Aog7DrBmvtCK2ilMI+T4c/Z5DxbML
	Pc2sJ+vXLh7RSp2uBzaYj4UnmFZ68N91x8RqKwmT8RfHonleyfSkLvVh/cg6cwfVdZOUoDiNqbe
	rfRBcnZKmzZCqOkEKPQH5mqKbf2dwpDLqxU+KYKDqhYwR1EYqMQQK7amV17DXvYIcRBe008Eu9b
	N8b5UApkHwlZGHkN0RP/mP1uTUuRa3J7x060UI7UZYp4hNIDmz8htdlThc6DUDtKarfHOwDKXYY
	rCV/ICoAV5M/TdOIdWStC4gPS6ozWCI0SuxYoeqrg51dPSXeR8pmJkC90g==
X-Google-Smtp-Source: AGHT+IEa9ajlxAKKQ3yxN4CheGZKtbgkFRUTKEWsGrjHM8+63DelUHJd83Is34UDkvnXGPEET4SGpA==
X-Received: by 2002:a05:6214:19e8:b0:6e6:5d69:ec2f with SMTP id 6a1803df08f44-6e66ce2c080mr95717886d6.8.1739991917967;
        Wed, 19 Feb 2025 11:05:17 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:8f2c:7dfa:4120:7aa2:1242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e676c70fd6sm45178086d6.85.2025.02.19.11.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:05:17 -0800 (PST)
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: [PATCH] media: vim2m: print device name after registering device
Date: Wed, 19 Feb 2025 14:05:01 -0500
Message-Id: <20250219190501.295976-1-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the v4l2_info() call displaying the video device name after the
device is actually registered.

This fixes a bug where the driver was always displaying "/dev/video0"
since it was reading from the vfd before it was registered.

Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
---
 drivers/media/test-drivers/vim2m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 6c24dcf27eb0..0fe97e208c02 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -1314,9 +1314,6 @@ static int vim2m_probe(struct platform_device *pdev)
 	vfd->v4l2_dev = &dev->v4l2_dev;
 
 	video_set_drvdata(vfd, dev);
-	v4l2_info(&dev->v4l2_dev,
-		  "Device registered as /dev/video%d\n", vfd->num);
-
 	platform_set_drvdata(pdev, dev);
 
 	dev->m2m_dev = v4l2_m2m_init(&m2m_ops);
@@ -1343,6 +1340,9 @@ static int vim2m_probe(struct platform_device *pdev)
 		goto error_m2m;
 	}
 
+	v4l2_info(&dev->v4l2_dev,
+		  "Device registered as /dev/video%d\n", vfd->num);
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 	ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
 						 MEDIA_ENT_F_PROC_VIDEO_SCALER);
-- 
2.25.1


