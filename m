Return-Path: <linux-media+bounces-33819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B4CACA5D1
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 02:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CB8518868A3
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 00:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4340826E15F;
	Sun,  1 Jun 2025 23:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJ04gW5o"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8736E298333;
	Sun,  1 Jun 2025 23:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821101; cv=none; b=CUFy5ddZ/thtQ/YE1OBwFgDK4pxarT94uMcA7/bYExAMy9X0jEg1bmpF5shmY9RehaWMaU+6PPWCwkpml/iUqg6ApYeIuQ1NogO1lf+dMHoFMQidwb0uxXf6yvpqg4N8p+zLohd+ek3lypkiU7v7dsasm3nQYVHxtNAUcHXu36g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821101; c=relaxed/simple;
	bh=1fMqaXTqZyQdK4kOw7+b4DlUAkyq4bXIYupkzak7I+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uPA7GzKfHY6TZ8EaKLqALqwB3m9UcvsapU1IsjPcmzU2pNApaDpEvMwh9qJb4a0Sat13m46PZvRVeNwSmEo0/a9KF4QS4Lg/xwyHGGZWEADqnwCo0IS2oRHulGhaTNFGp5/w76HfvrvG4Fw5ZU2dG/Wvt7ECDIMwQSiHaruYLJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJ04gW5o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F730C4CEEE;
	Sun,  1 Jun 2025 23:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821101;
	bh=1fMqaXTqZyQdK4kOw7+b4DlUAkyq4bXIYupkzak7I+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GJ04gW5oZ3my4aKDW8GrGei4dP0WESsJpX8cU/C/asaijQf+zaNZ5+yKoij1mMkhC
	 f2/UrLojUzAdvEI8JsF2FarKy8pgPsyuOHk97XE05I4H3ZLCD6FwTu+k4/5reeBIZM
	 xtJICU30NyPkQJzSOsazN/zqx11Mc7hLNquXSvKdAJAEvzPnxKu89etd7WSiNWWdk6
	 33wwuwnUBaux3TVFwMQQHF1SzRg72YiF2g05urAfq4mkQRGevOvtD0gAEMdVDqEJ1Y
	 6XmdiZ/vIDniK83iXIOz6+H7Paxc739NtkCG0r4mGHhOSLmqsv4aXmDifyS82xpS8x
	 E67JItL65fokA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nas Chung <nas.chung@chipsnmedia.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 14/66] media: uapi: v4l: Fix V4L2_TYPE_IS_OUTPUT condition
Date: Sun,  1 Jun 2025 19:36:51 -0400
Message-Id: <20250601233744.3514795-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233744.3514795-1-sashal@kernel.org>
References: <20250601233744.3514795-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nas Chung <nas.chung@chipsnmedia.com>

[ Upstream commit f81f69a0e3da141bdd73a16b8676f4e542533d87 ]

V4L2_TYPE_IS_OUTPUT() returns true for V4L2_BUF_TYPE_VIDEO_OVERLAY
which definitely belongs to CAPTURE.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees.
**Detailed Analysis:** **1. Nature of the Bug:** The commit fixes a
fundamental logic error in the `V4L2_TYPE_IS_OUTPUT` macro that has
existed since 2012 (commit 607ca46e97a1b). The macro incorrectly
classifies `V4L2_BUF_TYPE_VIDEO_OVERLAY` as an OUTPUT buffer type when
it should be classified as a CAPTURE type. This is a clear logical bug
in a core V4L2 API macro. **2. Code Impact Analysis:** The fix removes
this line from the macro: ```c || (type) == V4L2_BUF_TYPE_VIDEO_OVERLAY
``` My investigation shows the macro is used in critical V4L2 core
functions, particularly in: - **Crop/Selection handling**
(`drivers/media/v4l2-core/v4l2-ioctl.c:2517, 2547, 2597`): The macro
determines whether to use `V4L2_SEL_TGT_COMPOSE` (for output) vs
`V4L2_SEL_TGT_CROP` (for capture) targets - **Parameter handling**
(`drivers/media/v4l2-core/v4l2-ioctl.c:2269`): Affects how output vs
capture parameters are processed - **Buffer management** in videobuf2
framework: Affects buffer direction logic **3. User Impact:**
Applications using video overlay functionality have been subject to
incorrect behavior where: - Overlay buffers were processed with output
buffer logic instead of capture buffer logic - Wrong selection targets
were used for crop operations on overlay devices - Parameter handling
followed the wrong code paths **4. Risk Assessment:** - **Low regression
risk**: The fix corrects clearly wrong behavior - there's no valid use
case where VIDEO_OVERLAY should be treated as OUTPUT - **Contained
scope**: Only affects the classification logic for one specific buffer
type - **Clear correctness**: The fix aligns the code with the V4L2
specification and logical expectations **5. Comparison with Similar
Commits:** Looking at the historical commits provided, while they show
refactoring and API improvements that were not backported, this commit
fixes a fundamental logical bug in core API behavior, which is different
from cosmetic or enhancement changes. **6. Backport Suitability:** This
meets all stable backport criteria: - ✅ Fixes a clear bug affecting
users - ✅ Small, contained change with minimal risk - ✅ No new features
or architectural changes - ✅ Affects core V4L2 functionality that could
cause incorrect application behavior - ✅ Logic error that has persisted
for over a decade The fix should be backported to ensure VIDEO_OVERLAY
applications work correctly across all supported kernel versions.

 include/uapi/linux/videodev2.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 78260e5d9985f..eeb57e7673732 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -164,7 +164,6 @@ enum v4l2_buf_type {
 #define V4L2_TYPE_IS_OUTPUT(type)				\
 	((type) == V4L2_BUF_TYPE_VIDEO_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE		\
-	 || (type) == V4L2_BUF_TYPE_VIDEO_OVERLAY		\
 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY	\
 	 || (type) == V4L2_BUF_TYPE_VBI_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT		\
-- 
2.39.5


