Return-Path: <linux-media+bounces-37476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ED4B01B39
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 022E36471BA
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 11:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189EC295DB3;
	Fri, 11 Jul 2025 11:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdhtkK2p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF6028FA9B;
	Fri, 11 Jul 2025 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234885; cv=none; b=l4vuNRauq4V30K5FKHna1fUcrEe+lRwyX/DlciQvTu2rbnFiz3dCIVTjb8Lq0REUfGGCC8hPpUbSjPEcHbljN3SkjFDH7rzGYqAjw05/9MEOhD+HmDU/GOkk5esfvZiWR+knaiJ7cfbFcVW9UxAMEyUf2AISBAulKpcxs4PtJsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234885; c=relaxed/simple;
	bh=AsOB/t+XSLU3D6zXf9I3t7aFO7IF5+2RaXBQR2P1XXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/Pnk6x+16eq2Zk61TC41qusDnTjMqTthHdcNgbADqWDKvc8whW1bvD89xyAyaanU4xEsNvgQSJpHPZO38jHf3gAAj9ze6YtU2fZwnzVUY2YEQZOTqw0SO9RuhlAJZwGC9JYSvXQUn9rF4wKdiNGIsKRUA8BWYk9DINKv56q2mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdhtkK2p; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23dea2e01e4so16675655ad.1;
        Fri, 11 Jul 2025 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752234882; x=1752839682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feHMC4gJh/Io1aGG+AgeJkBxKrk860DvPSvkKFMxtDs=;
        b=kdhtkK2pxapr1a7qzuIElqPSfghU4FYB4Fu9RdAHKycwJglS7F9BlDgfBu/4UY7ne4
         ELzyr7LYmKp0gPn3WyUex1Bqn+SHDO1XF5mN2RU1xNPVOE6YLyxOjJSB0jsNENt5eLAa
         Muo91WPi/2LnCsBScbI9HXrOaW4UWM4Qy8rMC0j/6WWi6HFkiZ7mk7dtXMjhuQi8v0U7
         bK0v38kWFKB9DpzxSB+roiuclnHoUas3PScy7vH3I0KskG+a9UH9czvlpueDMP9yhlCm
         y2KCj9ckSDcEQlS7wRxgUjSIitVAufZXd2k4AmV2MvNCDfrxriSHtDlhz0+UlD/wuEie
         luqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234882; x=1752839682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feHMC4gJh/Io1aGG+AgeJkBxKrk860DvPSvkKFMxtDs=;
        b=AbfGUB0DWz9CFS+MUOCam9ZnpYvXzlra0wGFD/Dtis/M0KhGdRsf+qRpy0oTwV2oo8
         506zKSOhAuMKozjVvsG17YKKrgHMysDmFSvoNUhdT1Fi0tTvj5aFmtbjg2yrq1zLgvpH
         TqxjDukyaCbcPf1t4iyEwLCFH6XMfLsffiUTjxGq0h7sNHyHnb6j1JDcBvvHuRKfKmLl
         w2z9yU9d0nTrpZLbTYK2/fqTcBGhPH9zVKa0gxJ6c5DSpA0sjNHgJR8Ptwiizh52klCu
         llsnkYqVUOEGnejt5Me81hN6i5MHFM7hGShCz9keP4NnO7CGgSTBbBknxigZvAAdOlt5
         3+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUbSzzfcm+AqA78qv7h16CEXAMNdAwqxpBhv6tt6+tvYTaeGb5RbwoarN1GOJYeYIFVDgvNeplqTE+E4+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3oM1lUYJvMiHMdRLaf+QULu1NGsOUh9zXmdQoNMJFQP8hlEac
	w14GK6nelUO4XpzjTH3G+83GR3c0NROorCH4ilNgBEPLPzM4Iyf+Jmjzgr9OkTor
X-Gm-Gg: ASbGncswn3sxU9JUCjcTUU3C7V1XO8u52m0bZrKCASKixgINDErnQfpXA1XQfA5MEQ7
	4nVdAIqld4JDkVshwp55OFHpYZtE6azdKpSxg2rm/9aMswzPY3cCLQDxZUhrx+iChU55AEwpoGq
	QdeC7Q2xzsJqxxHUkcC5r2brR+5gLamSy4aRWnkJdTvzqjzP9ASUL3UsccKuaiYpk1zjN/kJ3g8
	FYBvxerH4QPiLeLFuPhDSILSNqu3ESYQDhmgvZ/azDu4H3A4Yiy3Jkm0Q7fyR2332ZHLTKqZ8PO
	dcsKTeaGX0zEiW1Sg4mWpo3FbyrPJUskSLtd0zKcRZY44PNgOiyaTBIaIvVQKmKqAQpj4cw2ow7
	y45fTLadwfxP6EQDJ+WV7M92pngl8007UshpVpX5/a07aKSVqikxTckwEJliwtc1a1mBEFbnsT/
	pH5Mu03eSrC2zlrmKnEVzG
X-Google-Smtp-Source: AGHT+IF7ICYrDWrxJPgVjVN+KoAK3tZUA7pTI4iybOd/IblO+4C+XKqVROFdlkk2YFX/ccSzZf7Uig==
X-Received: by 2002:a17:903:3df1:b0:235:be0:db53 with SMTP id d9443c01a7336-23dede98446mr35156005ad.51.1752234882208;
        Fri, 11 Jul 2025 04:54:42 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436e8e6sm46042135ad.255.2025.07.11.04.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:54:41 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 11 Jul 2025 19:54:36 +0800
Subject: [PATCH v9 1/3] staging: media: atomisp: fix indentation in aa
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-new_atomisp-v9-1-a9dd62425ef6@gmail.com>
References: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
In-Reply-To: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752234878; l=1535;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=AsOB/t+XSLU3D6zXf9I3t7aFO7IF5+2RaXBQR2P1XXY=;
 b=hgFoYH7QSeQwMrGtsVENOOY7aQhQUyokhgy3cTany7wTUE3mPnp6nA0lXcZy9215gLBSNF5hA
 oTUv1kDcLFUAl70ZPCMEXALJLBHvgTLg/tiflzEltPknEvSJc8y+7/J
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in aa
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75Vfc7QsENHsaYMKau_4DU3-LmW2XaUxd=oHqTS3F3R85eg@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
index 2f568a7062da726397f55b1e73dadd27fcd1f2f8..f825f537a5366f6b97170dd44827436fd800d105 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
@@ -28,11 +28,13 @@
  *     ISP block: BAA2
  *     ISP1: BAA2 is used.
  *     ISP2: BAA2 is used.
+ *
+ * @strength: Strength of the filter, in u0.13 fixed-point format.
+ *            Valid range: [0, 8191]. A value of 0 means the filter is
+ *            ineffective (default).
  */
 struct ia_css_aa_config {
-	u16 strength;	/** Strength of the filter.
-					u0.13, [0,8191],
-					default/ineffective 0 */
+	u16 strength;
 };
 
 #endif /* __IA_CSS_AA2_TYPES_H */

-- 
2.43.0


