Return-Path: <linux-media+bounces-10690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEE68BB04E
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 17:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2C8B1F2132D
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 15:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFE0155342;
	Fri,  3 May 2024 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WKuGf5YC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05016154C1D;
	Fri,  3 May 2024 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714751510; cv=none; b=j/scJF+zMUPDJ7jK/Z7s/lKdcmGeC9PIF4UnOEm0rts/UJVEkjTGHxjX4fmao4KnlcaWj+1fC9+hNVfrg+Oj/00dcn3B8RPxl+q/1wcwmBK6vqPYMhN3+AzByw7bJUbKfijX6z0WGC9/QmgJZ601BqlaoWTEsSC4hQoS3G8L5Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714751510; c=relaxed/simple;
	bh=IowQSQOGvTeSEKWL36pmZcYpbelb1fxaoyIK7e/pjlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p7YCSNL+pmGMGTRwpu2c64Bsb5GksZCAYSgR/idHB8iEYrFidA6FbFV5kiPvkkSnBLWLncKvRlJS11uU2Ljms8j9AA409IwRGjr8SdCExUzK1qcKH/kX1L5IYbavg5J1H3G5OH2CXX3sXyhcBBI1zO9lUeCkaEKoc3Z+rDTt5Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WKuGf5YC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CB5DE45;
	Fri,  3 May 2024 17:50:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714751448;
	bh=IowQSQOGvTeSEKWL36pmZcYpbelb1fxaoyIK7e/pjlU=;
	h=From:To:Cc:Subject:Date:From;
	b=WKuGf5YChz2/GLH1wFQGdzDo2YEzRfbZ9CnZWdF0C+XBDTaHXz3WS0XtKQ5zKkQAA
	 XruGzBKBzZTevisuXhkULI3GMEmjagsnJgL8i8F4RFbunPntB23QjstEExwx96iF91
	 beqiVBJRQlz2vfCDQw3rbLZMTt6PAae8F7XY+4nM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/11] media: renesas: rcar-csi2: Use the subdev active state
Date: Fri,  3 May 2024 17:51:15 +0200
Message-ID: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a follow-up to the recently sent
"media: renesas: rcar-csi2: Support multiple streams" series, this smaller
version collects some fixes and implement usage of the subdev active state
to simplify the R-Car CSI-2, ADV748x and MAX9286 drivers implementations.

Below the possibly more controversial points:

- R-Car CSI-2

There's a user-visible change here, as in the past it was possible to set
format on all pads, and the vin-test scripts do that. In this version I decided
to make the format configurable on the sink and propagate to sources. I'm not
sure if this can be considered a user visible change and we need to maintain
backward compatibility

- ADV748x

Add a list of supported formats and validated them in s_fmt. The ADV748x driver
configures the chip to automatically detect the output format based on what the
front-end uses, so setting a format doesn't actually modify the output image
formats. Regardless I presume making sure the format is actually supported is a
good thing.

- MAX9286

The driver uses frame_interval = 0/0 to detect if automatic frame sync detection
should be used. For this reason I initialized the frame interval of the active
state to 0/0 which might sound weird.

Tested with GMSL on Eagle V3M
Tested with HDMI on Salvator-X

Jacopo Mondi (11):
  media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
  media: rcar-csi2: Disable runtime_pm in probe error
  media: rcar-csi2: Cleanup subdevice in remove()
  media: rcar-csi2: Use the subdev active state
  media: adv748x-csi2: Initialize subdev format
  media: adv748x-csi2: Implement enum_mbus_codes
  media: adv748x-csi2: Validate the image format
  media: adv748x-csi2: Use the subdev active state
  media: max9286: Fix enum_mbus_code
  media: max9286: Use the subdev active state
  media: max9286: Use frame interval from subdev state

 drivers/media/i2c/adv748x/adv748x-csi2.c      | 141 ++++++++-----
 drivers/media/i2c/adv748x/adv748x.h           |   1 -
 drivers/media/i2c/max9286.c                   | 185 +++++++-----------
 drivers/media/platform/renesas/rcar-csi2.c    | 141 +++++++------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
 5 files changed, 251 insertions(+), 233 deletions(-)

--
2.44.0


