Return-Path: <linux-media+bounces-29235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C147EA78F3A
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32D6F172A3B
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6CD1EA7DE;
	Wed,  2 Apr 2025 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9u5pLX3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A112823A98D
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598608; cv=none; b=mosxELAxcDXCAM8DrC/b1AWR6lZeayouCr89Nj6w+9TVEXw8v/7hnt4rv/reUk3kritwJwYNy1baZafxmBgnJf0Hzr4Z7dtxluyFIwtGJ/2VVwpE+oz6EEkLsSTWe6b6Ysdy9Zgh9N3XW9IixLD0DTP2eiO4LNqHwqDAWmaIEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598608; c=relaxed/simple;
	bh=a0kH7DhOpRrkWCdxZS+dFa+RPfQsm3F5YoqiAgUDg2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ePDvElUgWdH9l1sehFeebe9Z+TMbIRF3XFOOT5R5XjcKoxJpKEZqVyHuV9EVWREo/X6JFeJTVGusPRvpUs0Xfe/EuIbAf2Ozz1znDwNTfKbLEpbglATtbDyryvgU9v4nqBuQ7JFSRm5CKGPEjrvO+ySvMKu0cckxYlHNkVccIBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9u5pLX3; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8f254b875so61826196d6.1
        for <linux-media@vger.kernel.org>; Wed, 02 Apr 2025 05:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598605; x=1744203405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FH5IyGCYpRiXKqw/L0TqblGu3eqXanO2lHgzz7a5Kp8=;
        b=R9u5pLX36wLH/qOUZWBc8cSvUQqq6GD+Pjvwjqv3PYqAmCCy6ZvIPHVXmfl2Jg1izU
         5LobxLh4aalS7x90zRbodknorjRjT8Govrb+ADRuEAhhK+VCUndhdfszQp8xG97TfeSz
         ZF8fL6QjgAeKZ49ZGhK4iXC1J3zwqmlR15j6DdYPqcJ/zLgHPY9153Kpjjnlba0iZLbW
         eJhp1SFTrOJ7X3dPjPCX0dx3IkiA6Yf+0OoOQFPUrPhbW9wEYLBo3Z8QEwwfYBXfr446
         ttPhIxWxrCiLEXlsqXf4uazdb1Ett9Og/G3GytowH28hiA/lnSnJ82wJ0Pk31dfBZUwn
         FGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598605; x=1744203405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH5IyGCYpRiXKqw/L0TqblGu3eqXanO2lHgzz7a5Kp8=;
        b=WzOAaK84WM57Fz6WdPCHRjFZFa+pV/RB460YvG5/loKEH2uBsak7ickfd1XiGbTKY0
         tI/pQMp4eslBl/LaWoTrL0zR6y1V69p8uu0Mud4GJl+J76YP4jswKoRqpv8coSXGhMo1
         CPN1tRkwrkQkgI9wX+fDqAH7cjIQXkL+2mqtObH9wPTARfmD4oacYhyZrgBoIe+b+tuC
         k2U4az3PVqUcK3jdYDcDa/CAyXWSMOpWzNn+1u2/bcMcsgWLPg3tyM5iOHNT9cbNS1nY
         uNIgvIrFzUH2483K00S7vGQxUgM04is1KeR/4zx8+GrKDX2bJT4w+l2R23AT42HnkACT
         DDrA==
X-Gm-Message-State: AOJu0YyDCNoycz//QHyxOa6FRD2s0Yt3gd6lSZTpL5kuXVRc44d9p8la
	iNFYLJQ3ToA3MsviyJP+RnBJXwMxncuIslWMIP4Lxog69cphhrO1WYBOrC0niME=
X-Gm-Gg: ASbGncskPTuV56SZKEktaieQw77/Dj/QNoM40WkYe82Yt7jnREJomlPLjSrOJmGqneT
	0CAvRxyDFCa9+EuiyggSCkhRC69HiP5PjsZI00FqwBg/BeOtw2PxPWtN+TY5CSbRtoRcpWpqvlx
	BFfOtgyGui5vldsp0NiMh0ivsBo5z4AD9h4AvhIGCj4huDC+kNm1s+XYl2kENJzQZCgFTMROC5r
	gU3iVvA6Cn0s1xnAFjBqkHad+roL24usOx3zpcN28hvV6IJAuWYbYgFO4CcODDIcT0XZL45p+a3
	oOVjj4S+/sz0PnWUXcptBXQYpzQwjZBsUyjYEr/RP2GyMcjuKMxzcpULQXp/qxUkpma1JaccExy
	fIFB4A6O8QbjBKiThqOMQeHA=
X-Google-Smtp-Source: AGHT+IFVeFnXd2rDwBfA4/WVsl/sTa59VE0NI1E/4WSKrgf4jCEN6qyYALQBbH3XqEON7AXSHA9Njg==
X-Received: by 2002:a05:6214:450f:b0:6e8:f464:c9a0 with SMTP id 6a1803df08f44-6ef02be9d06mr39391346d6.13.1743598605068;
        Wed, 02 Apr 2025 05:56:45 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec979734dsm73440786d6.114.2025.04.02.05.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:56:44 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	kernelmentees@lists.linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH v2] staging: media: Remove unnecessary braces for single statement block
Date: Wed,  2 Apr 2025 08:53:48 -0400
Message-ID: <20250402125348.7364-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces in single statement block to comply with kernel
coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes since v2:
	* Add missing author
	* Fix title of email
Changes since v3:
	* Resend using git send-email to fix formatting issues in email body.
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git drivers/staging/media/imx/imx-media-of.c drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- drivers/staging/media/imx/imx-media-of.c
+++ drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


