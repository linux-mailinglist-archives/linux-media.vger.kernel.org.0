Return-Path: <linux-media+bounces-25612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D2A26C62
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 08:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC276165E9D
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 07:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64BC204C2B;
	Tue,  4 Feb 2025 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B8PSsMVW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCB2204688;
	Tue,  4 Feb 2025 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652713; cv=none; b=dgekfpKXmKOzoE/QJCxW7q3kz4P1HeiyAn5CixN7EtKXVPvyPHMhjc8wkLG6Tk7ivh+QO4bJBDmIlzl2yCna3ajcgLoIyO55E5Plolhb/llNo8AcAgq8Az6ofTVy+NiecLsd4dxq998mo8M05jr56i7Rz6U1YnSUxPZ29IVT+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652713; c=relaxed/simple;
	bh=eyf4G8RGbb2yJR5FL1OoGC5XBCoV1dlKxEVQ0UuHGtI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rq2nE3mt1OgmUmkvMN/veCalRO/vwnAzslbpQtONS3NQym1pksNujlXtmZORxnca7rqgfImclLRPazWaM5mgrp6iCeCcJ6slwzsJr80tM9DcwVFlPemSp0X+Gu4w4cmwjlQLF6Voi9NMuete6B1IKR2do1dULLuTc2lorUYCAtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B8PSsMVW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:8839:be31:a1f6:6475:ef19:2df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBBB5CDB;
	Tue,  4 Feb 2025 08:03:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738652637;
	bh=eyf4G8RGbb2yJR5FL1OoGC5XBCoV1dlKxEVQ0UuHGtI=;
	h=From:Subject:Date:To:Cc:From;
	b=B8PSsMVWUr2DHUrD+xPwjKbt5T9ivl+yzih797SzDlw5n62Nfi5jD5r1K4MCjlj6b
	 fjZ8NWoucoEsWR7Rgc/3+CNC/9oS1zQia0DvdcFOBsxzRJlniKGz8MCNP7vYSIDL2v
	 4KL3jZTexrc8y+GURIFmfJsZFF7IxjXBlmMR7TRQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v6 0/5] media: i2c: imx219: Fixes for blanking, pixel rate
 and binning
Date: Tue, 04 Feb 2025 12:34:35 +0530
Message-Id: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAO8oWcC/3XMTY4CIRCG4asY1mKKokB6VnOPiZnwqyxsDEw6G
 tN3H3Sj6djLtyrfc2ct1hwb+9rcWY1TbrmMPfR2w/zJjsfIc+jNEJAE4MDz+Ypi+E35Ght3yVp
 PVmkEYH1yqfH56IufQ+9Tbn+l3p76JB7XFWgSHLgjFbzUyjiK3zlE28roiq1h58uZPbwJX4ZAs
 TCwG3sH2lgN0RKsGPLdUAtDdoMkJQ9OkfBmxaCXgagXBnUjBDTSyAQ67VcM9WZIWBiqG4Mh0sE
 ITWb4YMzz/A/C9LfFvwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3184;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=eyf4G8RGbb2yJR5FL1OoGC5XBCoV1dlKxEVQ0UuHGtI=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnobwdOQ0QpglX71Y44HuY24USe3PfzFankAoPY
 qXARPerXiyJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ6G8HQAKCRBD3pH5JJpx
 RWIiD/483868xAtD5MTuhFnAnZLDdAo3QWHtxDASxKp2cS5JngOX+Bc5trjc1RgojGfjtNe+8Dj
 CIMKfZAm9DSD54BmZ0r/BnwgcI8gL7DNHeiC6VdY/ipjD2JQ9mwXAJAMOUP9Jaz6lksnF9Pz24K
 SNYFaxQWHJlzUd43tJNpQgUU0swIR3rBPf822hIZVgEmaRjN/HOjoQVTJSMJIZFj4lQ6nRdQsgv
 YLw7hyRiGLxQP0FvTCxOZ7BkjKS1jXthtaQiE1Phy5Cu9WhA/ZqhNNdVJiOkQj6FPqlDPDqj7mh
 IJuYOQFkdUyzfGLGKC5V/q4pue+eUBYK2pdiXrm6rqDfs4PT9MVi5qo7LxPt8JAMqAJthRL14Ti
 mXoSEGW66NsemO122CORnKfO/M2crBjxwX/C30Hx1/WxS5lWYDYuK/0hzTXU8fEyqBRkUr/EBBA
 NqADXsz21ALaxpFqXjKg9qPs24BFkBsLXJi7PhV9+UAVmM++0+NQQjTdz7gSSYiIh6xGSeZJwIX
 nEA1oau/Wb9fDYO3SlXp8FEoO31Z2ZlBtmOFeoIGVRmxDhBgaZTkVj/lz47OtPdmsREyYjzoc73
 m59f5H+SJTop8+mY1jsJkeMv4hqK86w0CKck1qKNczBEowTHyZBtbjOfJeLmkScQ4n9lVFZJBJ9
 udJeY/Fug6bWrwg==
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
      media: i2c: imx219: Increase minimum LLP to fix blocky artefacts
      media: i2c: imx219: Scale the pixel rate for analog binning

 drivers/media/i2c/imx219.c | 207 +++++++++++++++++++++++++++------------------
 1 file changed, 125 insertions(+), 82 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241029-imx219_fixes-bfaac4a56200

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


