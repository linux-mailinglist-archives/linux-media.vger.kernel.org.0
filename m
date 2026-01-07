Return-Path: <linux-media+bounces-50153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936DCFE59B
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BE3C300BEF0
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8655834EF09;
	Wed,  7 Jan 2026 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOWWpRhm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13F34EEFA
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796994; cv=none; b=frA9DaRzj2y6Ofi+onV5sAQX4pk9DoVR/CN0UHOETtlOCAca13OihRnBF6Y7YcGwhBHmru4yHZUMIDFyKy9rM1b2pzYadZ3BTam02uf/oKuK2+exC1fMsdLnL2jl5RGm5jWRW7NA3M6pNMumCZm8u2YPBzrJq5t6yv5bC6bUnG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796994; c=relaxed/simple;
	bh=Il9Eh11WV/xqDqP1PVBl1AW8wIbYEY8UuvNcQustwlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S1eBGUcBjfygTm5iyQuCGSizkUfIKPAOwWI9O2uMFtINB8m94J2bZTZLcUErpy5JOxOThHoiiPbyXssxgkEzBZ6wbP/N529KwX38mRUT5wwUPvQlbiNqG+D7ZZOhDQNIZDzxVKlQBuvFm7FCvQaigdlV4eCQLdL2/PPb+Aih6k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOWWpRhm; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81c72659e6bso100748b3a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767796992; x=1768401792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jFmty4BNuj6awrii1t7U31FXH7wri8KyJdJwKzc08Aw=;
        b=lOWWpRhmaSa6k/O5wqf105m6Se6HkHpadcJpCMerXUvp91Y9zaxBF97HYJBRkDaiH+
         FiZVl9fweJfxS6KLedUBXbzQjvHjoESCfVUhJoejMY7udg9OTj/48ye4YkC125I3c01+
         jX76r6dXpDxF9CoLQU0NQ3Yd6XHsY/q7fYAGr0JgrvQ7qKrfU/8FUow4+V+QHlyvQB7S
         jqANNqyVCgHTHOKh8MXL7vETKiy6bBxBkEfA8ETG5Ho/UdBprjnv2mxlZZ20ril6eHI5
         1L1pv9zh90U/fGRV5mrMWzk/HRaUqC6ZWiSxsbFGUPV13QFU8wQF+g7T57BbpZlUE1l1
         qFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796992; x=1768401792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFmty4BNuj6awrii1t7U31FXH7wri8KyJdJwKzc08Aw=;
        b=fdoDVlw935OHKb+UOL0AFOnxyyl9c5FbgwPLPbXF59La91u6Rn5LLjKnYt4rnd3nsf
         H7NiWoAjbMP6GZZ5kdvMPC/B9w+3xrBtFIs96AgShTBeT+Ix+ZWzUb1ur2fJtvHqY+vD
         RoGoKe7yw7hmkWEsVsVj95LrzYgODaCbljrNwRMQbTpXaFn7uR8iJ9UCzOaQErHu875a
         BafIPtAWMOvWC/JBamJ+kjZp1mytmDRyYRZp09VOMkrK/AdEOKzyhRopDCmwDFUV3qn2
         xOIp/Nz+vcN3+M56+n+iLzGzWUooK50VRAcLicKKcFXHvxypScH4J3jt5AURm3pI+grP
         bUYg==
X-Forwarded-Encrypted: i=1; AJvYcCWk+1LsKxLY/eoZpGm7US4hSDw/+AJKoKLaFPQvFhgB2THzB2LIm0rKdM7TEEHLrnXb6l+FmNDD3HyHQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEnFnppUJLbCrKaoqLyZP9D5e4OFHkA5OaoOWGDl2wBlr4GXw
	Wnss1p1hJhF+AuZ9klEzwOESqy3CHLEEQUhwx4ldtbxyoygKQHkJRej8axiM7g==
X-Gm-Gg: AY/fxX7s1Xk4IdEDi+teq1P1Gx9RGbCtmrzBdYWJ/6p0uTTc3Oay5MZXQyMiZmkyFY0
	02aSGKs6/qyWzKNtTdRkt02UeLa6ImJUcLWIXe0488mIJoxX7xMQN9bxUiec54SAU4o8NusANir
	08UxF/jlDSTmyrEKP4MHQymBQA/gSBFufF7Jw7zQLnfFTUujGq40cZkXBfb6r34WnCL7hBJVxn9
	5bHzWevjT1GMz6elZ8I3dQPmIKzlUQ4CVdNAvNkhsSjfgyHwe9nfeqZcG4f5tPLtwar81QpHdMD
	nruM0/iLSCXuWDNz4CcUCpUUfM41v02q/cGhiIaOh28W9xpZlHk7q7E74hWrZMeNJ6igsvGhMkG
	3nGuWdkM9nyBHh4RUqxr/D7y86PdH4aflFNhm/DzHEOPwO6yslEhj26q89mGFku5Ifaw+U5fPAT
	FjRvUFxFSluWr7oGt2famvmQ==
X-Google-Smtp-Source: AGHT+IHBH/YNqBbSFpzLLKloAvcpMmkr0v8s83k+3t8kLdLWdTf6EoKI9MSDa6AMjmoTAhfPDP3b+Q==
X-Received: by 2002:a05:6a00:3019:b0:806:1719:295a with SMTP id d2e1a72fcca58-81b7fdc3515mr2374361b3a.47.1767796991833;
        Wed, 07 Jan 2026 06:43:11 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59da826sm5168936b3a.46.2026.01.07.06.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:43:11 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v3 0/3] media: atomisp: refactoring and fixes for V4L2 compliance
Date: Wed,  7 Jan 2026 20:12:49 +0530
Message-ID: <20260107144252.74666-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses maintainer feedback and fixes build errors
in the atomisp driver.

Patch 1: Standardizes the 'Bridge' structs significantly by using
v4l2_rect instead of custom shadow structs and aligning ia_css_region
members with V4L2 conventions.
Patch 2: Introduces a helper function for statistics buffer allocation
to reduce code duplication and centralize error handling logic.
Patch 3: Adds missing error propagation for IRQ enable and XNR
configuration to improve robustness.

Changes in v3:
- Fix extra new lines in commit messages (Dan Carpenter).
- Remove unnecessary s32/u32 casts in atomisp_cmd.c, keeping only the
  (long long) casts to prevent overflow (Dan Carpenter).
- Propagate error codes in atomisp_ioctl.c instead of returning
  hardcoded -ENOMEM (Dan Carpenter).
- Update commit message for Patch 3 to avoid "flooding" terminology
  (Dan Carpenter).
- Wrap cover letter and commit messages to 75 characters (Dan Carpenter).
- Sent as a new thread to avoid confusion.

Changes in v2:
- Split into a 3-patch series.
- Standardized internal CSS types.
- Fixed integer overflow safety.

This series is based on the latest staging/next tree and has been
verified with checkpatch.pl --strict.

Karthikey D Kadati (3):
  media: atomisp: replace shadow zoom structs with v4l2_rect
  media: atomisp: consolidate statistics buffer allocation
  media: atomisp: propagate errors from ISP xnr and IRQ enable

 .../media/atomisp/include/linux/atomisp.h     |  19 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 142 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 127 ++++++++++------
 .../staging/media/atomisp/pci/ia_css_types.h  |   6 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  16 +-
 5 files changed, 170 insertions(+), 140 deletions(-)

-- 
2.43.0


