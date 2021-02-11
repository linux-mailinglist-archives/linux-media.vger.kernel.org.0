Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABA13189E6
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 12:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbhBKLyA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 06:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhBKLu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 06:50:57 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEFEC061756;
        Thu, 11 Feb 2021 03:50:16 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:94f7:2542:9eb3:b5ba])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D64311F40F2D;
        Thu, 11 Feb 2021 11:50:12 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, benjamin.gaignard@collabora.com
Subject: [PATCH 0/4] Reset driver for IMX8MQ VPU hardware block
Date:   Thu, 11 Feb 2021 12:49:59 +0100
Message-Id: <20210211115003.249367-1-benjamin.gaignard@collabora.com>
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

Benjamin Gaignard (4):
  dt-bindings: reset: IMX8MQ VPU reset
  reset: Add reset driver for IMX8MQ VPU block
  media: hantro: Use reset driver
  arm64: dts: imx8mq: Use reset driver for VPU hardware block

 .../bindings/reset/fsl,imx8mq-vpu-reset.yaml  |  54 ++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  31 +++-
 drivers/reset/Kconfig                         |   8 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-imx8mq-vpu.c              | 169 ++++++++++++++++++
 drivers/staging/media/hantro/Kconfig          |   1 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  61 ++-----
 include/dt-bindings/reset/imx8mq-vpu-reset.h  |  16 ++
 8 files changed, 285 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml
 create mode 100644 drivers/reset/reset-imx8mq-vpu.c
 create mode 100644 include/dt-bindings/reset/imx8mq-vpu-reset.h

-- 
2.25.1

