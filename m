Return-Path: <linux-media+bounces-33849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 967DCACA71B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 03:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFC221892394
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 01:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7839432A034;
	Sun,  1 Jun 2025 23:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPztz1X3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D132A019;
	Sun,  1 Jun 2025 23:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821380; cv=none; b=F4OA9zw8yNhUNMVCWvA2rnOEJU9Qbhi7KFueLMIuzwguj4SI3VHPAfuHuExo1QM96758pIAuLHc03Nfan27hkeCNS2nlBO7YdSEUDZaZ9feZo1n7N1FnTsXv8qwcmhCginThvbSj5Z74DFwGEmVSOFhzK7ipAA5fjIwMhTnHrmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821380; c=relaxed/simple;
	bh=BUj8HgOKTP7nDL48Yf/lE5bnAIO/VWuXFNlp+2H/WkQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qbxi8k76+ZE2tToavyagELBrMsRlnJ3lt9R+IsL7CsUCrlNdYL3jP/EZ0a/PrLY/91Q+Micglz6ZWy+h3D5sDfXmSYq1hxsmxUqz18pQf7F980SSR69FZpjwUKRveWL+XWhcQyh0uWKECvOC0KzeW3XlTelihFsjjJcaY/WPIRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPztz1X3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9434CC4CEE7;
	Sun,  1 Jun 2025 23:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821380;
	bh=BUj8HgOKTP7nDL48Yf/lE5bnAIO/VWuXFNlp+2H/WkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SPztz1X3htZvJy9c5P9XUm2q4Pd3VqFMHlfOtpbTAWoCgoRZ/9R0e4db02EeoD2yw
	 Y5GA3dTD4huGHMfh9xXoqPDCylQknoxi5sMYk9DkX3c4WlHCTrqx6eGpC7LOSCkZkF
	 sNYNYWE9mulv+rwNLMOyow/bRML+Cg9C9pdKWIiATWk2ISKxtHUFqrh517SB2IM3ok
	 cZYD6W7duinSmUIbuvNzoMvw6XtWVouV8x/QETPJZdmKj6/hqQpj/YrrSvbdy8+9uF
	 CbLmdIz3tlr/M4t7TjuPWqNDCBigGMGHVrB0SJh3oAKzxQ+Evfr63vfDsJF4F8jgTC
	 jLZjwe2eTr38A==
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
Subject: [PATCH AUTOSEL 5.15 15/43] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Date: Sun,  1 Jun 2025 19:41:55 -0400
Message-Id: <20250601234224.3517599-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234224.3517599-1-sashal@kernel.org>
References: <20250601234224.3517599-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
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
index 4e305496edf27..96802f9b0955d 100644
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


