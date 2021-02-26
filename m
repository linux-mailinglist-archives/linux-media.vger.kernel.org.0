Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0329A325FBC
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 10:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhBZJMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 04:12:51 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54066 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbhBZJMX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 04:12:23 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:297a:447b:deb4:3f5c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 44E421F464C8;
        Fri, 26 Feb 2021 09:11:36 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, benjamin.gaignard@collabora.com
Subject: [PATCH v2 0/5] Reset driver for IMX8MQ VPU hardware block
Date:   Fri, 26 Feb 2021 10:11:23 +0100
Message-Id: <20210226091128.14379-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The two VPUs inside IMX8MQ share the same control block which can be see
as a reset hardware block.
In order to be able to add the second VPU (for HECV decoding) it will be
more handy if the both VPU drivers instance don't have to share the
control block registers. This lead to implement it as an independ reset 
driver and to change the VPU driver to use it.

Please note that this series break the compatibility between the DTB and
kernel. This break is limited to IMX8MQ SoC and is done when the driver
is still in staging directory.

version 2:
- Document the change in VPU bindings

Benjamin Gaignard (5):
  dt-bindings: reset: IMX8MQ VPU reset
  dt-bindings: media: IMX8MQ VPU: document reset usage
  reset: Add reset driver for IMX8MQ VPU block
  media: hantro: Use reset driver
  arm64: dts: imx8mq: Use reset driver for VPU hardware block

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  11 +-
 .../bindings/reset/fsl,imx8mq-vpu-reset.yaml  |  54 ++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  31 +++-
 drivers/reset/Kconfig                         |   8 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-imx8mq-vpu.c              | 169 ++++++++++++++++++
 drivers/staging/media/hantro/Kconfig          |   1 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  61 ++-----
 include/dt-bindings/reset/imx8mq-vpu-reset.h  |  16 ++
 9 files changed, 293 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml
 create mode 100644 drivers/reset/reset-imx8mq-vpu.c
 create mode 100644 include/dt-bindings/reset/imx8mq-vpu-reset.h

-- 
2.25.1

