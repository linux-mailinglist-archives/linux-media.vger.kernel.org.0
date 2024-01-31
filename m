Return-Path: <linux-media+bounces-4517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFE18444C2
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 17:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3247328AE2A
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 16:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AFF12BF05;
	Wed, 31 Jan 2024 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tGLTCcM4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909D512A171;
	Wed, 31 Jan 2024 16:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706719648; cv=none; b=uNIdxU2OMfGU5gArXJk2iiaM9SYTww/so5AaJjQY1nSLjfEUPDwgh5cgUIwQWXZNJdL2Aq4sl9VoVNwAPJ8Z5jS4xMt+HBd8SI4mqgZcpgC30wOM+T1aKlEk6qjOyutdYxh0fak54OEvoBgKTirl4AULP284Fi1elCe+E4SZ7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706719648; c=relaxed/simple;
	bh=i2Nyco+tVvT/sYMyaERZ4PNEFuw6x9vPgffFLNr1K7c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kTscf5TDvmF8F6ArpqT/zFipInVQYPGMdP2QLY1bbdCFfi6vc7Q7q7hGqGdlxfcBwyg/g+IYSWBJ5xhWPApNTG9WxWoEBytpMr/6lpC+m0Zb2chF14BucDV4C4OAtwyxjITmsLKGV4FP2zvRu5dCqaKMCH0tCxyqTjr29wryKUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tGLTCcM4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FA403D9;
	Wed, 31 Jan 2024 17:46:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706719565;
	bh=i2Nyco+tVvT/sYMyaERZ4PNEFuw6x9vPgffFLNr1K7c=;
	h=From:To:Cc:Subject:Date:From;
	b=tGLTCcM4PfC5sLTjtLVXY7adMGXVw9GkEK88Xk0SYrvZgJt6D72tGP37l/6DiKfDf
	 cRLTGGvO+cOModq+9nJObUvwnf4oeL5u/UtGefIL7NZX2CqHwOc6rBgEEqNfucahdr
	 8Kh+dYKBOXH8aycj0NdL1rjYG2OP0c0Vv9lG3kKo=
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
Subject: [PATCH 0/5] Add Arm Mali-C55 Image Signal Processor Driver
Date: Wed, 31 Jan 2024 16:47:04 +0000
Message-Id: <20240131164709.810587-1-dan.scally@ideasonboard.com>
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

Thanks
Dan

Daniel Scally (5):
  media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60 format code
  dt-bindings: media: Add bindings for ARM mali-c55
  media: mali-c55: Add Mali-C55 ISP driver
  media: Documentation: Add Mali-C55 ISP Documentation
  MAINTAINERS: Add entry for mali-c55 driver

 .../admin-guide/media/mali-c55-graph.dot      |   19 +
 Documentation/admin-guide/media/mali-c55.rst  |  318 ++++++
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../bindings/media/arm,mali-c55.yaml          |   51 +
 .../media/v4l/subdev-formats.rst              |  168 +++
 MAINTAINERS                                   |   10 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/arm/Kconfig            |    5 +
 drivers/media/platform/arm/Makefile           |    2 +
 drivers/media/platform/arm/mali-c55/Kconfig   |   18 +
 drivers/media/platform/arm/mali-c55/Makefile  |    9 +
 .../platform/arm/mali-c55/mali-c55-capture.c  | 1013 +++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-common.h   |  263 +++++
 .../platform/arm/mali-c55/mali-c55-core.c     |  717 ++++++++++++
 .../platform/arm/mali-c55/mali-c55-isp.c      |  682 +++++++++++
 .../arm/mali-c55/mali-c55-registers.h         |  180 +++
 .../arm/mali-c55/mali-c55-resizer-coefs.h     |  382 +++++++
 .../platform/arm/mali-c55/mali-c55-resizer.c  |  678 +++++++++++
 .../platform/arm/mali-c55/mali-c55-tpg.c      |  425 +++++++
 include/uapi/linux/media-bus-format.h         |    3 +-
 21 files changed, 4945 insertions(+), 1 deletion(-)
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


