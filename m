Return-Path: <linux-media+bounces-48501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F1CB1552
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 23:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEE7F312E14B
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 22:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DAA2F5A08;
	Tue,  9 Dec 2025 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TbBb3oWH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B052ECE9D;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320292; cv=none; b=QkkcL8s9VkXloJ0Vhs6NBcyWO1Q10OtLGLZeEQeeA4IvvglgdaCQ1F2hOSzlCre5koGJYMV6yQRyGTb8Y8cuyKLGrejKQk0XY3Acj6ZEeEOvyinJzR8Qgn6KlioFZFadSxBcELGZSqkfpPigPpeC8F5go4j95ipMuMo3vdgzJMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320292; c=relaxed/simple;
	bh=NcaeZW4e+lsXcDe5hqIbtTdEyfKMzNjpGnhp1vovOxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4w59v0+xMtXO4O0sZ0pv6rVP9YJWo5fB0en3vgx17u7hKgtX2hjYYY5eg9NJEqYhjU+oj/B02u1xO6kqEWeEyK5Kj9uFavIw8tad+nCrnPLMFOemP0DJpgm43yvk9bsO5aA2+kCVAG0+lyfkbkJvMBNMdGEDe0thiILofaKGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TbBb3oWH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF516C19424;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1765320291; bh=NcaeZW4e+lsXcDe5hqIbtTdEyfKMzNjpGnhp1vovOxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TbBb3oWHAhhsMpiTLOV6Rcs7jNZoYVLefwgb+zgjjTDm6iUk0s6wB0ty2G7EFxfEv
	 UWfyMlSEkvPDz9Hykeq/dNUJfJ3nInSf/GUqzsLZtP1uZDVmR3Ypb1/ND3GWDl687D
	 ZDJjGnHT/o+M3Tv4aRlTlKeq9+frz+bE7I3AvhqY=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDF7D3B982;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 09 Dec 2025 23:44:37 +0100
Subject: [PATCH v10 2/8] media: v4l: ctrls: add a control for enabling
 strobe output
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-ov9282-flash-strobe-v10-2-0117cab82e2d@linux.dev>
References: <20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev>
In-Reply-To: <20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.15-dev-a3fc8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765320290; l=1947;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=NcaeZW4e+lsXcDe5hqIbtTdEyfKMzNjpGnhp1vovOxM=;
 b=5rJ+2YO21XNdLRU2oLJ9WRbWJ6FJ0jiE2cSfJwKQEtRLv56slooLnQ1Mu6dBbcxvTDyHShU47
 i902FFZWDEeCwPggkkR1sFZkQBoSXeOoQ01G29CnP81hoIDgK+WqJ6w
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add a control V4L2_CID_FLASH_STROBE_OE to en- or disable the
strobe output of v4l2 devices (most likely sensors).

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 2 ++
 include/uapi/linux/v4l2-controls.h        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 4848423205ff7..765aeeec84fe5 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1136,6 +1136,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_FLASH_CHARGE:		return "Charge";
 	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
 	case V4L2_CID_FLASH_DURATION:		return "Strobe Duration";
+	case V4L2_CID_FLASH_STROBE_OE:		return "Strobe Output Enable";
 
 	/* JPEG encoder controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1282,6 +1283,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_FLASH_STROBE_STATUS:
 	case V4L2_CID_FLASH_CHARGE:
 	case V4L2_CID_FLASH_READY:
+	case V4L2_CID_FLASH_STROBE_OE:
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
 	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 9830833b48a52..32ba3b5fb1dd5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1187,6 +1187,7 @@ enum v4l2_flash_strobe_source {
 #define V4L2_CID_FLASH_CHARGE			(V4L2_CID_FLASH_CLASS_BASE + 11)
 #define V4L2_CID_FLASH_READY			(V4L2_CID_FLASH_CLASS_BASE + 12)
 #define V4L2_CID_FLASH_DURATION			(V4L2_CID_FLASH_CLASS_BASE + 13)
+#define V4L2_CID_FLASH_STROBE_OE		(V4L2_CID_FLASH_CLASS_BASE + 14)
 
 
 /* JPEG-class control IDs */

-- 
2.47.3



