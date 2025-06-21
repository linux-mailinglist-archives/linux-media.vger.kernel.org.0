Return-Path: <linux-media+bounces-35530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB56AE297E
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 16:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BFF13B8800
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 14:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBB6149C4A;
	Sat, 21 Jun 2025 14:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtIioooH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC995FB95;
	Sat, 21 Jun 2025 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750516359; cv=none; b=X6wzDi8fnpXQMwlzO1zy2eJ0ed7YFYLoiSwhbZ9qzxlhUu17Eo5XiJoxIkjY8Mc2C+9+Rb/3IZV4ZV7IWQGSNgBoAWSI3bCPS3Ih57+nh8+byuEHJJ+o23dQfBPdnxwYRK43p+CwwpgIoJ+1p4Fqntzp1TiqQN/dRQvU3bxWiSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750516359; c=relaxed/simple;
	bh=JVPFAAvse4A5IpP/YFqmn/hhxB+HgS5D6zZF1Yd2S3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lmP7e14syp5jmuEYpA+dlUeYHiA9J8Qn/BO/gjaNg1oCLIu2hIoW0tTctJCBhejc/IkCZG+0invIJggCS747ZGjZwY8ugytd9Ba/qisOJZ4t6MnY4ecl7s2jojZPXtcJAQB/6eYGkWSoEelUZkP60tHlRxDIL3LKdRnP01lOnKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtIioooH; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-749068b9b63so1286732b3a.0;
        Sat, 21 Jun 2025 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750516354; x=1751121154; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yL1kTJshOAGvipwJGRaHGGH+Jim1VlkRfihDhF37q38=;
        b=VtIioooHbxRVRQ7AHkWRzsMPigoypLf567ZgJBAKEONBbtfAT+hpekCAaIKQ2D14Ww
         KiKO5YtBUJT4aBAMOh4d4VrTuidfnQtMm5waSiZzKQIOOY3WMSfyAt2pqeCWETTdEvKe
         hVxC9MTFgTLcdiNFXFsQUf5hg3PdKntJI9sN1/SJiASKZbYI3GNZjz4Mctbpra+rLK5d
         XPZfk5ngI2gNqb8m5rb2jy9dFg9SJO+XIou/3ResX4YkPPcDxGYDQmKbiXPKGdflMU1r
         2r59X2h4SrTlrObKUAzqsJNia2cYgjOaNjFNWCVHaUKG1pwcYXcNW7Km+RNajT8bOLzJ
         AnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750516354; x=1751121154;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yL1kTJshOAGvipwJGRaHGGH+Jim1VlkRfihDhF37q38=;
        b=N839r/nRmhRubYrZcjeyn6HNE2qJIH58/XecsD4AsUVUwwAnMaqGYLdoiiggJgZ1ox
         t/e3lUX8uSdH7ei3XYyxJSV6xNzS12+Q0XarhBBJzW6t7GLrKhPBX2Xl3LrW5maahp7U
         MwsaVxs5u2sdtDq4MesKp+B8znRiwfXY1CPVSBTh22pW4IPv2/Zf9/PohTLV9zPeUwST
         bG571LJIazPvfvWUOJvqSbzWpaccAo+2lFsb6y8oNdwEcBzp6jGFzxCfNWN3ehJ+Eu4l
         fq0tBvbcwyjmHcXc2AQfMsZtUSb+aWTwE+MdkhaGXdGs56ei4SSSOknZsZdb0Ozdv3wP
         IELQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUoI7tUPsLRSQsoADnAhIHSZhB6hmtrXE8UadV0Hc00Nt1o/ATAQGQuSALGAgkIcvDostNR1960d9CR3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyggLsdTnb4hdWCCtKlKWEvWxp1FgwQovFetby1jW8HI8Wsfy8Y
	8zJLRKPbZxmzGncUlzHWXlwV/QQZ6YllGi/weD116UiR39RXaGJET9efeuVGf7Iz
X-Gm-Gg: ASbGncuBsZ7nAMrGVC2IxQEurz62kuBwvlf28/B9T9EQ2sPKhi7cW4UcfLZQd0dwiSy
	eJsEXWC4IWmx721FBHsHHeBiUwIYsPWTk7UTyuxobOwHIFDDcdgVsbbVzXB+EBVJXxF2fQ0tnSD
	YDsbW7WuRps7q/AIPbWesN6pX2uH3nhOHin/xVB/5j4E5Hub7oeXxA7DOOZ2y6/LSxUtDXGID1a
	DhUesI2mg1zB9FT7vqTrbF7LSZuN8A+x9Ra/6Xrr0cWUhOt3CCd2PaewIijsxcYqH+C8f+tM+Cm
	QAwWZ5CwcAybln0Q9kAdiPuBCbA8VWwD8R0GSK4LfJdb5LZ1Gj/vZpx6XZfKJ0CvXzeix3/dlAW
	cwh/ehG+75Y33FBa0SwHLmEGAuwM09SP98J7LgARt4wHsy1kjyw==
X-Google-Smtp-Source: AGHT+IE4ASQcgRWD/jZgC1n/UDfRdS8RrMiGc8W9Q9v6/qUF85DKlX48B/nBotJeArrpmvNsbvBT1Q==
X-Received: by 2002:a05:6a00:3d4e:b0:748:fd94:e62a with SMTP id d2e1a72fcca58-7490d4e3677mr8361899b3a.1.1750516354403;
        Sat, 21 Jun 2025 07:32:34 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626c31sm4457914b3a.106.2025.06.21.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:32:33 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 21 Jun 2025 22:32:23 +0800
Subject: [PATCH v2] staging: media: atomisp: fix coding style in
 ia_css_output.host.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-bar-v2-1-4e6cfc779614@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHbCVmgC/1WMQQ7CIBBFr9LMWsxAoW1ceQ/TBeC0ncQWA4ZoG
 u4udufy/fz3dkgUmRJcmh0iZU4ctgrq1IBf7DaT4HtlUKgMdkoKZ6MwfesGp3FyA0J9PiNN/D4
 qt7HywukV4ueIZvlb//0shRTGttQjat0pf51Xy4+zDyuMpZQvx1o43ZYAAAA=
X-Change-ID: 20250621-bar-573b8b40fb80
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750516354; l=2215;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=JVPFAAvse4A5IpP/YFqmn/hhxB+HgS5D6zZF1Yd2S3s=;
 b=3HJWzSk7bSPrIdSg4ZhvkYfzGpJsO+zuinCwnHYwi1F6c3nIqSCUoc40G6V+OFR0tDalMqWlF
 e8VF/EVeRjOASiw+ONLqSRVLe+dIvJAKc9XlZJieUyOSH9/lY6FI0kx
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix two checkpatch.pl ERRORs:
- Use tab instead of space for indentation
- Move trailing statement to next line after if statement

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch fixes coding style violations detected by checkpatch.pl in the atomisp driver under staging.

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format

This cleanup improves code readability and follows Linux kernel coding standards.
---
Changes in v2:
- Fix patch subject prefix to "staging: media: atomisp:" to comply with media CI style.
- No other functional changes.

Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gmail.com
---
 .../atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c47104dbffbd455bfd649b9079f88c9c..044c7d3706f486ba7cae5941ac598044c831b6c2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -74,7 +74,7 @@ int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
 }
 
 int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
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


