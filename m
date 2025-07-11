Return-Path: <linux-media+bounces-37478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D3DB01B3E
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C17B3A6321
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 11:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0CA2BD5AA;
	Fri, 11 Jul 2025 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5DOq1ND"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF94299949;
	Fri, 11 Jul 2025 11:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234889; cv=none; b=dGSEWt6QEKPCXv2FlnoJd14lrgyBbrOThlfIIKXYmovrJpdpGTx17v/bzkUvYn9UJvm6oAYAb1Mxtc4jQLSmyaIcY3bwOMVSGGW53psa6MSX04/TqFnPfVMpR0JmrUbFpoLpDm2Jy89zxnFlnfSrPIaoDRYLU9GNLrpU/jui73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234889; c=relaxed/simple;
	bh=AqnW7/c9nG03ZAzoPbA3nRf1z9VOfMnwRCXHwCluQ3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WyGulL5mw2574UkT7mlypOKcUEOrz9T5wFzlaJBINbWRzJ9wo1kbspWqKJoOXoYB4AIwIXhrtMiiXX9UmYRgd0f0wQw/zpvOzlvSUZuHnD+ElNbRWksl5VCXa7/Lp7Tw9st447Tf5OlbL56DgEACDCgaD4yC4uDliPIBCLBfe8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5DOq1ND; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2366e5e4dbaso25176605ad.1;
        Fri, 11 Jul 2025 04:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752234887; x=1752839687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFtn4/ZNNp1Bo82KZbs6Ml2JzOPxRd2Eu3X06xLlUB0=;
        b=b5DOq1NDiIAtuwnrI9CuEh3hD+HKQO7rAHdvq66siVHzyS+q6VqwtC36zOoGvyT+4f
         lB6M7C4ioU1LHGApHWV+SwdY2VW400IJhw+3arLs2GOebMdeyVAcikrZaaWX0n/6i+dq
         IpzbZ+dWqSMGj86ZwEPP752DqZDNVNrNFWwMp2wJ4hF9q5GIwTAqlJ4gQulzYUK6A/ZR
         d/y1gpArZ8i7sivcU7Ol3WRhEUT81e+1lUdBwgdce0j3hdXmeIIBvqdPhX0swBWLfHZ/
         taKMOjR/yanSlisGEqT1XwIOkHl7TttAnma9Et16hWzogWtcO2kN2ws3dIUTKRY/odM6
         dY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234887; x=1752839687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFtn4/ZNNp1Bo82KZbs6Ml2JzOPxRd2Eu3X06xLlUB0=;
        b=aKFOjeKLU40kkrm61tBDPWWlZoeyVXvk1XtNNjiLQYbaXyGBMTkxuTaaKAKQ8MFFg/
         oKvyWzmOa1LpXk1cBPm/6+ebysp/HOJ+qyxW7Nyqoj/fWy5NWlQgT7P4X7jkFetpJQ2n
         qxHYOLdjk7fCEQI+l3fm/oshEQtHy+TxKUMlGTNQJJW6hMJprXVx3ZzjUw/3BPgNSbnm
         lSYS/lNuiJJntSxz6+00IhGRVF9jBfKu9KHJAjraLbNcVZZZnjAgoHh8ysB90GqGq9Nc
         XMucob8edsK6Wy71tQgwv+cGxfb42opnXdn0zC2YR02VEd+BYb8Kjs6KpGzU5hvaqjYP
         1qeg==
X-Forwarded-Encrypted: i=1; AJvYcCUPyIyB+pxAHAhzAVLxXdXzXMJE+YsY0ibieE5t49EUGLZwtOfc2PwXU1vFiWgJZbYcg3FXO8DFFIznUFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxatI1SWz6dwMm1JPAOMAuIzJq0DUvCbJBcIleyPbnznlVX3Rei
	vcrk7xkyRXKsAVGh48bUM5W6zZyJGWWgpKAzNITKwTXwz94pvkSiKf5rHhTvMJ0E
X-Gm-Gg: ASbGncs34rcf527fWLMf/UNpHVWPIo9qp8w80GnYfKaTANTR7y7s9hbepn27QodTabI
	+gAsB6z4y+lIhlR3H4l7pEE4qkdndbkwQP8MpCCO0Nzry+mB37Z9iTIHGSr/cM9EL2hdVTHqB4f
	WWg0ZC8TOANOWGGsIa1q6dVWXYphSEIO/UV05qF50VxN9vAMai/L5eQ3z9xfZT1iyKJGpMJho1T
	Ua0QDh7MlxZS8NSp+Tm15Kqe6tD3jfuqgqLGWKvYkrcyWsRHvy4rxzn0Q/rH2KXFMIZpB5PSqaC
	jNtkvjqxIguzyQewHSxcFttm00qnQvVvtK4WNHO2s1cWlq+/2sleyXtfz1OCwZQyHkUcPZDBLef
	0B2vtxGRrVoer2MOeyOzL/lPKTRgY2Fg5hB7nN+tFYSL/lJm0P4g7kCA/XajP/I/TzULe+J2c2g
	cV/gtNy5xUkg==
X-Google-Smtp-Source: AGHT+IEk3wlzIO6RTnSOOWPjjVxW4BIHUDcW69FxA6Pav8/0J2N9+2Fr/Tpp38Fh6+83Gp6nU/1yvA==
X-Received: by 2002:a17:902:e951:b0:237:f757:9ad8 with SMTP id d9443c01a7336-23de2f3d787mr119083155ad.1.1752234886745;
        Fri, 11 Jul 2025 04:54:46 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436e8e6sm46042135ad.255.2025.07.11.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:54:46 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 11 Jul 2025 19:54:38 +0800
Subject: [PATCH v9 3/3] staging: media: atomisp: fix indentation in bh
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-new_atomisp-v9-3-a9dd62425ef6@gmail.com>
References: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
In-Reply-To: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752234878; l=2874;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=AqnW7/c9nG03ZAzoPbA3nRf1z9VOfMnwRCXHwCluQ3M=;
 b=N/M9KDmeKL/PVf0VtYy6+31rlg6csjPjfMikXL5zCjcyaiFAiiA7l+sqWvaClFLP88uYyNEc3
 0bAdZjbfLgBDtypt55CKlXMfYwUt4m0K6L2OD4+plyDYs+SDYYkQkxK
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in bh
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75Ve7y3pmZ5g8YXLNHyZgmZpiZNAuDdNfmhxYTOATrDBz5Q@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang<zaq14760@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c | 14 +++++---------
 .../media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h | 14 +++++---------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
index 69c87e53f3c22fade6c4c7914d1550f68dd8f5c2..b87eb1a21b216dc6132331d2a48d7cb56ddaea24 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
@@ -12,10 +12,8 @@
 
 #include "ia_css_bh.host.h"
 
-void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf)
+void ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+			   const struct ia_css_bh_table *hmem_buf)
 {
 	int i;
 
@@ -37,11 +35,9 @@ ia_css_bh_hmem_decode(
 	}
 }
 
-void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size)
+void ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		      const struct ia_css_3a_config *from,
+		      unsigned int size)
 {
 	(void)size;
 	/* coefficients to calculate Y */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
index 36b360cfe62e65037522e0037cf51fca0fabdfba..964d658ceec31b0b22fc3bc6d19b40b07b2fc06c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
@@ -10,15 +10,11 @@
 #include "ia_css_bh_param.h"
 #include "s3a/s3a_1.0/ia_css_s3a_types.h"
 
-void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf);
+void ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+			   const struct ia_css_bh_table *hmem_buf);
 
-void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size);
+void ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		      const struct ia_css_3a_config *from,
+		      unsigned int size);
 
 #endif /* __IA_CSS_BH_HOST_H */

-- 
2.43.0


