Return-Path: <linux-media+bounces-32495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFCAAB6DF2
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 16:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A9103A4E35
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 14:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6421D199FAB;
	Wed, 14 May 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTWSgX37"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCBF17A2ED;
	Wed, 14 May 2025 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232282; cv=none; b=PAqVZ/s+7n7PdjNzKxIwVuXnLuPqfiHjw70Hbcx2HOPm3fcL+pWCkbXRvqjV/Df665Weh88jB7OyJWxg3V1gwFWDRDzHwRGmip70xy9ZP8YKKUJ45jnLUZF/Cnwu4YgsVwzvQeK8heKPAtiqdnAjiQjg5747zpEiBag8ct8So9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232282; c=relaxed/simple;
	bh=Phxzd6q4YyKisxokYWmJBWJhBVP+9PoRbs2nn07gWhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TziS9FR/JYqIWO41i1jcxsXDIH9FkPn5V/qXmRMMRcY0ckdIAr8m09U0GrD/90C6nynZk3ZdmM9PtraXiqDqphbwmnjBF3s3S1uwFNNsZQ2u7ScT37ngcb37wmM8D6zdwW3M/Xr1XyzRoZBjS++R98rM1q8RvO/2Ofy6byNztww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTWSgX37; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad21cc2594eso291630066b.1;
        Wed, 14 May 2025 07:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747232279; x=1747837079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smp2NfEivl6utrDP4h/0mlb9D1eyeTY+H/de43dJ9GM=;
        b=HTWSgX370bs6iDeS22IVDHumJYFkRO4gVIFc71QrLz2yIgkSyHHn5A2RCr+xwuhGTp
         VQ5BdFbR8jnFgm10WCJPCYGiGipknbAGioDESovZHD3nhAGDsRyrqW5lpWrWdDvxLao5
         AvNK7J2kIng2VH2Ssi/l4IMK+mVJrWJRTBuDoX3+XdZYGbQA6hezNPRCB+e0UfcmDfCC
         D0m9dj+yL6ZLA+IEjJxKzUn3rCPh1QAvTRvVaIWpPgFkCWYzYUdbuEqtYFzhR7/iwSpb
         4BWMalll+r0tfpTtxJ2Iy3GhD5N6qZTP8tz4LJifjq2sKF6Q+myDvnNri+aAyIL50Wg/
         LSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232279; x=1747837079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smp2NfEivl6utrDP4h/0mlb9D1eyeTY+H/de43dJ9GM=;
        b=LKSnr3TeFEikKXPXPC1rtmE/81YyHifryWNiC57Okpbxgn5fAkl75oxLFEJo2NFTAL
         wB3QFRktGQHuvGg0/RPB72MjztkT4ZmHta8kIIdKq+kG0a8ZA/eF/CKZrHIQnXwcltj0
         woa1r7uaiH4fyX3aMXvccbyKG0pQb9x/Aio+bEBmcHpCNzlTeH0JaTF4+LN+2UNO7D3B
         I/HL5/42DTqJYK7ZTuJvs3aHCdOeK3J/78GpkkY/cyUOMMLEFE5NOAw3NHHdiLwgaW6r
         1PMOMUc117/h+3C4uc/q6QUtz4IGRwNJxt+SljVGdwonvUyItwRAmbFtpOq+PgRHAc/4
         Fu0g==
X-Forwarded-Encrypted: i=1; AJvYcCW8Qs4Vb0r7EYUAxrP/Iid6APGLY9T0khHnI9mIQrOzULbcqqE2TRGviQjPnd2gDU/yC7tUZ16PHKzYN5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlgxdqEyWHJVbY1qHDyj18Q66vZL3zvFw1GA0FIiLlJlv5TNln
	OR9xz0RJ7srxWbyvsSwgt9/wNdQRIsoBT6DDWVL9MgJokJu2lovAzBum0qiRfGA=
X-Gm-Gg: ASbGncuqNSYPhQdE6p3zSYlO0Q5mHja0X697laSr5jpA/sgQz0nfduosq9hU0nA5eUw
	HifkGuQ0QPxC3XGOc3NROGHViTAPYJ1sTbVWrXmfPhig9sSw/jiPkBnsPmg5RTnhc6GYsK4pHnR
	XZvMQs9uFZ925x+XZMtJXv7i/ga+/Iste8F14WzIhHznBy7xnFoVeYKIkMCkbTFaO5niywTC47q
	Vw/5RuvqA01YsuWTQfkP3Ikp7wA44Yb15dfXs7FQBHksq7E5IrlOVRJqmW9l8WTHSEjllNClxkZ
	Q8C35be0/qnLA6JIqrloVAGKOaBdUFIhHvn5DLPQvn3XlhnWPeUp4YzkU/3U
X-Google-Smtp-Source: AGHT+IHrbyWVCrsIgP/9/vdV9ojhJie1TVJA3TTRA/5DqzAoBsaP3kr2agu/GjXzoB9DF5djDpQJzA==
X-Received: by 2002:a17:907:c491:b0:ad2:2d84:ab80 with SMTP id a640c23a62f3a-ad4f75a9ea2mr381929166b.58.1747232278928;
        Wed, 14 May 2025 07:17:58 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:456b:224:c095:bd73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad223992d68sm866691866b.122.2025.05.14.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:17:58 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nmchehab@kernel.org,
	hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	martin.hecht@avnet.eu,
	michael.roeder@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>
Subject: [PATCH v1] MAINTAINERS: update my email address to gmail.com
Date: Wed, 14 May 2025 16:17:27 +0200
Message-ID: <20250514141727.156675-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace my corporate email address by @gmail.com

 Signed-off-by: Martin Hecht <mhecht73@gmail.com>

 Changes to be committed:
	modified:   MAINTAINERS
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5dee8459a614..e4a4f247d826 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -811,7 +811,7 @@ F:	drivers/media/platform/allegro-dvt/
 
 ALLIED VISION ALVIUM CAMERA DRIVER
 M:	Tommaso Merciai <tomm.merciai@gmail.com>
-M:	Martin Hecht <martin.hecht@avnet.eu>
+M:	Martin Hecht <mhecht73@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
-- 
2.43.0


