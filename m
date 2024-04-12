Return-Path: <linux-media+bounces-9174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C88A2E42
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 14:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9E61B22553
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 12:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC0C56B7A;
	Fri, 12 Apr 2024 12:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qFfTFFqZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCF856B68;
	Fri, 12 Apr 2024 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924933; cv=none; b=eMUdr0mZZ3LrfonOF4KGY3KQCxVtQDAsg1X8fbUidCGe81emBjz7M9heV9Ajw2GIImlkfbAOR9rWmVmllHVJyrWSjUDJunuSaU4YdUGt9OPkklOLbLjfoR2dIKxxP3gFbacTonY2ejkBGybiAVHXrBBpxqOPZeEnBIqdc/uOq3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924933; c=relaxed/simple;
	bh=QHAA42jWsT5+mycQxxxM3hgROwXPxTDhSsQcKRn9cr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXPiGaVg1ogviZpLZ4WMJ+zXMsJAA3ngsyiD/ZAGJ2vwfRGxG4J9wbZOf1M/it3gAiGaRx94yW6Xie7sVIdVqmhMRVpAcZ9kvIFt9jOJjRAr3oz3Idz/9tIY+Xh7ziVHCuRgsHKtZfCYkY5wa/kj4LMOfAhDvBNR47KlBQXz890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qFfTFFqZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAB918E1;
	Fri, 12 Apr 2024 14:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712924885;
	bh=QHAA42jWsT5+mycQxxxM3hgROwXPxTDhSsQcKRn9cr0=;
	h=From:To:Cc:Subject:Date:From;
	b=qFfTFFqZdeI+dh44smJKkHOwcZIAW+N2VB/CuVX3gkLDZaUW1vR248CLTL4PL0u23
	 pTvOUEkeMxShKhSdvLtUcFQK8XPBcOrWuI3AeprkIlziIH/LFYSgyiioYjFItTII6S
	 fUMIxKoy3Jg2xYvPRry0UGecjBqXZjs38iFY1Hek=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v5 0/6] media: imx335: 2/4 lane ops and improvements
Date: Fri, 12 Apr 2024 17:58:36 +0530
Message-ID: <20240412122842.193713-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another batch of improvements of the imx335 driver.

Patch 1/6 adds support for 2 or 4 lane operation modes.

Patch 2/6 call the V4L2 fwnode device parser to handle controls that are
standardised by the framework.

Patch 3/6 introduces the use of CCI for registers access.

Patch 4/6 uses decimal values for sizes registers (instead of
hexadecimal). This improves overall readability

Patch 5/6 fixes the height value discrepency. Accessible height is 1944,
as per the data sheet

Patch 6/6 fixes the max analogue gain value.

Changes in v5:
- Simplify error handling in 2/6. Check for ctrl_hdlr->error
- Space fix around { } in 3/6. Drop /* undocumented * as well

Changes in v4:
- Do not change from window cropping mode in patch 4/6.
  In v3, the sensor was changed to all pixel scan mode to
  achieve height=1944, but it can be achieved in window
  cropping mode as well, by fixing the mode registers

changes in v3:
- fix patch 2/6 where we need to free ctrl handler
  on error path.

changes in v2:
- New patch 4/6
- Drop calculating the pixel clock from link freq.
- CCI register address sort (incremental)
- Fix cci_write for REG_HOLD handling and add a comment.
- Remove  unused macros as part of 3/6

Kieran Bingham (2):
  media: imx335: Support 2 or 4 lane operation modes
  media: imx335: Parse fwnode properties

Umang Jain (4):
  media: imx335: Use V4L2 CCI for accessing sensor registers
  media: imx335: Use integer values for size registers
  media: imx335: Fix active area height discrepency
  media: imx335: Limit analogue gain value

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx335.c | 634 ++++++++++++++++++-------------------
 2 files changed, 301 insertions(+), 334 deletions(-)

-- 
2.43.0


