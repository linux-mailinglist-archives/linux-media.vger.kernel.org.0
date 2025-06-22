Return-Path: <linux-media+bounces-35537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8EFAE2E3F
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 05:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312553AF77F
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 03:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A53C13C81B;
	Sun, 22 Jun 2025 03:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCkE6a7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C88EED7;
	Sun, 22 Jun 2025 03:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750563771; cv=none; b=E7147Kr/JOzwxk3uyaKZabALhJnNz7UfVjXzIbSzOCRjqxvyg7ebsml1EqfwzCaKxjwOxWesz2JMvgdBaf+s9iXMNX5CgP/3tTem1fpJoBpb/R/FwAPpYomPOUjCqBG1dlfT75qljCd0XNKrcNkwbW3qtp7hwTXffv24wwGALbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750563771; c=relaxed/simple;
	bh=3LjE801mRj78RJWJDrIvDPdML4nIV3zCJzVY+sv4Wuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q/C4GmOtfA8OQTMoNjdijByZM8ASIqURyslDNsnlsdZa9WDOGJMgb18cCE9ILnnXgwjSaTt2g/R21ka2WbMRoaQIM+DOeG7IRnCmv9A6CSemnvHLA/1PxfZ0J7XAnHJO/8hl/y0DmMDfZENTmx0e0rhdS8xqHbksSMA4Aimp7iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCkE6a7Z; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234bfe37cccso40828505ad.0;
        Sat, 21 Jun 2025 20:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750563769; x=1751168569; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUhqmKLTOnc3oh3BthyzyWc2QzYwhIjxAnoQpkwuDh0=;
        b=SCkE6a7ZhPJu5GvxKvRQe0JrDydy6chIZPovwm4VdWCy0BT7tSTKOfc6/QPt3gpl0S
         8+VvkDiQ5wiJNPlCJLAVGFcbIjMHXOKlNzSWG+Qz2u0Rd1CcG8YTjpO8ifCL7SAbJJ7V
         U51vWNt2kDatht3Rihet+Ibmvmk+Ni7Bx0GSbAVidyEvgxM4PpLQJ9ToTX4Yd1JBAURm
         kJ4GtODc/R8Sy7DZaO5jKK5pgXU32z6ipBu3zjwzXUqpIPdKAolqoCHCFj42tGYp95uw
         szK68IQ3LAd63SsBZ95r7K2zdyy0GCclQi4rsWaJL1RpF2qShDMVdylVpfKui8MImqaz
         kGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750563769; x=1751168569;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUhqmKLTOnc3oh3BthyzyWc2QzYwhIjxAnoQpkwuDh0=;
        b=KcYeWB3pj6PXKgVP7XBujb9m/WHUuw9SVVN3m+sqs3kjaKjpKSqF7PHp4PI9M3KfxM
         OckbCcfn2cttLpG5leLiRSm/1LESETMnxsush3bCedWuki6mxMmCByMIs+/a8oLEDZ7D
         1GFiCha+T1Eljb7NRN+AKgv9jOtw7pvnxH6eze1YEBji/mT452BLvrKJi2xsypMnKPHy
         C857Wh17QD3h2p3pgNL7F8dbOlp6bsbiY9fv0OLSTz1ZXTNyUvdLCe2oLYvK0jwGM1F1
         3gKS/GqnjfUBFZUmD9m8LLOCgz2ZXLzwR17J7OhdRPnvwGfyXdW0MIC96AHCfRaJ2pIG
         gyrg==
X-Forwarded-Encrypted: i=1; AJvYcCWvvNDfbhqNfsU1AFun3zsBHpKmFHg43nXAcIdTkD9d9s3AS1Wa2+ICEi+RiF2KWJis54ARCNFQ/yOSgjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwefN2rEfix2yqCA7cXVKfsRQxtmp7plC5DNJcXEPVSm4RJHAxi
	O/2WHK6Yx96fAEcgDEcyKI58Mdf9noua8W/d2bjiueMtFdtDM8umGIXR
X-Gm-Gg: ASbGncum36tLO9PcMsQ1OJSIhHGj7ey+DnSgzimKisSepPw93xqBIyeySiqaHfPW9PI
	rQ53mQ8fsAuNFGg84I8bIgmC1rrKBwh9j8wDpZ1tm76ROggt/CiPrleUnYUo5kMkuydP1fEfOCF
	Tva/8XxHQvbtm2AFj7KdHxqZ61OLmMEk6QCxLZTJ33SE2xR2lCqwNFhdDl29XNYzOqMNGga/vd+
	K5zSoLN6CjZXZzuS8ddb0pj7cW3CecABksEcCXGOOkuT8Bdx4iIwoqlEWjgC0L56SsxJBqRHxgQ
	5z7+NZxCx1xX4PBGSLfBvhsz80ihI8FNz0PacUvWhySCyhM3MmKdPcgNccJSu26BmOAWT4boegD
	iGhEbTSpgtzKkaBlDnlrxha5uvT/kdWbz0vN3ox2cK8jDuWRp3A==
X-Google-Smtp-Source: AGHT+IHTdgSE4SBzwLy/M2GSba4+YuxiCFZJDaI1tx98HQ3ewLX2HhxNyL81uwei6qLUpOCQtvyW4w==
X-Received: by 2002:a17:902:f645:b0:236:6fbb:a5f3 with SMTP id d9443c01a7336-237d9a3fa8bmr128954155ad.40.1750563769288;
        Sat, 21 Jun 2025 20:42:49 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8753900sm51467165ad.253.2025.06.21.20.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:42:48 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sun, 22 Jun 2025 11:42:25 +0800
Subject: [PATCH v3] staging: media: atomisp: fix coding style in
 ia_css_output.host.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250622-bar-v3-1-4cc91ef01c3a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKB7V2gC/23MQQ7CIBCF4as0sxYDlEJ15T2MC8BpO4ktDRiia
 Xp3aVeauPwn870FEkbCBOdqgYiZEoWpRH2owA926pHRvTRILhuupWDORtaY2rVO8c61HMrnHLG
 j175yvZUeKD1DfO+jWWzXX58FE6yxNRrOldLSX/rR0uPowwibz/KPkcUo1L7zxpy0UN9mXdcPY
 SfqGMoAAAA=
X-Change-ID: 20250621-bar-573b8b40fb80
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750563768; l=2932;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=3LjE801mRj78RJWJDrIvDPdML4nIV3zCJzVY+sv4Wuc=;
 b=m4F5K0BM3M7HijaPnofVrKrPD6OSzQ/Pn31CfNCSwRSPo8QoBxE55HVoy7HKW5Hrtftoj0E7A
 ozHQutCYpLJAfNwoOrDqXa83eZG88YRR8LEpc/8Bwa6SE34z5xzHGtO
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix multiple checkpatch.pl ERRORs and coding style issues:

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format
- Remove excessive space between type and asterisk in function
  arguments

This cleanup improves code readability and follows Linux kernel
coding standards.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch fixes coding style violations detected by checkpatch.pl in the atomisp driver under staging.

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format
- Remove excessive spaces between type and asterisk in function parameters

This cleanup improves code readability and follows Linux kernel coding standards.
---
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
 .../atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c47104dbffbd455bfd649b9079f88c9c..2af83d51b5b3a6ad2edf9b835a342455e7536f6c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -73,8 +73,8 @@ int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
 }
 
-int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
+int ia_css_output1_config(struct sh_css_isp_output_isp_config *to,
+			  const struct ia_css_output1_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
@@ -127,7 +127,8 @@ ia_css_output_dump(
     const struct sh_css_isp_output_params *output,
     unsigned int level)
 {
-	if (!output) return;
+	if (!output)
+		return;
 	ia_css_debug_dtrace(level, "Horizontal Output Flip:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "enable", output->enable_hflip);

---
base-commit: 3f75bfff44be0646580fe4efda45d646f9c1693b
change-id: 20250621-bar-573b8b40fb80

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>


