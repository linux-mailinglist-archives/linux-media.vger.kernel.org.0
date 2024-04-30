Return-Path: <linux-media+bounces-10424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E78B6FC7
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B89F21F23E26
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A174612C472;
	Tue, 30 Apr 2024 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a5ZptZ0u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE3C12BF32;
	Tue, 30 Apr 2024 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473616; cv=none; b=Zti/Fl17kOm4ooiTc+g2LJOqjATdqRBXXCCfcAdnIuJdT7Ytc/2pUTPziABjNSB9t4rGTz9tOWYG63uYR6E83SlqHTZZZfVXOyGhMY74RKBjnhCRHzx81ryC5DcoUbdVsjbvmgkT2sOeS1bETtwWfqP4r4bjw7b7VdGVxoG7TMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473616; c=relaxed/simple;
	bh=/tjdMjeXTC6skYdAimQvb5/mQePmJSTxRmr9SH0xgpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RE0Mqefg5uovDTh2DdhDxJhNWnyVUirABwMUai5gpoduVyhZ0Tqj9JbsU8xVB/w13jlpc5xcnWx6Jx4Lmt0dFgv5+QmtT/wjsodW6bLuPoCrXxsqZqIDM7mcRCnVxiCeJbhlJagqz83o2zNQjv/pw8cNuqxdzjt7Fioecvb4JCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a5ZptZ0u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13CAD4AB;
	Tue, 30 Apr 2024 12:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473555;
	bh=/tjdMjeXTC6skYdAimQvb5/mQePmJSTxRmr9SH0xgpc=;
	h=From:To:Cc:Subject:Date:From;
	b=a5ZptZ0uvqgH6wAf61MvpY7RzRufv4pcUMzDMoFGH8qqY9GHQzWU4iUedY6dqKzAE
	 I7E2+BzA++ElTcEY8SM/sMdDT27Q3ZlW87K7LrDiN02M9OdesInxZRzruyQ6+RNaGl
	 EDVaj4I4P9PZe2IuIvaOFrM1QOe6898iiriGKqbM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/19] media: renesas: rcar-csi2: Support multiple streams
Date: Tue, 30 Apr 2024 12:39:36 +0200
Message-ID: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello this series implements multi-stream support for R-Car CSI-2 and the
two CSI-2 devices that are available on Renesas dev-boards which are mainline
supported (the ADV748x HDMI decoder and the MAX9286 GMSL deserializer).

The net gain in feature is:
- ADV748x: Select on which MIPI CSI-2 VC to send the stream on
- MAX9286: Paves the way for run-time selection of active links

Both features are realized by controlling the devices routing tables.
The max9286 routing support is not implemented, but these patches are needed
in order to maintain the current version compatible with R-Car CSI-2.

The R-Car CSI-2 driver needs to be updated in order to support multiplexed
transmitters, in particular:

- Use LINK_FREQ to compute the lane bandwidth
- Support subdev_active state
- Configure DT and VC handling by using the remote's frame_desc

A separate fix for VIN sits at the top of the series to re-enable YUYV capture
operations.

The series needs to activate streams in v4l2-subdev to work correctly:

--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -32,7 +32,7 @@
  * 'v4l2_subdev_enable_streams_api' to 1 below.
  */

-static bool v4l2_subdev_enable_streams_api;
+static bool v4l2_subdev_enable_streams_api = 1;
 #endif


Test scripts, based on vin-tests are available at:
https://git.uk.ideasonboard.com/jmondi/vin-tests

A note for Sakari: patch
"media: max9286: Implement support for LINK_FREQ"

Could actually use your new
"media: v4l: Support passing sub-device argument to v4l2_get_link_freq()"

I kept it as it is for this version waiting for your patch to get in.

A note for Niklas:
I think this series paves the way to actually moving the control of which
VC goes to which VIN using a routing table instead of using link enablement.

Currently the setup is as it follows: routing within R-Car CSI-2 is fixed, sink
stream 0/X goes to source stream X+1/0 and each source pad represents a VC.
Which VC gets sent to which VIN is controlled by link enablement.

A more natural way of handling this would be to make the routing table
within CSI-2 configurable and have media-links immutable between the CSI-2
source pad. A CSI-2 source pad would then represent a 'channel' between
CSI-2 and VIN and not the VC which is sent on it.

This setup would better represent the current implementation, with VIN's VCSEL
fixed channel routing and with the CSI-2 routing table controlling which VC gets
sent on which channel. What do you think ?

Jacopo Mondi (19):
  media: adv748x: Add support for active state
  media: adv748x: Add flags to adv748x_subdev_init()
  media: adv748x: Use V4L2 streams
  media: adv748x: Propagate format to opposite stream
  media: adv748x: Implement set_routing()
  media: adv748x: Use routes to configure VC
  media: adv748x: Implement .get_frame_desc()
  media: max9286: Add support for subdev active state
  media: max9286: Fix enum_mbus_code
  media: max9286: Use frame interval from subdev state
  media: max9286: Use V4L2 Streams
  media: max9286: Implement .get_frame_desc()
  media: max9286: Implement support for LINK_FREQ
  media: max9286: Implement .get_mbus_config()
  media: rcar-csi2: Add support for multiplexed streams
  media: rcar-csi2: Support multiplexed transmitters
  media: rcar-csi2: Store format in the subdev state
  media: rcar-csi2: Implement set_routing
  media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2

 drivers/media/i2c/adv748x/adv748x-afe.c       |   2 +-
 drivers/media/i2c/adv748x/adv748x-core.c      |  12 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      | 251 +++++++---
 drivers/media/i2c/adv748x/adv748x-hdmi.c      |   2 +-
 drivers/media/i2c/adv748x/adv748x.h           |   4 +-
 drivers/media/i2c/max9286.c                   | 457 ++++++++++++------
 drivers/media/platform/renesas/rcar-csi2.c    | 442 ++++++++++++-----
 .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
 8 files changed, 834 insertions(+), 352 deletions(-)

--
2.44.0


