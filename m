Return-Path: <linux-media+bounces-32558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61504AB7FD6
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 10:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DA9F4A7C67
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 08:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABDB283FF7;
	Thu, 15 May 2025 08:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv4mu78Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0581A704B;
	Thu, 15 May 2025 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296583; cv=none; b=sIkcc6LWnsmE3rCdmxaCtD7S9vaMPbBR6quQKUeTPt4z6B2DVIJzod+9exyE69y+MQoVyK+T5urjT9i5UpawnYuzSZu/9c0gzDlXLYSrpCT5KdXpBj19IBkxs4fF7Lg6JxQnOs/cE2jmqZ4QhFbRFkna1MvSk8DA8YP0BKcviIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296583; c=relaxed/simple;
	bh=ZCOA+MikIJ6hz4BMNdhkme/PbBjRb6+ytIsn9YmKuBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TWFlZ+HKYizgsFPHIJ/Z0mwNeaIuUVEWI+Zjh1yuZL+xbRJhPD45fXsCxpV9Swq7MG0SuusVB6Y9qEWnzk/bJcBrSc+DgdlrXKiLg1rK+Db75PzAS6sfaWNS5AtdUiJExS48w/Q6ye1mTBa9n7rBiTjg5xJKdrjbEXkCNNlBx/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv4mu78Y; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74251cb4a05so952322b3a.3;
        Thu, 15 May 2025 01:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747296581; x=1747901381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LIx4uJviRovv8kbekEvdBqRYIVxfNVVeRYilRDDQ9+k=;
        b=Dv4mu78Y2RATlmG1Gs/WcIxo/MjGWqFVFn8XlSsPdk2q/kxHfw7FOGvjpK7vjfFUGO
         aMnf2Qlm0/Vo7G9RipOqNAzHv0f7S1pn4HcGxMS/Y4JV77kFb1a0qhoj/ivuByxnwj3F
         /3uE5VIv8jJ85jxbNc/q/UjTF2J0G3fu3JZheOJzI/YsFB7kr0mS38qcjX4I988qPhRj
         BqfdSROQd9NSC5XGmBmitDyoPJXuyvx+8tgEg7az8OTvz2T4CdrhhDkAAaCHlIlN0qJz
         g/k9XUHo+tIS+Z59m4nPv/qqDcDLH9ZHG/RB/FHG3sDSMYsaKOZWS49fiNfxeQR3BRUd
         vTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296581; x=1747901381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIx4uJviRovv8kbekEvdBqRYIVxfNVVeRYilRDDQ9+k=;
        b=V/M/3dvgfM+52n0+1cjgSCjWi/o753xl/WgBvb9d2bHuMW9BqTO6KZ+4lc3QU/n/GV
         LHUgt5oJ4+ceouFgD+NIbNIwZibI2ZEtsVfH8Fg8Hv5yZNZlIT8BFl32qTySx7a3YYUl
         mR6e+wa/4eRLUHPK7YsFR0jMyN+UbRZmFH0+iCzz+76gtouS5DdiBLYJWkaba60ksnZ9
         2V6SxaXamAStiDWChmf/USyRlL4qy6iHA0RXkrAO1Zr/WS5cbUniRF9QMNsuHEVjyptp
         kDOj1lsCYdmaV55J5Vlxs5AE6Ljl1zTQk5YjNcI7weG4Jwe8eQnQE/DOxNp5LmQLp9Fi
         8l5g==
X-Forwarded-Encrypted: i=1; AJvYcCXtXB/4Q6ashEEo5XwGP4lao4FqsGhlVu0jOT9Fdd8NA4absUq9MnLmzEeLIbGhb1xTuoQLBDOdwp8J0S4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCYcYFZHi+LKPGhpCcgXnhtCmu+tFU38wEp5xxDfJeRyin5B1q
	UHJlbRZ129zgfXQ33md2bbWiUIr9TbMpIHerDke/tEGc2FJJRxRX
X-Gm-Gg: ASbGnctaffD07OoNgpW/iqvhTBa4yEVXtHzpoNDe/zDXLMPH5WeY8kmtrIFAlfDO+h2
	YDheCnm1IgziMu/CKL7+RLdVK3znUWYcI81H0j0t/XdBZQpjQNNdR79B8fBtIQhoZQT+mT6xQJ+
	ejNp+Svh3JqOGg0PIhASTP6BdO69lz46I7BU+A6X5C/Ko+xMNYxxw6rH7E4+qjLoP9JE6v3L44J
	O3HE560c8TzpqHsrC+Z7FkQ8tTFMWYnpTeEw/lZMoEfOMd9Vid8C+2AP47+egtTfFTEpFoTzNgU
	0xuySNEhhgYTl9md2703nzhcUDNimeQDs95F22FWqNj+Vnb9TcjtaTTsLn0Ni9zBzMejB5tw8Tv
	zPw0dJg==
X-Google-Smtp-Source: AGHT+IG0/gYSxvm0WZhJh6VbHw9a4hSHTkDTo4s7bkEXS27qoiLuXCba2cYdN5XuvlWgPYq3Rudnww==
X-Received: by 2002:a05:6a00:180e:b0:736:6d4d:ffa6 with SMTP id d2e1a72fcca58-74289345b9emr8118939b3a.15.1747296581500;
        Thu, 15 May 2025 01:09:41 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0cec0sm10881148b3a.95.2025.05.15.01.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:09:41 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: awalls@md.metrocast.net,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v5] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity8()
Date: Thu, 15 May 2025 16:09:33 +0800
Message-Id: <20250515080933.774874-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity8() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
---
Changes in v5:
- Dropped changes to bitops.h
- Switched to using existing parity8()
- Split parity8() conversion patch out of the series

 drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
index 65281d40c681..1a113aad9cd4 100644
--- a/drivers/media/pci/cx18/cx18-av-vbi.c
+++ b/drivers/media/pci/cx18/cx18-av-vbi.c
@@ -8,6 +8,7 @@
  */
 
 
+#include <linux/bitops.h>
 #include "cx18-driver.h"
 
 /*
@@ -56,15 +57,6 @@ struct vbi_anc_data {
 	/* u8 fill[]; Variable number of fill bytes */
 };
 
-static int odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -278,7 +270,7 @@ int cx18_av_decode_vbi_line(struct v4l2_subdev *sd,
 		break;
 	case 6:
 		sdid = V4L2_SLICED_CAPTION_525;
-		err = !odd_parity(p[0]) || !odd_parity(p[1]);
+		err = !parity8(p[0]) || !parity8(p[1]);
 		break;
 	case 9:
 		sdid = V4L2_SLICED_VPS;
-- 
2.34.1


