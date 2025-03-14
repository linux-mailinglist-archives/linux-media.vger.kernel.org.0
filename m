Return-Path: <linux-media+bounces-28187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE6CA60C25
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C50D17F7F9
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E1F1DFD83;
	Fri, 14 Mar 2025 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ExnRBqEl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2111D63D3;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942205; cv=none; b=F+cLq3K2PfHH4OlAzbQ5Iwl+JxVbd4TiLlwSv6uuYWv5ug0Si3U/pf7WKcRJC6bU1gipYXNEe5csq+TSYc83X6Vp2BCty9qcAMCi+RQ1OvehkRIAcS8IEEjnSi36LZq4buhuvIiZ0hLhYxB2Va7pKnGYNey1S6p5lm6T43XT78U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942205; c=relaxed/simple;
	bh=16N0ehkJWytFD5jx5wDbSTZhtNf5Qf6vx2SOhlkAC1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iq6z8vmCUDrYEFAq1mz3HI+VTkEYN+6nZ05NUguG0j4wFZELr8LLRBTZLtZLRAn7yUCbeo/FujWro+KvWSSHfcldyGo1DHoOnWkzDusG8OMPus9vNz2ALY0rY2mZsKfK6UaHLGKl5RzvO655VdZKa/FKrcn8Qh/EVOFsoDlbhx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ExnRBqEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5072AC4CEF1;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1741942205; bh=16N0ehkJWytFD5jx5wDbSTZhtNf5Qf6vx2SOhlkAC1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ExnRBqElfp7Q+Hz/hU4B2hH52eYctSP6RRNBeLiih82Xm5AL9MkickCcMwuUQyjua
	 7P8ONumkOJkRPz490Roc99dl+4CkauaxkqhGpLYaSP+Dub2ZOzW8zYjYpjM0LMCF22
	 l7e6RfaBDrqIz0FC61Ac3CFvVC70PILD+Qi08Lh0=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46290C35FF6;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Fri, 14 Mar 2025 09:49:58 +0100
Subject: [PATCH v2 4/8] Documentation: uAPI: media: add
 V4L2_CID_FLASH_DURATION
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250314-ov9282-flash-strobe-v2-4-14d7a281342d@linux.dev>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
In-Reply-To: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741942203; l=1038;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=16N0ehkJWytFD5jx5wDbSTZhtNf5Qf6vx2SOhlkAC1Y=;
 b=rYZXVUqgHQMZYjS6f4BgCjAXopqcphD3BKyHdNDVfTBxmt1eilUnuk68mmJqtbtSEw326OBtC
 6pNM0zOgllUDI0eHayqXHkPaZwIngG4oKfxNEHlDnog2306MLiKNX9B
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add the new strobe_duration control to v4l uAPI documentation.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
index d22c5efb806a183a3ad67ec3e6550b002a51659a..03a58ef94be7c870f55d5a9bb09503995dbfb402 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
@@ -186,3 +186,8 @@ Flash Control IDs
     charged before strobing. LED flashes often require a cooldown period
     after strobe during which another strobe will not be possible. This
     is a read-only control.
+
+``V4L2_CID_FLASH_DURATION (integer)``
+    Duration the flash should be on when the flash LED is in flash mode
+    (V4L2_FLASH_LED_MODE_FLASH). The unit should be microseconds (µs)
+    if possible.

-- 
2.47.2



