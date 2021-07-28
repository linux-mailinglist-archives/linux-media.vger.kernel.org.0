Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9498C3D8ECC
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 15:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235942AbhG1NRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 09:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234771AbhG1NRg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 09:17:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDF2C061757
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 06:17:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 737F43F
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 15:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627478250;
        bh=4AnwR2q/5XOhLQ/qGDlV9vxI3zd7sWaLwEr1WJO/J3o=;
        h=Date:From:To:Subject:From;
        b=RHIUDxjI14f6d24DWsMl1Wn0k3I2gC9+KRmNluiDKbwGE486h8td+DchjSxBoGCTE
         /YFsErQwMRI0GD9QNSwk6ea8PwvY90cnQ+sQFefzEbX61pUSjbzgIFFKvZk2zphcfm
         vN4jN+UMO1LehYhhs1/V/wFsNQdqSiBdhCF6KEy4=
Date:   Wed, 28 Jul 2021 16:17:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.15] i.MX8 improvements
Message-ID: <YQFY5FS8v3Y3KkEA@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/imx-20210728

for you to fetch changes up to bd767a962ee67b92c180c9d18f48e462d98e1746:

  media: imx: add a driver for i.MX8MQ mipi csi rx phy and controller (2021-07-28 16:09:45 +0300)

----------------------------------------------------------------
- i.MX8MM support in the imx7-media-csi driver
- i.MX8MQ CSI-2 receiver driver
- Miscellaneous imx7-mipi-csis fix

----------------------------------------------------------------
Laurent Pinchart (4):
      dt-bindings: media: nxp,imx7-csi: Add i.MX8MM support
      media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR for >= 10-bit formats
      media: imx: imx7-media-csi: Don't set PIXEL_BIT in CSICR1
      media: imx: imx7-media-csi: Fix buffer return upon stream start failure

Martin Kepplinger (2):
      dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller
      media: imx: add a driver for i.MX8MQ mipi csi rx phy and controller

Tom Rix (1):
      media: imx: imx7_mipi_csis: convert some switch cases to the default

 .../devicetree/bindings/media/nxp,imx7-csi.yaml    |  12 +-
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 174 ++++
 drivers/staging/media/imx/Makefile                 |   1 +
 drivers/staging/media/imx/imx7-media-csi.c         |  36 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   6 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c       | 991 +++++++++++++++++++++
 6 files changed, 1190 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
 create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c

-- 
Regards,

Laurent Pinchart
