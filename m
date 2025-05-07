Return-Path: <linux-media+bounces-31921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D6AAD93C
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C83D23AD98B
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88C1221F3D;
	Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="S3Wo3hG8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A099221263;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604342; cv=none; b=fq620okQWQ/7IuQW+7lhuhh7Z+tV3zDYN4dUmnkvT///HDFsKUFRdhc2ryPlrWPrVY+cqMwyXsGwZvRrg11MA1UdTU5Gpun0rnqSO15GXc8d/E6vBjB8nB3NVlW2o4wJkTwbsMAwKIdPvEKUUCDveWmipP6SERYgZBYDMSfAmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604342; c=relaxed/simple;
	bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQOdj73zLrpYfUzaBSWtnFC57f43YNv51UdfPKA4BzNeBbFci+UyO/VwlSNO5NMVMCNIQXw12pUIHVgLr1wQ12Xjl8xJ4R/qbozp+MKQAM9sjJ+x9dc9nOZbcRmLr+rcSCUYybR6ZEelRcRCDksOAu3s01AboUZ2e2qoEubZe7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=S3Wo3hG8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 956A9C4CEEE;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1746604341; bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S3Wo3hG85g7wVju04EV7FIznxnH8vKnrueaMvjmvKzZ6ytBfPQMIR+Yr2EQrweJpJ
	 AC6tkO+gOCNxar9ki5sjnuapjUFII7gW3eRGLWGdf31ReOjAptXLbYyMXLUxDGD9Ze
	 F3d16/bVuA/lm1S0Hr/r1BxBmxDJDWaSNeJdfSqo=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEACC3ABB6;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 07 May 2025 09:51:30 +0200
Subject: [PATCH v4 01/10] media: v4l: ctrls: add a control for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-ov9282-flash-strobe-v4-1-72b299c1b7c9@linux.dev>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
In-Reply-To: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746604340; l=1793;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
 b=N9DzPtzRdXQB1V4N/WXrsdb69R9cQzPbFuYPlMyrCKHSAjKtCHVtxj9Nc6Ku1Ve9PR7I+Xfl4
 l366x+8CNm8D11O8iEB2lL4e3otJGna6b2I1GWPQfJjJMuR2Rb+aR9z
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



