Return-Path: <linux-media+bounces-37475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4295FB01B37
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F386D6443A3
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 11:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F56D28DF04;
	Fri, 11 Jul 2025 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMRV6LPL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAFF28B7E6;
	Fri, 11 Jul 2025 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234882; cv=none; b=F/HNdd4FV0a6Fg1s0EkD0DOxLAZ/0N3dQYK9tSyFqMa0Bxc69kOTQJfW5usNllSe6Iu9t04MfDbGlqkbi7PyPoWjFVt9tr3Zc+8cPBdhI6ornTORX4V0XiE4elgDyK7w2LMrBm99jLIvZLO6cx7jWoNYERzrnu01DaIwisWmX6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234882; c=relaxed/simple;
	bh=feDvRDCDVySQgtBahHCSu9Ypy9OTk4jWyzpidVLMB4Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HmdpGzLZx4QxuPp3OsnxYwUulsxBu1jGCeyZv647xkmlrw+oWn+l8ffHAKgAB7fe+1+fdbpch0MAIbirRMq/RLKtBudCjoF5cYzCGo9drAg8VRJ170hO8DNIZhzTX8mkWA3Ha4VMO7c9bhVkZ9khYtB8srqB+z5VyqxpW3ZuVgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMRV6LPL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2352400344aso18574365ad.2;
        Fri, 11 Jul 2025 04:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752234880; x=1752839680; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t1mZQmrKVDAmOIPWfgUlqa9qFOkm2aS9rFMDa8dlAXQ=;
        b=YMRV6LPLHJRaNFWinBsLn2JdnhrvFQ4ATb4KQjhlo4fe1ZeLdnC2j5eVASmK+X+iIv
         yfcXds8ZR3WALqt4bSnE4QIYwXJL3LLKSurBAnHFnqdH0twUAK9Jlll0wPqq8/WZzW9N
         u2qKp+yHJDlS/lBZLFne0vHGYyhzi2TLuGIeF8eVPmbaxmirx4R6tSQlkUXVP0VgQ5ZI
         N9jSJCQunz24qYkdO0P0Cc1Pl3JyWh7VjqImDTlDENXT6Fwh4y7T2gTeMdJ8KGWnIe5H
         1Wge0sKWgVJ3Gt4aBvUklkzQayb4on/ijoEc8fiQDV1CeakeTzHEaGwo2zNEsUx7lbQS
         Dzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234880; x=1752839680;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1mZQmrKVDAmOIPWfgUlqa9qFOkm2aS9rFMDa8dlAXQ=;
        b=Q2AGWEaz4dnguxs/aJOdGLCRof67xcDWarylh/gZt2I2wEHGRfI7ojsxpCPrlL6c+4
         g/J1HrOcVlf8Xyr9tn9KuktMoep9Vm6DBMBU9DumgcadRIy1WCHMWNEqHs/pCSC5GU2n
         2fR/wGyoOxGnaTmQO7JZGVFx0JDiw9CTUkPVccapeQq5kvmccOSK45Beko4JxZ5JwHrw
         z0yR0bgS/uvCH6r/wnL2RLeWjDfpsybitcRPXwb/J2nfBhqpANl4qq0QGSgTVc2ZQXgt
         e+bfuTLDxRrrZTD+F1fl83aanw2b7LtMODsul1kcJPYc4xyfvhDc44TJvlXzO3HyC6QZ
         iVWA==
X-Forwarded-Encrypted: i=1; AJvYcCVNdWMr5GjoWdbAum5+qNRBxlLeSQoXAZ826oRELwPKQM34T35gjiAjJQFSi2GgpHji2SGNC6B/OkR5KP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBh3cDvHozfVy8+cfrSGsv2faDEXmro+Rc6zKkuGo22Q8YnRKI
	Xb18E59JDxlUS233S9wq7AopJBFN4R8T9BALP+YTtrttykW30pNif+Ja
X-Gm-Gg: ASbGncsYRzwy9IFTrdMck3ifCHFH7wSlGqyA6tNduzkn7t3WpdvJnoHDbhVBGywyvJR
	HHze9fXE8yID25/ewGt4uNlWz+mO+AEWt5Ulyq0FuMrS/7+UHiGk/VFK8Xw4hamkZ3z1GAonV4P
	vgetgxAkfC72Yd2zS7lixqpT+su+yE6aEATagGN2WhIhZMYOzZbR8UNvOeRtJiEL+c1WsK1+0wX
	CZDwCsX7Gkf0YMEBTm55gO5O/trKyStn0heK1sH2A6baXzEJsBCINozcqlUj6RfulscLTdcgdFA
	0a/Bh1K7AYJ/3SJepBZjgUT9jjm8i+2tCPfg6SeC4y/WLKPoHKQ6YXH/GyvFJ0KZMV3YHfslEzj
	7ddSvqL+tDUUuwZuJRlmTYPLXUc6fdHUmbA4IFhvvW7lAxkOft8YmtYD4F1/rjnB81/3QyRCxBb
	4secg401vQXA==
X-Google-Smtp-Source: AGHT+IETaLh9p3L+JTXZhSMf4BMBfeFZFaQ/8cg9uXxVbYQWOO4pT3BnG/VGG7t+vPls4gHhdUFsGQ==
X-Received: by 2002:a17:903:190:b0:235:f45f:ed53 with SMTP id d9443c01a7336-23df08e5a60mr31978055ad.33.1752234879931;
        Fri, 11 Jul 2025 04:54:39 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436e8e6sm46042135ad.255.2025.07.11.04.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:54:39 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v9 0/3] staging: media: atomisp: indentation cleanup per
 directory
Date: Fri, 11 Jul 2025 19:54:35 +0800
Message-Id: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHv7cGgC/23MQQ6DIBCF4auYWZeGohZ01Xs0pkEcdZIKBgxtY
 7h7qesu/5e8b4eAnjBAW+zgMVIgZ3M0pwLMrO2EjIbcILioueQVs/h66M0tFFaGshwreRlLLhX
 kx+pxpPeh3bvcM4XN+c+BR/Vb/ztRMc6EVvWVm35oerxNi6bn2bgFupTSF879s0OmAAAA
X-Change-ID: 20250704-new_atomisp-e73f471f3078
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752234878; l=4117;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=feDvRDCDVySQgtBahHCSu9Ypy9OTk4jWyzpidVLMB4Y=;
 b=1twEDt6k0zTGsYcR2NUvogGurdoeSs2Qh2drw+VpJsYrA+GZwORJr7fCq8tg3mmN/NyZojplQ
 OrWMeWaV+a9DiJQeUlysqbo9FxILmsiXiphGH7/b0UdlLmWBrHWMpEY
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch series focuses on cleaning up indentation (spaces, tabs) in the
AtomISP driver under drivers/staging/media/atomisp/pci/isp/kernels/.

This version continues to address only indentation-related issues,
with patches split by subdirectory for clarity and easier review.

There is no functional logic change.

---
Changes in v9:
- Reformatted struct comments to follow kernel-doc format
- Reverted macro definition changes that removed alignment
- Reverted multi-line array initializations to use brace-on-own-line style
- Added trailing comma in small array initializations
- Adjusted function declarations to follow kernel-style indentation
- Removed unnecessary churn in cases where code was already style-compliant
- Link to v8: https://lore.kernel.org/r/20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com

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

 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h     |  8 +++++---
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  | 22 ++++++++--------------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  | 20 +++++++-------------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   | 14 +++++---------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   | 13 +++++--------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c       | 14 +++++---------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.h       | 14 +++++---------
 7 files changed, 40 insertions(+), 65 deletions(-)
---
base-commit: 8c2e52ebbe885c7eeaabd3b7ddcdc1246fc400d2
change-id: 20250704-new_atomisp-e73f471f3078

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>


