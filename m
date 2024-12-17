Return-Path: <linux-media+bounces-23651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2FA9F58F4
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABBA9188EB32
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347681FA270;
	Tue, 17 Dec 2024 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACJowqyV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E9214A0A3;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734471563; cv=none; b=fcrpGFRtqjY5Re0uXui9pxx2EKZcJHEepOQtBRgr1G8U+V+qDYHWFleELr1MXYS0YIAubadE1zymJnkWsnoplAIGAt+BD/RfW37ru39OfHijrqOljraUIQxKtF3Nbna9YDhBiKME+vm0oSLRd63ui/gYq+ogEpOO9EWwmTc3JMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734471563; c=relaxed/simple;
	bh=n1JZHGtXkl1/iBBt0OCNPeTKOztwlU7Xcfro9qYAbzs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=InQwEzoqddVgqeVZLFl1ItTsCmvKQaY4mJMGpVaBe69i76b99KawkvEMh0ouuaiVnMvd5rztEfNrGAhIEgWnel8B9N40E1pqf+CIdmT7J4YivMfllreHJoxcwJ1egSZtD21Ps0dKVjbnTqGEppkhpAamuPQzwgAphP6MJ8CEpLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACJowqyV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 140A0C4CEDE;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734471563;
	bh=n1JZHGtXkl1/iBBt0OCNPeTKOztwlU7Xcfro9qYAbzs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ACJowqyVsEc1bCyfpmCT+CRLvHhiEBm9gOPl4MRstXNX6r0ZDynpaM+LSRL/UYLGb
	 MVSR9yQJA5hdA6mpF12DqRYKgWhOddu3pZobLrRnCvxD2RkLC24Pq/Sr6R7ZHc8lbO
	 Rcx2CjyCbSL+hnrw7f4dyomZ074Jz4rSIy7XdLrH4qZjVw9b8MENW1vakbb9yIVE6M
	 rgOywiPrswUAHCvK0RlOQ7Z7M1zvOngnYwnNxS7QYTLnTpm9IxASqXeCCq0Fj5BJ8D
	 wHgDAUl0qa9a1rnk0nXYe11RFJ6V0Hs2feK325MGB5ulvHxJxMyPb9p2gW5/u4UKWo
	 AybSjpOngTcGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12E9E7717F;
	Tue, 17 Dec 2024 21:39:22 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v5 00/13] media: i2c: imx214: Miscellaneous cleanups and
 improvements
Date: Tue, 17 Dec 2024 22:39:12 +0100
Message-Id: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIDvYWcC/23NTQ7CIBCG4asY1mKYgbbgynsYF0CnloU/KdpUm
 95dWmM16vIjPO/0LFITKLL1omcNtSGG0zGNbLlgvrbHPfFQps1QoBIaNA+HDkFxLVEVWvnCEbH
 0+dxQFboptN2lXYd4OTW3qdvC+PpMGIGvRAtccG9y76zRRkK2sedwuUdfr+jKxkiLMwSBMENMs
 HIlSjImU0C/UL4himKGMkHrcmGrgsj8u6g+IOQzVAlq70oLuaic/7o4DMMDiNrgZkkBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734471561; l=3563;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=n1JZHGtXkl1/iBBt0OCNPeTKOztwlU7Xcfro9qYAbzs=;
 b=WlqSfx42gMMwaD3JHUg6joz0lESwS0Bz63CQj6ccuLiPk+7wKMUOBI792kP9/9C+vmlMb9e98
 TMQCocuUjEYCvY/ykEBzqkyCtjXjsd8Z5VUEqZV7P4VsZN4bgtfRmG0
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
Changes in v5:
- Remove cur_mode field
- Link to v4: https://lore.kernel.org/r/20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu

Changes in v4:
- Drop function name from dev error message
- Initialize *format to fix compile error
- Improve comment "Update {FPS -> blank} limit"
- Improve code formatting
- Warn once on usage of frame_interval functions
- Fix commit message
- Add patch to fix clock handling on probe error or remove
- Warn if number of DT provided link frequencies != 1
- Add A-b tags
- Link to v3: https://lore.kernel.org/r/20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu

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
André Apitzsch (13):
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
      media: i2c: imx214: Fix clock handling on probe error or remove
      media: i2c: imx214: Fix link frequency validation

 drivers/media/i2c/Kconfig  |    1 +
 drivers/media/i2c/imx214.c | 1265 ++++++++++++++++++++++++++------------------
 2 files changed, 752 insertions(+), 514 deletions(-)
---
base-commit: 62f608176a46b6a794725022101d0d7f42faedb9
change-id: 20240818-imx214-8324784c7bee

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



