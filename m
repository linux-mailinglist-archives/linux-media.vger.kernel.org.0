Return-Path: <linux-media+bounces-41449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 412D9B3E8A2
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F68316E5D2
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C340734DCC0;
	Mon,  1 Sep 2025 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FM2kQiPX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070773451AB;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756739147; cv=none; b=FtbDKLEpSg4ppnZmyk+zCRZ8irhOCpQsNE6984IfZdsjSb1U3Bo/6gslfoQiM/U0Y6XWHVQkUqTwRDQHMUt2c61SbtX7h3PQCacOQkC1vQSZ/VxzcL3jPJr7smkekJr6260ptR7ObdkEM+x2VOjjNG6buIjnAo8cTrD/ygNOe+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756739147; c=relaxed/simple;
	bh=5h7OmJD5PtNvkXILVzg5eDKV/6YNZ11G+Tij3lhOaeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSFtq5KdEh+dofkbCQ132ULSL3uJAotE7jZ3QRx+nWpNlQ6l4yDIxMDRamHCAREclxFuvNo8I4iHJR918qocKVUjNoR9Z6x2YXASJIpDaAXiwls/kah8SncbOIo1bW3TMaXjcT0TV8WmvxDU/1Th4DVwDgnU3/kNwigVlvR/Xh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FM2kQiPX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4C41C4CEF5;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1756739146; bh=5h7OmJD5PtNvkXILVzg5eDKV/6YNZ11G+Tij3lhOaeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FM2kQiPX3VS5j68xI5jLlfzp9Q6mEMgcey8zEJXY2bDeTlVc21BIiM5SD1h+b4zvd
	 sEJk+Q9GFcGqaTd4kHMbVFStoqMQ/fniqeGGIlMi3MYAp/IvmQX6lTAbB97z+Ajh12
	 yaBYlgmOP3Fu+5dwdd0Y4Gs8zWz/hqil2YkOqz3w=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3214CA1007;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 01 Sep 2025 17:05:08 +0200
Subject: [PATCH v7 03/10] media: v4l: ctrls: add a control for enabling hw
 strobe signal
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-ov9282-flash-strobe-v7-3-d58d5a694afc@linux.dev>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
In-Reply-To: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756739145; l=2084;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=5h7OmJD5PtNvkXILVzg5eDKV/6YNZ11G+Tij3lhOaeE=;
 b=rw1kcybSIDOWGaINS1Hbvsrq6PdolMoPzFOK/dCXzHwfo9SXC7aM+fd8E5if/ZRyJScI3Y1Nv
 SVFYVgPuLElCMDtqp+4YwgRdyG06w5TWSer1cZ+wITgzFYoLoi8W4Al
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add a control V4L2_CID_FLASH_HW_STROBE_SIGNAL to en- or disable the
strobe output of v4l2 devices (most likely sensors).

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 2 ++
 include/uapi/linux/v4l2-controls.h        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index f9ed7273a9f3eafe01c31b638e1c8d9fcf5424af..e13214ca362b9bdd2302118963008b04fcad8d4c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1136,6 +1136,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_FLASH_CHARGE:		return "Charge";
 	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
 	case V4L2_CID_FLASH_DURATION:		return "Strobe Duration";
+	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:	return "Hardware Strobe Signal";
 
 	/* JPEG encoder controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1282,6 +1283,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_FLASH_STROBE_STATUS:
 	case V4L2_CID_FLASH_CHARGE:
 	case V4L2_CID_FLASH_READY:
+	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
 	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a5b7c382d77118eb7966385c5b22d5a89bc2b272..2a09815939a6d9abbe2babb3429e2227970275e1 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1187,6 +1187,7 @@ enum v4l2_flash_strobe_source {
 #define V4L2_CID_FLASH_CHARGE			(V4L2_CID_FLASH_CLASS_BASE + 11)
 #define V4L2_CID_FLASH_READY			(V4L2_CID_FLASH_CLASS_BASE + 12)
 #define V4L2_CID_FLASH_DURATION			(V4L2_CID_FLASH_CLASS_BASE + 13)
+#define V4L2_CID_FLASH_HW_STROBE_SIGNAL		(V4L2_CID_FLASH_CLASS_BASE + 14)
 
 
 /* JPEG-class control IDs */

-- 
2.47.2



