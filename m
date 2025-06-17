Return-Path: <linux-media+bounces-35025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF96ADC354
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 09:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E25C174F9F
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 07:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E58C28F957;
	Tue, 17 Jun 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VZYe2P2c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365001C7017;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145503; cv=none; b=nabDwQNXcJpvvtTQxKw9ndRSK4SSaCcaOOJ9xUMwdTAypYUk7wSBh7aw51Fcy8BFO5pUz4/GOaE5WqLAxV1gC/1CyGVBHeUjFe8J2rPNjabnmGJuAlK8Dd7F8DCWYeqP7WqfP6W7S59FFmI+07KpYja/03a/Q74lC055k3e/8HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145503; c=relaxed/simple;
	bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fi+GWsUCsG5g7dpXq8wuOE6Vd0Y4sdnJYbQOy2oUJwznG3h5kjAtdy9u8MidAKlQH5Ttw4Jx/JXp2QpccYDr74/6S/SYEtr+B3C/KY5nE92h3nfeJg7vM+MNHBxQdlitBV+KbDj6Grl5bRvEGbz8/SFr7ZzMuPymoSI3Tcq0BYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VZYe2P2c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE962C4CEEE;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1750145502; bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZYe2P2c9nRVPwi4sQS7LrTIF+Z8CEa62BbeXRIHmLdXkkZM7rtnuTy8x/NKk3yyg
	 0yQKRsBOEDXdIYoXiNGkeJ66Ip8XHDmdk3jF0/YmXvy5IRLDeLz2jmolhM19W5Lj70
	 Spx2CU6BRV63DRHt6SMpBKwHNodpvN86eXoWRWGs=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2290C71155;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 17 Jun 2025 09:31:35 +0200
Subject: [PATCH v5 01/10] media: v4l: ctrls: add a control for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-ov9282-flash-strobe-v5-1-9762da74d065@linux.dev>
References: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
In-Reply-To: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750145501; l=1793;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=0nzpfTzsTCcWDqac7ZTk2BZgJrXNm8rZpSw6OMimBsU=;
 b=wpZpWeC5n9BpiJxIykqqP21yGU7SfQez/GtwiE9pwmPFtM8egKR3TrSk80LMBIBck+v27JtVL
 XY95kdiDh1zBpbKyK28QbruxN13uQhUw2Z2dhtbBtMTeb4HX2bjFYGB
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



