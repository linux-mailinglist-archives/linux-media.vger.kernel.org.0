Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8B518CE7C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 14:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgCTNNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 09:13:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51781 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgCTNNB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 09:13:01 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jFHSO-0001XK-3z; Fri, 20 Mar 2020 14:13:00 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: [PATCH v6 0/4] Add initial i.MX8MQ support
Date:   Fri, 20 Mar 2020 14:12:52 +0100
Message-Id: <20200320131256.23294-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the i.MX8MQ decoders in active use and the i.MX8MM power domain
support still up in the air, I think it makes sense to merge i.MX8MQ
Hantro support now and accept that i.MX8MM may or may not require
different bindings.

Patch 4 depends on [2] for the MAINTAINERS change.

Changes since v5 [1]:
 - Drop merged patches
 - Drop i.MX8MM bindings
 - Change example node name to video-codec
 - Convert i.MX8MQ bindings to YAML
 - Drop i.MX8MM support
 - Rebase onto media/master
 - Enable h.264 and VP8 decoding
 - Enable post-processing

[1] https://lore.kernel.org/linux-media/20190612093915.18973-1-p.zabel@pengutronix.de
[2] https://lore.kernel.org/linux-media/20200318132108.21873-9-ezequiel@collabora.com

regards
Philipp

Philipp Zabel (4):
  media: dt-bindings: Document i.MX8MQ VPU bindings
  media: hantro: add initial i.MX8MQ support
  arm64: dts: imx8mq: enable Hantro G1/G2 VPU
  media: MAINTAINERS: add myself to co-maintain Hantro G1/G2 for i.MX8MQ

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  77 ++++++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  27 +++
 drivers/staging/media/hantro/Kconfig          |  16 +-
 drivers/staging/media/hantro/Makefile         |   3 +
 drivers/staging/media/hantro/hantro_drv.c     |   3 +
 drivers/staging/media/hantro/hantro_hw.h      |   1 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c   | 220 ++++++++++++++++++
 8 files changed, 345 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
 create mode 100644 drivers/staging/media/hantro/imx8m_vpu_hw.c

-- 
2.20.1

