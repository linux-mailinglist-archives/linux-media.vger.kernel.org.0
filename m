Return-Path: <linux-media+bounces-16331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936029529E6
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 09:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C71601C213C8
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 07:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94201917EB;
	Thu, 15 Aug 2024 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="egf+AEVd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB8D15E5D4;
	Thu, 15 Aug 2024 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723707002; cv=none; b=Hb3SeegvWBnGlzf4c22f+MkbWxIDYr4YKW562B5d2njjpzLO0yt4Caf9otWr0LDGnVWuYzORmdaVMrm+Y9lP8GUlxVjnRvhpLZV5lFCUrPoQC9erAxJY5mwB4c1mjNB/lwoR/4o/3s21IH/pC2THvLHQw83vdgSZUzvx1SUHsQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723707002; c=relaxed/simple;
	bh=t/W6Vp/61YIZT5YMzdtttHqcOF8Ic+esGOIm7XmKXgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YXMNBKb6uhtBSEQ8sIMt2Tw+j9HhXPxgiD7wDNrBazKRQelZEUAl9OURFGUSoOtdOhhXssl3/VE8cbBIpW3QNF+f6OXCYKjPFrU6E4vCRs3nQ5/E8wZuIEiq73MUmfeOCm9S9yo/HKoXxD14rVXzMANSwj6zWUaghq5D3SW1l4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=egf+AEVd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC737A34;
	Thu, 15 Aug 2024 09:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723706933;
	bh=t/W6Vp/61YIZT5YMzdtttHqcOF8Ic+esGOIm7XmKXgE=;
	h=From:Subject:Date:To:Cc:From;
	b=egf+AEVdMtLcBIrB+mB35wwowxbnG7e1oR7BImyXnXVTXFyrNxc/9/pSGAZD4VoST
	 1QGKLLGJavQbu+ZGR1y1827lmEP1wsm4OYCoL4NPoIE2rT0su62M8dAlNKohWPSII7
	 FNW/pBfv42S2ogGosMK+QGmArPFifqVn+RSKvfv0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 0/4] media: raspberrypi: Support RPi5's CFE
Date: Thu, 15 Aug 2024 10:28:51 +0300
Message-Id: <20240815-rp1-cfe-v3-0-e15a979db327@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADOuvWYC/22Qy07DMBBFfyXyGge/mpgIIf4DsRjHk3YqHAc7j
 Yqq/jtOKugCltfje3RmLixjIsysqy4s4UKZ4liCfqhYf4Bxj5x8yUwJZYSWhqdJ8n5ALo1yjbK
 uVdKw8ntKONB5I729l3ygPMf0tYEXub7+MOwvY5FccOgb/9SIYVDKv5JHyHF0EZKv+xjYilrUv
 d4oca+rUnfWGTt4B9rpf+rXm1rCz1PZbb75MQcZeZkHmrvqg8bTmQf0BDzPsMfHAHnGtG4VMGf
 YjtBVz5vATkthRSvaWptdY7nkR+jjFOsQR09/DF6KwvUbxVDQEWYBAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Naushir Patuck <naush@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3871;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=t/W6Vp/61YIZT5YMzdtttHqcOF8Ic+esGOIm7XmKXgE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmva5p+ylObJraW8p6QZX1y9QsysS9dk1ve97p7
 6A1Vkx7PHaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZr2uaQAKCRD6PaqMvJYe
 9Q7TD/9Ifs+pd2qzzNpppbK83PyThnrAToWLBkuF+66Y8uIODBN6KxCh/eS8pltsrYSwSo/eLFB
 TMz3m6Kt7QNpVcf2pph8pboGVwQKA0SJ+Wm3boMBh5Pn/NS+GpEfHh2lHWY1cCgaDW/qHh7nmEd
 tq/fSELIUwwi/PmcInF9xZQ86cevxZHGKn0mFLFN96zUE3bsrhgSxtZ3DBmlS4OMY1AP6Hig162
 nINHb3giOTxBvjvUghPN1mQQ2sJnXEx5UWr6e3UOx2qaJKav2yQrHzvmWyFrHqilaW6hIImVZml
 Glnkcd2h8QbAkORgNMQTbOTweO5mbp+XwnarhRcDEZOJRvw+c3Pfx3cTH7b2ttFmQPv4prkKs9I
 GavJ4RUKN4kIcAcyXMC+uWn736tOZhgDRA0LputLQiR//zdew+kI4DIBPvWitjWmUWLGPwVvcNJ
 Xmenhz3f0dhLz5EHiI2EVQ6RBQBxGeyBYXCKR/cLWnIFfXctZDVuV5eiHKSeAzUVOo7+tQ7/uuz
 Ve+A3A0wx1vvoe3kSz/ydCE4vxd1Pi3z417MacvqnPW5qVmikoL+cUh1C4qNvN41jznwhkDPmm5
 pLkE0HiVZ6sX4eSh1Z0h+5zQagZyeO3LlUKjYACLwuIacZwh7RswJDTtGQ0IRaqKFmMX726zEub
 I5CzOUzhgajNbjw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This series adds support to the CFE hardware block on RaspberryPi 5. The
CFE (Camera Front End) contains a CSI-2 receiver and Front End, a small
ISP.

To run this, you need the basic RPi5 kernel support plus relevant dts
changes to enable the cfe and camera. My work branch with everything
needed to run CFE can be found from:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git rp1-cfe

A few notes about the patches:

- The original work was done by RaspberryPi, mostly by Naushir Patuck.
- The second video node only sets V4L2_CAP_META_CAPTURE instead of both
  V4L2_CAP_META_CAPTURE and V4L2_CAP_META_CAPTURE like the other nodes.
  This is a temporary workaround for userspace (libcamera), and
  hopefully can be removed soon.

I have tested this with:
- A single IMX219 sensor connected to the RPi5's CSI-2 port
- Arducam's UB960 FPD-Link board with four imx219 sensors connected

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v3:
- Based on v6.11-rc3. The PiSP BE series is now in upstream so no extra
  dependencies are needed.
- Fixed cfe_remove() return value, as the .remove hook has changed
- Added Krzysztof's Rb.
- Link to v2: https://lore.kernel.org/r/20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com

Changes in v2:
- Change the compatible string back to raspberrypi,rp1-cfe from raspberrypi,rpi5-rp1-cfe
- Drop the references to rp1 headers in the DT binding example. This
  allows compiling the example without the rp1 support.
- Fix missing remap lines for mono formats
- Fix csi2_pad_set_fmt() so that the format can be changed back to the
  sink's format from 16-bit or compressed format.
- Link to v1: https://lore.kernel.org/r/20240318-rp1-cfe-v1-0-ac6d960ff22d@ideasonboard.com

---
Tomi Valkeinen (4):
      media: uapi: Add meta formats for PiSP FE config and stats
      dt-bindings: media: Add bindings for raspberrypi,rp1-cfe
      media: raspberrypi: Add support for RP1-CFE
      media: admin-guide: Document the Raspberry Pi CFE (rp1-cfe)

 .../admin-guide/media/raspberrypi-rp1-cfe.dot      |   27 +
 .../admin-guide/media/raspberrypi-rp1-cfe.rst      |   78 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/raspberrypi,rp1-cfe.yaml        |   98 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-fe.rst    |   39 +
 MAINTAINERS                                        |    8 +
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 drivers/media/platform/raspberrypi/rp1-cfe/Kconfig |   14 +
 .../media/platform/raspberrypi/rp1-cfe/Makefile    |    6 +
 .../media/platform/raspberrypi/rp1-cfe/cfe-fmts.h  |  332 +++
 .../media/platform/raspberrypi/rp1-cfe/cfe-trace.h |  196 ++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   | 2524 ++++++++++++++++++++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.h   |   43 +
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |  583 +++++
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.h  |   89 +
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.c  |  175 ++
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.h  |   27 +
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.c   |  581 +++++
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.h   |   53 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 .../uapi/linux/media/raspberrypi/pisp_fe_config.h  |  273 +++
 .../linux/media/raspberrypi/pisp_fe_statistics.h   |   64 +
 include/uapi/linux/videodev2.h                     |    2 +
 25 files changed, 5218 insertions(+)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240314-rp1-cfe-142b628b7214

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


