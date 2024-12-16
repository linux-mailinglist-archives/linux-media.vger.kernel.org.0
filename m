Return-Path: <linux-media+bounces-23490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2C29F3C43
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CB26164364
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0373D1EE006;
	Mon, 16 Dec 2024 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiMO/hLF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441901DD54C;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734382892; cv=none; b=TxX7jXy/aOCmffT/TE9v6DLAIUa2E++NMFppi3/bkZQDFy7JVSIa58xX5o1E3FzQDuZHqaqgHwbrtgmzO67mwk4XU+oxE70sKsddEeQBPmy7VpuNXRC2oI9/f00uurxw2mkZk34qem2bIxzw6D+xWzt4HH2a1CcyzS7wiOqEPxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734382892; c=relaxed/simple;
	bh=6cmEGBmf36veit8RAD1wqzyDYYwOBtBNXEx1H15Ah0M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WqbjxJeBN+1mbPdiGyjyJAL6hzVd6iBQ0c1iAZzawnzZSJQR/xVmun0eu6xRrXI/H1vQJqqvnocvolUStxOICnNLyn5GFLAOOiGF6NoOdvEfR1pt3A0eiItCcgpgrlxUJUjr1mgC/pTP2xpQoa5zNAkyWg6786S+DWxLWAxbDbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiMO/hLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D14F9C4CED0;
	Mon, 16 Dec 2024 21:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734382891;
	bh=6cmEGBmf36veit8RAD1wqzyDYYwOBtBNXEx1H15Ah0M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kiMO/hLFV5ElXfAt1xVc/PzprqMk6X+IbXUwiT2YaUsy8u9NNAl4RjNWpvBSV7qkr
	 pk7EIaTjoPJjEETrzh1VNnM4hJmSqDvvh1ip8ZLgU9yrEZBcNz7OvRFPh7DYlG6DFj
	 1hhBgJr54q4oZchXrp/k1/oW+zUEWukJ/dr4Ufpp8wwSYN+5vW5iX6xBWQQsyBtTtH
	 xCjv8hXM5pwDZ/+ulYZfnIKTNIjOk5xY2aTF/lcKIEAd3WbZatkKRSh5tDyhUTar8H
	 r726pUK1GvegwBsv0hvBTMNW5E1qiPK5JnZNRjq57KOP0sxBD/oXjML9hlf7eY6M+p
	 4Me84+y0dlseA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE001E7717F;
	Mon, 16 Dec 2024 21:01:31 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v4 00/13] media: i2c: imx214: Miscellaneous cleanups and
 improvements
Date: Mon, 16 Dec 2024 22:00:46 +0100
Message-Id: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP6UYGcC/2XN0Q6CIBTG8VdpXEeDAwp01Xu0LgCPyUXqxJzlf
 PfQlm11+Z3x+zORiF3ASI67iXQ4hBiaOg253xFf2fqKNBRpE2AgmeaahtsIXFItQCotvXKIJD1
 uOyzDuIbOl7SrEPume6zdgS/Xd8Iw+CQGThn1JvfOGm0Ez062Df0z+uqAd7JEBtggZ8A3CAmWr
 gCBxmSS4z8UXwhMbVAkaF3ObKkQze+P8zy/ABnu8h0QAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734382889; l=3433;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=6cmEGBmf36veit8RAD1wqzyDYYwOBtBNXEx1H15Ah0M=;
 b=EHfC7AL8dJQADMDbAL4P/CKLIviut5r5NixmWIuMRzSFr0QF5xle8MOcbtWRbgGRlNhqxrhd6
 jaevR7sxKU1BAURvSXgndxBaI1vxq45lb2HDpA7I3QTj+28r3K+h+On
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
 drivers/media/i2c/imx214.c | 1267 ++++++++++++++++++++++++++------------------
 2 files changed, 753 insertions(+), 515 deletions(-)
---
base-commit: 62f608176a46b6a794725022101d0d7f42faedb9
change-id: 20240818-imx214-8324784c7bee

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



