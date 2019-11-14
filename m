Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91CEDFBF07
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 06:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfKNFNQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 00:13:16 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43856 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbfKNFNQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 00:13:16 -0500
Received: from floko.floko.floko (unknown [IPv6:2804:431:c7f0:da1c:a086:2727:e196:fd8a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D674328ED79;
        Thu, 14 Nov 2019 05:13:05 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        zhengsq@rock-chips.com, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v11 00/11] Rockchip ISP Driver
Date:   Thu, 14 Nov 2019 02:12:31 -0300
Message-Id: <20191114051242.14651-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds the Rockchip Image Signal Processing Unit v1 driver to
staging.

The main reason to be in staging is that people are already using it from the
mailing list (including libcamera), and having it in mainline makes the workflow
easier. Also, it is easier for other people to contribute back (with code
or testing the driver).

We plan to actively work on this driver to get it our of staging.

This patchset is also available at:
https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v11

Libcamera patched to work with this version:
https://gitlab.collabora.com/koike/libcamera
(also sent to the mailing list)

The major difference in v11 are:
- Fixed compiling warnings found with W=1
- Fixed checkpatch errors
- Add clock-names values in dt-bindings

This series only touches MAINTAINERS file and drivers/staging/

MAINTAINERS
drivers/staging/media/Kconfig
drivers/staging/media/Makefile
drivers/staging/media/phy-rockchip-dphy/Kconfig
drivers/staging/media/phy-rockchip-dphy/Makefile
drivers/staging/media/phy-rockchip-dphy/TODO
drivers/staging/media/phy-rockchip-dphy/phy-rockchip-dphy.c
drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.txt
drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
drivers/staging/media/rkisp1/Kconfig
drivers/staging/media/rkisp1/Makefile
drivers/staging/media/rkisp1/TODO
drivers/staging/media/rkisp1/capture.c
drivers/staging/media/rkisp1/capture.h
drivers/staging/media/rkisp1/common.h
drivers/staging/media/rkisp1/dev.c
drivers/staging/media/rkisp1/dev.h
drivers/staging/media/rkisp1/isp_params.c
drivers/staging/media/rkisp1/isp_params.h
drivers/staging/media/rkisp1/isp_stats.c
drivers/staging/media/rkisp1/isp_stats.h
drivers/staging/media/rkisp1/regs.c
drivers/staging/media/rkisp1/regs.h
drivers/staging/media/rkisp1/rkisp1.c
drivers/staging/media/rkisp1/rkisp1.h
drivers/staging/media/rkisp1/uapi/rkisp1-config.h

Two drivers were added, including a TODO list for removing it from
staging:

* phy-rockchip-dphy: mipi dphy driver used by csi
* rkisp1: the image signal processing unit driver

Thanks
Helen

Changes in v11:
dphy
- fix checkpatch errors
- fix checkpatch errors
rkisp1
- Fix compiling warnings
- Fix checkpatch errors
stats
- fix compiling warnings
- fix checkpatch errors
params
- fix compiling warnings
- fix checkpatch errors
capture
- fix checkpatch errors
dev
- fix checkpatch erros
dt-bidings:
- add clock-names values

Helen Koike (1):
  MAINTAINERS: add entry for Rockchip ISP1 driver

Jacob Chen (9):
  media: staging: phy-rockchip-dphy: add Rockchip MIPI Synopsys DPHY
    driver
  media: staging: rkisp1: add document for rkisp1 meta buffer format
  media: staging: rkisp1: add Rockchip ISP1 subdev driver
  media: staging: rkisp1: add ISP1 statistics driver
  media: staging: rkisp1: add ISP1 params driver
  media: staging: rkisp1: add capture device driver
  media: staging: rkisp1: add rockchip isp1 core driver
  media: staging: dt-bindings: Document the Rockchip ISP1 bindings
  media: staging: dt-bindings: Document the Rockchip MIPI RX D-PHY
    bindings

Jeffy Chen (1):
  media: staging: rkisp1: add user space ABI definitions

 MAINTAINERS                                   |    6 +
 drivers/staging/media/Kconfig                 |    4 +
 drivers/staging/media/Makefile                |    2 +
 .../staging/media/phy-rockchip-dphy/Kconfig   |   11 +
 .../staging/media/phy-rockchip-dphy/Makefile  |    2 +
 drivers/staging/media/phy-rockchip-dphy/TODO  |    6 +
 .../phy-rockchip-dphy/phy-rockchip-dphy.c     |  401 ++++
 .../bindings/media/rockchip-isp1.txt          |   77 +
 .../bindings/media/rockchip-mipi-dphy.txt     |   38 +
 .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    |   23 +
 .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      |   22 +
 drivers/staging/media/rkisp1/Kconfig          |   13 +
 drivers/staging/media/rkisp1/Makefile         |    7 +
 drivers/staging/media/rkisp1/TODO             |   23 +
 drivers/staging/media/rkisp1/capture.c        | 1871 +++++++++++++++++
 drivers/staging/media/rkisp1/capture.h        |  164 ++
 drivers/staging/media/rkisp1/common.h         |   98 +
 drivers/staging/media/rkisp1/dev.c            |  439 ++++
 drivers/staging/media/rkisp1/dev.h            |   67 +
 drivers/staging/media/rkisp1/isp_params.c     | 1586 ++++++++++++++
 drivers/staging/media/rkisp1/isp_params.h     |   50 +
 drivers/staging/media/rkisp1/isp_stats.c      |  495 +++++
 drivers/staging/media/rkisp1/isp_stats.h      |   60 +
 drivers/staging/media/rkisp1/regs.c           |  224 ++
 drivers/staging/media/rkisp1/regs.h           | 1525 ++++++++++++++
 drivers/staging/media/rkisp1/rkisp1.c         | 1243 +++++++++++
 drivers/staging/media/rkisp1/rkisp1.h         |   97 +
 .../staging/media/rkisp1/uapi/rkisp1-config.h |  819 ++++++++
 28 files changed, 9373 insertions(+)
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/Kconfig
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/Makefile
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/TODO
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/phy-rockchip-dphy.c
 create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.txt
 create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
 create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
 create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
 create mode 100644 drivers/staging/media/rkisp1/Kconfig
 create mode 100644 drivers/staging/media/rkisp1/Makefile
 create mode 100644 drivers/staging/media/rkisp1/TODO
 create mode 100644 drivers/staging/media/rkisp1/capture.c
 create mode 100644 drivers/staging/media/rkisp1/capture.h
 create mode 100644 drivers/staging/media/rkisp1/common.h
 create mode 100644 drivers/staging/media/rkisp1/dev.c
 create mode 100644 drivers/staging/media/rkisp1/dev.h
 create mode 100644 drivers/staging/media/rkisp1/isp_params.c
 create mode 100644 drivers/staging/media/rkisp1/isp_params.h
 create mode 100644 drivers/staging/media/rkisp1/isp_stats.c
 create mode 100644 drivers/staging/media/rkisp1/isp_stats.h
 create mode 100644 drivers/staging/media/rkisp1/regs.c
 create mode 100644 drivers/staging/media/rkisp1/regs.h
 create mode 100644 drivers/staging/media/rkisp1/rkisp1.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1.h
 create mode 100644 drivers/staging/media/rkisp1/uapi/rkisp1-config.h

-- 
2.22.0

