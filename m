Return-Path: <linux-media+bounces-26952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E49A44043
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 14:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B686D17C615
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F36526981A;
	Tue, 25 Feb 2025 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qVR6OBsU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C211268FE9;
	Tue, 25 Feb 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488959; cv=none; b=IPbKoE+fExo91+qz5jqXo31iJYry2IPn9EJz33I9PFIKgpOcP8CG7uVpJkNFlDymqZnI9XRRxmTYib6EBLknkl7oXbGqX3sCSzJnzxlGiM4RX1pV5pQXtHEtUfpB9eSr7QyVKMhBheH6cL2Y6/+HT4y1qA0eRuXXVTyyif3X0vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488959; c=relaxed/simple;
	bh=mJB3OeO7yxJLnmoNvPHcVDUdgqbN6kyIO0TWpaVm7Sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQ/NH94uuExvQnFkKwiz8Ay0exPNJVQHLkxShJjByOXDuRI5GtVNVFobCXwBxYkDQoTm7X6SdsSCpSafKkGfgYCj8WlPjRP5ypphp+AzVbci7G4ZAlFGYHsnBAXKxmtFg64kzk1xCtkZzg/iqV2TjfJIW+EjQi3GCLeKA7lLQoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qVR6OBsU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C738C4CEE6;
	Tue, 25 Feb 2025 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1740488959; bh=mJB3OeO7yxJLnmoNvPHcVDUdgqbN6kyIO0TWpaVm7Sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qVR6OBsU5wfkltOwG+5xj+yu8BAwyBz3Bdx3Uqe05vq27aJ1cK/DsxceY4mHVh6TS
	 Qh3+O1snPoO7K4uxUybfAND5IVZHOUwC/oTdM1uuhW9tmvyPFnDWjwesEKEhAEbNLT
	 m0CJ1IGZplajMfxPW9S6pfn6F2sPP/CAtbD91aqM=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED58FC021B2;
	Tue, 25 Feb 2025 13:09:18 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 25 Feb 2025 14:08:40 +0100
Subject: [PATCH 1/3] media: i2c: ov9282: use register definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-b4-ov9282-gain-v1-1-a24af2820dde@linux.dev>
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
In-Reply-To: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740488957; l=1452;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=mJB3OeO7yxJLnmoNvPHcVDUdgqbN6kyIO0TWpaVm7Sk=;
 b=KwJ/U+DQUyz7ELVGsgLc1ocM+cs3un14JD1rk6kPXywBfpHDvZJR25YOhrFecZc8jmbbA2RFs
 xfW0rTF4l9nDnottl1hg7hd9OZl/DVjcdwaQiX0IcWjlk+G0/6+WZHY
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

For better readability use already available register definitions in
hard-coded common and mode register structs.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 87e5d7ce5a47ee23a721ea39c0ab314c6fca6007..c926842257893c4da3319b847fab9908b5bdaec6 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -296,8 +296,8 @@ static const struct ov9282_reg mode_1280x800_regs[] = {
 	{0x3813, 0x08},
 	{0x3814, 0x11},
 	{0x3815, 0x11},
-	{0x3820, 0x40},
-	{0x3821, 0x00},
+	{OV9282_REG_TIMING_FORMAT_1, 0x40},
+	{OV9282_REG_TIMING_FORMAT_2, 0x00},
 	{0x4003, 0x40},
 	{0x4008, 0x04},
 	{0x4009, 0x0b},
@@ -327,8 +327,8 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x3813, 0x08},
 	{0x3814, 0x11},
 	{0x3815, 0x11},
-	{0x3820, 0x3c},
-	{0x3821, 0x84},
+	{OV9282_REG_TIMING_FORMAT_1, 0x3c},
+	{OV9282_REG_TIMING_FORMAT_2, 0x84},
 	{0x4003, 0x40},
 	{0x4008, 0x02},
 	{0x4009, 0x05},
@@ -358,8 +358,8 @@ static const struct ov9282_reg mode_640x400_regs[] = {
 	{0x3813, 0x04},
 	{0x3814, 0x31},
 	{0x3815, 0x22},
-	{0x3820, 0x60},
-	{0x3821, 0x01},
+	{OV9282_REG_TIMING_FORMAT_1, 0x60},
+	{OV9282_REG_TIMING_FORMAT_2, 0x01},
 	{0x4008, 0x02},
 	{0x4009, 0x05},
 	{0x400c, 0x00},

-- 
2.47.2



