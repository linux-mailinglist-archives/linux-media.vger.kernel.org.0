Return-Path: <linux-media+bounces-33770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A495ACA218
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 01:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 896983B3315
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 23:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011C9266B41;
	Sun,  1 Jun 2025 23:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTh1hcwR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E92257AC2;
	Sun,  1 Jun 2025 23:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820381; cv=none; b=CgKS9C+VJkYWAg/hZAyPktVYo/2HOv06dyPDcPOnXBsO+mI65BVRJdy2H4AlWzj1nrVvxU1SC7BgjQHy88dNPP7QWdP4hbXw5739DhsES3NMLp2rqPm8Xfnu+/wP0iM8qIAVC/QwB+OC95NOpyvxAYvwY0xihi/cZWsaR77m2s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820381; c=relaxed/simple;
	bh=rT8kNq/Nx+iejTJ2afXf7ADnrlKnzKDTh0v4UfOjouo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tlQ1CC67ud0bM/LVQ7W1JR7jNJG0L9k7OsPKilmR+oeOKrQaW9CSZPga4hKBE9qUSKoYyKFeizhFWWNjmpGDX4YA9KEDLg2XRkhdeUQ+jvg5xToFMBNtPLf6Zeq8B+4XKO7zCDEIlzAcc/Af7OWHB9tYb3b3lzlO+zIqoPnERfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTh1hcwR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8757C4CEF3;
	Sun,  1 Jun 2025 23:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820377;
	bh=rT8kNq/Nx+iejTJ2afXf7ADnrlKnzKDTh0v4UfOjouo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTh1hcwRPM/tjMuN5eilsoBM8156lFk9GtacWpe3E/6yLUJ2nFkfg1LXbxjr7HEWd
	 V6nMR027rys7dPfClyaYkmlpkcgoi2tDkXb7fvFFSfN91kiYUHedbWqUR1cl36fRWo
	 krbtc9Bg+MhkY844i/JzawoWRV31Ooo224iYkWogXitoi9+QY17pAnU4+S9z2m4BCp
	 vSQzGqMUSalEAsXM7APDJEAKuNfZ6LHpzRipeQNYtppzbEL5bXF6yWfe9XDo9cxeIp
	 VbEqI3uW+ecpoEP4o2dtaiRFbfe6aXXQGMYmTQy271iR8lu6+NgeznCmLB/Q7lNMfE
	 qOs4Zc+Woq/1Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nas Chung <nas.chung@chipsnmedia.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 040/110] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Date: Sun,  1 Jun 2025 19:23:22 -0400
Message-Id: <20250601232435.3507697-40-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nas Chung <nas.chung@chipsnmedia.com>

[ Upstream commit ad2698efce37e910dcf3c3914263e6cb3e86f8cd ]

Explicitly compare a buffer type only with valid buffer types,
to avoid matching a buffer type outside of the valid buffer type set.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees based on
the following analysis: ## Code Change Analysis The commit fixes a
logical flaw in the `V4L2_TYPE_IS_CAPTURE` macro in
`include/uapi/linux/videodev2.h`. **Before the patch:** ```c #define
V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type)) ``` **After the
patch:** ```c #define V4L2_TYPE_IS_VALID(type) \ ((type) >=
V4L2_BUF_TYPE_VIDEO_CAPTURE && (type) <= V4L2_BUF_TYPE_META_OUTPUT)
#define V4L2_TYPE_IS_CAPTURE(type) \ (V4L2_TYPE_IS_VALID(type) &&
!V4L2_TYPE_IS_OUTPUT(type)) ``` ## The Bug and Its Impact The original
implementation has a critical flaw: **invalid buffer type values
incorrectly return true for `V4L2_TYPE_IS_CAPTURE`**. Here's why: 1. For
invalid buffer types (e.g., 0, 15, 100, 0x80), `V4L2_TYPE_IS_OUTPUT()`
returns false 2. The negation `!V4L2_TYPE_IS_OUTPUT()` makes these
invalid types appear as "capture" types 3. This can lead to incorrect
code paths being taken in media drivers throughout the kernel ## Why
This Should Be Backported 1. **Affects User-Facing API**: This is a UAPI
header that defines kernel-userspace interface behavior. Incorrect
behavior here can affect any V4L2 application. 2. **Potential
Security/Stability Risk**: The bug could lead to: - Wrong buffer
handling paths in media drivers - Potential out-of-bounds access or
incorrect memory management - Driver state corruption when invalid
buffer types are misclassified 3. **Small, Contained Fix**: The change
is minimal and contained to macro definitions with clear semantics. It
only adds proper validation without changing valid type behavior. 4.
**No Regression Risk**: The fix only affects the handling of invalid
buffer types, making them correctly return false instead of incorrectly
returning true. Valid buffer types retain their existing behavior. 5.
**Wide Impact**: Looking at the kernel tree, `V4L2_TYPE_IS_CAPTURE` is
used extensively in media drivers: -
`/drivers/media/v4l2-core/v4l2-mem2mem.c` - Multiple platform-specific
drivers (Samsung, Mediatek, Verisilicon, etc.) - Any incorrect behavior
propagates to all these drivers 6. **Consistent with Historical
Pattern**: Looking at similar commits like commit 4b837c6d7ee7 ("media:
v4l: uAPI: V4L2_BUF_TYPE_META_OUTPUT is an output buffer type"), UAPI
fixes for buffer type handling have been backported before. ## Backport
Criteria Met - ✅ **Fixes important bugs**: Corrects fundamental macro
logic affecting buffer type validation - ✅ **Minimal risk**: Only adds
validation, doesn't change existing valid behavior - ✅ **Small and
contained**: Changes only macro definitions in header file - ✅ **No
architectural changes**: Pure bug fix without feature additions - ✅
**Affects critical subsystem**: Media/V4L2 is widely used across many
device drivers The fix ensures that only valid buffer types (1-14) can
be classified as capture types, preventing potential mishandling of
invalid values throughout the media subsystem.

 include/uapi/linux/videodev2.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index b0e1f660c5f72..af86ece741e94 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -153,10 +153,18 @@ enum v4l2_buf_type {
 	V4L2_BUF_TYPE_SDR_OUTPUT           = 12,
 	V4L2_BUF_TYPE_META_CAPTURE         = 13,
 	V4L2_BUF_TYPE_META_OUTPUT	   = 14,
+	/*
+	 * Note: V4L2_TYPE_IS_VALID and V4L2_TYPE_IS_OUTPUT must
+	 * be updated if a new type is added.
+	 */
 	/* Deprecated, do not use */
 	V4L2_BUF_TYPE_PRIVATE              = 0x80,
 };
 
+#define V4L2_TYPE_IS_VALID(type)		 \
+	((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE &&\
+	 (type) <= V4L2_BUF_TYPE_META_OUTPUT)
+
 #define V4L2_TYPE_IS_MULTIPLANAR(type)			\
 	((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -170,7 +178,8 @@ enum v4l2_buf_type {
 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
 
-#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
+#define V4L2_TYPE_IS_CAPTURE(type)	\
+	(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
 
 enum v4l2_tuner_type {
 	V4L2_TUNER_RADIO	     = 1,
-- 
2.39.5


