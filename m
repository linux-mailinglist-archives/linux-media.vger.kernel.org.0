Return-Path: <linux-media+bounces-36160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B41AECC41
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 13:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DC503B31B2
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 11:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160C021C161;
	Sun, 29 Jun 2025 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6IQN13E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70E14A4E0;
	Sun, 29 Jun 2025 11:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751196663; cv=none; b=WBSLmxy/np1Qlc1GI2hV623znkBKUbymZNreEi7nee6uN9UhOajqteO6X5IARoGyS0PfTIpSMV08SnuwvYNZGlN3bv7aJspIc27aJorzaXMY2IdEf9oa1CbIb84tefCpMUFlhRtrtckgzQ1rku0Ou2dXkaAiByggWLJGhdkQeso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751196663; c=relaxed/simple;
	bh=UqJ5yC8IXVrYyMPp7M4cddX+td36SAkjeKoqUf4iZHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AMr5PADbINTaAM5abivRiJSnKabqb6ezsoYsJpGiooovo6bITaVVsoZ2wwLrcPkVeUXtibwDTod08DMGxzQIkkj7OKojaabXLpLV/eShjFE3wBlJkuXOOt4TLYHz3pAcZQM/LGoquvOh/cuEzjeKF8S88CnRRrIWL8KqFPOplHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6IQN13E; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3137c20213cso1000156a91.3;
        Sun, 29 Jun 2025 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751196661; x=1751801461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o46zGpyrwMV+rXCp1UXOdJkQcBjDglXNYVLQA/nYN1g=;
        b=m6IQN13EqU5ijMKqt0HNtxmmXDnV43Dfbx8L/Zo4qsMf+QjS8xDCu7B56wE9Or7BvU
         ++CCd35SHRzZ0nbQwTSVqzZeXuvPI6HTJMexewQACx2CKfxYGj5+WHlX/3G0jo3o9mCb
         phxEuuU+BBlBg98FIckySnmMZN1ArGPWlCqLfzrEyapzIZU/WGZHRYk4hq9A/+HuGO4Y
         xojBVrQCvCwqmimnVzvVoqLHlFI5eah+J++IZ10ubP0I6vTHSg9EWoDqm5/uoKABo9In
         /LysCOc+oKM+EdijwpSDf1n0gNiemD5qHT6Yn3r8phgt/0XoM8s+CsoJZJFuCL+Ie2c7
         /IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751196661; x=1751801461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o46zGpyrwMV+rXCp1UXOdJkQcBjDglXNYVLQA/nYN1g=;
        b=SRKJ9lWC7SsRqnBjDcTNbE35OuArQSlyiUp+n2ltPplGt2LiYSBvsQm53va91Aajgf
         QGayr3dYlpkuuUfH+RcVQIbQbV8M6a0HC2rtvMRlWwfOtCGwWQydgxHIpGHAwU0elAc2
         GGR118dwVSh9bo6r6JcuAvVWA1SDEKsw2/R/rIi7BOj4h5ITdAKAmm5BA8PZPkG5MEMi
         nfs2G7ByfUdUtuOZq/UpSeAU3coxfrH9JuLeDJm2PETSs9TxzRW6AxT67i/4QuKMu0ry
         ohFyNYNjsiStGHTwdCqBscNpLdOiFWsHp5Bk/xNPng1lusohJ6hD/9gEBsohiRdwdxjV
         nWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqNcWhVBRNFqNhDYugdPjNxQOJMTiOsk5Byqv3d9oQ3JAKPvYZ7NspeFVXsU1/cNHz2lbixmBBJ/hH+m4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ukeEu1NasPpCFxhSfFSqdgPxrJeVce/KkIuPw24yWcTfEP8F
	9HATVWDDRg3f1/sHRepY+YwkSzpngogjEtbBP1X5FQ9x4WpWoS/86osx
X-Gm-Gg: ASbGnctiexB7tq7Q7QUx+LXwZKGhMogdIbT9LrmaawhSF4EoDQgWiMAJrT9aF9T0/dl
	w7XRAvbWdU2VluITusUrMXiDVxy3Bc3sD8enCfzdCU6uLYi0yr5Cv4Us/N4IEvKLpoLLSEzkAkM
	4vMOgjejg7KqoxAoW7cGmjNeBoGQyRPmHwps7Bjhs2sM9AVTjVdicWDpuH+LLoWTSKuNP2e6uh4
	NrYY0qkxktbujIiGXWXV3m0g/+OKCYLntYYseU4eFfIl1m/NqP0Y8f5hXcaTiKfHM0V8ywGqw85
	29iXRLcZmp/wA8JrVAdMR/r+7b/d1H7lJYgt6YtTI+9q4bqhZacCzqlzO7Hl1NXS7IidPPiBUCy
	4CPKqMspyO7wVGihY3ekPZx0ozV67a1lqW/+SEDAaWH6LXd0kjRTAtG/TSVDO
X-Google-Smtp-Source: AGHT+IFvo+LkDyVCc2WnJ7fJYF9lW6fRmLFZJRmkVSMwgKjDjypnxlC0XPNBI8jPg7mmOJe/LyqeVA==
X-Received: by 2002:a17:90b:3d87:b0:311:9e59:7aba with SMTP id 98e67ed59e1d1-318c8ecd027mr14920502a91.2.1751196661282;
        Sun, 29 Jun 2025 04:31:01 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c1523351sm6576896a91.48.2025.06.29.04.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 04:31:00 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	llvm@lists.linux.dev,
	LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v7] staging: media: atomisp: code style cleanup series
Date: Sun, 29 Jun 2025 19:30:50 +0800
Message-ID: <20250629113050.58138-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series applies clang-format and fixes all checkpatch.pl-reported ERRORs in the AtomISP driver, excluding the i2c directory as advised by maintainers.

The changes include:
- Applying clang-format (excluding drivers/staging/media/i2c)
- Removing unnecessary parentheses in return statements
- Removing unnecessary zero-initialized globals
- Fixing space issues after unary minus operators
- Wrapping complex macro values in parentheses
- These patches focus solely on mechanical style cleanups with no functional changes.
- WARNINGs reported by checkpatch.pl were intentionally left for future work to keep each patch clear and manageable.

The full series and corresponding commits are also available in my public Git repository:

https://github.com/lc-wang/linux/tree/b4/atomisp

To: Hans de Goede <hansg@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: llvm@lists.linux.dev
---
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

Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gmail.com

--- b4-submit-tracking ---
# This section is used internally by b4 prep for tracking purposes.
{
  "series": {
    "revision": 7,
    "change-id": "20250621-bar-573b8b40fb80",
    "prefixes": [],
    "history": {
      "v1": [
        "20250621-bar-v1-1-5a3e7004462c@gmail.com"
      ],
      "v2": [
        "20250621-bar-v2-1-4e6cfc779614@gmail.com"
      ],
      "v3": [
        "20250622-bar-v3-1-4cc91ef01c3a@gmail.com"
      ],
      "v4": [
        "20250624-bar-v4-1-9f9f9ae9f868@gmail.com"
      ],
      "v5": [
        "20250625-bar-v5-1-db960608b607@gmail.com"
      ],
      "v6": [
        "20250627-bar-v6-1-b22b5ea3ced0@gmail.com"
      ]
    }
  }
}
-- 
2.43.0


