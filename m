Return-Path: <linux-media+bounces-44162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DB7BCC72B
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B3AD4E417E
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61BE2ED84C;
	Fri, 10 Oct 2025 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPepydih"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE1A20A5EA
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090259; cv=none; b=EpV114QGxfXGlwIdb2Vvc8MiZwHMUnzJKpKE+OjNAIc5B6RYprYh9Qh0TRyMXYoHwikNSgApg39YlNV6b6Mseh0TMK7o7Jagj4l5O4guM8D40YeNFmx81cGc+mGhWmQ/HqCObeDUhF3Bxu4epqWOYGIR5hpoVcVuVe/0HMoasno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090259; c=relaxed/simple;
	bh=FscxL/242r5uj6Hp2HX6By7g73yX9t4racZEhkatQvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G43JLNRLoFZ96KCgZtRIkjxjJz4rzh+AoLUtTEjXFAP6zBB35LJ0xYuQltW3Wrieh1+HIdTTuvld+rZGDXCjJdB6g5uTJItOuIV+fBYUI2mA+x0lYMH219gKu4ifQwec1VoXpbUn70ZQghMkYOuaY6wbtRn2P2fDFLx6xGNxPxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPepydih; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C38C4CEF8;
	Fri, 10 Oct 2025 09:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760090257;
	bh=FscxL/242r5uj6Hp2HX6By7g73yX9t4racZEhkatQvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DPepydiheZ/MI40VwGUzmIEYxv8iZrlkQtxE0V0IWHJ0F/P4ii3qdoeQzvk+qD+Fb
	 NiDtrs7ySu6C6L0AmeYIHHZzotYGTdHwUzAegkRABdIaJCAgAUsuhfDxXN+OjZnGsy
	 y4XrLjCErI0EMnM24SGWCdke+U0KxRC7OrdMvp+q8UxLBy6PW1YmVWkYhwCTd5EJuw
	 Y1RKl5+lLl3lZXFSIuqJvl8g1r1X8z66qAlRfKU72KJWKoU6IgNi1zNEt7VG6UZL6/
	 qlhhh7ebjp2OnItleCzaUgau0wsDHzNaoQmPbco9BrAsNB5NudfEPIAKl/Qm/6tXSJ
	 PRAvmspAZfDXA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [RFC PATCH 2/5] media: videodev2.h: add new v4l2_event flags
Date: Fri, 10 Oct 2025 11:54:07 +0200
Message-ID: <921b61697a0a87ccf758521a02c042d9c8831792.1760090050.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760090050.git.hverkuil+cisco@kernel.org>
References: <cover.1760090050.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two new flags:

- V4L2_EVENT_FL_INITIAL: set for the initial control events if
  V4L2_EVENT_SUB_FL_SEND_INITIAL was set when subscribing.
- V4L2_EVENT_FL_MULTIPLE: set if the event actually is a merger
  of multiple events due to space constraints in the event queue.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/videodev2.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 83ee088df24a..2d7f1ab7ca33 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2600,6 +2600,9 @@ struct v4l2_event_motion_det {
 	__u32 region_mask;
 };
 
+#define V4L2_EVENT_FL_INITIAL			(1 << 0)
+#define V4L2_EVENT_FL_MULTIPLE			(1 << 1)
+
 struct v4l2_event {
 	__u32				type;
 	union {
-- 
2.51.0


