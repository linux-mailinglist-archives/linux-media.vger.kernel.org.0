Return-Path: <linux-media+bounces-38526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FAB135B5
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 046237A54AD
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 07:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126CA22F76F;
	Mon, 28 Jul 2025 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcaprkMy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B39121A436;
	Mon, 28 Jul 2025 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753687676; cv=none; b=RRo+8hwQh3GEpO67xdt2GuzviWs5cZlkGQxKObOlAX7oOhHS5rRFAJca75r+0oJDtLsSbBlgXPTly9iL7fcDlthP7fA0I11LgUVWT7jPbMvt+RA4XsTzjBFKy7q8ARPQ3AdLjgWB5jDkscTODng2Ojjy0mh1Wr+qhzZt/7QV9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753687676; c=relaxed/simple;
	bh=s8XctckT3Sdb4YvEEyVaRTMNQimbq2CU+c1oA1oZ7ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7CghrvgOsGcb2oqMIEsSyS8U5FeDkhPuf4wZ+tbSYpohEGcsmJ/b0LWsau/AZvYryVRT5SsVr7kpxK2H72rR7HNbomem6jrH2E/lM18yX4llx+/Y3dCgbmGbGZQLOtwmcea7ZoUgdturqpILASFR5Zo2fgLtH80zx9PXpVDrLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcaprkMy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236470b2dceso35268945ad.0;
        Mon, 28 Jul 2025 00:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753687674; x=1754292474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIkA7rxj2aeFkUnZL3Z4nhuVfvXyGjEGJhkZwRCP+pk=;
        b=GcaprkMy50QL3ubiBxUwNf+SWq/uPbT9rYFnA323D/i3aR1n7Fgx2tVneC/52kug4C
         Dw0mjomIIIFBhIS9/ck4K7Y2SkZ2FXpt69UQ8tSbqj9pbjpQD/XH8qpOKKLvlnbYejyM
         fCvfTZ9SKCPFxPYCUKo7leA7Q8qAAkn0L1tbvsxBYf8foSPnewdAzx1qkJnlKO13T4/X
         FDteAlIktWtIS4JEt7gNlrFbwevgzAjNEqzWYBAUoKznMi8BbZa5EiK0dD38z2tf3AGE
         MacVObY3STzmvcImTjtzEvcBILWpW141pCAqJw3XHm/rOIx1vHuLJ2H7pNYQa8O0Yh5i
         EHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753687674; x=1754292474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIkA7rxj2aeFkUnZL3Z4nhuVfvXyGjEGJhkZwRCP+pk=;
        b=eoejNRAc1NLwOiJSNa5ohI1jAubeKNwS6rVQIjU9778hbZUKDKukfZqqN/+ecJ275v
         75bDRi1LY33QGcVLMzZeipNTrYlKPXa9Ci6aXUg4VCFRDCN1jKYfeiYitTbUYNjkV1qA
         79ZlaWeaL0jwL91E3+Le7v3+ic0nr2hUklU2w2BpHkNZg6+mJ/XRrkEtOaHkLgL3oJTc
         o9mo9ul73EMhnpjA6QN1EVYOzuLfQ9+akh4s2TKpUQYzarMkJzC28WLy4W5ZWffldxPR
         GxNLJqqD/Twun5LTIJqA7UM3KkGoiTgcERJwUrtXt5McVlHggqHP4fCG6iRMgBe7Tm6n
         BGQg==
X-Forwarded-Encrypted: i=1; AJvYcCUTCtjRf1RK6bYSwqtHLw2ueKS/nIUbPBb4MieEXOgGzms2tQMrAXWw0x8JtXqj43UBwJ6tP9XqDBNiY9k=@vger.kernel.org, AJvYcCW+H/kBjovRWnac7veni7i+Y7X8MbMMylSqYpSTcpTzy/aQz2C7s1ujfQ3sIlA/wJnY9Cj/kpPBg+hBZO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG664+9NdHqkuHdzc4XLnHVMLMZsPgASePH9QTAg/P5SDFrU+I
	0Q+5Ith0YUBtc9h2VmWNTileea7SA8N4ziStYXc2nxHw2W+CcSIM7dme
X-Gm-Gg: ASbGncsR9uNNGYRfXbD4mfPBH6K6e2hTvb3ZUpiPQErfU9ucroWIX40FrKSbc0jIDet
	ds6m8MYmJ/ReWQIUsgj4MIM6R6vkCWNrLSr2QG2cKcmJEkjvnUw/VyxiSD8DUrDnZnD2GA34Jtb
	nwVf7Y/xF4ue9WvgRPXZQi+1EicZbwymzT42vKSlBjkFFv8OyCYuWfxoRMDZL4tBOu2fCDu22Ik
	CcAS4u+8L2Llt28bYi3qGsitV7ItnulNUDjAvy7k+0qUuEl7T+M1Lt3P6DA0AGwFQZeFXSegkL1
	1lnbhqrp5YOrjg+g2cijJhNehkARONq9AcD/q4VcHUogbU/7dqQaBmNKywOcwKsRayMalmXKQmq
	fxNUNsJRijcVmC8qDMAAN0eCsuBnORSKDOmMS8ZerQZvOitlANk51rtPprnTJAO9p8L2NTW7uTX
	p4fw==
X-Google-Smtp-Source: AGHT+IGxXFmKSvT4xZhknxQ8XN0geHH0nu1k5wB6QGBZYZRXvZJGddPc1NKhIESQxbDZ2gZaSJERlA==
X-Received: by 2002:a17:903:fa3:b0:235:f298:cbbd with SMTP id d9443c01a7336-23fb30ac008mr182227745ad.21.1753687674219;
        Mon, 28 Jul 2025 00:27:54 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([49.36.68.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2403f4dbd1bsm5783435ad.59.2025.07.28.00.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 00:27:53 -0700 (PDT)
From: "Darshan R." <rathod.darshan.0896@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	jogidishank503@gmail.com,
	"Darshan R." <rathod.darshan.0896@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix indentation and styling in output kernel code
Date: Mon, 28 Jul 2025 07:28:22 +0000
Message-ID: <20250728072822.10730-1-rathod.darshan.0896@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated the formatting of function definitions and if statements to match
kernel coding standards. This helps with readability and consistency across
the codebase.

These are non-functional changes aimed at preparing the driver for eventual
mainline readiness by addressing common checkpatch warnings.

Signed-off-by: Darshan R. <rathod.darshan.0896@gmail.com>
---
 .../output/output_1.0/ia_css_output.host.c    | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c471..4f84c6d3622a 100644
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
@@ -95,7 +95,7 @@ int ia_css_output_configure(const struct ia_css_binary     *binary,
 }
 
 int ia_css_output0_configure(const struct ia_css_binary    *binary,
-			    const struct ia_css_frame_info *info)
+			     const struct ia_css_frame_info *info)
 {
 	if (info) {
 		struct ia_css_output0_configuration config =
@@ -124,10 +124,12 @@ int ia_css_output1_configure(const struct ia_css_binary     *binary,
 
 void
 ia_css_output_dump(
-    const struct sh_css_isp_output_params *output,
-    unsigned int level)
+	const struct sh_css_isp_output_params *output,
+	unsigned int level)
 {
-	if (!output) return;
+	if (!output)
+		return;
+
 	ia_css_debug_dtrace(level, "Horizontal Output Flip:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "enable", output->enable_hflip);
@@ -138,8 +140,8 @@ ia_css_output_dump(
 
 void
 ia_css_output_debug_dtrace(
-    const struct ia_css_output_config *config,
-    unsigned int level)
+	const struct ia_css_output_config *config,
+	unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.enable_hflip=%d",
-- 
2.43.0


