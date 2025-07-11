Return-Path: <linux-media+bounces-37477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C27DB01B3D
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 319703A682B
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 11:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8008C2BD589;
	Fri, 11 Jul 2025 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDYxA67M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403E28C035;
	Fri, 11 Jul 2025 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234888; cv=none; b=GRL/JPXG4OWFIyehDpZlA9vnTN+JAGiYJx99K9LYrj8jR9AJ2ZCRQi2c0CTPSx0mOQz7iuPvAYxKrWLXwZ/P+BG4SDCyo6wrcCt7LzVpce0O2cdWdam0wyvzGuimTEBIEj6JrmIy0lwX6K4Fsi5zCUdZ5pfrGpT2aidJqOg6JB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234888; c=relaxed/simple;
	bh=AZX6kVF1g/cRe8XsgNWI9KMwm9xW3d2j4FgbxqLevNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEekQnCCyT6W0PX0nxgqFSDR7F+G3cMe1UJx+TC2ibRg2qFEsNGU9qGM+lgge3a7oBHMxpcvMwYhwAnrHJvN6wHJTgxIFSIRbPEvHCOYrtd+prVMKm6Pd/XE6iNKJvs5Ss0f+JyJ+E7HBLDmiVRggI+cBdAf+pf/efGUvJXiEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDYxA67M; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-236377f00a1so18938345ad.3;
        Fri, 11 Jul 2025 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752234885; x=1752839685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJw5YhlCva5K9gfTlJfdEIZ6FPIj4yxrNOWwGxsH+uU=;
        b=eDYxA67M8eSryeEZQRXcr5WLrPEAFPzqjBMb14OhUir8+Cd9nIQOcORmNtKCd5g7uK
         ywUtlniNKmS+Up4jb0BTWUn1Xvv6NMt91feI6DF9U4oN+Q+/RPEWZtFhAPzQewe626z1
         Gpp9bUIyqQdyFY5Dtuk5lRq5dHoEqpBougllMdpbd56GdxSrWNa4I/4cyiNfuh+lH1YP
         2m3apcP2HK25K8V6BOCveIr4GKEAIVKCice3JYpcPWg2dBVB95bgaECU3ZqVsAm2cCKT
         MzNHLPw63yBrnE464FWwQfWo873C8t2JKkqZsKGIMbF9QDtDelLH2e6XZzco1Lpcs1Wy
         T38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234885; x=1752839685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJw5YhlCva5K9gfTlJfdEIZ6FPIj4yxrNOWwGxsH+uU=;
        b=XI3zZV7V2NI4efhiB77tfdIiC48pAgPGKXt6Xeb3SyTi2f8uI1mzubaN/QpdKVFHjS
         2AioKC10PgSHz3kGjavcgMorFmt1grA+y4NY1ANvTHdCjCusyEkkn3q7MxArdGGhi6GG
         BGudkjm6kqKqQYr++4s0lgi6nGEu+zwP3OrZ9pVSUrvPcd7CcfjVYBBLbMoxaRMTnbh7
         vE4dbGtNA22DVXTqkQzYYjSP596tx1XtEHFcyorE3SPxLpJXxl2duMC9FWWiOrKpl95c
         fqneC+FVpHTC+fkrjYkR0D5uBXOLrPBAun5bBYh8XE5Buxty7GcR5K3T/aOjMxkLahhi
         /viQ==
X-Forwarded-Encrypted: i=1; AJvYcCUotvrzdjb2/HATKx+Suw3hu13Mu2CxfCitUTrhkxju6o3ymLr9Ce9fW80s03M7OiPKhYRXNEqBD5M8dgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzX9lSP0+qXL0r9/R12Id8y0t1QfIMnoXHRckSrE79PVOQpID8
	FVMYOgOBj7nt4BKWEVLr2s9ihiOApXIqmVI+zLUNWIh3xFIxEgqw6umFNjdU6zwE
X-Gm-Gg: ASbGnctQ+55/Yw2gH8ALAM6ax4Wifx3qVqQkfiqh3RpgdOtxQ6K6kKKmV/VZA31cDE5
	BWR03NR7pSX0gOZqLqEHJCc35G7wdfbsuWaOnpESJtFvJMSZ/OamsXsavY11/fmQP/pLzrnW6db
	rFwM7WB2TMtzNoIUldEJhb0umDWeUOBmzMP5M/k4dQHPtEbEM4jGW3c7SV8qjdYQyLRAinhM1D/
	G5FNoNKuf3QzExfXpNkukPUe76IlqsOwIhdAMiYJYnVK45HuKKLmhWecahUZNeDSkoZjc9BaxKE
	jT1KZimqV2OTePxLIECh2MaG3w/trIQa2X41o85o8pMQEXZB9ytZixt9kzZek09tI40ymzU0ZkP
	ibRoSbWACeIhgvUjpvCX44ibpzRLQ8cqlOVWv7E5ROKqsFhLnuw4RxJq+vwbfW3J8NPUWWKM45t
	Q1XpdKEXItRg==
X-Google-Smtp-Source: AGHT+IE/GNQHsDOkg4hebFNChU6e40ICf26SOfPwoJ/7Kba0PNQnjHtm2s4+itACNqTLwFmps56A0A==
X-Received: by 2002:a17:902:f603:b0:234:d292:be7f with SMTP id d9443c01a7336-23dede7d45dmr37114665ad.31.1752234884488;
        Fri, 11 Jul 2025 04:54:44 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436e8e6sm46042135ad.255.2025.07.11.04.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:54:44 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 11 Jul 2025 19:54:37 +0800
Subject: [PATCH v9 2/3] staging: media: atomisp: fix indentation in anr
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-new_atomisp-v9-2-a9dd62425ef6@gmail.com>
References: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
In-Reply-To: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752234878; l=5863;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=AZX6kVF1g/cRe8XsgNWI9KMwm9xW3d2j4FgbxqLevNU=;
 b=rmyCv0VDLYJVaFTd2HhQBMdEAJsgDwWu/HBjUPhHYGPHLPe7K+86ROdVrHA+qHw4fqcXV+g7K
 TnV6MawUe2QB5tk9Gp/598KkW4AXI+9aiyMnNXB30OaFt33XqQFL98c
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in anr
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75Vdd8aOhQ73opych5WohuM2CXq2dPgdgHW0ZdYHRU=u5WQ@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  | 22 ++++++++--------------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  | 20 +++++++-------------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   | 14 +++++---------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   | 13 +++++--------
 4 files changed, 25 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d566234b9d3a35401666dcf0c7b1b80fd5b31..ed582d38b27fbf6839a71a4037c310f320de3466 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -18,23 +18,19 @@ const struct ia_css_anr_config default_anr_config = {
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
 	},
-	{10, 20, 30}
+	{ 10, 20, 30 },
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


