Return-Path: <linux-media+bounces-24149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA79FE2D4
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 07:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 154173A1CDB
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 06:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270D219C553;
	Mon, 30 Dec 2024 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ph7NcVKw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634A19882F;
	Mon, 30 Dec 2024 06:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735539107; cv=none; b=B7X/Kx8A/UaRsQ4DYfFyIElys+NQojdvT4+6uQINn9fjuZWjyiWSEwGx3qVTuWWD6pZ5B2oxCPFb4clHgWW97tZntKHxOS3rV+ZiOmg5ZwMZcAjPwnRfsDWUubQ1Tm2/WkBVhlHPLZo3VfGpUA1jnbBilLvFGNQstX7HWDwD9s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735539107; c=relaxed/simple;
	bh=VIo/Z2HEEYABCa9DfCFTI+9hRGs6nnLhPzWGdCjalzs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r8M2oU1nUBSQhRTM+ju+3lAyKcucTTu2fJKARjSpVNuty6IZIbEJMhTrHHeDPlfUqutJEqBT5S/4SQ/FFhSWibldbIahk6MV0CMpxCfJ1c9/q87m6+55XU0zewyB4dkLxV3mFdUNVU/rbsNt2ThE4aeQ+nZ03r0XVXlhhhqFA0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ph7NcVKw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FF123DC;
	Mon, 30 Dec 2024 07:10:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735539051;
	bh=VIo/Z2HEEYABCa9DfCFTI+9hRGs6nnLhPzWGdCjalzs=;
	h=From:Subject:Date:To:Cc:From;
	b=Ph7NcVKwQV2wLfRRDn0OkRE8SSobpoGQbrDLsYpSezhx2ynu3f+NkUs+kQLIki9cW
	 UQNy5Nzc4M9FP9oalaBduxuIEBlUW2m+MQh6GZFfhqtN6ZPPxL2YCAM5f1Nte26Gru
	 QxAdWfM0Jba9jj2CxmVbhxDAJCA4wdt3qdOd+tfg=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v5 0/5] media: i2c: imx219: Fixes for blanking, pixel rate
 and binning
Date: Mon, 30 Dec 2024 11:41:17 +0530
Message-Id: <20241230-imx219_fixes-v5-0-98446d816489@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIU5cmcC/3XMTW4DIQyG4atErEtljCGkq94jqip+TMMiQwXVK
 FE0dy/JJtWos3xtfc9NdG6Fu3jb3UTjufRSpxHmZSfiyU9fLEsaLRCQFOBBlvMF1eEzlwt3GbL
 3kbyxCCDG5Lvx4zEWx4/Rp9J/ars+9FndrxvQrCTIQCZFbY0LxO8lse91CtW39BrrWdy9GZ+GQ
 rUycBj7ANZ5C+wJNgz91zArQw+DNOUIwZCKbsOgp4FoVwYNIyV02ukMNu//MZZl+QUAy4peewE
 AAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2825;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=VIo/Z2HEEYABCa9DfCFTI+9hRGs6nnLhPzWGdCjalzs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBncjmKb7V/avEwD3TBwz2hfSUDFRQAFs6Oj6Gx1
 7jNFy89f9KJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ3I5igAKCRBD3pH5JJpx
 RYiSD/4ynbIZi/ZU+dQlsZqmX3WvzbpR1L/EgrdRPpENjzSgnJU7+A4dXWdTZQq8SHO3HR+TpKs
 7Gw5c5S5ml/+1oqwNwMXtWzEuJjbhXWeL9O0k9D+t7aRLpoucY2fqgjusy3SyGBiT9VU49PeVrK
 5kr9a+ZEL30RZj0tERLLOTu1ddixbpu6NChpk11eWBrM//2J0uEuB1uMhYKtPKD3sV7SFUXvtja
 6S0zgFIOXKVyiUtThZc9L51Og9fGm2KaSLj/91MyN+QTpF+W21HWsTEhz1BCjiiGO6N8c2UyG6T
 IXu3LfOQCM4Qmq7a41uM9zNi2T9CrCrZY7I6FD/vX3mNolqgtrMyJPpmWr/FdKCxG0Iict+FgJz
 SgdymaSNsD6cX62RZxh+AbZJqySDrvIPPZnTaIs5SzZY+vCuUXAQxSKpASEAlOh7okKMkUGoWp8
 2hZk1bcjkapPVjk9dO1T1M5s2xrMZj+yP+/ZmvRpaXWgyUJ4k2JkZJASA3udOQPBzDsv8e8Anmp
 Ub6eVhrnqgeX+VrmTFtiahRvXGdLHDx9cyqEh8vrq18rfDDKfpAY3a7s6/nUq4wTsSvMtUNORd+
 oG61/qw9So8fwrFzrokPhvpJTivh2exk0Io7/2hPd4AJQOahkn0weounkWClrsQPm3AeySErBEU
 1fdIOTrPNRDkzRg==
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
      media: i2c: imx219: Increase minimum LLP to fix blocky artefacts
      media: i2c: imx219: Scale the pixel rate for analog binning

 drivers/media/i2c/imx219.c | 208 +++++++++++++++++++++++++++------------------
 1 file changed, 126 insertions(+), 82 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241029-imx219_fixes-bfaac4a56200

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


