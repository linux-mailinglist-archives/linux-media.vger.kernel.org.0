Return-Path: <linux-media+bounces-18733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B5D9890C4
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 19:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1916281DCB
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 17:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D74148828;
	Sat, 28 Sep 2024 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wnlmd2O4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC092B9B8
	for <linux-media@vger.kernel.org>; Sat, 28 Sep 2024 17:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727544253; cv=none; b=EU7O90hOQMCgn90dzbEtqqbDTTMp3Oc8X3/Y+X50Yz4s2kYkJ07pMA9OlpNONdnWbPNBBACjw3b82WsX6ach54R8WB7FGtLyPuQh1EY9X95tTNSkf/ZD950sfertVLRh4tZhOScqemdVWQio3IQoY01mjJ42rxG9H+sOrpn4M1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727544253; c=relaxed/simple;
	bh=qlD4hAYezzRfMJSVTKMvcaprQkVTpNx1pCXkIvcQKXo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TVfQFtYNJtMU/pQP4VY/QvYo9SgXv3IkqSatOxBOzQ1z/R8nzVgCwh1EelRA4ir9+BncxMPBVbQ/9vTbEAO1sC5MmigbuiVuvcCnn8mJ/4vtiPzEAdD1r2BhfvW4+ybsiGAAo00QJ9LHehXJWIoItPiZhoXuQkVwzHdJxltK2YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wnlmd2O4; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6c582ca168fso22399196d6.2
        for <linux-media@vger.kernel.org>; Sat, 28 Sep 2024 10:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727544251; x=1728149051; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YFbHhEntad0YRkHRniEw4Op6jqg3FVPKb/3C0+dPTjk=;
        b=Wnlmd2O42mQ6XykMcxjd12wCbj04PPfCi4cV2UyHRpEYRSsdjhXiiavgqnuksrSpKz
         5ElcO6SufmNFAyBS7KHGN96boryPZHNTMf6h7RRt174uAOS68RuZLvDgrSSKB9dwsoWr
         2T/M/mX9lL1wydvUDYNf4XeF9t8Bp6NSRy81U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727544251; x=1728149051;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFbHhEntad0YRkHRniEw4Op6jqg3FVPKb/3C0+dPTjk=;
        b=EI7cZo+LVGITb6fNr2StWUuINzcrA6InlhITJWJxvx0Uk81/f2aJH+KC8/bcfLXd3K
         HPyJXFsdto8tboUMHx5RS+T3zAGu4f+3hygb83asHlGHe0UxfY3yYwfHx4dgF/lWnkCN
         KPE+DvsOyTLWPr4xOWeAZN99rGtLER0J+R4/HCq7uNncKI7Kat4LRH0fvkhKDI+bna8N
         xqr/ZGA/p/VJ16n9kgYDdHaIK/CRNNkMcR32xkiqc/fu/xWn6A9jhHDacCRjQQTfC2XB
         v13HvlUGF2Cjlm41NSaazHwc/MAIDZ7efYGNaJvk7n3X0M9soM/fRXiGytbW4i1j2aqe
         GzYQ==
X-Gm-Message-State: AOJu0Yz/jLkc29PwmWk3d6TyDWJiHVNNca/xL7V2FWFao4Ej4GII3C5m
	vyVmj9Ebl7Nupn7r9TTxyqaM7F890Zqngjyr8jWy5U9Zbz+uA9vKPjX2QN6C8Q==
X-Google-Smtp-Source: AGHT+IH5Q56DnLabPE84rAsJDRreZzkbe2cLbv9f5se3Te8mZWhOiHBZCEcJotjViuL7j8ic39Ib3g==
X-Received: by 2002:ad4:4d03:0:b0:6cb:3da9:b8ac with SMTP id 6a1803df08f44-6cb3da9bbd0mr78224976d6.3.1727544251157;
        Sat, 28 Sep 2024 10:24:11 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b68311dsm21437756d6.122.2024.09.28.10.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 10:24:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/3] media: static-analyzers: Fix 6.12-rc1 cocci
 warnings
Date: Sat, 28 Sep 2024 17:23:57 +0000
Message-Id: <20240928-cocci-6-12-v3-0-53fc5ed20be0@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK07+GYC/3WMyw6CMBAAf4X07Bq2lEc9+R/GQ9lW2APUtNpoC
 P9u4Wj0OJPMLCK6wC6KU7GI4BJH9nOG6lAIGs08OGCbWchSqlLLFsgTMTSAEhTVLfbUOW2tyME
 9uBu/9tnlmnnk+PDhvb8TbvbnJiGUYCrsrHKNQW3PNAY/8XM6+jCI7ZTk/1rmGqkxVleoa91/1
 eu6fgAO4B8b5QAAAA==
To: Benoit Parrot <bparrot@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This patchset introduces fixes for all the new warnings introduced in
Linux 6.12-rc1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3: Thanks Andy and Hans
- Fix patch description
- Fix build error :S
- Link to v2: https://lore.kernel.org/r/20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org

Changes in v2: Thanks Andy and Hans
- Replace max with if
- Fix style in subject
- Link to v1: https://lore.kernel.org/r/20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org

---
Ricardo Ribalda (3):
      media: ti: cal: Use str_up_down()
      staging: media: ipu3: Use str_down_up()
      media: atomisp: Replace ternary operator with if

 drivers/media/platform/ti/cal/cal-camerarx.c    | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_frac.h | 6 ++++--
 drivers/staging/media/ipu3/ipu3-css.c           | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)
---
base-commit: 075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
change-id: 20240927-cocci-6-12-4c571bc8e9dd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


