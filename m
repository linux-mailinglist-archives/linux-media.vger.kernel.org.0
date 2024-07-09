Return-Path: <linux-media+bounces-14743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57192B5D1
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 12:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 278A81F2440E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C7A155329;
	Tue,  9 Jul 2024 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Asfd1295"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93665154C0D;
	Tue,  9 Jul 2024 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522093; cv=none; b=QxUXsgI5O7fYrHoD5hnmsEYW4712lRvYkHaqxUSlobf6a/XKZLZi0wQwPcfyR4OdCQ1q9HdwVb+wSgUI8cvUGwZAfgnEdTqQsxASF8sxcuwdv5PhH/PWdwsGK0XB2+YFMPD7LE3SYWLn/ocEvOvL5pGjbp/H2Ii2PNSoVC7I4B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522093; c=relaxed/simple;
	bh=0xkU7IgIYUv4NKxJJEVpD6QkCpmpQXa8gGCjanhQcg0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=C/akBFa6MyzdqdYS0AhTP+8rp2VgEeY/hHMA+Nx8mJTfbMdwoGdPS9lFKIUqVC7rxGMvGVgAZ2UFN+W/Ann8jfLVP/fpGOiBPjVXLV8OAeIO9g8uu9qJ5QLwBSq/DH/6ATEuMUznlzubvRtheNf0/r/ZzKObyx1fDP6FW45N+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Asfd1295; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-367b0cc6c65so2315216f8f.3;
        Tue, 09 Jul 2024 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720522090; x=1721126890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F6j93NAgaEbkg9TwwMnNk+h0n998d/UHM8aDpgO3P40=;
        b=Asfd1295GLD7bUozXnSsiUuINcj/j5vKIAd1jdlYAUql/s2Pnvrx1IEckqvqQ8ujaA
         T2qCy6ODdrSqVLjqk3R8apYQvZRuCc4IHyaNIKmRko+T9lWGsROYbCHWsaWMtprxdUD5
         OtC/BPO6A1NHKE4IJC02modseQpkgU+KcC1k3261TODPvmYa5iMyjiZrTzWMrk02q5BK
         r7kg5N4e4QBjqxhrKsXXL3SpwwZ15b9K/MRiDBP+oUjHn/JZezjRGwRlQRg29fohn28y
         jo2lfKrztH3dwE6CEu0n97LbC5WcD8NsCcRRkCOvtEfOPvTnaUyZgH5YlXgdnO4Ox9ZM
         UR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720522090; x=1721126890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6j93NAgaEbkg9TwwMnNk+h0n998d/UHM8aDpgO3P40=;
        b=YqVDNaR5DIhxGHuFnbrV0wSrLPPe43rA1dXJlEDtFthWH5j593vcyjiQA7zNFeL8iW
         rfHwhLFcD2hybCTEdfAnjJPx8BMaBq5Jws3/jz0f40HLFCRJwPBkvALtmUrvFDFybmX0
         o6EtgBEYDlV4dMNbiB2/EbmAtMea+skFyxdslvmEZVBAjpR1WxnRzRlnFIygCheV+BYN
         DzOrJ9FizOrmG0vaDFNWpejyPx3hAvxa/yPygrVSstM04JyzIEvQ1nO7OyeWE5Kow8LF
         ZPctGO5uv2i2PXMxWg/Y3xnovXs1mc2E5XgkDo3gKsHED8+DPBmP8Gu1UYmRyRWXaU7f
         Hscg==
X-Forwarded-Encrypted: i=1; AJvYcCVL5y0CuDoV/qsczEtrqUj/Y1vIDupKaoQnLgA300LOTBL9DVQGMRq+niBO7HO4pP0vjusbbTonV4FjBUAs/iyc5cJ5Oei2F6SB05kBAxAEa+b8D7tOM9xf//2YM2nmHwrbB9gVxXQB8EQ=
X-Gm-Message-State: AOJu0YzoaE6wT508xD2oyZLTM16fxLi0uYEzam/UrAH0VQmNHt+bN9vK
	K9oU1eEPuLjrhk5395i9PmxFateLcXQsuOLzK0mHDbOVLYtcRCp4
X-Google-Smtp-Source: AGHT+IF2vPtRPRrXhmooa5/sHFCSJ7g/iHCxCxNwXFB0+bGtFhLdonWOHqLcr98ixTtVqydWUbG5sQ==
X-Received: by 2002:adf:f84e:0:b0:367:8459:a56c with SMTP id ffacd0b85a97d-367cea73576mr1392955f8f.15.1720522088390;
        Tue, 09 Jul 2024 03:48:08 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e023sm2187690f8f.13.2024.07.09.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 03:48:07 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: i2c: GC05A2: Fix spelling mistake "Horizental" -> "Horizontal"
Date: Tue,  9 Jul 2024 11:48:07 +0100
Message-Id: <20240709104807.167992-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a string in the gc05a2_test_pattern_menu
array. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/i2c/gc05a2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/gc05a2.c b/drivers/media/i2c/gc05a2.c
index dcba29ee725c..0413c557e594 100644
--- a/drivers/media/i2c/gc05a2.c
+++ b/drivers/media/i2c/gc05a2.c
@@ -65,7 +65,7 @@
 
 static const char *const gc05a2_test_pattern_menu[] = {
 	"No Pattern",  "Fade_to_gray_Color Bar", "Color Bar",
-	"PN9",	       "Horizental_gradient",    "Checkboard Pattern",
+	"PN9",	       "Horizontal_gradient",    "Checkboard Pattern",
 	"Slant",       "Resolution",	         "Solid Black",
 	"Solid White",
 };
-- 
2.39.2


