Return-Path: <linux-media+bounces-6483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C138724BF
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 17:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A98D91C21E5B
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 16:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84FAD271;
	Tue,  5 Mar 2024 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qmqIrv6o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493568BF6;
	Tue,  5 Mar 2024 16:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709657333; cv=none; b=J0IJtSgbX/Ob3Q7jkBSv95770zihCHZGaMK1W4R5v2RJP6yB2rgnV0NrUYIJ+2SI7GQVUn/BTMbU4KDEdYld9ibWYcpIBuU3Mor6TYZVmnQh/mM+JY5QafOmp/+bMa66UOLlebUTTUbb67G4oxs5bpXmSCh4m7P6Lwsxh8op9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709657333; c=relaxed/simple;
	bh=MWuI6KClS+k6D10Sdz3QHQiUSP0sCsHteLrJCzclwKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RxVg11g6yd8Yo/Sof0iOpQ1PlbRm0UWyNG/R4bm1SFREwJLOX+e7bvvMklyjeaQWrFYcHK1wtmIeFSi1ZvJ/Vm9j4XGnKLZKUny+fu0cAg4TcEd5P6FctWV4VFe69yAYbnFtXkK/9w+s7hs4ZyqrqajEueqZwnQ2CUne2ktOh7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qmqIrv6o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B5AB9D5;
	Tue,  5 Mar 2024 17:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709657312;
	bh=MWuI6KClS+k6D10Sdz3QHQiUSP0sCsHteLrJCzclwKo=;
	h=From:To:Cc:Subject:Date:From;
	b=qmqIrv6oiFQSxFWDo55YU3CsP/Cw79P63DkQdlc/I26jGOi93X0rAg9+WhBZ7wKWB
	 OLnv34brot8QVRSfrEJQZy2N796BMZF0eYy5I8GpxUEXCnc6xVlLhuVDLRRM2nUZfy
	 53gy46VPiMry6baAYIYvJFdM5Blzv2I3zmRyBZ2E=
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
Subject: [PATCH v3 0/5] Add Arm Mali-C55 Image Signal Processor Driver
Date: Tue,  5 Mar 2024 16:48:27 +0000
Message-Id: <20240305164832.2055437-1-dan.scally@ideasonboard.com>
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
 Documentation/admin-guide/media/mali-c55.rst  | 330 ++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 .../bindings/media/arm,mali-c55.yaml          |  76 ++
 .../media/v4l/subdev-formats.rst              | 168 +++
 MAINTAINERS                                   |  10 +
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/Makefile               |   1 +
 drivers/media/platform/arm/Kconfig            |   5 +
 drivers/media/platform/arm/Makefile           |   2 +
 drivers/media/platform/arm/mali-c55/Kconfig   |  18 +
 drivers/media/platform/arm/mali-c55/Makefile  |   9 +
 .../platform/arm/mali-c55/mali-c55-capture.c  | 958 ++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-common.h   | 266 +++++
 .../platform/arm/mali-c55/mali-c55-core.c     | 745 ++++++++++++++
 .../platform/arm/mali-c55/mali-c55-isp.c      | 703 +++++++++++++
 .../arm/mali-c55/mali-c55-registers.h         | 180 ++++
 .../arm/mali-c55/mali-c55-resizer-coefs.h     | 382 +++++++
 .../platform/arm/mali-c55/mali-c55-resizer.c  | 740 ++++++++++++++
 .../platform/arm/mali-c55/mali-c55-tpg.c      | 425 ++++++++
 include/uapi/linux/media-bus-format.h         |   3 +-
 21 files changed, 5041 insertions(+), 1 deletion(-)
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


