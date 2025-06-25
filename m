Return-Path: <linux-media+bounces-35877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4AAE875F
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 17:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E12611646D0
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB40C26981C;
	Wed, 25 Jun 2025 15:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVTmxMNQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B1E262FF1;
	Wed, 25 Jun 2025 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863880; cv=none; b=XOrBmKMCqmznMtZk6tzh4ofjTSLn9XR2S2PXWLNQHu72DFuaWeg+RHQS8Q2tPFDqHhcxxl11GJxDvIcoOy2lbVJNAZtWeVOEEif4jAcFGsFnQbAnLjBtQbuho07G4ZuadUmHhm2q90W322wf7Vgqpq8ROYBgMhRLB4uOJhaEVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863880; c=relaxed/simple;
	bh=ZNB3XhrTzyPjApmhZf4sMBMt2qivNHgeklldzwm7ilE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a8FirAR3RtkEu5ZRit/77IKwcQaUVXjDVGyJetffgUyVaLxr4kkwlodL6U+Bm2KTaWQi9gwExQ9rDHg9wJ6B7cx/wbQcCCHT4TxERWdw2N+aVVRIB889kEEo0bHYdRJUHLUoCNV+reRm2A2UmzC6qK5Vy20YK/wqvqJNBFDKEFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVTmxMNQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23694cec0feso19516265ad.2;
        Wed, 25 Jun 2025 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750863878; x=1751468678; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39bZ4LirHO1x5OQItaEAejSwWpOWeNe8ZeqxJzEyH7w=;
        b=KVTmxMNQw/az4/yyDfBa5PEIjmSsBit7LlMciCj0C75lGnsXLddtx9oU6KWs0gVQxQ
         rb0vYW6LBs7ts7puAybUpKujav1flaql0MNzBBzY9uDzlQpGigRWhvvCklerrbPqQbhc
         gxPR3dKDHSPC+H6Zapt0Ue6uAkspww12FlsQLjOMf8pXrNrcKmSWbPhzzZw/paL8NEX9
         Uii59s7abpk90E/JW8O9WfubSU1wY0kauBYocC5rANCVKrKe536EBa5vlg+ZVIsQgeWg
         x3BT+Lp2hvcS52kKt63Fttvc7MLVXeClyRC+xNRR7Fw40j5qW6y7Ce6mU3xRnhZuIuLb
         yrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863878; x=1751468678;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39bZ4LirHO1x5OQItaEAejSwWpOWeNe8ZeqxJzEyH7w=;
        b=wVkc7wURYeSwpIcDz10IdIBRJOgRfqylEXEPhImikm0DZD/azSjvm5Ew1aM4uoaxRE
         KxrQCybqWJ9sLcJlC9Rteh5JlsYSD3/ulI+15DDkCoVoJfjpdJiKIu2VfoDMk2baXKOB
         KRs4K9FjdoCIvymRJY5cEuSYA0+FpB1Zkal4kwbYy9ElJN+Tn0KpVvxagGBmzd3QErac
         fhWR2/O0Dsjqhz4JUahBdbDPL8zlvTQkuJ5Veb17Tku6QyXT03sI95Poij8MM712afmC
         oPZt5id9URSt4WKF5v6GdAlvel14VW8NCwVxnGpWJ+AHZKa7vrvZloJo1BGcgc5hWnsY
         PBCg==
X-Forwarded-Encrypted: i=1; AJvYcCXx+rcrr/MWFVm4CyFZh8HrUu1E7BDcomChEDBnFTUmu4mx6aLXLZiwpPbUcLc7GjGEfuNhoaOwLm10nH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTUHWYeyllnqFOBFY6M2LcdqqSKWBO77MaGE8eRQqzoxdAqZsg
	yCal6Io8KZfhGQcbzvUAOvErQk6gl+NobzXUOUT/qoVGCHV4vK0GsBZ2iXIYoddy
X-Gm-Gg: ASbGncuTQbC+aKudmLEc+YrDJSSUuNsOy7XlaMfibFB2OClTwq1eoycKnkvRAzpEBX2
	e06rvjOFfZNKgFH92XolWnjNU7r3IOGUjVytBMsvplYDeP1gt/z3X84mQ1vvUxDSuXpJ6aURf6S
	rGSYR12USFwpj21bqPeAMfg3+MTVv4K+H8G0eq3GKASH7XtY4twU8JKtYmz0uxNaGsVMamDbJX0
	SdiiWiQdxuIRkMPqtDs9Nir6PIxhGWC/NhiSAYz/Hg5DV3EeN5LoEWITDjfWvLj3aNcdyR7jhpu
	FCO97on7y+Js9vY5LpTkVZsI0AhR/NfxfFzsSsQX4RpywGeRE5T7hHFWIIx2DCizs19WJuC5c4k
	k7TwKdkvRV3NfHTO2mFOXMKih1ZewvoxQAQVScA3+a+4783w7cg==
X-Google-Smtp-Source: AGHT+IGuTWVkLVC4r4XkXeqSaabFcu6dwm5Rg7hkYvxsKcomX9Q1Wpt85Hiyg95v9nAiU4e+mVLY1g==
X-Received: by 2002:a17:902:c946:b0:234:9066:c857 with SMTP id d9443c01a7336-23823fda014mr61874845ad.21.1750863877692;
        Wed, 25 Jun 2025 08:04:37 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866b000sm135082685ad.162.2025.06.25.08.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:04:37 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Wed, 25 Jun 2025 23:04:31 +0800
Subject: [PATCH v5] staging: media: atomisp: fix tab/space issues in
 output1.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-bar-v5-1-db960608b607@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP4PXGgC/23MTQ6CMBAF4KuYrq3pP+DKexgXZZxCEwHTmkZDu
 LsFNkjMrN7kfW8kEYPHSM6HkQRMPvqhz0EfDwRa2zdI/T1nIpjQzAhOaxuoLmRd1oq5umQkN58
 BnX8vK9dbzq2PryF8ltHE5++vT5xyqq3EgjGljIBL01n/OMHQkdkn8ceIbBQacFAUleFqb+TWi
 NXI2QBUHB3jIO3eqK1Rq1HZVC6fxcqVptyaaZq+NmqzTTIBAAA=
X-Change-ID: 20250621-bar-573b8b40fb80
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750863876; l=6031;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=ZNB3XhrTzyPjApmhZf4sMBMt2qivNHgeklldzwm7ilE=;
 b=V1GicTj7GDB4edMERdzb05R1lU6I1EFxJE+HTQPwGl1Mo9fJ568OmmMBOGdh2ERKKAAmA6IP2
 SD7UsDivQFuDU2ZAnnPhsGGq8feQK5c/1kkTpY05i4B8wqaDPRVRMGH
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix indentation style issues by replacing spaces with tabs,
according to Linux kernel coding style.

This cleanup improves code readability and follows Linux kernel
coding standards.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch addresses tab/space indentation issues in the
output_1.0 directory of the AtomISP driver under staging.

This patch is part of a broader effort to clean up the AtomISP
driver and is scoped only to tab/space fixes in one directory
to keep review manageable.

Further style fixes for other directories and issue types will
be submitted in subsequent patch revisions or series.

Fixes were identified using:

./scripts/checkpatch.pl -f $(find drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ -type f \( -name "*.c" -o -name "*.h" \))
grep -Prn '^[ ]+' drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0

Only lines with space-based indentation (instead of tab) were changed.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/r/CAHp75VeijMvnbrCmRuqTeo_maxevCA9rB-r5URHaX+TrDNvyGA@mail.gmail.com
---
Changes in v5:
- Replaced space-based indentation with tabs in output_1.0 directory
- Used checkpatch.pl and grep to identify formatting issues
- No functional changes made
- This patch is now focused solely on tab/space issues
- Link to v4: https://lore.kernel.org/r/20250624-bar-v4-1-9f9f9ae9f868@gmail.com

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
 .../isp/kernels/output/output_1.0/ia_css_output.host.c   | 16 ++++++++--------
 .../isp/kernels/output/output_1.0/ia_css_output.host.h   | 14 +++++++-------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c47104dbffbd455bfd649b9079f88c9c..8d440856471ca73089569be51644c7ac421607ce 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -34,9 +34,9 @@ static const struct ia_css_output1_configuration default_output1_configuration
 
 void
 ia_css_output_encode(
-    struct sh_css_isp_output_params *to,
-    const struct ia_css_output_config *from,
-    unsigned int size)
+	struct sh_css_isp_output_params *to,
+	const struct ia_css_output_config *from,
+	unsigned int size)
 {
 	(void)size;
 	to->enable_hflip = from->enable_hflip;
@@ -74,7 +74,7 @@ int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
 }
 
 int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
+			  const struct ia_css_output1_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
@@ -124,8 +124,8 @@ int ia_css_output1_configure(const struct ia_css_binary     *binary,
 
 void
 ia_css_output_dump(
-    const struct sh_css_isp_output_params *output,
-    unsigned int level)
+	const struct sh_css_isp_output_params *output,
+	unsigned int level)
 {
 	if (!output) return;
 	ia_css_debug_dtrace(level, "Horizontal Output Flip:\n");
@@ -138,8 +138,8 @@ ia_css_output_dump(
 
 void
 ia_css_output_debug_dtrace(
-    const struct ia_css_output_config *config,
-    unsigned int level)
+	const struct ia_css_output_config *config,
+	unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.enable_hflip=%d",
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
index 25408f1aede55a61a33a55ad38d5afc3a594a756..e7d44f809003d8692292e9571ac777ea3f2d87b9 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.h
@@ -17,9 +17,9 @@ extern const struct ia_css_output_config default_output_config;
 
 void
 ia_css_output_encode(
-    struct sh_css_isp_output_params *to,
-    const struct ia_css_output_config *from,
-    unsigned int size);
+	struct sh_css_isp_output_params *to,
+	const struct ia_css_output_config *from,
+	unsigned int size);
 
 int ia_css_output_config(struct sh_css_isp_output_isp_config      *to,
 			 const struct ia_css_output_configuration *from,
@@ -44,12 +44,12 @@ int ia_css_output1_configure(const struct ia_css_binary     *binary,
 
 void
 ia_css_output_dump(
-    const struct sh_css_isp_output_params *output,
-    unsigned int level);
+	const struct sh_css_isp_output_params *output,
+	unsigned int level);
 
 void
 ia_css_output_debug_dtrace(
-    const struct ia_css_output_config *config,
-    unsigned int level);
+	const struct ia_css_output_config *config,
+	unsigned int level);
 
 #endif /* __IA_CSS_OUTPUT_HOST_H */

---
base-commit: 3f75bfff44be0646580fe4efda45d646f9c1693b
change-id: 20250621-bar-573b8b40fb80

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>


