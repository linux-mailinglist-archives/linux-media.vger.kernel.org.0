Return-Path: <linux-media+bounces-36851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10310AF972D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 17:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F0F37B98A9
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB4F309A52;
	Fri,  4 Jul 2025 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMvIconC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17482D9ECD;
	Fri,  4 Jul 2025 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643680; cv=none; b=NNkJoRw5UGkgnYT0BdaeSgZv9wNFWNjpCu2sTxIeuVjXSi4u3spnWcrYc69e93cdEpRn0pHIygf5tjtGoMSFZcczJBI4mgiQly2Diumojz2HWnJEewKgUZsj5xztyhSrx/3XjWwOAVBg9GMuGzoCA2Dat4NQdD2TKIPKhE7/goA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643680; c=relaxed/simple;
	bh=3O23PovrqC+Eqola7rZwzAQ/Qycsqf0zMsQd7QF+gy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUcRshWjkWOpeL13Z3XTAEGd/QLxIW3wkqTJWeCoKxxgxTwuVYWQ8viKlwv9Gs8hNmo6uFteE1VNxB4HA0Nk62tL9n9Ildneoz0TBSJ9SIuL5hRj9cy6l4fR+ZHrUjQwdyVwTxsIYUthWqRwVoE2clXV2nsXqE9KK6tesz25rZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMvIconC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234fcadde3eso15819545ad.0;
        Fri, 04 Jul 2025 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643677; x=1752248477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bwu9r1p26KTOzo+HYJ23OLsAkP90JLIljNiM101BJZc=;
        b=HMvIconCuNGcWo0NNXiBWqf4D8firA6ueUtE7XHmv21WBnV4C8F3ootPqIM5/LVQPB
         npgNmT2He5XQjFfH25jGEOCH5zkSjxXrX4PzB6spmrwT91JB/ti9WPdW1zcAwuKbqIi1
         Yo54FsoImJB3LVqonLMQYYi5CQ/9KbalV/bvnOzBNEDDtFmWa/FKF4gdjOHnq2SotriG
         06YvugGgpHiIRTuPdkkQYpKz/QPjgwlwVVZijehcWXgLSzeIy9YBsOYqJo2TpHEjN+1Z
         F+LwLuSy03GtqONs9TreJRP7fXj5dTOeLmkMvsQJSfmmoW+FgiWt5dEyerd1pjy6vHjY
         mXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643677; x=1752248477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bwu9r1p26KTOzo+HYJ23OLsAkP90JLIljNiM101BJZc=;
        b=h38vMCEwsWiiQjK6E/BJbDKKQ6bjIebOXPkCc+GVetDLfv6OF4Ee70hHpO1UIfdJMD
         Ip2bBKe7pNPw00eCKJZR0tktyAqTAYYhc+Yoq4WuYj2Xpb3QTlDwGfCIYhMNs/+f44LE
         5skW6MlRh2iBHIxQgmM0as+ZfyONBDEm2TF2K7KCNCMvwNjlt2gIgyKDNB1tn0G95Jem
         qpBhSYMmmZuPVdAFdcabV0kT8BU4Lw2tUEcU3XTSZuNQDNRBxQG+tsWk1ZpjOy9+fHD7
         AFFfMBYUCBp3Wx6gdaJzCErwgxYHjCijzR9uWv76e03+8VIbx+1J2t8Y3wtp6xhOqyV4
         TY7w==
X-Forwarded-Encrypted: i=1; AJvYcCXqNgQcwvHPw5Ypje3SOiED0COO2x94yuYwpEMT0i5Bar0mkJaYfSmtqnleUtLoS/VyFTAtYAR/Ti84suY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFg/do01ffjcKfl8N7VjQKIn0JxFfmk0PIYKsrYpFl8dcQeOqp
	rpkuyRg5N6ioley+IZsWKgw1p8Ln0TPeTPWm+BfoP/QkqjYkYomqRvTu
X-Gm-Gg: ASbGncvAIS9FqVhV677JVAlrrRdCm3lIAIUW96d/Y0fpjBscPYreUGxs8WF28PaS2zw
	1Wcr76sxHQXeoUtmYcepmoOaTzTUlitQaB7g8J7VIjNQm48ifJT3qd7aK054IOE514l7Lq/DnGi
	TDg7FfO1jMgLmxRfqX4d7UXjFjVo5UvAuCvmB7uMDWmBybC/VoKmpk1E296QRmIxsNd9Zd+T1y6
	Gfx9GUz726m0TCjaIz69SMUHQUB4egVLMQ12pG7MBlD7Bqjx/OrJZwrTY3Zf+/B8K/Y9GZnaviM
	mT/QZN+qudMXM6PwAZlfeJOEywEtnYel0+huLuTNRgFaYrrmuI/KlWVmsazN13E3zFY4ZiPGZQB
	uiDimMbxNYuq57HCKycRSFa9GLfJxiQcgfIwEhmrHfSECs+mzmQ==
X-Google-Smtp-Source: AGHT+IHRLGL6bFK40PS5q8sdOtdC/6UZeqO1blXqQ9ve3eUIkRtlKPo2QyPqLuUTF53vj/rKWQe8rA==
X-Received: by 2002:a17:902:f611:b0:234:a139:1216 with SMTP id d9443c01a7336-23c875b0929mr45400045ad.44.1751643677091;
        Fri, 04 Jul 2025 08:41:17 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a4b6sm21912375ad.29.2025.07.04.08.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:41:16 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 04 Jul 2025 23:40:54 +0800
Subject: [PATCH v8 3/3] staging: media: atomisp: fix indentation in bh
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-new_atomisp-v8-3-2a8560cbd9be@gmail.com>
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751643666; l=4413;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=3O23PovrqC+Eqola7rZwzAQ/Qycsqf0zMsQd7QF+gy4=;
 b=jsooQGeH4Oti43sdbaM7xkpUZi/H5mJGJo1rmUlAOD+cqljrTCu2kpqrh1QIeyRUN2JYRgOSe
 Lt0OZfYBTPtDcX9kFVYBDJvkH7Q13HHfO6cWW7Ofxe5I+6IY67SeBD6
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in bh
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75VcPzq9XrFD29+uZ1rbFcDxb4UbXNkv_QZ=3iyVm3dxyPg@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang<zaq14760@gmail.com>
---
 .../atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c   | 18 ++++++++----------
 .../atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h   | 12 +++++-------
 .../atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h  | 14 +++++++-------
 3 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
index 69c87e53f3c22fade6c4c7914d1550f68dd8f5c2..c120ecb178b2c60a3512725327779819d1888268 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
@@ -13,9 +13,8 @@
 #include "ia_css_bh.host.h"
 
 void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf)
+ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+		      const struct ia_css_bh_table *hmem_buf)
 {
 	int i;
 
@@ -38,18 +37,17 @@ ia_css_bh_hmem_decode(
 }
 
 void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size)
+ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		 const struct ia_css_3a_config *from,
+		 unsigned int size)
 {
 	(void)size;
 	/* coefficients to calculate Y */
 	to->y_coef_r =
-	    uDIGIT_FITTING(from->ae_y_coef_r, 16, SH_CSS_AE_YCOEF_SHIFT);
+		uDIGIT_FITTING(from->ae_y_coef_r, 16, SH_CSS_AE_YCOEF_SHIFT);
 	to->y_coef_g =
-	    uDIGIT_FITTING(from->ae_y_coef_g, 16, SH_CSS_AE_YCOEF_SHIFT);
+		uDIGIT_FITTING(from->ae_y_coef_g, 16, SH_CSS_AE_YCOEF_SHIFT);
 	to->y_coef_b =
-	    uDIGIT_FITTING(from->ae_y_coef_b, 16, SH_CSS_AE_YCOEF_SHIFT);
+		uDIGIT_FITTING(from->ae_y_coef_b, 16, SH_CSS_AE_YCOEF_SHIFT);
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
index 36b360cfe62e65037522e0037cf51fca0fabdfba..9912dfea06074c6ecdbb1afb8de771b54b45aebf 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
@@ -11,14 +11,12 @@
 #include "s3a/s3a_1.0/ia_css_s3a_types.h"
 
 void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf);
+ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+		      const struct ia_css_bh_table *hmem_buf);
 
 void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size);
+ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		 const struct ia_css_3a_config *from,
+		 unsigned int size);
 
 #endif /* __IA_CSS_BH_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h
index c717c636f666b984665f9d11c494843b55ee8c92..d62cb05d201dc8c9cabda03256f1d16103c5161a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h
@@ -10,14 +10,14 @@
 /* Number of elements in the BH table.
   * Should be consistent with hmem.h
   */
-#define IA_CSS_HMEM_BH_TABLE_SIZE	ISP_HIST_DEPTH
-#define IA_CSS_HMEM_BH_UNIT_SIZE	(ISP_HIST_DEPTH / ISP_HIST_COMPONENTS)
+#define IA_CSS_HMEM_BH_TABLE_SIZE ISP_HIST_DEPTH
+#define IA_CSS_HMEM_BH_UNIT_SIZE (ISP_HIST_DEPTH / ISP_HIST_COMPONENTS)
 
-#define BH_COLOR_R	(0)
-#define BH_COLOR_G	(1)
-#define BH_COLOR_B	(2)
-#define BH_COLOR_Y	(3)
-#define BH_COLOR_NUM	(4)
+#define BH_COLOR_R (0)
+#define BH_COLOR_G (1)
+#define BH_COLOR_B (2)
+#define BH_COLOR_Y (3)
+#define BH_COLOR_NUM (4)
 
 /* BH table */
 struct ia_css_bh_table {

-- 
2.43.0


