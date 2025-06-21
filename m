Return-Path: <linux-media+bounces-35526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDB1AE2907
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 15:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61A073AB5F6
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 13:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A78212FB7;
	Sat, 21 Jun 2025 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiOjOyn/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532981DFF7;
	Sat, 21 Jun 2025 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750510910; cv=none; b=bVHcYNUFZXjjDvUzpCIoZ1VlN6Xcju1SyX/BEVno1gc0zYoMNkQRg5ZcfjUXh9to+xLbIy4sILx8t9tNdBiB36uZ12rs3eQVShqU/nIco7tFFVsbPNO1Yq8ihpAUzT/Y/F2jQSJ1DsAI/OS4PJglg0equMTq0NkNkhzAvPWGM+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750510910; c=relaxed/simple;
	bh=UmuaVwVACEk8G368/vsvTByhNseq8/MmDXVCYyOC58Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UNFhVV9hxcsFNPOfPJqQnre6wjvFs/mT7q8Cr64nmKXguSdE32zv84DSwDL+f5o8iRAYlA02Dk717rQdhmBBE7171HncGxoslQO2oFU91NcgCwnKH2rz+y/OBiUfh3dJ8nvNuiuOD8GAmX/3kA+A626ZK9oAJ29jeBcSPBiQqag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiOjOyn/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235ea292956so29125665ad.1;
        Sat, 21 Jun 2025 06:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750510909; x=1751115709; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++Wr/hdHcpVIEXymOHZrBQsfIoJyvz7x05Ev90joOPw=;
        b=IiOjOyn/3c/ZvdQgUURx2Lv6YPTgGNNh1QtJyFIJdXgSGkkoSQ+kIClLDiuDAS0EEC
         Fv30LFDTMCLNMIT/RryzSBjHfU7TMPWgr0H7bwLbfJBHrz+EvHGRgz3fWPZFxr/B56Zu
         kDC463AOLypG0Q8ESdHz5lraeQ9jmf5q+QO3FFWDPoXQYdd4bSZeTCGkeZp+LEdj7XGo
         d0HTPXzS4zV4A2qp4CXlqqGluN6KSiZKeVpXC3cWLe6V/9l4PSxbexGG3cpcWrowrlW9
         U0qYXgI5CP8k8c+akGWf9H58C4Y6adWPCRc48DG7hJUWMiU7J22luod/3waMaGb+dWmM
         NVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750510909; x=1751115709;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++Wr/hdHcpVIEXymOHZrBQsfIoJyvz7x05Ev90joOPw=;
        b=S96mV0ES9x2MhcJcDk6NuzITYy5f9949uALf2uy8hSZCgcLh2tRAOtFA13jusc7tuM
         na8QrRpBhruyAYuGwDXMP0Cxg9lF7BTfwIgKGEFNYZq0NdEJzL1kox99WYBh5IqYaIwr
         iOnO/6XBlM59s8nL+b/0VdX0f21gyfJwMdqo3NMt8jKrDI5wvAd28Zqm9Sij8hek9fWX
         MbuQZJFATo/GHmRhO0lvL1fN6bWPrzsqLU8C2njw4z4t/sql1xoY9Sm6Ra+xQ3XwyajU
         63QaouYKscpFS04kYPiM/tnqeCrbvZoS+6Et8xAiOH+v/wEIHBgVElodNQIcdKB6UdtX
         2pOA==
X-Forwarded-Encrypted: i=1; AJvYcCW5p3jInB7CI9Fo/bCsLp4ILov4rjm0RwN8r7n/vCZqoaSsZRgkoc4A3cpEFZI0KuZrnZ3puUaY28yPACI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhJC//Akt2aQDTxjeFslrZXRDoNWk79mQaatzxtWAWHKluoA6J
	+ZXQ4vb25/TbR4ZbusrM4nSOQ5953Ri+QWht0bf7QnPpj28Pg+kOGYXq
X-Gm-Gg: ASbGnctgGsy57Ne2sMERQA0FZ/rg/d2FMLOnlfqNTRiFPhEtNI/Jyd4MtrzkGY3Cfg8
	QeUWM8VadUZxgVZ2dfN0HN8mvE/eVPM3NrUit3o+yjEtE63kBYwHmqyOTr3c3BaSOK+pihQuK5R
	LrmzpU8I3iLZOFzNbT5vY3cgGJ8Xo2S/WYvY+zIG3HWxO+J+vlazAPoRnmEiuCtbXFThQDBLyEe
	w45Gau70MrV5NWIHb3hDOCJjWkz554i4jM9OP5zTa1ESquMhrVHfqgmNVu72kudCKRaFqi9xNkF
	jv0HrnfEjIFEjpHu0r+JCL3Jzh+h0IIjkV7iAq5cex/UZPVC3IFLG4ZmgxZABrW3ZWnKLvySfII
	S+WTEpFWY2kBlyHsCNkMqRqYmT1gbOWwE9CrTZY+4/uU6ueMGdQ==
X-Google-Smtp-Source: AGHT+IHdzUQZnMVQWroq2Y86Ji+WHfkeOg/cc6RKLkTNOoQTQIJHGPYR88ZHTNwdnPBk+xf98vMmoA==
X-Received: by 2002:a17:902:bb8d:b0:235:ef67:b5a0 with SMTP id d9443c01a7336-237d9a71c36mr64793695ad.36.1750510908606;
        Sat, 21 Jun 2025 06:01:48 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8640ab9sm40575145ad.145.2025.06.21.06.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 06:01:48 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 21 Jun 2025 21:01:34 +0800
Subject: [PATCH v1 1/1] staging: atomisp: fix coding style in
 ia_css_output.host.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-bar-v1-1-5a3e7004462c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC2tVmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyND3aTEIl1Tc+MkiyQTg7QkCwMloMqCotS0zAqwKdFKZYYKhvqGSrG
 1tQDlMHRVXQAAAA==
X-Change-ID: 20250621-bar-573b8b40fb80
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750510907; l=1991;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=UmuaVwVACEk8G368/vsvTByhNseq8/MmDXVCYyOC58Q=;
 b=tloAjt8E0c/tquzQidruBT8mvc3LN9b7bnhxWNqp4xkKJlVl9EYzEysGN/Uvis81F/ujTTdeQ
 zOz/hWwP9EZAPLr9Zyu/sCqna7coxuEGRIyqUBH260HD8bs/hHBrtOQ
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


