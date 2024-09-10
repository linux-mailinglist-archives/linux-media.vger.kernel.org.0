Return-Path: <linux-media+bounces-18046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D0972B99
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 10:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C476B2345D
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 08:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76950187FF9;
	Tue, 10 Sep 2024 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uL4bvR8I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C9187FE7;
	Tue, 10 Sep 2024 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725955654; cv=none; b=UCG7zYsKYr8Rqq1fIe7G9h6UEI9r1iW0k2lD6pe9I6Y3j5wb3NSPIvb5vIZzSl4K9lKTr0Dux9mg3z4CInuGb513kP7LSb+l1nwm6plntoS6loHcg9dDfBVMlQHkQw22q0U2hWtveRxEnUrfb9eZp6I2YZ40pZG/09DzNifvw/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725955654; c=relaxed/simple;
	bh=RtVNswHRz3cymvLxxz6qA0j9iMPcwqxtPHCjGnFRzUE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M2XLE+iDfKmF3Pev4CJ+XSLecTX1Rhk9sfjo0hlkLyRV0DK+1q0WdDG0HGQr+hgUDW32cPeMmVOBDzZjbdjHgqzuqSc+IcM+LIffzzg9LrS9k1n4yIRhTKCvrXbpj4RWYynTz2nZJQ4TcD/HiUE+9Zt7ZhKu8FQMokJrw2b1TSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uL4bvR8I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2558C741;
	Tue, 10 Sep 2024 10:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725955574;
	bh=RtVNswHRz3cymvLxxz6qA0j9iMPcwqxtPHCjGnFRzUE=;
	h=From:Subject:Date:To:Cc:From;
	b=uL4bvR8I+fwLJCkOmzzAaBQosf2A+/kw2UFBVFYX5uAvOJCB3qLwJAY6eu2W6sn0o
	 gG36xAHQGuYWO1Ahg11M4dG5s217FGulHmmzgp2eHLfo1tMhDR7D6GbLoeuW9/r95l
	 8SjcymPAqwR80/vMpguw8Ttn9oxngfWDb5v5P1LE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 0/4] media: raspberrypi: Support RPi5's CFE
Date: Tue, 10 Sep 2024 11:07:05 +0300
Message-Id: <20240910-rp1-cfe-v5-0-9ab4c4c8eace@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACn+32YC/3WRzU7EIBhFX6VhLZXfljbG+B7GBZSvMxgpFTrNm
 Mm8u7QTZaGzvMC5uTlcUILoIKG+uqAIq0suTDnIhwoNRz0dADubM2KECcKpwHGmeBgBU8FMw5R
 pGRUov54jjO68N72+5Xx0aQnxay9e6Xb606F+O1aKCdZDY7uGjCNj9sVZ0ClMJuho6yF4tFWtr
 OANIwVnGTfKCDVao7nhd3BecEVlwXnGgUrdtZ01nLV3cFHwjhQBq8j4SI003DbdoOg/+PUmJsL
 nKZtdbnaQ0Qlwvvdu6asPN53O2IN1GqdFH+DR67RA3Jx6SEnvX9BXT/sAySlRpCVtzYVsFKb4X
 Q9hDrUPk3V/FjznCddvQZXpQ+QBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5030;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=RtVNswHRz3cymvLxxz6qA0j9iMPcwqxtPHCjGnFRzUE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm3/48nh4gnkN8vMQfP2HQOeIfwivrmlR5lxwkl
 +s5tY1YFOiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZt/+PAAKCRD6PaqMvJYe
 9UdpD/oDq7Uz/uRejFy6i2xpiPZoIkdG0wfFYTf7H2tFz5Tgm6mr7lKgCPNatQoLUK4Q5iWVTTy
 aYn0URNVUXfLvIJfjHfDuvx33SPMC2kVhL462d4leuAgT/RDAF1zrgq0V4sB/bjAw8zAtJTItqr
 dLqWNAYIW6WYyagtfBRAd8YbzE4P73pMvNsSG0Xm2HvPEfWBOysSxsDcds61Estq67GdMnxDllj
 7fqc2vOaB0x8eJYH1mQD6IY7u8/HX96h8/M7DEmRCod3wAxfo4F9eaG2EYoohldhh3+MwolMkpB
 kytlZjkUZ1FCOQfzL9g9BPuz/pyXA9VLR6m2lPdmlEMckacq0ZzOxeXTmwT4FgEdyzP/twnlkyD
 yttTQ5daZeoCfhxw8hEal5nQ09m9cQz1VW+lh15xvmhsFy8XC+5lqKpFLFIQIYH7SqH0yTDPJpb
 9kgQoR/ys6qWW5WPYd608jfpOVXwKNWB1YUEGEM4yp4KFDiShhWHdPPeYqmD3fulNFFRZjP64vq
 7huIeOC8aiE+jzKTH+7F2xzvoGZjpQmrCSDC4svh8azr2Cj8fKsHN+QjJj3Imb/8vzqsZxtq84O
 /Iu8MP/GHePK+3/Uu2sw9F8jAwutxoEtGx/SUtzrTyWRI1pPvnvWabNbTJwqJ4nDHThq/N+8Gne
 7z5N/atngXai0TA==
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
 .../media/platform/raspberrypi/rp1-cfe/cfe-trace.h |  196 ++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   | 2487 ++++++++++++++++++++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.h   |   43 +
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |  583 +++++
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.h  |   89 +
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.c  |  180 ++
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.h  |   27 +
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.c   |  581 +++++
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.h   |   53 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 .../uapi/linux/media/raspberrypi/pisp_fe_config.h  |  273 +++
 .../linux/media/raspberrypi/pisp_fe_statistics.h   |   64 +
 include/uapi/linux/videodev2.h                     |    2 +
 25 files changed, 5181 insertions(+)
---
base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
change-id: 20240314-rp1-cfe-142b628b7214

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


