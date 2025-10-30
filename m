Return-Path: <linux-media+bounces-45984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B93C1F08D
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 086A91895C81
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE96337BB4;
	Thu, 30 Oct 2025 08:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tw0+Yx1k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2EC32D7FB;
	Thu, 30 Oct 2025 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813792; cv=none; b=LoI77nJCTNnHjVJIhhkhnaLHLNHRGOhLrd6VcKvD9nDqUdGm+j1ZgBdq+zZbgw7KSJNnAzE4ngRAtJnAlzDsECcYU7CjfNtvZYT3OoWXE1c7MoT+jZ4Y2CVpFElaWo2fyaCUzQkLmNnYhyYj/oNK3QX0MvVNmIc1gB2Cc8GrNfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813792; c=relaxed/simple;
	bh=7DXv/+yb6DWCcHLnxNfR2X8aeHeEvWByVOvzkMI4SbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FBIpZlOPFcPbW2Ei5HHFLgD6hoAhaBAZByZdlHZIuy5s+QCEr9kicxIQPKoWd9SOSmUc71N2LP9gIUT31fU19TQ3BsEQ+roXjNiDiB3q5NRDRBP8HbFqEIMa6jXVT1jsY9JOd6fQpVgxW/5bqLl5alrwdywHYOb6TpT+QK33X1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tw0+Yx1k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4305EAE;
	Thu, 30 Oct 2025 09:41:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761813678;
	bh=7DXv/+yb6DWCcHLnxNfR2X8aeHeEvWByVOvzkMI4SbI=;
	h=From:To:Cc:Subject:Date:From;
	b=tw0+Yx1ktVV3xTPd5cSN4g2tvXjAeEVG814B21tZyiQWh8fAJ3g96UH1LvEFE/QM6
	 MAVo2Azzvgdlsf55yPmhDdY66+vx16xTlqMdRxOzvoOWDF/AjVbIluXxNvuGgfjFcM
	 Q/wPhYytI3qQKUgmuuEpFBwhf8M9i9peB7jCerjI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Jain <uajain@igalia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 0/8] media: imx335: Vflip, active state and binning support
Date: Thu, 30 Oct 2025 14:12:53 +0530
Message-ID: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250606-imx335_binning-d43dce921b0a
Content-Transfer-Encoding: 8bit

From: Umang Jain <uajain@igalia.com>

Hi,

This series adds support for 2x2 binning mode for Sony IMX335, along
with some improvements like using subdev active state, using
{enable,disable}_streams APIs and fixing the native pixel array width to
match the datasheet.

These changes are done on top of a couple of already reviewed patches
from Umang's series from last year that added support for vertical flip [1]

[1]: https://lore.kernel.org/all/20240830062639.72947-1-umang.jain@ideasonboard.com/

There is some WIP to make the resolution freely configurable:
 - [x] Add support for a cropped mode (1944x1100)
 - [ ] Fix exposure timing limits when cropping
 - [ ] Add support for a cropped binned mode
 - [ ] Make it freely configurable (depends on new control for binning)

Available in the branch here:
https://github.com/jailuthra/linux/commits/imx335_binning

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Simplify imx335_update_vertical_flip() as Sakari suggested
- Rebase on top of v6.18-rc1
- Link to v3: https://lore.kernel.org/r/20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com

Changes in v3:
- Drop extra commas in reglist
- Fix checkpatch check for wrong indentation in disable_streams
- Add Kieran's R-by tags
- Link to v2: https://lore.kernel.org/r/20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com

Changes in v2:
- Split runtime PM re-ordering from the patch introducing state support
- Use v4l2_rect instead of macros for sensor native and crop sizes
- Add new patch to introduce enable/disable streams API support with
  s_stream fallback helper
- Link to v1: https://lore.kernel.org/r/20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com

---
Jai Luthra (6):
      media: imx335: Update the native pixel array width
      media: imx335: Update HBLANK range on mode change
      media: imx335: Handle runtime PM in leaf functions
      media: imx355: Use subdev active state
      media: imx335: Support 2x2 binning
      media: imx335: Switch to {enable,disable}_streams

Umang Jain (2):
      media: imx335: Rectify name of mode struct
      media: imx335: Support vertical flip

 drivers/media/i2c/imx335.c | 509 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------
 1 file changed, 340 insertions(+), 169 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250606-imx335_binning-d43dce921b0a

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>

