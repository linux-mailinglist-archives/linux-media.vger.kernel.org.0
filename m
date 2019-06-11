Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75FA43D69C
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 21:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407469AbfFKTVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 15:21:09 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:37574 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404789AbfFKTVI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 15:21:08 -0400
Received: from mailhost.synopsys.com (unknown [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 320AFC014E;
        Tue, 11 Jun 2019 19:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560280868; bh=zJxgoewnRS3428npvD4zrvQ1ZwW2ket2Gxy5yCj5CDY=;
        h=From:To:Cc:Subject:Date:From;
        b=AtWq7JBO/dTeSnt7uLt6+IbErp++i5RJeKjnmz9D6o9nNZqwrT9LJMe6HxBB9MWw7
         nHXSYY716giBXIKCfHNvVOfZ28YpCHNpd+TcY95dUn+uee5oO5h3CerYehQ9Ws9PEM
         vm/RiVgtA1xblQCZp/CCEi7g9f3NNyqiiSnG09+sjWZEOagELY/Q+sw6N/bJ/Lfx8W
         uPHV8GErKVZlL2ctI4BI/p8kVVmR8vDk06FJkdnRrNZZ9qWFL96LsBUAAPgWFwDsKw
         BwQ1PbYFVadppsuRa+tllYgoy/M4A9McxAUkQYRaXNN9WjRp/Jlo2ARuLVHgvuX4I8
         /0/0umjb/HPTQ==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
        by mailhost.synopsys.com (Postfix) with ESMTP id 245F0A022F;
        Tue, 11 Jun 2019 19:21:03 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by de02.synopsys.com (Postfix) with ESMTP id D16873F88F;
        Tue, 11 Jun 2019 21:21:03 +0200 (CEST)
From:   Luis Oliveira <Luis.Oliveira@synopsys.com>
To:     mchehab@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        robh@kernel.org, nicolas.ferre@microchip.com,
        paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [v4 0/6] platform: dwc: Adding DesignWare MIPI CSI-2 Host and D-PHY
Date:   Tue, 11 Jun 2019 21:20:49 +0200
Message-Id: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds support for Synopsys MIPI CSI-2 Host and MIPI D-PHY.
The patch series include support for initialization/configuration of the
DW MIPI CSI-2 controller and the DW MIPI D-PHY and both include a reference
platform driver and the option to use platform data. The optional sysfs
interface is used to re-configure the controller and the phy for
prototyping purposes.

This series also documents the dt-bindings needed for the platform drivers.
This will enable future SoCs to use this standard approach to Synopsys
DesignWare CSI-2 and D-PHY and hopefully create a more clean environment.

This series are following an old series submitted on v4.19.rc1 and are
result of all the feedback received, please check the changelog per patch.

This was applied in: https://git.linuxtv.org/media_tree.git

Luis Oliveira (6):
  dt-bindings: media: Document bindings for DW MIPI CSI-2 Host
  media: platform: dwc: Add MIPI CSI-2 controller driver
  media: platform: dwc: Add MIPI CSI-2 platform data
  dt-bindings: phy: Document the Synopsys MIPI DPHY Rx bindings
  media: platform: dwc: Add DW MIPI DPHY Rx driver
  media: platform: dwc: Add platform data support to D-Phy

 .../devicetree/bindings/media/snps,dw-csi.txt      |  41 ++
 .../devicetree/bindings/phy/snps,dw-dphy-rx.txt    |  29 +
 MAINTAINERS                                        |  11 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/dwc/Kconfig                 |  41 ++
 drivers/media/platform/dwc/Makefile                |  15 +
 drivers/media/platform/dwc/dw-csi-plat.c           | 516 +++++++++++++++++
 drivers/media/platform/dwc/dw-csi-plat.h           |  97 ++++
 drivers/media/platform/dwc/dw-csi-sysfs.c          | 624 +++++++++++++++++++++
 drivers/media/platform/dwc/dw-dphy-plat.c          | 224 ++++++++
 drivers/media/platform/dwc/dw-dphy-rx.c            | 611 ++++++++++++++++++++
 drivers/media/platform/dwc/dw-dphy-rx.h            | 212 +++++++
 drivers/media/platform/dwc/dw-dphy-sysfs.c         | 232 ++++++++
 drivers/media/platform/dwc/dw-mipi-csi.c           | 569 +++++++++++++++++++
 drivers/media/platform/dwc/dw-mipi-csi.h           | 287 ++++++++++
 include/media/dwc/dw-csi-data.h                    |  26 +
 include/media/dwc/dw-dphy-data.h                   |  32 ++
 include/media/dwc/dw-mipi-csi-pltfrm.h             | 104 ++++
 19 files changed, 3674 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-csi.txt
 create mode 100644 Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
 create mode 100644 drivers/media/platform/dwc/Kconfig
 create mode 100644 drivers/media/platform/dwc/Makefile
 create mode 100644 drivers/media/platform/dwc/dw-csi-plat.c
 create mode 100644 drivers/media/platform/dwc/dw-csi-plat.h
 create mode 100644 drivers/media/platform/dwc/dw-csi-sysfs.c
 create mode 100644 drivers/media/platform/dwc/dw-dphy-plat.c
 create mode 100644 drivers/media/platform/dwc/dw-dphy-rx.c
 create mode 100644 drivers/media/platform/dwc/dw-dphy-rx.h
 create mode 100644 drivers/media/platform/dwc/dw-dphy-sysfs.c
 create mode 100644 drivers/media/platform/dwc/dw-mipi-csi.c
 create mode 100644 drivers/media/platform/dwc/dw-mipi-csi.h
 create mode 100644 include/media/dwc/dw-csi-data.h
 create mode 100644 include/media/dwc/dw-dphy-data.h
 create mode 100644 include/media/dwc/dw-mipi-csi-pltfrm.h

-- 
2.7.4

