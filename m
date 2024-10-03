Return-Path: <linux-media+bounces-19028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72798ED02
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 547A61C21961
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 10:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D790014D6ED;
	Thu,  3 Oct 2024 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uULP+9bG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DB978289;
	Thu,  3 Oct 2024 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727951509; cv=none; b=TCjolkLEGcyhfxbBXVEnNHSBCbTYtIpNcnoUFaCen0P9GmulJObTr66SEmrpEa/ROUSlT1CeMB3ZZVeDmIFWHP61Fs9HksYb6ycRQfd0gQ2+2jfU2kysZrVx7aioKjkx4ETifTEDjvJ0AmCA7LFkAzLzZQv1WVEscBlFv94bh/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727951509; c=relaxed/simple;
	bh=T0eLI3BQx09VUinYnX5rge1Gt0+JKsB+27b/i31lM8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dTeyngAskKXnX0vlM4z+7rCG6sDAYwDeXm7LnFq4gtybsj4/rfkXdEbMv6lYVocRQsI81PptJ/ayGucH71wXweLUqkl6lLnZ/Wja8zb4cxZtjpz7R9vaGlLyjCSA4AVFrohd5PdMImilYwpibu93+PEz+eemvxm9mB3iZz0BpyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uULP+9bG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5399B66F;
	Thu,  3 Oct 2024 12:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727951406;
	bh=T0eLI3BQx09VUinYnX5rge1Gt0+JKsB+27b/i31lM8M=;
	h=From:Subject:Date:To:Cc:From;
	b=uULP+9bGzhYez/ebZktHIGjDVfiAa98EEd7vkHvZooRC1j+2xyyNOIwF2newZDDc6
	 8wvSyJT7iJ06CXLMBrO3l5HyJ6o19Evt5Ptv5ZtodBAno5ghTAJ0VeMaj1N8efhEuI
	 cSTW5CY+IKMaYKSWSb3nym5zzRnhmDVq0d0n1sK0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 0/4] media: raspberrypi: Support RPi5's CFE
Date: Thu, 03 Oct 2024 13:31:09 +0300
Message-Id: <20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1y/mYC/3XRTU7DMBAF4KtEXuPivzhOhBD3QCzG9qQ1InGx0
 6io6t1xU0EqQZeT+Ht6mjmRjClgJl11IgnnkEMcy6AfKuJ2MG6RBl9mIphQTHJF055T1yPlSlg
 tjG0EV6S83ifsw3FJen0r8y7kKaavJXjml68/GeY3Y+aUUXDat5r1vRD+JXiEHEcbIfmNiwO5R
 M1i5VqwlYvCrbHK9N6CtPIOlys3vF65LBx5DW3TeitFc4erlbdsXcCsCu+5ra30unWG3+H1Dec
 35evCW7DKKWcQHP7Dz9e9Jvw8lMNM1+USCxlp+T+Eqas+wng40gF9AJon2OLjAHnCdDnJgDnDc
 sGueloK1JIzwxrWbKSqtaGcvoOL+7gZ4ujDnwbPpcL5GwSwYJcjAgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5363;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=T0eLI3BQx09VUinYnX5rge1Gt0+JKsB+27b/i31lM8M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm/nKCrpzPGVs9w2OM8F3CW1ZEzXtd01qMAxH99
 Jr+7arRH/CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv5yggAKCRD6PaqMvJYe
 9al6D/4hJ1eenxev2HdtwrCJZTTU7wGR29H0OdNZe6cwxHssT/+kOEddvhEIQ0eXP2+L12v2wy7
 WcNZmQJC0uzS1jsU+21czk86gY+XsHNx45+81q6J74R2Q86vYocBAPn6o/F8RDK6aIacLWCaeqG
 InntCdy199VYucO2KujaB4SDSyWn0svvh6Pjuwp8eor+LNu3+e4JVnuIsFRO1SRkdzecFSMoCTo
 EnBLxxISTERTnD7KSrStAVWto6r+PqpPYfkX4+T5RiWu3RNnA9AA0Qy33n/GBFtIvCjNhl7a1T4
 eqNTp0j0yze+RzxKrbvnqlfIsvvvlPC4t89I5A1P0aUFm26WPYp90DQ5Z757xwMvYkhKcHPZFBW
 wlbAgEwdKQvrsfmO0WqbRzZJvqn8SWBJFXq1f2wk+dLkNokxlOQG7eErCC0gPPQhvlScJ0y1sXH
 FZanzovLSecuYQA0Z7ZxKyJX+glWEMTaxvevn+FxgpYegESyXxa0JcwH4X+tE8r56RNKPCUAcJc
 m44tsbE6P0WbZSU4exi69ofdzQv6JwzbZpaNrmMdV1QIwi7H2WDnqBHCvvxACLhhtvg6mpVcguK
 IYwgqseTgid2GjiwCaRsbPxUKrRsd5PVLdb9p2zrmcTVq1/8vfWMg5Pr/OWxjTSezr3Jb6LrpxG
 EMiiul5owy0Xj7w==
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
Changes in v6:
- Rename "isr_handler" functions to just "isr"
- Fix checkpatch warnings, mainly lines over 80 chars
- A diff of the changes be be found from: https://paste.debian.net/1331173/ (note: the tab there seems to be 4 chars)
- Link to v5: https://lore.kernel.org/r/20240910-rp1-cfe-v5-0-9ab4c4c8eace@ideasonboard.com

Changes in v5:
- Add "depends on PM". The platforms that use CFE will always have PM in
  practice, and it's not worth supporting both the PM and !PM cases as
  it adds complexity to the driver.
- Link to v4: https://lore.kernel.org/r/20240904-rp1-cfe-v4-0-f1b5b3d69c81@ideasonboard.com

Changes in v4:
- Drop unnecessary clock-lanes from the DT bindings
- Drop unnecessary linux-media from MAINTAINERS entry
- Drop unnecessary conversion to bool with !!
- Don't set cap->bus_info in cfe_querycap()
- Make debugfs files not readable by the world
- Check the return value of v4l2_fwnode_endpoint_parse()
- Remove the code dealing with remote_ep_fwnode. Instead use
  v4l2_create_fwnode_links_to_pad() and media_pad_remote_pad_unique() to
  create the link and get the pad index.
- Add cfe/csi2/fe/dphy argument to the respective dbg/info/err print
  macros.
- Drop some debug prints and add a few, clarifying the prints for
  enabling and disabling the streams.
- Some cosmetic changes (linefeed, drop unnecessary assignment, move a
  define)
- Link to v3: https://lore.kernel.org/r/20240815-rp1-cfe-v3-0-e15a979db327@ideasonboard.com

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
 .../bindings/media/raspberrypi,rp1-cfe.yaml        |   93 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-fe.rst    |   39 +
 MAINTAINERS                                        |    7 +
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 drivers/media/platform/raspberrypi/rp1-cfe/Kconfig |   15 +
 .../media/platform/raspberrypi/rp1-cfe/Makefile    |    6 +
 .../media/platform/raspberrypi/rp1-cfe/cfe-fmts.h  |  332 +++
 .../media/platform/raspberrypi/rp1-cfe/cfe-trace.h |  202 ++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   | 2504 ++++++++++++++++++++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.h   |   43 +
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |  586 +++++
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.h  |   89 +
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.c  |  181 ++
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.h  |   27 +
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.c   |  605 +++++
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.h   |   53 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 .../uapi/linux/media/raspberrypi/pisp_fe_config.h  |  273 +++
 .../linux/media/raspberrypi/pisp_fe_statistics.h   |   64 +
 include/uapi/linux/videodev2.h                     |    2 +
 25 files changed, 5232 insertions(+)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240314-rp1-cfe-142b628b7214

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


