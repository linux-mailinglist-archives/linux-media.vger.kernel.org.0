Return-Path: <linux-media+bounces-31317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D25AA0C87
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 15:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F6B41B66390
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 13:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833A62D29C9;
	Tue, 29 Apr 2025 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JbekdOJw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827822D029B;
	Tue, 29 Apr 2025 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931557; cv=none; b=QKSTVkyQvdPgLQS4pE4L08wJYZNDD8qUCK9rD1btLBrqSMyzqkrgwhsb8WVQAWjoatf7192r3yrJvpmSweecJ1VN+Gt9cWW+p6PY+csnJLzAwdi9QZX4Fp5KP4/pci87fs8wdV7ZtqVjr1vDC3bPkMSWDdMCrdrxgxQ95dZCfn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931557; c=relaxed/simple;
	bh=16N0ehkJWytFD5jx5wDbSTZhtNf5Qf6vx2SOhlkAC1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJEODbAoGqoS8SbZ6PL0zbvpUhV6AlkCGYy+Je5/VjIrom6HDwPsDxCgM/1xR54u46XCx/O+9Q+djcy+Ux0AqeTJIdFFTAiHRWAs+8U/fU0k/+cOIyaYWK7x3xhHfIMUKApR1Wl9Jc3fgrj7VaqXpuVldJklcExdV0NkpbLKkgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JbekdOJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80DD3C19422;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1745931556; bh=16N0ehkJWytFD5jx5wDbSTZhtNf5Qf6vx2SOhlkAC1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JbekdOJwB5KkfTAVZnMSOOO6KVy1H6HwF6VKcRVwVXOFunM+3RY6myhhlhg2hU/7F
	 JdW4B/3S0cZC2c6ghkfiAaysIBglATaik/oewo6ILaWiGne7QN818AixQhkUM9h/+j
	 BmkflqODYfw3m4/9Pajr0mRPMMWI+jE7VpODF8OQ=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7058EC3ABB2;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 29 Apr 2025 14:59:10 +0200
Subject: [PATCH v3 5/9] Documentation: uAPI: media: add
 V4L2_CID_FLASH_DURATION
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-ov9282-flash-strobe-v3-5-2105ce179952@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931554; l=1038;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=16N0ehkJWytFD5jx5wDbSTZhtNf5Qf6vx2SOhlkAC1Y=;
 b=wDEuqGzuAzAKafp77XME7C+1i7hnGJTO89QyQhr8UWvQwj2gMhQE+C5LSPSBLXfqY3CEcJ1b8
 ++BLABez+d7B93WWQ0NEdUvzpbCac5Zq0fkIRqX/GwSy7FYbxSW1P9d
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



