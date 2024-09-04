Return-Path: <linux-media+bounces-17569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B3796BA5A
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D97841F232B6
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12871D0DCD;
	Wed,  4 Sep 2024 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D14Tt5Tr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7251CC887;
	Wed,  4 Sep 2024 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448780; cv=none; b=ejvgYw1bwn3SNOGTfQ7rNNYzlYGWfi1Z+oykhqhV4cbujp+f9WXvp+YGc4hk6GZ/NQC5Ng6b2hSJC4ZqBPM5SUsSPcI8oODhbgZdcyFDqSKfAGpFqyJx00EfEv7NZ6LBkY3lpzO9GbLeT3ciHoKgmuI5tN0yTa2+LuUej8HOLwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448780; c=relaxed/simple;
	bh=HU62cloo7tqKBXnv8yfSBcE8oyrBX8Nj+XE7JGPDUFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mdpo7bQ0GAHDMJdixueL080DvsI/qSwRq69jK7ERnxRxarFrIrw+KjBnaLtBvFwwJ3SO/CHtrSCvxy99ZMv0rLTAlfOyZAlNNri6ffxEIg3EBUwwgC9evDbYynbtlRQHNx5ZYwpH+M/94mZYnfFfRBZUzvP0j9G4ogPxHWD6Fck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D14Tt5Tr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07A753C7;
	Wed,  4 Sep 2024 13:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725448703;
	bh=HU62cloo7tqKBXnv8yfSBcE8oyrBX8Nj+XE7JGPDUFM=;
	h=From:Subject:Date:To:Cc:From;
	b=D14Tt5TrzusAFjGFa6DNew3ttGlQm3qJD9NwJa058bj1P5TGa3KFllM9hvr+LI7eR
	 ZH+HWF7xtFNQRsA53LVoNwlioGIInWZlKuZlJEF99A7ejH1xD6SlAUwXL8rCHvP6kR
	 QqkTSIK0JzcbVSdmr64dELuqwy87FRlZ/eicZVQM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 0/4] media: raspberrypi: Support RPi5's CFE
Date: Wed, 04 Sep 2024 14:19:08 +0300
Message-Id: <20240904-rp1-cfe-v4-0-f1b5b3d69c81@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACxC2GYC/3WQzU7DMBCEXyXyGQf/JXEihHgPxGEdb1pXOA52G
 hVVfXecVJADcJzd/UazcyUJo8NEuuJKIi4uuTBmoR4K0h9hPCB1NmsimFBMckXjxGk/IOVKmFp
 o0wiuSL6eIg7usjm9vmV9dGkO8XMzXvg6/fbQPx4Lp4xCX9u2ZsMghH1xFiGF0QSItuyDJ6vVI
 na8FmzHRcaNNkoP1oA08h9c7rjm1Y7LjCOvoG1aa6Ro/sBv988ifpxzNfP9PWIgIc177+aueHf
 j+UI9Wgc0zXDARw9pxriW4jEl2DrsiqctQCU506xhTSlVVWvK6Qn6MIXSh9G6Xwmec4TbF5s96
 5ulAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4736;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=HU62cloo7tqKBXnv8yfSBcE8oyrBX8Nj+XE7JGPDUFM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm2EJAbxIHxttGUodBxqHXux0yObI1CvUj3szML
 LfW+8MXUF2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZthCQAAKCRD6PaqMvJYe
 9c1+D/94oncnEuf5eyQlC2w7LKkkRFJnTGZxhU3LIjS5i9a/CPY07MGrLXMnY6g/QDpsMzBE3vI
 wztPBacsjwsNr7IkHn69zFEz4pbKNeNBnsWqPP/Wew9eOlbksJZ0FKvHlHLcJ4Kkf3YLpsU1abR
 3hng4FyUKyddVMQgYGSl3efkrS0bybuauGXQV3f4Ae8ZCWcMJ+utHg3yiy/sY3KMHwSU7fCkTyl
 bb4Lno0SArS4B2vZkP38C9nsOkRaCFn52pV2TUHy9rkr1/8gVwXuOHkY1keGHY+7Prp6kt1mmQ1
 vCou77kWIwFvWeSCydwkIrmxZVim7lL2+CXodnE4WEAO48/zjmn0nzjQcNDOuD9rrHx200YqXL2
 ubk00dDL7mVqWzsBSwiTKEptjbkeqWtuUE25iOWUcqTEQtOxz2gWGqTRkFSOM0ynjMDi/VwwbCn
 yaJ+YNpwqWI5dVQvOtcGZy2Lub+dl+PsP5O4Hdlq13KSVEmHMGn6v3IiCKAsmhunHaBZCW0mNOu
 iEErf044ad5tGFqpFJLI0iwnVvvcgT/zGBN3is7HTmrzOu0lD2Ayj7CJTfJCwGsYgcrNFyljufI
 TfXyfYjaBHpo5NUG95TfQ0jB5tf30+wNNVgQbZfa9zEG+8q5oXWSeOIKQ5I7ukzS50+FGnDr3Wa
 CuB7JhUyAX2N6Xw==
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
 drivers/media/platform/raspberrypi/rp1-cfe/Kconfig |   14 +
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
 25 files changed, 5180 insertions(+)
---
base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
change-id: 20240314-rp1-cfe-142b628b7214

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


