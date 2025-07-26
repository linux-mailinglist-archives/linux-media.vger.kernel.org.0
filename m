Return-Path: <linux-media+bounces-38500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFD0B129A8
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 09:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96094163294
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 07:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C033222586;
	Sat, 26 Jul 2025 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9FzLgZ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E617221265;
	Sat, 26 Jul 2025 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753516412; cv=none; b=m9FyYex0hCJw7v4CRgK497WrHvSgXOhfnMzzE9YVTWdt21W0oRCBVzCwHoUAI0IAn24WHZ0Su9Oc0t8BlBAX2PVkbc47HC2bl9ajTMtZTTMji8Zqc7LfgBKV0byKLsTv61bAGNYMxyZYUUhTwLVkhXmzpONX2C5C/gwYcLA3oJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753516412; c=relaxed/simple;
	bh=8lW0FT+ajGfnaFktrf6Ri42a5YHuN/0ryZeZh5gSR8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSyLyT1NPGar9cr228RzQ5hnxMqj2iGZumZAyC4p2tEr8pJZGoh2nRLDbZh6t3JLmxnyaTSXhIIHiXsgiDIhdOb/vTdi4TAs0luBpLObx+DRv6Jhj3iGwLPOvawKTfobLKllTsBYckLcA9T1kajOO2q/4eI7pbOZ3sewc+TRB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9FzLgZ0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-31329098ae8so2504661a91.1;
        Sat, 26 Jul 2025 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753516410; x=1754121210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbVhOvrEHD79IFkFX+s0ts9glhzmC/IrVv2w0Cn+ND0=;
        b=e9FzLgZ0qM/RFCTMMQibNFgj3ek/SxnwMnQhW7DrQCppgVg0dxL3nloIy8uQQlnlpO
         gSlyrlykaJDzoOPFbFhnciJ59+G0BLIa9cu4Cne8vTl2XuhYa8guxKA2zUfFORebMJen
         3IrABWFM5wZkbJGlMIPEKGKQD2T1LKVPBXwFcFK3LiWNGPI52w+TDgM6BS0pK+GDhBAr
         wHqC6iie5yRi1jKtnEgfgf6PLLN2cXhytcD9Kkw7v970RaOqcczQONSkYW1aO9bzWHdS
         F4XBHNmfRrUhYwym140EsNagdbBZbdqTmQEzMaP8+/8Q0dhJ9GgtUbCjBitvEqjdty3r
         l2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753516410; x=1754121210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbVhOvrEHD79IFkFX+s0ts9glhzmC/IrVv2w0Cn+ND0=;
        b=dlN2YlxDOYVwqvnlTyyLCEUMpTvlpFRljyABA+gQmSohL7YgfY13TO55V+laRbIXmq
         EKRHhIhjWqg8slW1zzmd57rxHZnEuMOjE3KisqUGOqNbyne5T8MhOM+ITOzyLK32uRNo
         PLHVrS+xXObU9csWHJRMVI1rNbMhdTsQHVW8pSd+8X3aYVAbmwC2XRjlCmuZuuFnunin
         +9UTGKoQ5SGWaUMMCC7aneUXqJU3NkIcGKPEM40i3Y7iueHop+hSRgSdCf6s5FTa75Nu
         xU5Mg4I7YqSG56jS7QNFzmE/hfDNUvad8On6HeRWN25lj7p8V4qSdxyYR+dewa/NOlcq
         eWlg==
X-Forwarded-Encrypted: i=1; AJvYcCUx+SzmUGFgrxOkbHcTOWlfELSacnvUFiTddP0/izyZD+pNJzFxEs4JqgfabOfWylua+KpZD7giML+E5sU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw6gpkf1s01jGXY1nTrWWZwWIlgWwbjQopd2P4HRXuhiZsPfMt
	FSOPzhnWN3Y0UrxjeOrYoJlogPXup9c0T3GBIYvuTWZvQu0SS7aH2egP
X-Gm-Gg: ASbGncugiDtUKY4B9FborerK4ITdECOZSahkAT5XP4lApIwGDXH978FrdIu2tLKEHZ8
	iK269zjKp3IVO5x18vpboHVMib6t8gb16mm6n2wAshpQdmqDOLGejdDKsJpC0mBoKhwulZt5kW8
	QXdCqK5cAqDLQvyddx1ubpy1ySDXJ61qkMWf5c9z8UlWwEhXUs0+0MmD+yofA6E7XFFA6ptsEzD
	25F3So0za0S63uIwkxOPf15kiBB/rwfXv8VTA0+DopwsAi9HRBhqWfvwIykuOpJwQnYY+xuO1Cm
	du1BFucJbBI4fTNUS1yCV+Qx0IZhGDTWNkHTZ/qaFYTAYmXMAyQGcE7OQjtMqAjBTJQOuOZS+NB
	GGh2hx/yS77vmSCGgi9fsjr+EsMyokhRN5YOA54xaIt+2pMsGsAIU6s/YRLXD08IzOH2ov8DywA
	YKRqoP4d3omA==
X-Google-Smtp-Source: AGHT+IFmlk7XXVSMK3hNd32GHRMHBVCZAZZ7o6LG/w9Q3uWyVv9bdoRY1q42nhwjVoQFJpQmqbXmrg==
X-Received: by 2002:a17:90b:5107:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-31e765ab632mr7648749a91.2.1753516410213;
        Sat, 26 Jul 2025 00:53:30 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm1234979a91.1.2025.07.26.00.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 00:53:29 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 26 Jul 2025 15:53:14 +0800
Subject: [PATCH v11 4/4] staging: media: atomisp: fix indentation in bh
 host files
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250726-new_atomisp-v11-4-46eba1953fba@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753516395; l=2576;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=8lW0FT+ajGfnaFktrf6Ri42a5YHuN/0ryZeZh5gSR8s=;
 b=FpAPIRhKcJ5aQrsXmb3ZqlV1+MoowmEJAPvHkLxx8h4kxCQV+9Ynx3OVzR0RYVQ5KhxKwrIzy
 cX+lC7RRN+GBYXWOEzhc2CS8biUHjG/FT8G9CIEE1I/M8CWXXjhq/Vy
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix inconsistent tab/space usage and bring function definitions
into a single-line format, matching kernel coding style.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
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


