Return-Path: <linux-media+bounces-10900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC65F8BD310
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 329861C211C8
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66EF156C5E;
	Mon,  6 May 2024 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sEPH9fiT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E521552F7;
	Mon,  6 May 2024 16:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014200; cv=none; b=SsO6J3t8tGZGtqICZKHDbs9uPnxUgY3DysBYQTkkRexjCuC6BXJD6MUJAV28gjjG7xfoSkkiV/q4zS3euGPK4TzXPUFQxmUQLZj2ei0fok80JDpospLhb7iYRSklTi46y7yo4/XRiSYzFjoqeMkfSpM6aslb4O+fnkMZI9YP0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014200; c=relaxed/simple;
	bh=IXDZhWAQSzG5f8MWFrZtlLPgVNOwwp+J+jB0UFgktaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TCnOw7YYTGyeqD6R91Kr1tG5b2HsYHzWqwTxEAKWrc1tj/98wt9PqgMzkkCOWqodAbaW70JfkWN/hw02ef6/wcw8GbYkJQgf9W+AEHSPaT2NcW/JaB3oriR0TTERfPu67fG1h6LEuybRsPt+4HczWiGsIgYg3hLyE8pnygwKrzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sEPH9fiT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCC6A908;
	Mon,  6 May 2024 18:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715014194;
	bh=IXDZhWAQSzG5f8MWFrZtlLPgVNOwwp+J+jB0UFgktaM=;
	h=From:To:Cc:Subject:Date:From;
	b=sEPH9fiTX4isNnHmf2RS40+ADn4cMrw2/uUX9MyhI+h+rFLGYlnoCK01YcAsPiSl5
	 mUcyUVk25orTzUQOBngKfklzLBwQMol/btaJKY1TRHIkO0SbiDVKdDOBECSJP/vZE4
	 x19qz7sbFTSqNnnGf57hraRICPL48x1e5Pp1nABY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 00/11] media: renesas: rcar-csi2: Use the subdev active state
Date: Mon,  6 May 2024 18:49:28 +0200
Message-ID: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2->v1:
  - Remove "media: adv748x-csi2: Initialize subdev format"
  - Add "media: adv748x-afe: Use 1X16 media bus code"
  - Tested with CVBS
  - address comments from Laurent and Niklas

As a follow-up to the recently sent
"media: renesas: rcar-csi2: Support multiple streams" series, this smaller
version collects some fixes and implement usage of the subdev active state
to simplify the R-Car CSI-2, ADV748x and MAX9286 drivers implementations.

Tested with GMSL on Eagle V3M
Tested with HDMI on Salvator-X
Tested with CVBS on Salvator-X

Jacopo Mondi (11):
  media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
  media: rcar-csi2: Disable runtime_pm in probe error
  media: rcar-csi2: Cleanup subdevice in remove()
  media: rcar-csi2: Use the subdev active state
  media: adv748x-csi2: Implement enum_mbus_codes
  media: adv748x-csi2: Validate the image format
  media: adv748x-csi2: Use the subdev active state
  media: adv748x-afe: Use 1X16 media bus code
  media: max9286: Fix enum_mbus_code
  media: max9286: Use the subdev active state
  media: max9286: Use frame interval from subdev state

 drivers/media/i2c/adv748x/adv748x-afe.c       |   4 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      | 140 ++++++++-----
 drivers/media/i2c/adv748x/adv748x.h           |   1 -
 drivers/media/i2c/max9286.c                   | 189 +++++++-----------
 drivers/media/platform/renesas/rcar-csi2.c    | 141 +++++++------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
 6 files changed, 256 insertions(+), 235 deletions(-)

--
2.44.0


