Return-Path: <linux-media+bounces-26213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F1AA3849E
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 14:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF46016492C
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 13:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A7C21C9FF;
	Mon, 17 Feb 2025 13:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sLvYG8wM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCE821A953;
	Mon, 17 Feb 2025 13:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798883; cv=none; b=SPD2/uhYC32FovStLVq3Y5NyXWXPXsBzxsU/r2jMuLv5uFNWPh7OOD75MZcBPvJ5AwZwJkGmuhNsbDDE1+/XWbA8kkk/hGUDOVHHWtZp2jgVy42pK0yUPd+XFameSePvp57633btyb/Yx58mA6WSj7snm0S3b953+sckIdJuoYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798883; c=relaxed/simple;
	bh=iR0blI/6ktM2R9qE5MLCFVfaQwYvnAbZpJ+v0jJPZjM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KqLnM8P59C8rJkWqt8RUvkBC6YECHQ1wfDVsjfQzwLIKAdSRQl1qO9GRrKkDVsq/RiDqLgyW6RnnL56TTxhvSfREMmI4YGLS5K/EEiTyyHcaQLDJssO19/Kwdsi/VTe0Yq5NfybOOMPbokS8aBWcpnujNZ9k9XH5PVDpxl7DU54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sLvYG8wM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.80.185])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9418F22F;
	Mon, 17 Feb 2025 14:26:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739798793;
	bh=iR0blI/6ktM2R9qE5MLCFVfaQwYvnAbZpJ+v0jJPZjM=;
	h=From:Subject:Date:To:Cc:From;
	b=sLvYG8wM7IG73NshFinQ7icZI6RHkyjc2UujXhvzoufh5bSmPs5GvyiEHB+5z0H0r
	 4WfNEylhwYPgTZ5yqJm9Rl6uY9W5dgN+fw3pdkv2ZsC6NZdsdha7wYgBrcbEv7mbGX
	 vEqW+sHSwyJkKVI6T8ps26sjOGLZI6KjVnuYpzv8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v7 0/5] media: i2c: imx219: Fixes for blanking, pixel rate
 and binning
Date: Mon, 17 Feb 2025 18:57:30 +0530
Message-Id: <20250217-imx219_fixes-v7-0-83c3c63b737e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEI5s2cC/3XM3UoDMRCG4VspOTYymUyyWY+8DxHJr81BN5LIU
 il776YFaQnu4TvD91xYizXHxl4OF1bjmlsuS4/p6cD80S6fkefQmyEgCcCZ59MZxfyR8jk27pK
 1nqzSCMD65KvG26Mv3t57H3P7LvXnpq/iet2BVsGBO1LBS62Mo/iaQ7StLK7YGp59ObGrt+LdE
 CgGA7sxOdDGaoiWYMeQj4YaDNkNkpQ8OEXCmx2D7gaiHgzqRghopJEJdJp2DPVgSBgM1Y3ZEOl
 ghCYz7xj6z1CAQIOhu2EoJatAwjzhP8a2bb/I5pXhAwIAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3594;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=iR0blI/6ktM2R9qE5MLCFVfaQwYvnAbZpJ+v0jJPZjM=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnszlK9ciQ/QlYbxurQplnreypdJHml9c0jJlaL
 N+i8YMYTy6JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7M5SgAKCRBD3pH5JJpx
 RUKPD/9o5+H4pRhzq0EM7C0D6lMTxciHz7/5oLU+dy9kV/44blnhBwSIz0UmwIvp25kl8FarVRR
 1sbGL2REAlN2j4dnuk1YGhGFT36Ve6QfzSWrNE0Ak0BgNAAtD39q3e2oS9dn472oS6fCP/zjuhD
 g/afjd4bAjg8/4VCshauchn6Y/UpV/nE+vQ169vSZVoBJEacsXxILhCcYlgg2C9QTsg3Iszq2eM
 b+QBPMd0i/n+9EtmTVyKNj997dMQch/PxCMpi8afxsHCq/8kp7f7r2roIyCsX1YQzvLfR9OwCGs
 JkOIRbWYsKZzyl3a+bFgUQd9qOauyZ20yrd/WRG9WTiL2o2zt09b7+reRww07ulH8clavJxpbQ2
 iVbi1PoJlXhzb9oSi6AeZi/fwkKqRukQbJJA2+3rFAYYC6//oPo2Ut5toC68yCz6XUNK3k6lysr
 ECy9lRBa2OymYVSxynfwrStMe/eqkpQUgf9gQAhR9wNHu7upDS7igaR346TVV+PjU6dv1Q16olh
 KnN1xv/XM7MlA05YAgcj8BSNyScWDU6+HmCqwAGoPAJaPRbMwcsW18VFgiIfGgPRxiKlxdV2Acm
 ZiYJFecwZ6X7ptUUiBgK/rsnb0LzJMqU2X6rW1xGia/qjsxwmUcZ0Hrlxb5j5SvOMmHZ4g+nm9f
 dQrRIR+DEeLQMng==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series has a few fixes for improving h/v blanking, pixel rate
reporting and binning modes for the IMX219 sensor.

These patches are picked and modified (and squashed where applicable)
from the rpi-6.6.y vendor tree.

On top of those changes, this series also updates the minimum line
length to fix some issues seen when using analog binning with RAW10
format on higher resolutions (like 1640x1232).

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v7:
- PATCH 4/5: On Dave's suggestion only update minimum LLP for
  binned resolutions. Add a comment in code about the ADC limitation
  with Jacopo's R-By.
- PATCH 5/5: No functional change, but drop the get_format_bpp()
  function and modify the get_binning() function with Jacopo's
  suggestions
- Link to v6: https://lore.kernel.org/r/20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com

Changes in v6:
- PATCH 2/5: Rename REG_FRM_LENGTH to REG_FRM_LENGTH_A, and remove HTS
  from commit message
- PATCH 3/5: Rename REG_LINE_LENGTH to REG_LINE_LENGTH_A, and drop
  redundant write to the register from the table
- Rebase series on v6.14-rc1
- Link to v5: https://lore.kernel.org/r/20241230-imx219_fixes-v5-0-98446d816489@ideasonboard.com

Changes in v5:
- PATCH 2/5: Rename .vts_def to .fll_def
- PATCH 4/5: Don't change PLL multipliers, only update the minimum LLP
  size
- PATCH 5/5: Update binned mode comments: s/30fps/60fps
- Link to v4: https://lore.kernel.org/r/20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com

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
      media: i2c: imx219: Increase minimum LLP for binned modes
      media: i2c: imx219: Scale the pixel rate for analog binning

 drivers/media/i2c/imx219.c | 171 ++++++++++++++++++++++++++++-----------------
 1 file changed, 107 insertions(+), 64 deletions(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20241029-imx219_fixes-bfaac4a56200

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


