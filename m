Return-Path: <linux-media+bounces-4847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A911B84D629
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 23:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29146289CA7
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 22:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702FB535D2;
	Wed,  7 Feb 2024 22:58:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709AF692EA
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 22:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707346689; cv=none; b=UwyKdm2QsvoidXcCQhHN0OqhfwdXcDbUtuska3qriX1saVBVXpSxTosZ6Wem9gO0IVWWGCs9Tm4OJc5D+7Ojkrp7n1c3mKL83adH+HLzWu6euJ8vTLrXN6dsbQFaY0/QmxLuKBHDQQ4Cxo349Suhwvnk6yb0VgE63w5rDFbbp04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707346689; c=relaxed/simple;
	bh=gJ+5xJtmPCb9on9uJmCdfGScJ5JPt6Yl94gO4pKEpbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqqwNKEPcutFqVaOuWBainxsx9jDOa5Av0AdSA8FbY/2tlOn4myGU86Vh1Qovv0IAjUGoqnkc7MmQrikXltK3Ytq3OS/g5Vusawe6ngfUAaeeBoakIRVbVXf8DBEDOlz6NgW1YMdaxUWTLROWMNp507p92TecuK5gGzLFpupMaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: James Le Cuirot <chewi@gentoo.org>
To: linux-media@vger.kernel.org
Cc: James Le Cuirot <chewi@gentoo.org>
Subject: [PATCH] v4l2-compliance: Fix building against libc++
Date: Wed,  7 Feb 2024 22:57:29 +0000
Message-ID: <20240207225732.22970-1-chewi@gentoo.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2-test-time32-64.cpp included compiler.h, which checks
_LIBCPP_VERSION. This only works against libc++ when a C++ header has
already been included, which wasn't the case here.

v4l2-test-time32-64.cpp doesn't need to include compiler.h anyway, so
just drop the include.

Signed-off-by: James Le Cuirot <chewi@gentoo.org>
---
 utils/v4l2-compliance/v4l2-test-time32-64.cpp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-test-time32-64.cpp b/utils/v4l2-compliance/v4l2-test-time32-64.cpp
index e175c055..810fd5e4 100644
--- a/utils/v4l2-compliance/v4l2-test-time32-64.cpp
+++ b/utils/v4l2-compliance/v4l2-test-time32-64.cpp
@@ -16,7 +16,6 @@
 
 #include <sys/types.h>
 
-#include "compiler.h"
 #include "v4l2-compliance.h"
 
 typedef __s32		old_time32_t;
-- 
2.43.0


