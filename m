Return-Path: <linux-media+bounces-23224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DE99ED67C
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 20:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CBBB282548
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 19:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3487E2594B8;
	Wed, 11 Dec 2024 19:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m/dxx1lM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143C617736
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 19:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733945290; cv=none; b=gIum/lLcebz+Rn7wTIzG9kupRfYR8RGgDi+vq7n+W/V8YUb3b2M8fBveMOHjb7N/U+yUjtwHLRteARgqrTopeJNM4l/9/pkBBm6EEO+vxQ/TmNUu89XtKmOuLXaQcttRsOUc/REVPVUCrFykQftGx3z2fcCNFlx4la3MjWJjuMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733945290; c=relaxed/simple;
	bh=c4rUUO9W/z0Roi3Xk7gZM2ymh5j/W9eoNvewP1R/+pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HNR05S0LXb8bOR0VLEuUFXVYldUuiQuyBktVPmEL4tHsTYdmNUlvf/fhRVBxU+r7AsEpO0wR6kNg0PyXvmB9wVIna31Xkcn4W8WPvUf4IUirPxPn1bBONbFag4YASulws45OKIHGtayuEMqPnM6Vo2WRNjEiIOFtJdhgiFyr6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m/dxx1lM; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d91653e9d7so28083936d6.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 11:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733945288; x=1734550088; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lwz1GH20YZcAfR4wOD0+ts6AyJGblz9iSW/fLDIqe6s=;
        b=m/dxx1lMs6nr3Q2ZZ0UtowpZ1LzEirYdk1tHQEAhg31Fv4oID0ZZhd2LhZ/0hlW8vC
         r5O//A5CsMBAT0V215+MaUaz6D6dlQuJjvwId+cEq7Nigu6F8jywJ9THE9KKd5b/cKn3
         MAODd6QfkCEUVCOS0LM2hHP+94NqZNtAvHfnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733945288; x=1734550088;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lwz1GH20YZcAfR4wOD0+ts6AyJGblz9iSW/fLDIqe6s=;
        b=RBvG2EChU87KVdBsTS4Iv27Ofz6mElc/KJrN9mnMeFmfy92AGuxyl3T57nIdRFjbHQ
         1k8Dy+TAFzoM2kJ+gN8VrU0ZWCqd8ubD3EyBFtOJj2a2sU8DES/si3tFh3vSdx1T1Gf2
         4PgDnYNR3LUFaz3+zWfTkx5BiTfzBJRb7J8Rha9HUD9myGCZLj9GHNcWrZk2T+G+7pNR
         eCR7XS8W+yU5IwgXzowvvgy5EAlXUscJH1+vjQDdjRWYviXn8LlXSOsndYvHGx94zqoQ
         GoSB9xeam1if5KXY3nAWgjVjAaQKMMG92QsH/QvojeMRR95BIdYmg/YCxsxjOrzR46J/
         iI5Q==
X-Gm-Message-State: AOJu0YwFLCrLf2wYtWwgzupk/Tmne5Nz7xC6y5k7qn/FUmV8WTZdEC7m
	dr/2uU1vfP/ZJdztru/46zcvRk0vwbAootXe01ZX0ZmzRXYBpggQW/d8ZG9MPqwSfifbnQRc/Ws
	=
X-Gm-Gg: ASbGncuqdCVcZb/ZE2rQvf9mGLHzDoU4lpln1qBuiplzIYBvqox1xf4EpfXoMqILGBa
	qcmpZ6HPGWxvj1m4+Z/L2bJZBPByAkO64Yy1XEVGlw83R5BAxnrMk+uldHllnTFMvhs4E6f03MI
	/MFxtwNK8ocWiMyeOMOybcDnNfm8B2ZeGCRCzLIcTf3ygPm8cWnZ4c/RSLaxmCiN+76tWSw8PxY
	rGZ9Th4j1j1rOBBPY4Dkm7w6nssbyC/AeG4J1lZX7KCQpy58AXcyj3oqntQ2WPnNwmWbyaqOMyF
	W+/oAzxe/N0CRavI50q2z6QFm4Np
X-Google-Smtp-Source: AGHT+IF85TpZZDz5UAzO1lr9gGXfenvzCXpA0EtrQPjOMN7BgtskI/YOorD6MBoLmyJWS0Ws6BB2qQ==
X-Received: by 2002:a05:6214:2a4c:b0:6d8:a84b:b50d with SMTP id 6a1803df08f44-6dae395d9bamr7580716d6.33.1733945287877;
        Wed, 11 Dec 2024 11:28:07 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9fdf24sm73354866d6.75.2024.12.11.11.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 11:28:07 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 11 Dec 2024 19:28:06 +0000
Subject: [PATCH] v4l2-compliance: Fix build error clang TOT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-android-v1-1-2416cdefb98e@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMXnWWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0ND3cS8lKL8zBRdMwsD47RUi2QzA5NUJaDqgqLUtMwKsEnRsbW1AAp
 p83lZAAAA
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

We define the fallthrough keyword in compiler.h. but he c++ header files
uses as well that keyword and it get confused.

We could swap the order of the defines (like the other files in this
directory do). But this file does not use fallthrough, so we can remove
this define completely.

In file included from utils/v4l2-compliance/v4l2-test-time32-64.cpp:20:
In file included from v4l-utils/utils/v4l2-compliance/v4l2-compliance.h:24:
In file included from prebuilts/clang/host/linux-x86/clang-r536225/include/c++/v1/map:2193:
In file included from prebuilts/clang/host/linux-x86/clang-r536225/include/c++/v1/functional:540:
In file included from prebuilts/clang/host/linux-x86/clang-r536225/include/c++/v1/__functional/boyer_moore_searcher.h:27:
In file included from prebuilts/clang/host/linux-x86/clang-r536225/include/c++/v1/vector:326:
In file included from prebuilts/clang/host/linux-x86/clang-r536225/include/c++/v1/__format/formatter_bool.h:19:
In file included from prebuilts/clang/host/linux-x86/clang-r536225/include/c++/v1/__format/formatter_integral.h:21:
In file included from prebuilts/clang/host/linux-x86/clang-r536225/include/c++/v1/__format/formatter_output.h:22:
In file included from prebuilts/clang/host/linux-x86/clang-r536225/include/c++/v1/__format/parser_std_format_spec.h:29:
prebuilts/clang/host/linux-x86/clang-r536225/include/c++/v1/__format/unicode.h:465:9: error: expected ']'
  465 |       [[fallthrough]];
      |         ^
https://github.com/llvm/llvm-project/blob/ccfcc9117b70828390019979219fa26ce77c3900/libcxx/include/__format/unicode.h#L465

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 utils/v4l2-compliance/v4l2-test-time32-64.cpp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-test-time32-64.cpp b/utils/v4l2-compliance/v4l2-test-time32-64.cpp
index 752045df..ade76843 100644
--- a/utils/v4l2-compliance/v4l2-test-time32-64.cpp
+++ b/utils/v4l2-compliance/v4l2-test-time32-64.cpp
@@ -16,7 +16,6 @@
 
 #include <sys/types.h>
 
-#include "compiler.h"
 #include "v4l2-compliance.h"
 
 typedef __s32		old_time32_t;

---
base-commit: c81300e18609d94fbbcf53a60aa639b4b983fe2e
change-id: 20241211-android-6803fe8c604e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


