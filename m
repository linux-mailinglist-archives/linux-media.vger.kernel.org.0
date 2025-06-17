Return-Path: <linux-media+bounces-35027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 448DCADC359
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 09:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7B92188CEC9
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 07:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC7028FA87;
	Tue, 17 Jun 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W5Tk7Xrx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D011E22FC;
	Tue, 17 Jun 2025 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145503; cv=none; b=n13qEHlmOGVGQmoRO5IcmUmQOWFP6QHhQIDRvjnXtEYdb+6Oz/Fns+Rw2SIOMg8dpOHp2tETJWwBABtEbhqPtPjTQzeEVDvqZq4Wx3E4t3ekESkAra48mZtO0jGsYfFCZFpff5Cl0NNa78WF5PQUcxohYtN+fDl7Lz3fawQ35Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145503; c=relaxed/simple;
	bh=16N0ehkJWytFD5jx5wDbSTZhtNf5Qf6vx2SOhlkAC1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uq4uQWXOrlsDAXWlVwcXbw96vo/J0sLisIG9GfBQz102DKAOZc6LuzSzyqW82nrvtlRoRI/q8qKVls6hWwUvcXQuZzr1hkeQU9HxQUNRjC0CrCqiJXUSR2duIZRK8TMxf1MI7/s+cT6nL9UtJFQ3KrT9NETOqdqQIVDsSy1VHlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W5Tk7Xrx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E25E1C4CEF7;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1750145502; bh=16N0ehkJWytFD5jx5wDbSTZhtNf5Qf6vx2SOhlkAC1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W5Tk7XrxMVaiCjlLaD1ZsDEg4V2ER7IWbKshfxw58qGO6EVp4dPdbZf5ZyVrgyae9
	 dA1BBOWSVHUe0kELvGOZyL0RcoHolq84w/wqMLLcRXpMcqo208MLflX48XDDYmmGqS
	 OjATOlbLd0U/C94stJk9iHjzhUycyGwwgWULh5kU=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D215FC7115D;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 17 Jun 2025 09:31:38 +0200
Subject: [PATCH v5 04/10] Documentation: uAPI: media: add
 V4L2_CID_FLASH_DURATION
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250617-ov9282-flash-strobe-v5-4-9762da74d065@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750145501; l=1038;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=16N0ehkJWytFD5jx5wDbSTZhtNf5Qf6vx2SOhlkAC1Y=;
 b=DVSTCYqNJufAJ3eLL86OJ8J58+xjr+B8yJkFVS4dnrxT53dv3Po4+gGFv81Z2jtJs1PWzSllW
 aOcTeZmAgFCAt8ZqtbtsOFUemwNxb+Wi1pxyh4nONJ4MIdO/ea56VsE
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



