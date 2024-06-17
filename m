Return-Path: <linux-media+bounces-13458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B0690B5DA
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2B951C22EDA
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05166FDC;
	Mon, 17 Jun 2024 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RlwZSwaM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18ADDC5;
	Mon, 17 Jun 2024 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640721; cv=none; b=N2czCoo79D/K56xhp4sVdMw71HtyILaRvi0G5BNdLyVJC01VSwr3tinMLdt5NzPQH7K5aX6jroDhIbZdoOr9oIw1QQSiPpu1J5oDa0qnEQTuhJMANOPhQjkxF1Qzsa8IUqa//tsjv7YlJveEx9aYi824tOcwaCLG2n6USBoDCdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640721; c=relaxed/simple;
	bh=UT/svzMt6+KlZ5NxYAhWAeTFvGK8dlfz4ZI2CIesUM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QZgld9y5rPDnDcfw91NKXKyZvN4S2j1R1VB8rXvERxCpZVrPRf9iFnDtbdGA9QmZ5wqfIGkr/aCIrJOrDZu+p0vUkswtCf1py1NehzadMO66ktkFcwMZ818o5wcmgs3+rSDfd76brAo31tnUBvgKL77ZSTTYQu+oI4Vdujlq0q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RlwZSwaM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7504329A;
	Mon, 17 Jun 2024 18:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718640699;
	bh=UT/svzMt6+KlZ5NxYAhWAeTFvGK8dlfz4ZI2CIesUM8=;
	h=From:To:Cc:Subject:Date:From;
	b=RlwZSwaM50BbjmXIZ0gPZNFzYZ/TqeAUdoEEpwPnM04ptrHmPe3po5NoXWozLfH65
	 9PSEhC8MqHEENzhhgNvIMsXxYdBUqVAXejObsgX4fpFZgPyeNjb6Ycbki6bHiwB1b6
	 SYP9yHD48ZrArd0Vl8SPoXvlnxyiozPLcUo6Ov2c=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 00/11] media: renesas: rcar-csi2: Use the subdev active state
Date: Mon, 17 Jun 2024 18:11:23 +0200
Message-ID: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v3->v4:
- Add tags
- Re-sort patches as suggested by Niklas to avoid breaking bisection

v2->v3:
- rcar-csi2: Collect v2.2 of [4/11]
- adv748x: enum_mbus_code: reduce the number of formats to the ones supported
  by the HDMI and Analog front ends;
- adv748x: enum_mbus_code: enumerate all formats on sink pad; enumerate the
  active format on the source pad
- max9286: Apply the format to all pads to enforce all links to have the same
  format
- max9286: Remove max9286_set_fsync_period() from setup

v2->v1:
  - Remove "media: adv748x-csi2: Initialize subdev format"
  - Add "media: adv748x-afe: Use 1X16 media bus code"
  - Tested with CVBS
  - address comments from Laurent and Niklas

A branch is available at
https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git/
jmondi/renesas-drivers-2024-06-11-v6.10-rc3/multistream-subdev-active-state

As a follow-up to the recently sent
"media: renesas: rcar-csi2: Support multiple streams" series, this smaller
version collects some fixes and implement usage of the subdev active state
to simplify the R-Car CSI-2, ADV748x and MAX9286 drivers implementations.

Tested with GMSL on Eagle V3M
Tested with HDMI on Salvator-X
Tested with CVBS on Salvator-X
Boot tested on WhiteHawk V4H


Jacopo Mondi (11):
  media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
  media: rcar-csi2: Disable runtime_pm in probe error
  media: rcar-csi2: Cleanup subdevice in remove()
  media: rcar-csi2: Use the subdev active state
  media: adv748x-csi2: Implement enum_mbus_codes
  media: adv748x-afe: Use 1X16 media bus code
  media: adv748x-csi2: Validate the image format
  media: adv748x-csi2: Use the subdev active state
  media: max9286: Fix enum_mbus_code
  media: max9286: Use the subdev active state
  media: max9286: Use frame interval from subdev state

 drivers/media/i2c/adv748x/adv748x-afe.c       |   4 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      | 145 +++++++++-----
 drivers/media/i2c/adv748x/adv748x.h           |   1 -
 drivers/media/i2c/max9286.c                   | 181 +++++++-----------
 drivers/media/platform/renesas/rcar-csi2.c    | 155 +++++++++------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
 6 files changed, 271 insertions(+), 231 deletions(-)

--
2.45.2


