Return-Path: <linux-media+bounces-35792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66DAE67E1
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 642AB7A2249
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BE72D23BC;
	Tue, 24 Jun 2025 14:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSJoCq6q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE352D1F72;
	Tue, 24 Jun 2025 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774227; cv=none; b=o+vS21HYxevAxyxO8/w1en12C06PR56xSCp2GQj9zq15mQj9H+uRWtRGgY+nN6h3HYGBBNyE2AQO4R2Mt7IZ6HQgx9jeV5sT22kEwS1DD9NVaGZxFkEZ7x3/pRwGrKHkVyvHAAqrUEx1rE1KkSTwZLn/HMatK7b++1UHdu28xu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774227; c=relaxed/simple;
	bh=hu5D2yG7YDF3qT6VuNJ7QELnHxz0FGP6x8nWUeh6yOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q0eQyrPTpXgzXo/zt7VCukLR8gZyI5KQ4wk3BAOFUSZKCa4zMvmDjSHzuKqc1VgrRk+NHAFRe3KY4feHitemZ2+z4IlMO9+x/HRK7DNqaf/U2qx3Oc7Z2UDEdz6NF8rEUmznliYya2x7msRSuDAjDf29XcyPw1xwUc9N9+Fm3BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSJoCq6q; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso478112a12.0;
        Tue, 24 Jun 2025 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750774224; x=1751379024; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vILkg8ZEGzs8nDPWad0XYNa3F/qA85actTxUYvIR0gc=;
        b=SSJoCq6qJ4olEUC92Fi4DMMSZOpFbhgBWZe4TLnXe2l557CP37FvuZFOdZf7CVmjdo
         9KAnMDItqlqBN3o0aEjWCxjnQUHW9leKYxR7agrA6dFbsnqTRMnYgdtKI8D5noVbvFjS
         12CSaEzKo1aMMZiVQYfKd5aXVn0KzKbVmcgG42S1DBPw9toZmmh4wOpeEWvdMvsq6Rnb
         MU2vJekozcad0UOji8S/ji7iRQ1UCIXYgmLofrDQlPn7gGQShh5Xzj9uy6vLMY8UlUmM
         GeqyON72D+4XCGQBuwqgJvEgBBmroV+oen0GSgwKCZu2l7PvmiLo1WMpaJGin7xEAz5Q
         RIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774224; x=1751379024;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vILkg8ZEGzs8nDPWad0XYNa3F/qA85actTxUYvIR0gc=;
        b=bSvlyjf0VK2Oah2IpP5qw7fgnc6z+ZMi0tzCTm//py0HKJcgN6bP6GjmL6B+WIbNWT
         veQ1NzDQnAIFjtSRNDW3WqbWRuKyls5mmqVTF13M6X7J9MViqvaZgwHPEvcHItyl63oT
         LGf8WOSNQryzIGk5dq4/Wp/+skGvXAJ+m7p1UiGLnylbj2VuxgHtcZjCnxkd8rw3MQvk
         k8Pi6Dia0KlKuBDFd45FNlhteXj55fDMbsdX21a7hHNqZXHzFER29iV7v97mCBxBUaaz
         5vZZfqyrM8Z9hG+RltlKA/3vkgX8zo0PGDwtYeW29pEWqKbAS+KTy/L53oOCqD2LpU+n
         7C1g==
X-Forwarded-Encrypted: i=1; AJvYcCV31PgoXEmjwPlySV7Kjz2vlZ+Gn/S+2o2HPH1tGVKZmsXkn5rK5wIxzX53Ki/k+V8Rp9lIvYRgnY/kVHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6qUPIM/xTZbWmVUIKBWYiD0juVF5IsZOtoo1EqCHlUAZiknys
	GyLlahyd34UHN6I2Ap0AK0ekzc/d0i8T+uz6onjy9ohD6CkcLqKd4IJNqtAVZ2Mc
X-Gm-Gg: ASbGncuo5xRZprLEKXyJW+iDM7iLvJAM/jMN0PxvjJxoPZhT1Q90MJjJGO9Xgu286i9
	KOmr+lVhu6U8BedlSlFUnrzKcWujEIcNYeOqHnZbuIACRvz1Zk/WC9dA6RvKXQbcRONg+OUjUb0
	DHqwmbIXrvlVkYGGt8QseHwK7PHqOLjToOZnFli2QcDgy7TOl2d/sAP+ZAery0LzcRqpkgUN9+W
	/dYfqL7x9onIuUWLXJT/3h7Zw7ohjJ4vjH3HxoQgUuaQBrrXeq6zxAfOZkmqkX1PoXzz51nWLTd
	FVwZxnAZySBCPnaeccEfA+SATByNU1CrhTwr4YDXepiTyUTeUf6+LweO1g/FUk38MeowPUH/yy4
	z6RAUj/TjJnoxXHVDzH1AhqCgjhNGkvIIIRfDHF2vUbJALydUtQ==
X-Google-Smtp-Source: AGHT+IHM7fdzhWlDDyjVNuz0muzjzy/ZJKs0jZVCPWYYP+Dw22irw4/etAo34nrjJNxnORqI9Z5zew==
X-Received: by 2002:a17:90b:4cd1:b0:312:639:a06a with SMTP id 98e67ed59e1d1-3159d8fce9bmr21905357a91.31.1750774223961;
        Tue, 24 Jun 2025 07:10:23 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e07d7c0sm10871747a91.46.2025.06.24.07.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:10:22 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 24 Jun 2025 22:10:00 +0800
Subject: [PATCH v4] staging: media: atomisp: fix coding style in
 ia_css_output.host.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-bar-v4-1-9f9f9ae9f868@gmail.com>
X-B4-Tracking: v=1; b=H4sIALexWmgC/23MTQ7CIBCG4asY1mL4K7SuvIdxAePQktjWgCGap
 neX1k01Lt/JPN9EEsaAiRx3E4mYQwrjUELtdwQ6O7RIw7U0EUxUTAtOnY20MtLVTjHvakbK5z2
 iD8915Xwp3YX0GONrHc18uX77zCmnlZVoGFNKCzi1vQ23A4w9WXwWf4woRqEGD8Y0mqtfI7dGf
 IxcDEDD0TMO0m7NPM9vx1x5Z/4AAAA=
X-Change-ID: 20250621-bar-573b8b40fb80
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750774217; l=6451;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=hu5D2yG7YDF3qT6VuNJ7QELnHxz0FGP6x8nWUeh6yOw=;
 b=qRIAQRDbJ/R5qEE9RO9CF7rAymxmlNHm+GMk++kWB6uFkP3xYY9fQMACVzxUNHnYUigaVFXCo
 IMGhdAyH8r2Bl4zLlZxdOZWZo/SlqzRed6LuZ4sF+eEn4VOrvaaDcry
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix multiple checkpatch.pl ERRORs and coding style issues:

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format
- Remove excessive space between type and asterisk in function
  arguments
- Move assignment operator '=' to the same line for static struct
  definitions
- Remove unnecessary line breaks in function definitions

This cleanup improves code readability and follows Linux kernel
coding standards.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch fixes coding style violations detected by checkpatch.pl in the atomisp driver under staging.

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format
- Remove excessive spaces between type and asterisk in function
  arguments
- Move assignment operator '=' to the same line for static struct
  definitions
- Remove unnecessary line breaks in function definitions

This cleanup improves code readability and follows Linux kernel coding standards.
---
Changes in v4:
- Moved assignment operator '=' to the same line for static struct definitions
- Remove unnecessary line breaks in function definitions
- Update commit message to reflect all the coding style fixes
- Link to v3: https://lore.kernel.org/r/20250622-bar-v3-1-4cc91ef01c3a@gmail.com

Changes in v3:
- Removed extra spaces between type and asterisk (e.g., `*to`) in function
  declarations, as pointed out by Andy Shevchenko
- Update commit message to reflect all the coding style fixes
- Link to v2: https://lore.kernel.org/r/20250621-bar-v2-1-4e6cfc779614@gmail.com

Changes in v2:
- Fix patch subject prefix to "staging: media: atomisp:" to comply with media CI style.
- No other functional changes.

Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gmail.com
---
 .../kernels/output/output_1.0/ia_css_output.host.c | 42 ++++++++++------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c47104dbffbd455bfd649b9079f88c9c..560102e81aed7a56125a97f0fff8c46de440e74d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -22,21 +22,18 @@ static const struct ia_css_output_configuration default_output_configuration = {
 	.info = (struct ia_css_frame_info *)NULL,
 };
 
-static const struct ia_css_output0_configuration default_output0_configuration
-	= {
+static const struct ia_css_output0_configuration default_output0_configuration = {
 	.info = (struct ia_css_frame_info *)NULL,
 };
 
-static const struct ia_css_output1_configuration default_output1_configuration
-	= {
+static const struct ia_css_output1_configuration default_output1_configuration = {
 	.info = (struct ia_css_frame_info *)NULL,
 };
 
 void
-ia_css_output_encode(
-    struct sh_css_isp_output_params *to,
-    const struct ia_css_output_config *from,
-    unsigned int size)
+ia_css_output_encode(struct sh_css_isp_output_params *to,
+		     const struct ia_css_output_config *from,
+		     unsigned int size)
 {
 	(void)size;
 	to->enable_hflip = from->enable_hflip;
@@ -44,7 +41,7 @@ ia_css_output_encode(
 }
 
 int ia_css_output_config(struct sh_css_isp_output_isp_config *to,
-			 const struct ia_css_output_configuration  *from,
+			 const struct ia_css_output_configuration *from,
 			 unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
@@ -66,21 +63,21 @@ int ia_css_output_config(struct sh_css_isp_output_isp_config *to,
 	return 0;
 }
 
-int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
+int ia_css_output0_config(struct sh_css_isp_output_isp_config *to,
 			  const struct ia_css_output0_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
 }
 
-int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
+int ia_css_output1_config(struct sh_css_isp_output_isp_config *to,
+			  const struct ia_css_output1_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
 }
 
-int ia_css_output_configure(const struct ia_css_binary     *binary,
+int ia_css_output_configure(const struct ia_css_binary *binary,
 			    const struct ia_css_frame_info *info)
 {
 	if (info) {
@@ -94,8 +91,8 @@ int ia_css_output_configure(const struct ia_css_binary     *binary,
 	return 0;
 }
 
-int ia_css_output0_configure(const struct ia_css_binary    *binary,
-			    const struct ia_css_frame_info *info)
+int ia_css_output0_configure(const struct ia_css_binary *binary,
+			     const struct ia_css_frame_info *info)
 {
 	if (info) {
 		struct ia_css_output0_configuration config =
@@ -108,7 +105,7 @@ int ia_css_output0_configure(const struct ia_css_binary    *binary,
 	return 0;
 }
 
-int ia_css_output1_configure(const struct ia_css_binary     *binary,
+int ia_css_output1_configure(const struct ia_css_binary *binary,
 			     const struct ia_css_frame_info *info)
 {
 	if (info) {
@@ -123,11 +120,11 @@ int ia_css_output1_configure(const struct ia_css_binary     *binary,
 }
 
 void
-ia_css_output_dump(
-    const struct sh_css_isp_output_params *output,
-    unsigned int level)
+ia_css_output_dump(const struct sh_css_isp_output_params *output,
+		   unsigned int level)
 {
-	if (!output) return;
+	if (!output)
+		return;
 	ia_css_debug_dtrace(level, "Horizontal Output Flip:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "enable", output->enable_hflip);
@@ -137,9 +134,8 @@ ia_css_output_dump(
 }
 
 void
-ia_css_output_debug_dtrace(
-    const struct ia_css_output_config *config,
-    unsigned int level)
+ia_css_output_debug_dtrace(const struct ia_css_output_config *config,
+			   unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.enable_hflip=%d",

---
base-commit: 3f75bfff44be0646580fe4efda45d646f9c1693b
change-id: 20250621-bar-573b8b40fb80

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>


