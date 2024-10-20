Return-Path: <linux-media+bounces-19929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF429A573C
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DFB4B225F5
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E894319923F;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZroOby9g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2030D36124;
	Sun, 20 Oct 2024 22:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729462452; cv=none; b=hA3vt1NGSQTr9Bg/7E2VxxKp80333naumfIvGMcBs1KkvYB+SmHZzhBvqL2B3JA1BivQmDWAECpzH4VOM1An8mOelYd28J5LJsE3nK0pNY7W7IYqBO6bJAi8yoZ/73oy8ciCKxMKqEU11+fb07lpcGkHr7cbWAQStleJTLPR8QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729462452; c=relaxed/simple;
	bh=Gl8hfYn2T/YTDKU4HaLJgS6y5RrOxB6rv+1XIPta0Pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dVNqLwEMRA2heugcf92foIfoRwSVGLB0E8kV5YiVqK+EHQajaZ3MM1sB4xfeNpjER2tvvkVnu5DhhvK4IE4gczNpL1OpOOJ1ogSEDT2+l02wuscXXgfNYcC/SWEzUHMjBMC2jYQW8cLrwkSjC0WA+Uz/QnXgCR1Pkq4TBOx3YZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZroOby9g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FB3BC4CEC6;
	Sun, 20 Oct 2024 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729462451;
	bh=Gl8hfYn2T/YTDKU4HaLJgS6y5RrOxB6rv+1XIPta0Pk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZroOby9gMAdK+cbLx+HBFCplfX3HfWHV6absLsIobwtL3Vicd/pHR+iSL756miNHr
	 82uAgLbEUlLGK3WpeM9jANS+gj7CcuTWE8jlX1oRazLRL7Y/WlX4xlsuy3HRdZE7W1
	 i6O+H7iAF8UhqsGXucWhtmSX2dQDd1hVXxKKa/8Dw5dkMpivIMXxZuY/5XRtOt2tcz
	 jk+7CngBPoopfMKiJv7n8D+4aKgVCBKvyyGw5YEZGlIMRr8+lyInbSA4u6iWHflVto
	 9rYCpMdvk+fLlb7u2ANGiCFtEmheYolXGjR8cMSWAt7g+ot2WQ3YAZh0QumGPKzhU1
	 eoaDqLpUDGXkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773D3D3C930;
	Sun, 20 Oct 2024 22:14:11 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v2 00/13] media: i2c: imx214: Miscellaneous cleanups and
 improvements
Date: Mon, 21 Oct 2024 00:13:20 +0200
Message-Id: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAICAFWcC/zXMQQ6CMBCF4auQWVvTDlVaV97DsCh1tLMQSIsNS
 ri7FePyf3n5FkgUmRKcqgUiZU489CVwV4EPrr+T4GtpQIlaGmUEP2ZUWpgadWO0bzoiKOcx0o3
 nDbq0pQOnaYivzc3qu/4IK/FPZCWk8PboO2eNrdXh7Eae3smHPT2hXdf1A48vnBeeAAAA
X-Change-ID: 20240818-imx214-8324784c7bee
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729462449; l=2197;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=Gl8hfYn2T/YTDKU4HaLJgS6y5RrOxB6rv+1XIPta0Pk=;
 b=Lh4y4Jql8cRhJZudqunmzS9M2VT+jXR8X11Va+js09+iFftk5tan5RJTyKBOBCLzcH1/nDj5k
 kCBUOckAF/mBdKlR/anlLsjPdAqjcCFpUA2VTtdMs7W+UW4r8SfYKfx
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
André Apitzsch (13):
      media: i2c: imx214: Fix link frequency
      media: i2c: imx214: Use subdev active state
      media: i2c: imx214: Simplify with dev_err_probe()
      media: i2c: imx214: Convert to CCI register access helpers
      media: i2c: imx214: Replace register addresses with macros
      media: i2c: imx214: Drop IMX214_REG_EXPOSURE from mode reg arrays
      media: i2c: imx214: Check number of lanes from device tree
      media: i2c: imx214: Add vblank and hblank controls
      media: i2c: imx214: Extract format and crop settings
      media: i2c: imx214: Implement vflip/hflip controls
      media: i2c: imx214: Add analogue/digital gain control
      media: i2c: imx214: Verify chip ID
      media: i2c: imx214: Add test pattern control

 drivers/media/i2c/Kconfig  |    1 +
 drivers/media/i2c/imx214.c | 1320 +++++++++++++++++++++++++++-----------------
 2 files changed, 800 insertions(+), 521 deletions(-)
---
base-commit: dc492038a748d54f9be2a31a629c44710989034c
change-id: 20240818-imx214-8324784c7bee

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



