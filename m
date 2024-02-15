Return-Path: <linux-media+bounces-5227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E45856EC0
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 21:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 636FCB2479D
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 20:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E056613B29F;
	Thu, 15 Feb 2024 20:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aSnG0L2j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222932595;
	Thu, 15 Feb 2024 20:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708029890; cv=none; b=flITeU1UPh07g8E2ggdX36RdQ7FUCOjKnrvV6wGxiUX29HGR5jzQZCd08BuD8yIELa8PaBTBWsHmrrxWLiVXH76bO++BPVViVUVbD1/JqYR4Ll7qiOb0L7eWDfKuRlJCgDGtC3jR+Hk1jvYAwNTLNYkG4cooYYfRY1527oDCNe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708029890; c=relaxed/simple;
	bh=7+C+nuf2HLU4u1NNutFvy9AsrXNIpxJuVzWnH369IPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cGux7GOfqQguDISlbftN11Qmbovda4IX9vvVD0AfXO/fk/yPrOKnJvba3EHFbVl5zCOnee6SIa4wvitUCM6ZhX1UcY+LRe8VnwzFlooDw2CR77TePc0gy89923Fp49meDoTI6+vhKAqDGhiyohox2a1YHRuaf0i2ZgO2uwaLfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aSnG0L2j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [103.86.18.214])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D18D1325;
	Thu, 15 Feb 2024 21:44:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708029881;
	bh=7+C+nuf2HLU4u1NNutFvy9AsrXNIpxJuVzWnH369IPI=;
	h=From:To:Cc:Subject:Date:From;
	b=aSnG0L2jd2x7PXkKXGbkfdM0+RGIiflExiCWgzAvNKic1JeJOE8YAj012n7UphuHW
	 CLF+gmXaK1ovZ9SS04tksD3E3J5RrcBEVUgJp4uSRrdj/w7PK9fSrgNdg4jUiEwusc
	 SivjosE2+w0BTs6INL9gJtb2zKL5Wz3m9wDkvbDs=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	willl will <will@willwhang.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/2] media: i2c: Add imx283 camera sensor driver
Date: Fri, 16 Feb 2024 02:14:33 +0530
Message-ID: <20240215204436.9194-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a v4l2 subdevice driver for the Sony IMX283 image sensor.
  
The IMX283 is a 20MP Diagonal 15.86 mm (Type 1) CMOS Image Sensor with
Square Pixel for Color Cameras.
    
The following features are supported:
- Manual exposure an gain control support
- vblank/hblank/link freq control support
- Test pattern support control
- Arbitrary horizontal and vertical cropping
- Supported resolution:
   - 5472x3648 @ 20fps (SRGGB12)
   - 5472x3648 @ 25fps (SRGGB10)
   - 2736x1824 @ 50fps (SRGGB12)

The driver is tested on mainline branch v6.8-rc2 on IMX8MP Debix-SOM-A.
Additional testing has been done on RPi5 with the downstream BSP.

In the driver, CENTERED_RECTANGLE macro is defined to center the crop
rectangle. Possibly that should be removed, and a V4L2 helper can be
introduced if more use cases are identified.

Kieran Bingham (1):
  media: i2c: Add imx283 camera sensor driver

Umang Jain (1):
  media: dt-bindings: media: Add bindings for IMX283

 .../bindings/media/i2c/sony,imx283.yaml       |  100 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx283.c                    | 1601 +++++++++++++++++
 5 files changed, 1724 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
 create mode 100644 drivers/media/i2c/imx283.c

-- 
2.43.0


