Return-Path: <linux-media+bounces-47518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B21DC7591A
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 18:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 759104E329C
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 17:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1960C36E561;
	Thu, 20 Nov 2025 17:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DmbZOjnF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF236C598;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658270; cv=none; b=W2LbgLOI0+wyk+L7LGkyQCxBlpc9MPJ5NY3JXIyUaD5VE9FXkANwTD4YnQGdTiq2yx/sgaod40f/PGl0DfKTqwVCoJNYEQtpFr9NPXVF0pj7dgyi94MhJLEgtCzLBuLB3YmtARxbPbr8/nDbztWrs2rRvGfXWOsdak7ZkIkkNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658270; c=relaxed/simple;
	bh=HEPG8i7Tu7I33PPWqSL35rVstPZw+8wnVPXzsGuFHqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jinNNy+yWLtBlhgcAh/iY05xQrZI+H2urYyr9qZo68Iq0aD/C1TnbqNx2rwLzN4l4RVwZCgalHM7gRvSvsrARXrYzZUzVK3fY+5xIJqxF4pIJABC8Jga7/ErLYZRs8XKey69O6ln1LkMaoRClltd5QIkfN/60dNhkqqG1mE6svM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DmbZOjnF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB88CC116D0;
	Thu, 20 Nov 2025 17:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1763658269; bh=HEPG8i7Tu7I33PPWqSL35rVstPZw+8wnVPXzsGuFHqQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DmbZOjnFJ2fDfXnabx2NZ3yVS8zCdY1/v2RhFCUyLf2sVPk+Wrf+nCO5mSP5Lx2kY
	 3uOLqmeSHuEfLcARtvk4ZCWERTH108dpi0SkEuHrn4VZPcNV6kArA59HdYxwPV/fWP
	 hGK7WCgcXkMRyq/Hv3qglJxhIc7ij7T041qDTQwk=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB39FCF9C6B;
	Thu, 20 Nov 2025 17:04:29 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Thu, 20 Nov 2025 18:04:21 +0100
Subject: [PATCH v9 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-ov9282-flash-strobe-v9-1-6c9e3a4301d7@linux.dev>
References: <20251120-ov9282-flash-strobe-v9-0-6c9e3a4301d7@linux.dev>
In-Reply-To: <20251120-ov9282-flash-strobe-v9-0-6c9e3a4301d7@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.15-dev-a3fc8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763658268; l=1816;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=HEPG8i7Tu7I33PPWqSL35rVstPZw+8wnVPXzsGuFHqQ=;
 b=vXyGWnjzJkMlgTI3oqAKHnjRXvlVzfTEJT9UrS31rdViQSzfhnfI64gPpfKZeKniqhDBfbHrk
 Dhkh3VxxH45AMtPqFEIpTAxhFmWLxzuiJqU9WRmLxjV9KvnNPJbItHL
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add a V4L2_CID_FLASH_DURATION control to set the duration of a
flash/strobe pulse. This controls the length of the flash/strobe pulse
output by device (typically a camera sensor) and connected to the flash
controller. This is different to the V4L2_CID_FLASH_TIMEOUT control,
which is implemented by the flash controller and defines a limit after
which the flash is "forcefully" turned off again.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
 include/uapi/linux/v4l2-controls.h        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ad41f65374e2..4848423205ff 100644
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
index 2d30107e047e..9830833b48a5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1186,6 +1186,7 @@ enum v4l2_flash_strobe_source {
 
 #define V4L2_CID_FLASH_CHARGE			(V4L2_CID_FLASH_CLASS_BASE + 11)
 #define V4L2_CID_FLASH_READY			(V4L2_CID_FLASH_CLASS_BASE + 12)
+#define V4L2_CID_FLASH_DURATION			(V4L2_CID_FLASH_CLASS_BASE + 13)
 
 
 /* JPEG-class control IDs */

-- 
2.47.3



