Return-Path: <linux-media+bounces-31309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D0AA0C6E
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 14:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C16221898C59
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A492B2D1919;
	Tue, 29 Apr 2025 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ay8TNfIJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F8726AEE;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931557; cv=none; b=s16YntpYuW7SYtnOaF17UA5p3kf+I/Mh6g2USzCJgz4LTNP2/3zFuB2MlHdoriqoNT18a1xEfUW/dKZfLLoluiXptQoxG6ZA2j+u4n16wlXtAZ8jMFEG3WJ7LLziPjolRSHbQfTf+8tsNk1vzZDj8+SSu/66g4hlf5mf2Oas52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931557; c=relaxed/simple;
	bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtoS0UXYZh29waIr9HIwaFGRYEtffTT9DX5KwK2b7LC+hvTrEl2RDLxXySwRjL09wJd4RFiDTPaomRQY3EzFvWLLrW8SSka1xpX4HtccjOej/MFCTC7d+k6Dkx94QMUUJukDAz4Gt+GU+OP/Casew0VrBmzWAZlRnbWvS76jKYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ay8TNfIJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55840C4AF0C;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1745931556; bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ay8TNfIJdHSpE+Ghmbsd+kSSO8m9juy6QZAkTgyzDv10MPyJ5iQ7TSDz8GNkIt5N0
	 MkJNf39g4/wXj9Ast1YYWXtr0Qdi+fY7YdepA3vKr2uoVxCt+7FDu/2qYy5g4Cdep0
	 HY8sIjyjhJVUIkfdzrmDerDpGZtvySSxdUoCB+2s=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3871AC3ABAC;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 29 Apr 2025 14:59:06 +0200
Subject: [PATCH v3 1/9] media: v4l: ctrls: add a control for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ov9282-flash-strobe-v3-1-2105ce179952@linux.dev>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
In-Reply-To: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931554; l=1793;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
 b=q0HdotQ1a3Lpu50SYXXrSIedy34zGRbVP85oeqT3uX74IjThduRjeyIdqv7WKOAQl3DpQ5spv
 a9RTte8pwtUAH8OaPV3ZJBAk66Dz2jwehtJHkJGzaBMI8/zwriVjhUX
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



