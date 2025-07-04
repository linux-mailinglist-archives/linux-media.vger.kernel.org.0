Return-Path: <linux-media+bounces-36848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFA6AF9724
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 17:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA23F1898BB0
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035492E06C9;
	Fri,  4 Jul 2025 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXGmh2nE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEDF4501A;
	Fri,  4 Jul 2025 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643672; cv=none; b=rTBGM8Eykv7OWsre5vGoLToCzbig0FZ0eFDHHGk8m2NHWMF+QrLsqjOsWT1lOC/Xsh3TAh3YVLKsvO10xTaLdn2WjtwHYblOo+urtTPxYhwGCaWsBQszbpyo3NXVAtcWHUn9UsPc/2NVs2ZFMllK+fRe+ePXfbMwxL2KSxS7iSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643672; c=relaxed/simple;
	bh=Im8I+7hlGniAQNwn5GxMLcoY1pxk5HJSJUp96zBoC2Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X5r/zTKLmZMhwhnjiaBDOg+9QnKZB6EFjpuhBCx/n493/JJcTBaV3DuqAXedXQIw+qa77kepsOMGeDofWWwoVzNvvS3jZr6zmMHc3nSaRM3793LPy65uLEx5tXkl70ORPRF5DJg6CMwSSdmbe9OIWLBnZTPo8sYtsjGUP32dAMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXGmh2nE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2349f096605so14984095ad.3;
        Fri, 04 Jul 2025 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643670; x=1752248470; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OedcBPFbzsQsV/0/v5ae1F3cwXPOlb49ooocQIKNZl4=;
        b=WXGmh2nEwVgJIHhfCSWRWrPYtxzk/xdpg/f7sd7nF00o7EfKzz/t70twFUlNS0mu/e
         o3nF6famN3ruflcIVTON6eDt3u9RSG0tcl4Qp4+QAu+ywUm+LX768UbbBDyVOm27o0wt
         4w9BNjoV4iSUjw+cNSjqCiFmllts6Rkkmo1u9o7EJAVPLh6v60hqZwsTOa8qFtSxR8eL
         4/6iUpaSTwt9kd5MK2jkZEqpOteb3mMJSzEykY4VOi30k34TIlI5xI594OxCNKLBYvCi
         TLgcSU4hNjSUEM1vJVDUAuhx6snWWb473R79eTc/jnb8MTaO4BPe035AMGWxKEVZp6qn
         4nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643670; x=1752248470;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OedcBPFbzsQsV/0/v5ae1F3cwXPOlb49ooocQIKNZl4=;
        b=KDOLi6Ae3vh/X8X83sIxTcOdtcqss/nZsxOqm62tYeeOrVsM6kyHBXwlbB12CGMvmq
         3w1cSIg9raWRb/LKxApalOaGAy6tPPrv+M0irKM7W0Nk4Dyv3uKOqRn6QBYcymfQlZFh
         3N6qAz43kZxvzlAIQJq+CxmVt93g82ED+Mi+rki4Ir/z+JrsU1NStVOAm+V+yc9WHnH4
         X5UkuksZk0OMV3PPWUYUvGpO/oePIxgYFPUh9okylcfPvn1kPmI/cn3+05r0OT1wyIW7
         P5oaOqpisBnaM9Dm2XTf54POS7iW+poWvr4UMfH3hnhXMWNJOdRMFZOLi9ZHfDjTs1jx
         g4iw==
X-Forwarded-Encrypted: i=1; AJvYcCX78UdA1PM0Q7BRsnj5UNueseTCnGQAcJs79WzlW9n3YecTtSugFZJumt6b2N5GZUDFaEtW1Db5GI3Khuo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6hhq1kCKHNN4kKiTtwQ/VXEo2tJS6U41bTh229pbiQeAJyAvH
	LHFnplj84OVmo8FTfir94+TNNMCqqyApr2uikAkwpTa8lnTtUgE4F+kS
X-Gm-Gg: ASbGnctrStmiCL00cu+iRwScpHFNwPbtlOjb4rYxisNPfv95lUZpKrnK6yL0xc1HlYY
	O0x61IXYi8und3vRuYv9fa4hdNJYvg7/B6FlOEnlKcVGf+I8CK0iUhgxTwtWqyTcAKJdawtq2hh
	jfgXNKzzHwtxRF7m9GAzYewSNmgilQoq5SF/7ljKBgMcyzgPn2lTnnL3a5pXmfHn6xkCgtbV0DC
	1wke24p3Se2QmOzTxpWAVGwALheoM/d9gO74/G/VLoWCiCXbF4IidaYnlray8tfJPv8xu7S66ld
	bBm10FQYid6XTcEoyvevV0GTUrSAl2PjkeXkWUz9TpGQeap3RH/cWBkDPzGIhq+Q6JtvQvIXAa8
	e8hNjzB3WxyhbKfjL1oU1iCuf5ENNVKCaRlELgmCGQWWsboZofQ==
X-Google-Smtp-Source: AGHT+IG1TDVx9zaBJ67Uj+KJrT++joFV5lUfwhoIBw0a6RJIPN4Mg//ySNPgrJ9HLqu6bkHlyCZM1w==
X-Received: by 2002:a17:902:f682:b0:234:b422:7120 with SMTP id d9443c01a7336-23c8746d75bmr34272925ad.9.1751643669593;
        Fri, 04 Jul 2025 08:41:09 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a4b6sm21912375ad.29.2025.07.04.08.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:41:08 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v8 0/3] staging: media: atomisp: indentation cleanup per
 directory
Date: Fri, 04 Jul 2025 23:40:51 +0800
Message-Id: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAP2Z2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHQUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMT3bzU8vjEkvzczOIC3VRz4zQTc8M0YwNzCyWgjoKi1LTMCrBp0bG
 1tQAqBeK0XQAAAA==
X-Change-ID: 20250704-new_atomisp-e73f471f3078
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751643666; l=3949;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=Im8I+7hlGniAQNwn5GxMLcoY1pxk5HJSJUp96zBoC2Y=;
 b=7Fs8CESTiTtc3P9HHWidgMqselOticjAAk5NbwihSCq27lVxaK+8mJ/UFthtNl9QL4+1adfpN
 DHLAq81vczqCQaXIx39XSBWWwqwKLzwQbLuJcnYe0ktQoayc3Gv6BoA
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch series focuses on cleaning up indentation (spaces, tabs) in the
AtomISP driver under drivers/staging/media/atomisp/pci/isp/kernels/.

Following previous discussions, this version:
- Applies only indentation-related changes
- Touches a limited number of files to keep the series reviewable
- Splits patches by subdirectory to improve traceability and clarity
- Does not include any clang-format output or automated rewrites
- Leaves all non-indentation checkpatch.pl warnings or errors untouched

There is no functional logic change.

---
Changes in v8:
- Reorganized cleanup by subdirectory (one commit per directory)
- Focused only on indentation fixes (spaces, tabs)
- Removed all clang-format involvement
- No functional changes
- Link to v7: https://lore.kernel.org/all/20250629113050.58138-1-zaq14760@gmail.com/

Changes in v7:
- Split previous monolithic patch into multiple smaller patches
- Applied clang-format to entire driver excluding i2c directory
- Fixed checkpatch.pl-reported ERRORs (parentheses in macros, unnecessary return parentheses, zero-initialized globals, spaces after unary minus)
- Left WARNINGS untouched for future cleanup
- No functional logic changes
- Link to v6: https://lore.kernel.org/r/20250627-bar-v6-1-b22b5ea3ced0@gmail.com

Changes in v6:
- Applied clang-format across the entire AtomISP driver
- Fixed all checkpatch.pl-reported ERRORs
- Added explanation of tooling and scope
- No functional logic modified
- Moved 'Suggested-by' and 'Link' tags above Signed-off-by
- Link to v5: https://lore.kernel.org/r/20250625-bar-v5-1-db960608b607@gmail.com

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
- Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gmail.com

Thanks for your previous feedback.

Best regards,  
LiangCheng Wang <zaq14760@gmail.com>

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>

---
LiangCheng Wang (3):
      staging: media: atomisp: fix indentation in aa
      staging: media: atomisp: fix indentation in anr
      staging: media: atomisp: fix indentation in bh

 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h     |  2 +-
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  | 29 +++++++++-------------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  | 17 ++++++-------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h |  4 +--
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   | 12 ++++-----
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   | 11 ++++----
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c       | 18 ++++++--------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.h       | 12 ++++-----
 .../pci/isp/kernels/bh/bh_2/ia_css_bh_types.h      | 14 +++++------
 9 files changed, 52 insertions(+), 67 deletions(-)
---
base-commit: 4c06e63b92038fadb566b652ec3ec04e228931e8
change-id: 20250704-new_atomisp-e73f471f3078

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>


