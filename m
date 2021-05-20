Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32AE38B3A3
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 17:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242354AbhETPtr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 11:49:47 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45102 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239281AbhETPtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 11:49:41 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4180EC06B1;
        Thu, 20 May 2021 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1621525699; bh=JJ/c8C+pVZi3N1FcrcVHTZLIqTQYdSRuR+1afrYIFGw=;
        h=From:To:Cc:Subject:Date:From;
        b=VW+NoEAhE2gzr7v5j322A51ERnLRwxg/N4JmSsF1YaF4ekEoKECAs7RjHJAjhzEzs
         cSWPGbxwEdfdn3TAvqPZR8uyWWJ8iih4toVHFzZYV50izel7VqL1vjAfYqa6iw0uIE
         ZnF83TM6BdCoCgghnoRMpHnB1VFjLdw+8Diz4lehULS1di3krGbzV+todKgx2xlcyz
         jmVObBwqLbCHi86EGHMiCLnZ74rUtV+aJFcTxZQUlc7Ia0i7phT8iFHuCvyFXIM8H1
         yy/hZFjJYIDb+akvgnQpcF7BEYQzFGaUQEl5MBwMiAlsQLhhCKOa1H1ACifZ+bmFJu
         Qgk95cLdGFH5Q==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id 3ED76A005C;
        Thu, 20 May 2021 15:48:17 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From:   Nelson Costa <Nelson.Costa@synopsys.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Nelson Costa <Nelson.Costa@synopsys.com>
Subject: [RFC v2 0/9] Add Synopsys DesignWare HDMI RX Controller and PHY drivers
Date:   Thu, 20 May 2021 17:47:54 +0200
Message-Id: <cover.1621524721.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series implements support for the Synopsys DesignWare HDMI RX Controller
and PHYs e405/e406 drivers, being compliant with standard HDMI 1.4 and
HDMI 2.0.

The Controller + PHY pipeline can be integrated into a fully featured
system that can be able to receive video up to 4k@60Hz with basic audio.

This solution is mainly composed by two modules: phy-dw-hdmi-e40x and
dw-hdmi-rx.

phy-dw-hdmi-e40x: it's the PHY (Physical Layer) driver that implements
support for Synopsys DesignWare e405 and e406 PHYs. It is responsible to
configure the PHY and equalize it for the best settings, in order to
receive and decode video to be delivered to the Controller.
This driver is integrated in the PHY subsystem.
The main features of this module are:
 - Equalizer algorithm that chooses the phy best settings
 according to the detected HDMI cable characteristics
 - Support for scrambling
 - Support for color depth up to 48bpp
 - Support for HDMI 2.0 modes up to 6G (HDMI 4k@60Hz).

dw-hdmi-rx: it's the Controller driver that implements support for
Synopsys DesignWare HDMI RX Controller. It is responsible to manage and
handle the PHY (through the PHY API) and the Controller configurations in
order to configure the video and audio pipeline.
This driver is implemented as a standard V4L2 subdevice.
The main features of this module are:
 - Support for scrambling
 - Support for color depth up to 48bpp
 - Support for HDMI 2.0 modes up to 6G (HDMI 4k@60Hz)
 - Support for RGB, YCC444, YCC422 and YCC420
 - Support for basic audio (LPCM 2ch, 32KHz/44.1KHz/48KHz, 16bit)
 - Support for Aspect Ratio
 - Support for CEC
 - Internal state machine that reconfigures phy and controller
 - JTAG communication with phy
 - Inter-module communication with phy driver:
   * through the PHY API using the phy reference "hdmi-phy"
   * through the callbacks that phy dwc driver needs.
 - Debug write/read ioctls

NOTES: This patch series has two specific patches (Patch [4/8] and [7/8])
one for the PHY API and the other for v4l2-dv-timings.

Patch [4/8] adds phy standard HDMI opts to the phy API that contributes
for the PHY subsystem, which allows to integrate the PHY driver in the
PHY subsystem using this new HDMI opts structure, because there are hdmi
options that are needed to pass between the Controller and PHY drivers
using the standard API.

Patch [7/8] adds more CEA/CTA-861 video format timings that contributes
to the v4l2 media subsystem, which in our case is needed to provide
information about the Aspect Ratio.

version 2:
 - The original media Device Tree bindings was divided in two independent
  Device Trees:
  * Device tree for PHYs e405/e406 in PHY dt bindings
  * Device tree for HDMI RX Controller in media dt bindings
 - Add OF graph ports connection model in the Device Trees
  (Thanks to Laurent Pinchart <laurent.pinchart@ideasonboard.com>)
 - The HDMI RX Controller was adjusted in order to work with the new
  Device Trees Model:
  * the "input-count" field was removed from original Device Tree and now
  the count is done based on port child count.
  * Changed the way to get the phy node, removing the dependency as child
  node of Controller node
 - Fix reported kernel test robot issues:
  * Fix "warning: no previous prototype for 'dw_phy_eq_settings'"
  * Fix "warning: integer literal is too large to be represented in type
  'long', interpreting as 'unsigned long' per C89; this literal will have
  type 'long long' in C99 onwards [-Wc99-compat]"
  Reported-by: kernel test robot <lkp@intel.com>
 - Fix phy power off/on issue when the system startups without the cable
  connected.
 - Fix "CHECK: Comparison to NULL could be written
  "of_device_get_match_data""

Nelson Costa (9):
  dt-bindings: phy: Document Synopsys DesignWare HDMI RX PHYs e405 and
    e406
  dt-bindings: media: Document Synopsys DesignWare HDMI RX
  MAINTAINERS: Add entry for Synopsys DesignWare HDMI drivers
  phy: Add PHY standard HDMI opts to the PHY API
  phy: dwc: Add Synopsys DesignWare HDMI RX PHYs e405 and e406 Driver
  media: platform: Add Synopsys DesignWare HDMI RX Controller Driver
  media: v4l2-dv-timings: Add more CEA/CTA-861 video format timings
  media: dwc: dw-hdmi-rx: Add support for Aspect Ratio
  media: dwc: dw-hdmi-rx: Add support for CEC

 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml |   98 +
 .../bindings/phy/snps,phy-dw-hdmi-e40x.yaml        |   93 +
 MAINTAINERS                                        |   11 +
 drivers/media/platform/Kconfig                     |    2 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/dwc/Kconfig                 |   20 +
 drivers/media/platform/dwc/Makefile                |    3 +
 drivers/media/platform/dwc/dw-hdmi-rx.c            | 3542 ++++++++++++++++++++
 drivers/media/platform/dwc/dw-hdmi-rx.h            |  533 +++
 drivers/media/v4l2-core/v4l2-dv-timings.c          |  139 +
 drivers/phy/Kconfig                                |    1 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/dwc/Kconfig                            |   20 +
 drivers/phy/dwc/Makefile                           |    9 +
 drivers/phy/dwc/phy-dw-hdmi-e405.c                 |  497 +++
 drivers/phy/dwc/phy-dw-hdmi-e406.c                 |  475 +++
 drivers/phy/dwc/phy-dw-hdmi-e40x-core.c            |  514 +++
 drivers/phy/dwc/phy-dw-hdmi-e40x.h                 |  219 ++
 include/linux/phy/dwc/dw-hdmi-phy-pdata.h          |   73 +
 include/linux/phy/phy-hdmi.h                       |  102 +
 include/linux/phy/phy.h                            |    7 +-
 include/media/dwc/dw-hdmi-rx-pdata.h               |  126 +
 include/uapi/linux/v4l2-dv-timings.h               | 1595 ++++++++-
 23 files changed, 8079 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/snps,phy-dw-hdmi-e40x.yaml
 create mode 100644 drivers/media/platform/dwc/Kconfig
 create mode 100644 drivers/media/platform/dwc/Makefile
 create mode 100644 drivers/media/platform/dwc/dw-hdmi-rx.c
 create mode 100644 drivers/media/platform/dwc/dw-hdmi-rx.h
 create mode 100644 drivers/phy/dwc/Kconfig
 create mode 100644 drivers/phy/dwc/Makefile
 create mode 100644 drivers/phy/dwc/phy-dw-hdmi-e405.c
 create mode 100644 drivers/phy/dwc/phy-dw-hdmi-e406.c
 create mode 100644 drivers/phy/dwc/phy-dw-hdmi-e40x-core.c
 create mode 100644 drivers/phy/dwc/phy-dw-hdmi-e40x.h
 create mode 100644 include/linux/phy/dwc/dw-hdmi-phy-pdata.h
 create mode 100644 include/linux/phy/phy-hdmi.h
 create mode 100644 include/media/dwc/dw-hdmi-rx-pdata.h

-- 
2.7.4

