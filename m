Return-Path: <linux-media+bounces-24094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E05D9FC97B
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 08:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDD0B1882929
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 07:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4286C1B87FB;
	Thu, 26 Dec 2024 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r5UpZV3f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5E2168DA;
	Thu, 26 Dec 2024 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735199437; cv=none; b=see/IgVj/TvYfcTBHPTns3MNZfbkgKf0Q46n545EVzCwSDbTdGqFRGmTjnHjdCntk5FJVyADqC/MzMY0jZ3EAfYg0kmhZ0yoWekLJdTnuPwuhV5wAPZ8JDeLS3QKJtZuUQy0y1UPI9Vmro5DcbQr/ld66ovh4mIh9otpSvQdyKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735199437; c=relaxed/simple;
	bh=DYIypMXZCPqxOKoApl2AUMexF7BNo54VtE3FdRMTjkw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NJ7xekkydBvjX8knP6ymSOynmRf2QyaRaCVrVmQVKOZ/FO90yOQndUMdkU1pOkefAet+9gtwRrIlfPk5YzpCkBPKHM/wTGpkR43BoD6zsCzI5REaa0M1TDV/IrF7/uiUOHJvwzhMibgmY73ifWkkerPyYOc3+dWt0RYtH1Bl2/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r5UpZV3f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:416f:6c:4037:639a:e90f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E11E463F;
	Thu, 26 Dec 2024 08:49:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735199389;
	bh=DYIypMXZCPqxOKoApl2AUMexF7BNo54VtE3FdRMTjkw=;
	h=From:Subject:Date:To:Cc:From;
	b=r5UpZV3fr5V62PcLHrsTaaqApeY48TweWOe+IG6gCCy8CTmu9c9iLJ4lfMczlFmnr
	 aDGswHeyd7R5LTxG8oRrqZvmCDEb5udibqOi2uPsLjmmUoRjLaT2dIOFhHuaSWvQDD
	 syGVw5fIfXZgXvT7Fl18qM4woBWdqGPCFzwx0Hok=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 0/5] media: i2c: imx219: Fixes for blanking and pixel
 rate
Date: Thu, 26 Dec 2024 13:19:32 +0530
Message-Id: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIwKbWcC/3XMQQ6CMBCF4auQrq2ZlimCK+9hjGnLIF1ATWsIh
 nB3CxsNkeU/k/dNLFJwFNk5m1igwUXn+xR4yJhtdf8g7urUTIJEAbLirhulqO6NGyly02htUat
 CArA0eQZaH2lxvaVuXXz58F71QSzXHWgQHLhBVdu8UKVBuriadPS98TrUR+s7tniD/BpCio0hk
 3EyUJS6ANIIO0b+a6iNkScDc2wsGIXCln+MeZ4/KnJHXjcBAAA=
X-Change-ID: 20241029-imx219_fixes-bfaac4a56200
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=DYIypMXZCPqxOKoApl2AUMexF7BNo54VtE3FdRMTjkw=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnbQrC+Ekw7+zb7hi8rAdnIj+3cbczV9VSZOr5c
 OvJFumABnaJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ20KwgAKCRBD3pH5JJpx
 RWOWEADFAvzGEmuQ9KxKkA3vitjI9ZRnJUbSn0HEdTOKg/vZm2NlnxK2RhItlxGiLJqfKb7nGF2
 9o3utq9DIhKIy/v6SOoYqzVi0hy2N44ZtZYprtxtBHBaB9ikKA4cFBJxf1Hi80Mwu5QlyFLa2M8
 FolxrJzZRzWzAT+U7CP+DjYUlPhwf4IcVxCviel6cuLc1F1s2HPSR1v9vU9VpwO+VWSVfGiwNJR
 StTNSo4h/d0rwZsuP56c3C9LaUDjFqcHxPRjDrHaDpII50n4RpdNqXzkSVnQ2isN1SSzRBf+A4/
 JomN6SMGjGBc2OB3JL2WDUQs9NKPrXx3Szs+wxU/49RsL7iGrqjmVJUN+yUVK3NCk4nihaWNHxE
 +Q7B1eW/a/D9b4+bamS8hzcBDaY5iYMOhCaJV5l4+I2jCdAeO/wZbf0DOISGTHn7Z6CUPS7XCnG
 6NyWLsqq04okTFh1fXHxO5NrfdEAkTnZz+L6NvS/3GrPh2WazXK5kpVqWKLglyundszliULtsv9
 GJk2UKVlDx27r2TMLwySK4rOJiTvfane3IWO5DCRPDM/O+KeaT84P4z5PpBuf9hBGnkuQ89QUj7
 aYrkD7voDcDpxgoYL5C56BlC5mEXADgtaWbqOr/YBTXIdgijae56gtBoz2u7QSNtDpkNnTYhbaJ
 FigiSM/d4OaLq0A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series has a few fixes for improving h/v blanking and pixel rate
reporting for the IMX219 sensor.

These patches are picked and modified (and squashed where applicable)
from the rpi-6.6.y vendor tree.

On top of those changes, this series also updates the PLL multipliers
and minimum line length to fix some issues seen when using analog
binning with RAW10 format on higher resolutions (like 1640x1232).

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Add PATCH 2/5 to rename VTS to FRM_LENGTH
- PATCH 3/5:
    - Match macro names to datasheet (LINE_LENGTH instead of HTS/PPL)
    - Improve comments in init_controls()
    - Use prev_line_len instead of prev_hts
- Add PATCH 4/5 to update PLL settings that fix artefacts seen when
  using analog binning with RAW10 mode
- PATCH 5/5:
    - Use special "analog" binning for all resolutions and bitdepths,
      simplifying the binning logic
    - Don't store bin_h/bin_v in imx219 state, instead compute it
      everytime it is needed using the crop and format.
- Link to v3: https://lore.kernel.org/r/20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com

Changes in v3:
- PATCH 3/3: Calculate binning mode to use instead of hardcoding
  per-resolution
- Link to v2: https://lore.kernel.org/r/20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com

Changes in v2:
- PATCH 1/3: Add R-By from Jacopo, Dave
- PATCH 2/3:
    - Keep IMX219_PPL_MIN macro value in hex, matching the datasheet
    - Fix prev_hts calculation, by moving it before updating pad format
- PATCH 3/3:
    - Store binning register values in enum binning_mode directly
    - Remove unnecessary pixel_rate variable in imx219_init_controls()
- Link to v1: https://lore.kernel.org/r/20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com

---
Dave Stevenson (1):
      media: i2c: imx219: make HBLANK r/w to allow longer exposures

David Plowman (1):
      media: i2c: imx219: Correct the minimum vblanking value

Jai Luthra (3):
      media: i2c: imx219: Rename VTS to FRM_LENGTH
      media: i2c: imx219: Update PLL multipliers
      media: i2c: imx219: Scale the pixel rate for analog binning

 drivers/media/i2c/imx219.c | 196 +++++++++++++++++++++++++++------------------
 1 file changed, 120 insertions(+), 76 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241029-imx219_fixes-bfaac4a56200

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


