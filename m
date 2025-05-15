Return-Path: <linux-media+bounces-32559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F7CAB7FE0
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 10:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02EC07B3C11
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 08:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBAD285419;
	Thu, 15 May 2025 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePoswzkM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47871283FD6;
	Thu, 15 May 2025 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296678; cv=none; b=P9npBtYtUHjrM1t7Rcb2d7bc0FYi1Em/RH7daGf1kT5lIFgfShpLqdJh2nXCwyZ1PYECJ0aYBhtJtYH6o3d2ZigDESGOM1GQSZaeSC61FA9TmzQP/i6sJ8zCe33+H36aK3EdrysYUCoGxfT19YIxuqxSfNxPfFcEWMEzVSLV+p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296678; c=relaxed/simple;
	bh=WRYDfrSI7TdBiPaRhCWExaqTVB8yw8k53PGKzwU/D5c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qDl1UG9ILA+kzQWwCfOvBWMsFHwqrh5ywU2Upl2cZ4Emr9Kff4YmdhBHWDuSmI/AbVBnuAaOMXcBRcuG0Hea/nY+Jl4ZCED3VQ6HqNrD/1Wv/bdg3770QrX74WhZVvmGZCY5324RsnEJn+k1/ksM+5AC18wrpfjkChAiSWLoehY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePoswzkM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30820167b47so587440a91.0;
        Thu, 15 May 2025 01:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747296674; x=1747901474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps7R2QIEs+5mu2GJCxRUbylEZlVUfxi0rWq/U2VgmWs=;
        b=ePoswzkM8UMZ+HEOdJe/iiuoIkocXkvsU5NzgZfRaX6K6hUPisOaf2B9hMzVNTlyLw
         r/+Afvmir4lc6P71WtyepxWrtkuXL13ekkPUxVdsdWu2aHFQXTDqRxB7WQxI8CJV5ok5
         zDWXlreMIjfv4WGoljF0fkciK7UDT7kAEha5tQLnIaGIgaRwh+EfwhB5CNfD4JIuZ+Bw
         lCl/UglRYPgD1/Gg31ZYOc0buAvtFunsKCf9iHx34+aM+WQryL/trlzmYWZPlgV2jDB/
         ijCnetwhuqedrIwMpoROCih97OQdObt92/CaFUyKEUViT8x7GjfCz+rHNTltLSc0EyJc
         qGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296674; x=1747901474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ps7R2QIEs+5mu2GJCxRUbylEZlVUfxi0rWq/U2VgmWs=;
        b=ZxgoBacMlYt8jTKHMR7Bdr7r5IxFzG9eUvlkUfiGaer/VCG15w/veVAg7/6v/Zz9My
         BGVON2sDujp7dJ0hHvXF35ab0fzzmAg2QZ4XNCDIGsIdotLAQXUOMggkQ89iZ8xaFtnO
         zvPIrryF7UK184hRflbNxCQrvD7ZWEyJ2Aa3iUEKANZ4psWvNlSpNUmdSRoCQnz1Tr4/
         nogEnQi+WZTroTdZnb7CSxbcPpdxwTeZq+nWGmDkn7Zvu2tKLmsc2GA+l3JvNZwUUztn
         QiFmNP7vnJ40Nitbzy+vrcmJCDms7Plb5jJ6qbe0JdP6ThaJDRcLCWwgVQuFvk8xE70P
         Ijww==
X-Forwarded-Encrypted: i=1; AJvYcCXDIkYiS9R2VZCaWaf9U6gsCZP18nAgJq6XQ1qYmhzPrnnQzKo6B0YDq0smOKPlqPSPZujqu0FxP4ZQm7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy32yoCoEtZNBcBSjV48aVtg1DkFSjgiI8b4gdz5JwccsXmwUF1
	lsk3Mu07mDO62hk4C2A3SOVajrUueeKKjg5OmWNRKOuxyxDkKf6o
X-Gm-Gg: ASbGncvCF2E43kTAzk++/7EOnVGauRvRC2Ckz7veHr+1zWzufshEVfP8Gy6RZPOvdh5
	+jApGIA+PBXW9kXXDe49e7vJ5Xu6FUevWQsOaqjtl5Nd7BaWPggRsgDTv4lsNZw1xr5tZwYTnZo
	i/7zF0WuebInRs34mAhG91BAtgiY915X2pYEgKSU9Wb0KdYfsCzop/3lgGoiELcnTBkSXL1d9VZ
	rPrCsJBtAWtJxflvxBe3ypgA9EViACE9hP2/bmDhahngsx/nnQ0BBplnzqfNXg0bGQ2/J47n4ym
	26ZnrkkAQ3nebnk2Xvm7KvDkIpPxqOuKUmdu64kqoX7aJExokhjN6TO1u2qQ57ydf21wqY+575x
	hD7PDKA==
X-Google-Smtp-Source: AGHT+IEEEOsVYjAaUxGr57mzC4JLrwMTaMkvvLNeUEozpxb2Rn12pe25UpFGlB6wdWp06eESvaAYSA==
X-Received: by 2002:a17:90a:d645:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-30e4db6d9f1mr3789265a91.14.1747296674292;
        Thu, 15 May 2025 01:11:14 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334e2939sm2885759a91.33.2025.05.15.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:11:13 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v5] media: saa7115: Replace open-coded parity calculation with parity8()
Date: Thu, 15 May 2025 16:11:09 +0800
Message-Id: <20250515081109.775227-1-visitorckw@gmail.com>
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

 drivers/media/i2c/saa7115.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index a1c71187e773..b8b8f206ec3a 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -25,6 +25,7 @@
 
 #include "saa711x_regs.h"
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -664,15 +665,6 @@ static const unsigned char saa7115_init_misc[] = {
 	0x00, 0x00
 };
 
-static int saa711x_odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int saa711x_decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -1227,7 +1219,7 @@ static int saa711x_decode_vbi_line(struct v4l2_subdev *sd, struct v4l2_decode_vb
 		vbi->type = V4L2_SLICED_TELETEXT_B;
 		break;
 	case 4:
-		if (!saa711x_odd_parity(p[0]) || !saa711x_odd_parity(p[1]))
+		if (!parity8(p[0]) || !parity8(p[1]))
 			return 0;
 		vbi->type = V4L2_SLICED_CAPTION_525;
 		break;
-- 
2.34.1


