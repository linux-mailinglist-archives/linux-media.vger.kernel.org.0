Return-Path: <linux-media+bounces-40868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD8CB336D2
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80E85178C18
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE613285CAD;
	Mon, 25 Aug 2025 06:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiFUR2J/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABA285C9D
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 06:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104790; cv=none; b=ZV/Yv8iugdv9DVdXDSCvGFTG3FUCALmJNooPl8iRRkuB3w/+5uhBWZ7PZalD4jXhTW1qP+/1E5seYfYLbYSiqWREGba9KBedQlD8pDGvywIUP8OPKwMqk4h8LtbDBIzMgPQpZripRf/ylpvUitLpXv3eaM4tGfWLUeRPl++u6bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104790; c=relaxed/simple;
	bh=QRlyHnh7lKwz9i0h0EKlYgYa4Peu20MC7cb/1ozN0t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLWB2rrRjXt6sPZmUsfKnuvSYomLni4a2fOSYZsAFfgXaVORANggYrJTS85emR52Cm64x240Tuv8ej+GIoGS9DwtAQFUV94t/ngvGXjzK5PGsigEGf9Wj9h9y9bH69bMyUpNQnN0K/u0bSj8JYrQB7ndYF0NsJsFRD1pUb2W9Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiFUR2J/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4BBC4CEF1;
	Mon, 25 Aug 2025 06:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756104789;
	bh=QRlyHnh7lKwz9i0h0EKlYgYa4Peu20MC7cb/1ozN0t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiFUR2J/q04//s3awOPIlCaWt5VFLsfEf0+yFqqwp6zKin9wm7KYyfRn2iziQUXbc
	 b7i7kEdGbdCbkmkpueD83TVTeElgwc8VXlbKqF0jSBB43IYU71NcJ84M4igFBsSP7u
	 YgYFL//qg4nq85OnjKtT36wtvlzx9miPGr9PweF1zhWEw57jWQTOYPq5XQynF23LBt
	 kBz7iR5tj+dqqCTN+s8eRTirBBwKVTAEUs0rUFdHi9oxRTeinS3E6ItmcpW8qizwAp
	 pCFTQwLfE0jBa+41MdjVh2iPWAKcRheuycTqka1cjT5R6ACo/1+1uLhFuRqK+6fap6
	 H+Fdzh2nuVMVg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 3/8] media: v4l2-core: update Hans Verkuil's email address
Date: Mon, 25 Aug 2025 08:51:50 +0200
Message-ID: <2fff39e3cd6fd5efa9314b8204a4003fff4b7cef.1756104715.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1756104715.git.hverkuil+cisco@kernel.org>
References: <cover.1756104715.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@kernel.org>

Replace hverkuil-cisco@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c     | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c    | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c    | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-priv.h    | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 49a5c7538a09..0078a04c5445 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -2,7 +2,7 @@
 /*
  * V4L2 controls framework uAPI implementation:
  *
- * Copyright (C) 2010-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
+ * Copyright (C) 2010-2021  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #define pr_fmt(fmt) "v4l2-ctrls: " fmt
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 98b960775e87..85d07ef44f62 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2,7 +2,7 @@
 /*
  * V4L2 controls framework core implementation.
  *
- * Copyright (C) 2010-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
+ * Copyright (C) 2010-2021  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/export.h>
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..ad41f65374e2 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -2,7 +2,7 @@
 /*
  * V4L2 controls framework control definitions.
  *
- * Copyright (C) 2010-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
+ * Copyright (C) 2010-2021  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #include <linux/export.h>
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-priv.h b/drivers/media/v4l2-core/v4l2-ctrls-priv.h
index aba6176fab6c..f4cf273ecf30 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-priv.h
+++ b/drivers/media/v4l2-core/v4l2-ctrls-priv.h
@@ -2,7 +2,7 @@
 /*
  * V4L2 controls framework private header.
  *
- * Copyright (C) 2010-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
+ * Copyright (C) 2010-2021  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #ifndef _V4L2_CTRLS_PRIV_H_
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-request.c b/drivers/media/v4l2-core/v4l2-ctrls-request.c
index c637049d7a2b..e77f722b36a4 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-request.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-request.c
@@ -2,7 +2,7 @@
 /*
  * V4L2 controls framework Request API implementation.
  *
- * Copyright (C) 2018-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
+ * Copyright (C) 2018-2021  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #define pr_fmt(fmt) "v4l2-ctrls: " fmt
-- 
2.47.2


