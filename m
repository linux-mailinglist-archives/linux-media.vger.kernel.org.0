Return-Path: <linux-media+bounces-9692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 418508A95A5
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 11:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F26F62822D0
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 09:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C512C15AAC2;
	Thu, 18 Apr 2024 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Uoc2Dbtc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775F515A4BB;
	Thu, 18 Apr 2024 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713431347; cv=none; b=g9qdLLkoXhsmPkc9A1qcSx6svwkFPBW2xmjUge4NNasbHotdlBFq5W2hQKSOnpMg5rt83CpyyLZVbt78yo8UftNdo0l23cumG/5Yo1poPfz8fTUBdhRRTIs6MsY2rZ9w70vc18j3vDXwzv9UaGzrcWBaARBrdofyi0nhM9Mmkv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713431347; c=relaxed/simple;
	bh=3EbgWDb6EbcWPdY7230fm2pvGJoC3J6JonBCHrB66qQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cMUfkLrM4Hd9YCGXm4PJa4GB9D/XfvgpJQWBYgq/yE32z6Pw3UIMu+xFZ8jm9HqGsS5+vj/86F10QqKc5hd3kIsIeAZwVYQ24xq08A8z54kBhBnMX2Nml9bTFUZ7qq8cw28TA8hJbXGabGJDc+5RKKy+9XWZ72Yj0jrWIo3xTIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Uoc2Dbtc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3ACC802;
	Thu, 18 Apr 2024 11:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713431289;
	bh=3EbgWDb6EbcWPdY7230fm2pvGJoC3J6JonBCHrB66qQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Uoc2DbtcRw0PON5XpVoTqiEfqFpbCHoje1FoaRhcM77enzzkmZfG2GVDCiRmjBvm4
	 XsJDyGDKUBq/Y4et1gcA8wUBxERRyvFrDDrN9QY/lwlW+PrbZddul+MNw0Cyd0Td7f
	 VhNk2wnQZhWsA9gHYrzGqUxC/lyoFxcgTPk53rmw=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v4 0/5] Add Arm Mali-C55 Image Signal Processor Driver
Date: Thu, 18 Apr 2024 10:08:20 +0100
Message-Id: <20240418090825.624747-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all

This patchset introduces a driver for Arm's Mali-C55 Image Signal Processor.
The driver uses the media controller API and in this initial support implements
both of the ISP's capture pipelines allowing a range of output formats plus
downscaling and cropping. The capture pipelines are named "Full resolution" and
"Downscale" and so abbreviated FR and DS throughout the driver.

The driver exposes 4 V4L2 subdevices:

- mali-c55 isp: input data formatting
- mali-c55 tpg: test pattern generator (modeled as a camera sensor entity)
- mali-c55 resizer fr: downscale / crop and format setting for the FR pipe
- mali-c55 resizer ds: downscale / crop and format setting for the DS pipe

Conspicuously missing from the list are subdevices for the ISP's statistics and
parameters; work is progressing in these areas and we plan on introducing them
in later series on top of this one.

Thanks
Dan


Daniel Scally (5):
  media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60 format code
  dt-bindings: media: Add bindings for ARM mali-c55
  media: mali-c55: Add Mali-C55 ISP driver
  media: Documentation: Add Mali-C55 ISP Documentation
  MAINTAINERS: Add entry for mali-c55 driver

 .../admin-guide/media/mali-c55-graph.dot      |  19 +
 Documentation/admin-guide/media/mali-c55.rst  | 329 ++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 .../bindings/media/arm,mali-c55.yaml          |  66 ++
 .../media/v4l/subdev-formats.rst              | 168 +++
 MAINTAINERS                                   |  10 +
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/Makefile               |   1 +
 drivers/media/platform/arm/Kconfig            |   5 +
 drivers/media/platform/arm/Makefile           |   2 +
 drivers/media/platform/arm/mali-c55/Kconfig   |  18 +
 drivers/media/platform/arm/mali-c55/Makefile  |   9 +
 .../platform/arm/mali-c55/mali-c55-capture.c  | 955 ++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-common.h   | 266 +++++
 .../platform/arm/mali-c55/mali-c55-core.c     | 748 ++++++++++++++
 .../platform/arm/mali-c55/mali-c55-isp.c      | 701 +++++++++++++
 .../arm/mali-c55/mali-c55-registers.h         | 180 ++++
 .../arm/mali-c55/mali-c55-resizer-coefs.h     | 382 +++++++
 .../platform/arm/mali-c55/mali-c55-resizer.c  | 740 ++++++++++++++
 .../platform/arm/mali-c55/mali-c55-tpg.c      | 424 ++++++++
 include/uapi/linux/media-bus-format.h         |   3 +-
 21 files changed, 5027 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/media/mali-c55-graph.dot
 create mode 100644 Documentation/admin-guide/media/mali-c55.rst
 create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
 create mode 100644 drivers/media/platform/arm/Kconfig
 create mode 100644 drivers/media/platform/arm/Makefile
 create mode 100644 drivers/media/platform/arm/mali-c55/Kconfig
 create mode 100644 drivers/media/platform/arm/mali-c55/Makefile
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-capture.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-common.h
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-core.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-isp.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-registers.h
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer-coefs.h
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c

-- 
2.34.1


