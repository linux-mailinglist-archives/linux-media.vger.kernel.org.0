Return-Path: <linux-media+bounces-36850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C5AAF9729
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 17:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B1641CA28EF
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBE42D781C;
	Fri,  4 Jul 2025 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVtIPoa3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17262D5C70;
	Fri,  4 Jul 2025 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643677; cv=none; b=i7Zl5zwk5VHEoJzTtLjvgv5XzHNX5CDSZ3mdEwfzwniGiFe5xDryKSE8QOcN6nmaJ2E5UZKBIN7cV5ymRAvUd2szocnr/FZ9wbgB1N8jA0I4ZzIwZ0LAO55Kf6dN1k6BqyEWfjc1p1i2013PSQ6dlTirg5G4r8evzJcd9a5h2FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643677; c=relaxed/simple;
	bh=Qcm3MlO+7rmXnR8oh4vhPfCPmo05ohr8Nh98i8ArQVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fs5J7P8/z1SrzM9XuDuqavx2dmFnpr8JoxHFg9vzHVh9R9N1Lj1239uxqbwgDohq90zAsK6bMxXLmM6MfKJ5TA9XS3UTZ9/EfDl7AU6HlzQRLE7F5BeSZxOeflgH+oZKb5OrYVi3mxXgt79pu+Q0XCNZ6CETgtBoqlHj3mrthDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVtIPoa3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-237e6963f63so7359225ad.2;
        Fri, 04 Jul 2025 08:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643675; x=1752248475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfnVacEcpG1/z9xW+RoMcjdxJiO0H01iGgEdemoCmq4=;
        b=YVtIPoa3N8zzjctAiiDGbebS6yYbGctKqhSgyjm3SAwUdj5AWM1AFGKbhevf9G7Y0S
         rn2eRGMgZIOXckLr/8WEK2aZ59tCjzsORLO30OS3VTch120X57v7rBEiDGXI5lC9VH3I
         pJ1AA3bJ/0gSF06Z7xIkkcejxp/IXHzFjqmrVg/SVOJvR4pld4R5w8wc+wX6HY5RhDfZ
         HbBphFpOUGUp8FXPNg092slagOLwpG3Zgw2BbRgHFGv/E9C4L8S1N84UfqFPWYhb9zrm
         Cbm8mPaShoVSysqtLTzQBGe/quQmprnN0s8UfGPeWz0bZ6vxuEj7p7r5J5o9F2ZpTQ8Y
         dCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643675; x=1752248475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfnVacEcpG1/z9xW+RoMcjdxJiO0H01iGgEdemoCmq4=;
        b=MJ5keSgpi2t2+u96GPVaBNWDJKR9lyWZCwEGHBQW1IdYyRY2KQHw5pVhfDh0xBFNo5
         ayaaKogcKDpsZntQYsVUGzy8j6X0Y3qDG/Z8tDrtj9rdyRSJ0FBpOvZA12k4yNOD9HDC
         bLf5AuryTtVZo86WRxNn3ysq9qtQEqoPM4eWDHyMY2TwjGPdD+nxbGsSO3eOxo0arbVX
         EBWQdtjHHVDPFyhC20gs4qFkzw1x++KTSdfdNdO5FR42LdGqRgEJ2MvQ5tfOHzJmszwb
         rl3Nc5GSN1pnGjXpLI40yUuRfa9rDfcRTLa/Td1Zn5Y6vT77bspwaJ9SaHIeCkBovsZv
         c21A==
X-Forwarded-Encrypted: i=1; AJvYcCW4cyPurY6hi1V4cp+kAQkwuaQ09Qu8W5HU5EHUdHjUiCtUjsKJELDJijMmyZaOKOBxCT2UZwm47SyYQi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/A0v46PqmQajUBMT+sOMWpvrnG+7ijAgSKE6P1g3YiZ1tIFWc
	W++7s+kd3H6Rub/eHQsZvKMCfnlCht83RZoRX7L3c9gbY3bEaSeJugvf
X-Gm-Gg: ASbGncsuaOqFO8DJSo9/n2EyonCvZjuqwv8B1+yxk/1pHRvVls/mrjU7H6mfgN9et69
	q/HbjKYYwnxEhGimFDKf19YXRbO7CcaAKrzyd/oBFmeX+QHPqu4L8xgCAfEGj/fzdul9pnAL4Fa
	5ZsIDMEZfolM2JJV06rTcKUgP62W6MpNtxOYw+Hv3SU9JNba7Cs9bZh1k00klIEszH65JRnjlAk
	6+hTI9utYxrnWBcu2v1M9SSgqZmQjxCldslkZsTl6Xmk4gsChFWpVh4BOWwIPZHucCFeSNl1vkA
	6tHnTY0iQEzIC16stRNIFJqQfObS32Qhg9W3nplgnbeTwfcxKdLCR1n8CE0f8O1gzsdV/RIqUPC
	SCAa/xPzP0sBQNCFuQuHktX5aZg/gQeBoL4l8CbC98DABjPNAMw==
X-Google-Smtp-Source: AGHT+IG0lTfhEEHWncv8WKAFJwZDkwEnzpSOYiogS08UUeqmbDR6YxGPWb/+MxBOXvROY1Yo0ukpTQ==
X-Received: by 2002:a17:902:c404:b0:235:f143:9b07 with SMTP id d9443c01a7336-23c874662ebmr43998795ad.5.1751643674806;
        Fri, 04 Jul 2025 08:41:14 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a4b6sm21912375ad.29.2025.07.04.08.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:41:14 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 04 Jul 2025 23:40:53 +0800
Subject: [PATCH v8 2/3] staging: media: atomisp: fix indentation in anr
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-new_atomisp-v8-2-2a8560cbd9be@gmail.com>
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751643666; l=6803;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=Qcm3MlO+7rmXnR8oh4vhPfCPmo05ohr8Nh98i8ArQVs=;
 b=1A6lT02aBGa5D0eQa/opSQcwLCY9pqnk6Iv0AIrW0CwNPoCgxvd2h0fKUNw6QBWZc8r9i0FUk
 zYh558HgraqCG3yGMOk/1/B4/UiynKWChsc9GOZaSxrjbYmi5WGJ+Ya
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in anr
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75VcPzq9XrFD29+uZ1rbFcDxb4UbXNkv_QZ=3iyVm3dxyPg@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  | 29 +++++++++-------------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  | 17 ++++++-------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h |  4 +--
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   | 12 ++++-----
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   | 11 ++++----
 5 files changed, 31 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d566234b9d3a35401666dcf0c7b1b80fd5b31..98e5c3c49952a3024bf7a0ee3e09c66ae88c97b7 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -12,29 +12,25 @@
 
 const struct ia_css_anr_config default_anr_config = {
 	10,
-	{
-		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
-		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
-		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
-		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
-	},
-	{10, 20, 30}
+	{ 0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
+	  0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
+	  0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
+	  0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4 },
+	{ 10, 20, 30 }
 };
 
 void
-ia_css_anr_encode(
-    struct sh_css_isp_anr_params *to,
-    const struct ia_css_anr_config *from,
-    unsigned int size)
+ia_css_anr_encode(struct sh_css_isp_anr_params *to,
+		  const struct ia_css_anr_config *from,
+		  unsigned int size)
 {
 	(void)size;
 	to->threshold = from->threshold;
 }
 
 void
-ia_css_anr_dump(
-    const struct sh_css_isp_anr_params *anr,
-    unsigned int level)
+ia_css_anr_dump(const struct sh_css_isp_anr_params *anr,
+		unsigned int level)
 {
 	if (!anr) return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
@@ -43,9 +39,8 @@ ia_css_anr_dump(
 }
 
 void
-ia_css_anr_debug_dtrace(
-    const struct ia_css_anr_config *config,
-    unsigned int level)
+ia_css_anr_debug_dtrace(const struct ia_css_anr_config *config,
+			unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.threshold=%d\n",
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
index 4f77900871c8b9d43bdc00308aa914eda3af7fa7..732ee8924df0a5352c8558521520d723be09626f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
@@ -13,19 +13,16 @@
 extern const struct ia_css_anr_config default_anr_config;
 
 void
-ia_css_anr_encode(
-    struct sh_css_isp_anr_params *to,
-    const struct ia_css_anr_config *from,
-    unsigned int size);
+ia_css_anr_encode(struct sh_css_isp_anr_params *to,
+		  const struct ia_css_anr_config *from,
+		  unsigned int size);
 
 void
-ia_css_anr_dump(
-    const struct sh_css_isp_anr_params *anr,
-    unsigned int level);
+ia_css_anr_dump(const struct sh_css_isp_anr_params *anr,
+		unsigned int level);
 
 void
-ia_css_anr_debug_dtrace(
-    const struct ia_css_anr_config *config, unsigned int level)
-;
+ia_css_anr_debug_dtrace(const struct ia_css_anr_config *config,
+			unsigned int level);
 
 #endif /* __IA_CSS_ANR_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
index 6e573ceaa9ea2ecd7da6517c9f2ec5996f56087f..af65a47e9cca297da945b0b77add9226b20e1b27 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
@@ -12,8 +12,8 @@
  */
 
 /* Application specific DMA settings  */
-#define ANR_BPP                 10
-#define ANR_ELEMENT_BITS        ((CEIL_DIV(ANR_BPP, 8)) * 8)
+#define ANR_BPP 10
+#define ANR_ELEMENT_BITS ((CEIL_DIV(ANR_BPP, 8)) * 8)
 
 /* Advanced Noise Reduction configuration.
  *  This is also known as Low-Light.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
index 09599884bdaefe32f891f437274b96110888a675..a7c0285bc63498fcb2e51f09fe1ed4a12ed4f3d0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
@@ -11,10 +11,9 @@
 #include "ia_css_anr2.host.h"
 
 void
-ia_css_anr2_vmem_encode(
-    struct ia_css_isp_anr2_params *to,
-    const struct ia_css_anr_thres *from,
-    size_t size)
+ia_css_anr2_vmem_encode(struct ia_css_isp_anr2_params *to,
+			const struct ia_css_anr_thres *from,
+			size_t size)
 {
 	unsigned int i;
 
@@ -29,9 +28,8 @@ ia_css_anr2_vmem_encode(
 }
 
 void
-ia_css_anr2_debug_dtrace(
-    const struct ia_css_anr_thres *config,
-    unsigned int level)
+ia_css_anr2_debug_dtrace(const struct ia_css_anr_thres *config,
+			 unsigned int level)
 {
 	(void)config;
 	(void)level;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
index 2b1105f21c1e2b37144083b6bb8f9dd465a2f43b..f57acff112ee17670114658b1c4b7ce9203362ca 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
@@ -14,14 +14,13 @@
 #include "ia_css_anr2_table.host.h"
 
 void
-ia_css_anr2_vmem_encode(
-    struct ia_css_isp_anr2_params *to,
-    const struct ia_css_anr_thres *from,
-    size_t size);
+ia_css_anr2_vmem_encode(struct ia_css_isp_anr2_params *to,
+			const struct ia_css_anr_thres *from,
+			size_t size);
 
 void
-ia_css_anr2_debug_dtrace(
-    const struct ia_css_anr_thres *config, unsigned int level)
+ia_css_anr2_debug_dtrace(const struct ia_css_anr_thres *config,
+			 unsigned int level)
 ;
 
 #endif /* __IA_CSS_ANR2_HOST_H */

-- 
2.43.0


