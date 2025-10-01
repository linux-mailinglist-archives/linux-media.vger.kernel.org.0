Return-Path: <linux-media+bounces-43494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9BCBB0E02
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624FB1947BC0
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CE230F92A;
	Wed,  1 Oct 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fv5CxC1U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C285E302160;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=TDiKxbaP0l1CHag4kvHMoDJr02cgdzMr/VOOiCxsfjdjAm7Cr2Es5OZyQ/zmnNI0B7x+wD5i6mbez2c4M+2NiRFC6ShlQsvUrp50210j8OGWZ3dtcCQjvmmJlW53p3+DK+RQaW1V0GjzNuhEdfnQYqqaddLVf8+TiUut43B0DEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=7Ul388q4W4vgu8zu3WDz0+o84z4buoASZ5zF95dEgJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bV/MPiquCSYB8krMqeBkwuktPhbi6ay0P/xJdd9tdBOzGT9SUW2d14WxwgE9LYibzCxSE1dZHnq25xLrD14bW1aJ2jMZjVFMzRyVKdPXTRdXJeH2W5YqnMc4zYpEkg3LdFDf1tow4vvBw0X2RrhPPBFNUs7VreANumWqKUUptX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fv5CxC1U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7F2C19422;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=7Ul388q4W4vgu8zu3WDz0+o84z4buoASZ5zF95dEgJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fv5CxC1UIrrKvLO+T3Q8sSZhZPzxSIUP+WjUgczZyWKRM32nOeUnW/GKo63Oe43kH
	 mLrjeVor5EsN5FN8m0Cdd5ahNpA6Ya6QnAvXRCvaVpPnT3sBL9iibNZ5BKxD/vjlYA
	 GqzEEdbp7CAciMpHEXPblSkzFw9BeM9huJjMfK1Bixwbt7Tda3eWB9qZmM3hB8LM53
	 QNHnIyt0fW6l6+6jNtDHu285fmpFHMFNtWuMsII1jxJCDjz1xM8ouVJybpWkreAyXm
	 ipNnKi3INvJcTPGIKTv0oB0jsDLfNzQcAPQqlvv3hSgUyTkxDUmbRYJwPSR7NON0q/
	 PDFgXfeyFpx0A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLJ9-2Xkr;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 18/23] media: docs: add some C domain missing references
Date: Wed,  1 Oct 2025 16:49:41 +0200
Message-ID: <c9b036938197f1dd5bc93f5c5be0245bd9e5d1ee.1759329363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Some enum/struct fields don't contain C domain references.
Add them to avoid broken xrefs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/buffer.rst           | 2 ++
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 856874341882..94dc2719e907 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -667,6 +667,8 @@ Buffer Flags
 	exposure of the frame has begun. This is only valid for the
 	``V4L2_BUF_TYPE_VIDEO_CAPTURE`` buffer type.
 
+.. c:enum:: v4l2_memory
+
 .. raw:: latex
 
     \normalsize
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index a8d84806a3c0..c8baa9430c14 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -100,6 +100,8 @@ See also the examples in :ref:`control`.
 
 .. _v4l2-queryctrl:
 
+.. c:struct:: v4l2_queryctrl
+
 .. cssclass:: longtable
 
 .. flat-table:: struct v4l2_queryctrl
@@ -180,6 +182,8 @@ See also the examples in :ref:`control`.
 
 .. cssclass:: longtable
 
+.. c:struct:: v4l2_query_ext_ctrl
+
 .. flat-table:: struct v4l2_query_ext_ctrl
     :header-rows:  0
     :stub-columns: 0
@@ -278,6 +282,8 @@ See also the examples in :ref:`control`.
 
 .. _v4l2-querymenu:
 
+.. c:struct:: v4l2_querymenu
+
 .. flat-table:: struct v4l2_querymenu
     :header-rows:  0
     :stub-columns: 0
-- 
2.51.0


