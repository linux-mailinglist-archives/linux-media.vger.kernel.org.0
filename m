Return-Path: <linux-media+bounces-22824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEDC9E8205
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 21:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E33E16622B
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 20:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB56191F79;
	Sat,  7 Dec 2024 20:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMKkkuat"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D214A0B9;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733604506; cv=none; b=oRiKDjiz9tgomkcS2sz0r/zd43TGk6hEARBKGbBvxNyMpA4pOqYCYhNi1aLh9hs5lu7fJNLlrBBzR+/Ml+ktsx0oqzm6wCxqILgzkGSk94c+WbQMFTbJCmxTYcfiSVLNt2e0dJEdv9IVX99INCPBpRILvrieS8yqFfopYurwGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733604506; c=relaxed/simple;
	bh=rWz9GxnchMLN6fSpu6IMZqkDL9a3pSZ+wb6rekAUHzY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AYmUgKz6dW0yc1+7z4gK4gLfkCB+Na5R78R0n88rYsQGMGkhCpCID5XgLLpjTsZNbwYLt+pHUhMZ0ILV7lXCMmRpqL5NKtQ8LOBjGislNT92OVfurElKVr/MGnb9hTz4Tgd4HZRU64xJ2EwiDbpgE+wTUm3TXZTEP2TMvNRRoLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMKkkuat; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EB12C4CECD;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733604506;
	bh=rWz9GxnchMLN6fSpu6IMZqkDL9a3pSZ+wb6rekAUHzY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VMKkkuatp//a6q58hLMpDx9SiOix3UeRZOXDnNJMNH7PebGPlhGbWnNixquF7Zw3B
	 ESnJnvvoXH4mau2SDzgxlSbh+XEhEWfn2R1skhDEf+vH6MDeBPcFcC9Op9prk+JnKJ
	 ZHa5uWIgjEesHKpJr2opf7Aw30A05QErekrGdU38ECDn+hwYPph3qq9ghKPxzZBdim
	 g/MH0wY+hw04BvejNLvb5qUeA5ecTHYamhUyLGiU56S+auhQKNOJxJcd48gjct9VQ0
	 02W88E5jW7aemKGfCpfh9SK1FALV9LtF+crMqmuvpTj1O3duQ+pL5ANt360P4OY8pE
	 1RMahSSE+VDkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03360E7717B;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v3 00/12] media: i2c: imx214: Miscellaneous cleanups and
 improvements
Date: Sat, 07 Dec 2024 21:47:49 +0100
Message-Id: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHW0VGcC/1WMwQ6CMBAFf4X0bE13W6T15H8YD1AW6UEgLTYo4
 d8tGEk8zsubmVkg7yiwczYzT9EF13cJ5CFjti27O3FXJ2YoUAkNmrvHhKC4lqgKrWxREbF0Hjw
 1btpC11vi1oWx96+tG2Fdvwkj8JeIwAW35mSr0mgjIb+UgxvfwbZHerI1EnEXQSDsIiaxqWqUZ
 EyugP7FZVk+/2K1HNcAAAA=
X-Change-ID: 20240818-imx214-8324784c7bee
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733604504; l=2879;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=rWz9GxnchMLN6fSpu6IMZqkDL9a3pSZ+wb6rekAUHzY=;
 b=bGLVRCS/O8ECvYhfAvnZFfe5jzV8wf+QLCRW2vAi6smx/TEFXdNQOdNs19XxOqCb7zvkXHOTV
 ie0Obio8ulgCPeubzMnCEaFp9sT4Rd81gzsi7EE6R+5Z7J8PXrVuG1o
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

This patch series is a collection of miscellaneous cleanups and
improvements to the imx214 driver.

The series converts the driver to the CCI helpers and adds controls
needed to make the driver work with libcamera.

The changes are inspired by the imx219 driver.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v3:
- Also keep previous link freq for backward compatibility
- Move link freq patch to the end of the series
- Remove return-early check from imx214_set_format()
- Remove unneeded struct imx214 function parameter
- Use correct ret value on number of data lanes error
- Revert changing order (imx214_parse_fwnode, devm_kzalloc)
- Fix typo
- Remove unused definition IMX214_EXPOSURE_MAX
- Don't set FPS to default
- Simplify exposure_def definition
- Set state and format only if control id is V4L2_CID_VBLANK
- Restore Ricardo's message to Sony
- Drop "media: i2c: imx214: Extract format and crop settings" patch
- Add A-b tag
- Link to v2: https://lore.kernel.org/r/20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu

Changes in v2:
- Add patch to fix link frequency
- Don't use and remove fmt and crop from struct imx214
- Squash patch 1/13 and 2/13
- Only check if #lanes == 4
- Add comment that enum_frame_interval() shouldn't be used by userspace
- Set V4L2_CID_VBLANK step size to 2 (according to datasheet Table 4-4)
- Increase IMX214_VBLANK_MIN to limit max frame rate of full resolution
  to the documented 30 fps
- As bpp is always 10, simplify setting IMX214_REG_CSI_DATA_FORMAT and
  IMX214_REG_OPPXCK_DIV
- Simplify imx214_get_format_code()
- Cluster hflip and vflip
- Remove kernel log note from 11/13, issue was fixed by a kernel update
- Add A-b tags
- Link to v1: https://lore.kernel.org/r/20240902-imx214-v1-0-c96cba989315@apitzsch.eu

---
André Apitzsch (12):
      media: i2c: imx214: Use subdev active state
      media: i2c: imx214: Simplify with dev_err_probe()
      media: i2c: imx214: Convert to CCI register access helpers
      media: i2c: imx214: Replace register addresses with macros
      media: i2c: imx214: Drop IMX214_REG_EXPOSURE from mode reg arrays
      media: i2c: imx214: Check number of lanes from device tree
      media: i2c: imx214: Add vblank and hblank controls
      media: i2c: imx214: Implement vflip/hflip controls
      media: i2c: imx214: Add analogue/digital gain control
      media: i2c: imx214: Verify chip ID
      media: i2c: imx214: Add test pattern control
      media: i2c: imx214: Fix link frequency

 drivers/media/i2c/Kconfig  |    1 +
 drivers/media/i2c/imx214.c | 1253 ++++++++++++++++++++++++++------------------
 2 files changed, 739 insertions(+), 515 deletions(-)
---
base-commit: 7c537db2474dd5b1acf4ee9bb665113127e2d013
change-id: 20240818-imx214-8324784c7bee

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



