Return-Path: <linux-media+bounces-38538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB70B1383F
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7E5E3AEC3E
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E1D2686A0;
	Mon, 28 Jul 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVrZXIpS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B97E267B6B
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695865; cv=none; b=Dlp6ROMqZISTEQjKJbNQ1jfRvF7nWttw+OOVe3yR8kA9EGxN7LXJuIx8VuiGFXx4vztP6BbmJKfwGkpWQXiu+w3qOOhM/bOFrHceo02Zl7KHk8XcwlBkcKidy2wBbIozxd0VKDOwcMLt7rxd5N/O18BgA/jvqUoga+OdNw75nlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695865; c=relaxed/simple;
	bh=iMlKRDc82Fk4coX7lf5dqJ5dm2Z0dqtQBjtMFXpujU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjpzIt4CcGCEzNH3fDDnb5L9vwVNIcfcofwZ18WxErsDpNkIHlaW6mukvcMKHk+28r86e7gJnxRI+FXh0gmXp8gc1v4EKd+uQVfwFRVqp37I2iiiPLvouJWZlbgeL1RSveB1U7EOdAKtbGI3nOSd19DXfs7h28ldLe+O1HLSGjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVrZXIpS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63578C4CEE7;
	Mon, 28 Jul 2025 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753695865;
	bh=iMlKRDc82Fk4coX7lf5dqJ5dm2Z0dqtQBjtMFXpujU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVrZXIpSPYyPcaha4p4ws88pR73BHV1LxIvmk0vtdZbsIsAK3/fug3DfWyEnpNVHj
	 e0kUIEPVj8TNNgjU5T5bVvDUFF0SJd8twkpASgKnK/fOr2F0naEAgqUBMSZdfy7H1n
	 f9RSbg46Yb/dWdJBehEfno2VY+KDTbqDgXGkPRT3Hv+vtDac2MXFvk0FP5uZlVD5BB
	 aKRbK0DjgNLKCRK0RuDMREu5BuMpZHRWqGlm11bJrQhcr6vAyHnJ3dvxmvHmRU0L4N
	 B/eyMS/Id7YyfY34UlSUcz1CgrmqsxTkssL9Bo+c5v7Fjc4zk7TqjaNrFddFdoZUh5
	 0BnUWEqRYjzAw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 3/8] media: v4l2-core: update Hans Verkuil's email address
Date: Mon, 28 Jul 2025 11:41:52 +0200
Message-ID: <9bfb86c3b6b85d10e96cc0a1d770c71202e5dbb2.1753695717.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753695717.git.hverkuil+cisco@kernel.org>
References: <cover.1753695717.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

Replace hverkuil-cisco@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c     | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c    | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c    | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-priv.h    | 2 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index d49a68b36c28..1316194015a0 100644
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


