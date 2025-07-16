Return-Path: <linux-media+bounces-37842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE711B07126
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16852505A58
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6692F19B5;
	Wed, 16 Jul 2025 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fSk538Rj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A528B4EA;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656848; cv=none; b=Aq8gble+1IdnDL/hktQC3AATUCJqYgsbppPQJ7K6MhLeeMh+BeNKI63qqGoiALlYJaPAuczsCBcHkLXkFgXZOl+aqrHxNxzALU9jwxXLJCkRgHWequeBeR3PhbsqG5MjJbuKbP+O7eJzAT//c/AjMYPEtDZSdp02rLqyP7MHE1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656848; c=relaxed/simple;
	bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOwLcWkNFn0a6QooU6tRjILEpmfPoTQxmcycT8hYFFbY7DDimDKqD5hJNmr6FMZKref1bPGbaNBt+eHC6qIveqw1HH9dsxMwqI7o/clt9I2Z7iPfj3p4I/kXRkt20fDR9x1EnuKf9BHOaIYZKaxp2XgLDeHyyMTtMIErNdgGTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fSk538Rj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7918EC4CEF6;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1752656848; bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fSk538RjF1tdMUKROR4uR9mlhUsyT5498o8kra2auofzQ6ZRisTe/+VxI80lgLCnx
	 hWfvmDCUmlfe2hLr8tPKtnVqBzfo1FEihl0DiFy+feVn6+5lEc9rGSwwf/s+uSj8kW
	 6AD0qo0p0ngwjNHriq2WEHAZXcABnOfAq+DVO0Ig=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A22CC83F1B;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 16 Jul 2025 11:06:51 +0200
Subject: [PATCH v6 01/11] media: v4l: ctrls: add a control for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-ov9282-flash-strobe-v6-1-934f12aeff33@linux.dev>
References: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
In-Reply-To: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752656846; l=1793;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
 b=juVuqNIAo95NqjiFbbrFMnZ7vfSLwdFTjoEXauwNrnReH8hzs5zm81UCZqvsU0wZTMTNuMenP
 nHLOY3zROL0Df6VkWil8eQbY0Bkq0Hm2DeAj5PEhE0Mup8nqKbWOtML
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add a control V4L2_CID_FLASH_DURATION to set the duration of a
flash/strobe pulse. This is different to the V4L2_CID_FLASH_TIMEOUT
control, as the timeout defines a limit after which the flash is
"forcefully" turned off again.

On the other hand the new V4L2_CID_FLASH_DURATION is the desired length
of the flash/strobe pulse.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
 include/uapi/linux/v4l2-controls.h        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247accc51d0261f56eab1cf13c0624a0..f9ed7273a9f3eafe01c31b638e1c8d9fcf5424af 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1135,6 +1135,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_FLASH_FAULT:		return "Faults";
 	case V4L2_CID_FLASH_CHARGE:		return "Charge";
 	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
+	case V4L2_CID_FLASH_DURATION:		return "Strobe Duration";
 
 	/* JPEG encoder controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 72e32814ea83dee5f1202c1249eac7cf3b85a22a..72c6bd26e2dfa23a0224e745e5cd07c9fca0c8b5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1180,6 +1180,7 @@ enum v4l2_flash_strobe_source {
 
 #define V4L2_CID_FLASH_CHARGE			(V4L2_CID_FLASH_CLASS_BASE + 11)
 #define V4L2_CID_FLASH_READY			(V4L2_CID_FLASH_CLASS_BASE + 12)
+#define V4L2_CID_FLASH_DURATION			(V4L2_CID_FLASH_CLASS_BASE + 13)
 
 
 /* JPEG-class control IDs */

-- 
2.47.2



