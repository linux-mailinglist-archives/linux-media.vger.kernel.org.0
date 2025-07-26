Return-Path: <linux-media+bounces-38498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF3B129A4
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 09:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E1E01C26F52
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 07:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3002221CC79;
	Sat, 26 Jul 2025 07:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ea78tAkv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DFF21C184;
	Sat, 26 Jul 2025 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753516406; cv=none; b=kbHqmTALlROACFIHrfJiGCCqax4dEYgAdB0pPI1NNk+w/ijwO4N9km7RWmcExgEdS0ZJJN91bQ9GjkCg3e940ad5QUzLmVkGvY8+RYk6lNoNXwZYyrPbMDtJIqxCxl+3itJia5GgLAo3y0gjGBPrmdCOt/+nyw3oEXvqhMGqdvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753516406; c=relaxed/simple;
	bh=ZULe9obZ09AITQHO9BPnUCZXts9FE3eLccsfGy5RX0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyj19zyoNbjx6ucdhUYCZiYHcYrqv86q7NF74F4IVsdVJ/GhU3znQ4iKBRiIngWBzQlAPg1l/356D/TLr9XhOAsNxyINhjxlJGTJjW/LHnRRwG2pXMkEPH8Fryh6sH45u9OG6/00Aa8B75iapKaKeo6cZv/XnagA+YeWZS1tmqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ea78tAkv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31a93a4b399so2451601a91.0;
        Sat, 26 Jul 2025 00:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753516404; x=1754121204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Yt4HAobT14RazfW63r3vFdQaxxPOup80rKFVAFgqHA=;
        b=ea78tAkvDErsX3ooGGpyM2Ejw4Bwn/zO88N9ulzcWdwXrMvnWRz55w+RU/f/ZDsbUn
         QrpCVIU1EO3/oYL38r5pNvXL6SD2d0XmSRcQEwbqIjl3rQDnH4Ss7go2dixmMImVZCCE
         rdOvBxNohgYO3pDUSy6dXDR8GCbCLjKFnuTbdxKEEbJ7fighH03RIZHWDqIJYPqF6Sj9
         pB4h/bS0D8tflgXH6B3WleBTBQRSJCmleHMwZicTC6vqUaRijIIvE7ugks2uHTviN7jr
         tusKMPD2LAPBFfVsZpghHMDoFZLFtWvb3Oajw/PSaG8m7w8W7D7NWO5kZtKghC4xUBWe
         KKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753516404; x=1754121204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yt4HAobT14RazfW63r3vFdQaxxPOup80rKFVAFgqHA=;
        b=kB5wPK2TAu7yDzwpSwkn6tdKPCJwi9qUtSSGcT3IM9dDVUynibcpblVhyjZIGtA7X+
         CL8RQx2JPOttwohqsHSgzLDPaGI5Ai340hJuOXskdqYfyJLQLqJ1ZMTOE2+k4YpggX6b
         TPfdPrnGR10I3utatdxGaG/pcqNEhf0rIhn9x4GXP7DAiAir4pY0rDPLhnkHbK/EYlZ/
         NZYAnKtK+Uf9eaTRz+9De07m80Eysp2IhXsDHbVc0WiEYGfkYj2eYaxdP37dIV7tPI1W
         IGZxiBGX9VFegX8eMZu53kBQ72+LLRsjDoHJm451udTn3GqBNzqPyOscvP30yTyc9nte
         4z+g==
X-Forwarded-Encrypted: i=1; AJvYcCXzLhxLf+k3+VKD+5WURqv/THV3v7hYGjWBlEfsyn/hIe1A40U23ESFoaU8aKjW12AOGHWZ6/BUwFtlGXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRAxLZS9zrRFwTU/bkJ+MGSpKITPpBrDWpsHru6YrqRcMFDy4
	/HlVl0QMr9BRvwmOROcsrhVF57ZJtXu7+1AbV6MsdXupL3TJWqiUVN6C
X-Gm-Gg: ASbGncuaSizqE0vNJ4WkAsJJJu0njBrlPOiXcoCaWdAyragekIkGTwzPXDyO4q56TQ9
	JAdEKBimSHS8lH1A0u4wFAXxvwvNQrgrOcHTjHI9aHX9nXdAysHay5zOM5IHg762I0/IqiJvgd0
	7MKCAHP4Op7b7px8afdYi/v51zP1ilpNzpXAsmv/8uMbu9s1f4kbNnI0dqpjRTiLCyCJvTLSIPV
	ydsi4atJ9sFXSsCIgmjC3wM/LWbxg3ewKP5ua8Hrv4dPR3zTsE7dRDmEbLpXx0rYo7aoaem4VNm
	Ffuf5dMIiRz333uxPqUU/9pFOcHNCKtQlqZkn66/3LBiA1LM5AsbJg+df03khAnREEQl2T/ov4s
	bL/qa3hMJPy9eZpB6LDqhFOQRN3bqtHtfESarTRDKVw6lSaelrnh31IbfiBys9kDEaluUsZmk+y
	tl4suDhTAZM44RqG8BLJeG
X-Google-Smtp-Source: AGHT+IEPgjn/mmIAH6VpRWah8+yxJ+DkOYJ7QQBBBEaP/6OKMlER0ABmom9pxqmiU946l5nzGW9YHw==
X-Received: by 2002:a17:90b:17ca:b0:313:d342:448c with SMTP id 98e67ed59e1d1-31e766b2893mr8107395a91.17.1753516404208;
        Sat, 26 Jul 2025 00:53:24 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm1234979a91.1.2025.07.26.00.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 00:53:23 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 26 Jul 2025 15:53:12 +0800
Subject: [PATCH v11 2/4] staging: media: atomisp: fix indentation in anr
 files
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250726-new_atomisp-v11-2-46eba1953fba@gmail.com>
References: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
In-Reply-To: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, llvm@lists.linux.dev, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753516395; l=5441;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=ZULe9obZ09AITQHO9BPnUCZXts9FE3eLccsfGy5RX0U=;
 b=AgtRwFex1T15UFET84o7CWlbPodZi1H5beaOHwVBcLcLILBSLkTC1scspv3/Tne+sg1CU9lcn
 QfFfodWM4beC0U6ifw3GArxJRb+SfrlizqklWxWgNXKmJK4Vl0L8xAd
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix inconsistent tab/space usage and bring function definitions
into a single-line format, matching kernel coding style.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c    | 20 +++++++-------------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h    | 20 +++++++-------------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c     | 14 +++++---------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h     | 13 +++++--------
 4 files changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d566234b9d3a35401666dcf0c7b1b80fd5b31..49c22a68ec552ed163e3268db2b823fc4ea73b36 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -21,20 +21,16 @@ const struct ia_css_anr_config default_anr_config = {
 	{10, 20, 30}
 };
 
-void
-ia_css_anr_encode(
-    struct sh_css_isp_anr_params *to,
-    const struct ia_css_anr_config *from,
-    unsigned int size)
+void ia_css_anr_encode(struct sh_css_isp_anr_params *to,
+		       const struct ia_css_anr_config *from,
+		       unsigned int size)
 {
 	(void)size;
 	to->threshold = from->threshold;
 }
 
-void
-ia_css_anr_dump(
-    const struct sh_css_isp_anr_params *anr,
-    unsigned int level)
+void ia_css_anr_dump(const struct sh_css_isp_anr_params *anr,
+		     unsigned int level)
 {
 	if (!anr) return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
@@ -42,10 +38,8 @@ ia_css_anr_dump(
 			    "anr_threshold", anr->threshold);
 }
 
-void
-ia_css_anr_debug_dtrace(
-    const struct ia_css_anr_config *config,
-    unsigned int level)
+void ia_css_anr_debug_dtrace(const struct ia_css_anr_config *config,
+			     unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.threshold=%d\n",
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
index 4f77900871c8b9d43bdc00308aa914eda3af7fa7..2f17d62b92087afd26aff2a49dadf4ee2fb7fcf5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
@@ -12,20 +12,14 @@
 
 extern const struct ia_css_anr_config default_anr_config;
 
-void
-ia_css_anr_encode(
-    struct sh_css_isp_anr_params *to,
-    const struct ia_css_anr_config *from,
-    unsigned int size);
+void ia_css_anr_encode(struct sh_css_isp_anr_params *to,
+		       const struct ia_css_anr_config *from,
+		       unsigned int size);
 
-void
-ia_css_anr_dump(
-    const struct sh_css_isp_anr_params *anr,
-    unsigned int level);
+void ia_css_anr_dump(const struct sh_css_isp_anr_params *anr,
+		     unsigned int level);
 
-void
-ia_css_anr_debug_dtrace(
-    const struct ia_css_anr_config *config, unsigned int level)
-;
+void ia_css_anr_debug_dtrace(const struct ia_css_anr_config *config,
+			     unsigned int level);
 
 #endif /* __IA_CSS_ANR_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
index 09599884bdaefe32f891f437274b96110888a675..3c6d99139cda6f12eb6ef6fe8f996f7ff11551c2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
@@ -10,11 +10,9 @@
 
 #include "ia_css_anr2.host.h"
 
-void
-ia_css_anr2_vmem_encode(
-    struct ia_css_isp_anr2_params *to,
-    const struct ia_css_anr_thres *from,
-    size_t size)
+void ia_css_anr2_vmem_encode(struct ia_css_isp_anr2_params *to,
+			     const struct ia_css_anr_thres *from,
+			     size_t size)
 {
 	unsigned int i;
 
@@ -28,10 +26,8 @@ ia_css_anr2_vmem_encode(
 	}
 }
 
-void
-ia_css_anr2_debug_dtrace(
-    const struct ia_css_anr_thres *config,
-    unsigned int level)
+void ia_css_anr2_debug_dtrace(const struct ia_css_anr_thres *config,
+			      unsigned int level)
 {
 	(void)config;
 	(void)level;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
index 2b1105f21c1e2b37144083b6bb8f9dd465a2f43b..36fb6c25969991ffcdd4424a695dacc5b5c2a9db 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
@@ -13,15 +13,12 @@
 #include "ia_css_anr2_param.h"
 #include "ia_css_anr2_table.host.h"
 
-void
-ia_css_anr2_vmem_encode(
-    struct ia_css_isp_anr2_params *to,
-    const struct ia_css_anr_thres *from,
-    size_t size);
+void ia_css_anr2_vmem_encode(struct ia_css_isp_anr2_params *to,
+			     const struct ia_css_anr_thres *from,
+			     size_t size);
 
-void
-ia_css_anr2_debug_dtrace(
-    const struct ia_css_anr_thres *config, unsigned int level)
+void ia_css_anr2_debug_dtrace(const struct ia_css_anr_thres *config,
+			      unsigned int level)
 ;
 
 #endif /* __IA_CSS_ANR2_HOST_H */

-- 
2.43.0


