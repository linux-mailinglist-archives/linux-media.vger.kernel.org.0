Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A97D6E322C
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 17:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjDOP40 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 11:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjDOP4Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 11:56:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAAA30E3
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 08:56:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D73E59C;
        Sat, 15 Apr 2023 17:56:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681574177;
        bh=u1FKRFePmYTBCprAvt80AlE4NYu89QhD+CS8A8K6W+g=;
        h=From:To:Cc:Subject:Date:From;
        b=Bkr57XVF0SpPpUp6og1hgsmqGPTA+p2bzXo3MD1la2nPFL++ARcEjzU9ojZek069E
         wtAP+M6tDEaIX9/Mst64YRr37wqbWMzCo4Hxe+Ro1BLZsTlwM1SKjrtmPCewDEbn4Z
         N8ogpDNlvbS7ORkXLYIiJxWEWPS9H1OD7Vg+rPWQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH v5 0/5] media: nxp: i.MX8 ISI driver
Date:   Sat, 15 Apr 2023 18:56:25 +0300
Message-Id: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds a new driver for the Imaging Sensor Interface,
an IP core found in various NXP i.MX8 SoCs, including the i.MX8MN and
the i.MX8MP.

This v5 adds three patches on top of the previous version to address
small issues. Patches 1/5 and 2/5 are unchanged compared to v4.

Jacopo Mondi (1):
  media: nxp: imx8-isi: Remove 300ms sleep after enabling channel

Laurent Pinchart (4):
  dt-bindings: media: Add i.MX8 ISI DT bindings
  media: nxp: Add i.MX8 ISI driver
  media: nxp: imx8-isi: Drop partial support for i.MX8QM and i.MX8QXP
  media: nxp: imx8-isi: Replace udelay() with fsleep()

 .../bindings/media/nxp,imx8-isi.yaml          |  173 ++
 MAINTAINERS                                   |    7 +
 drivers/media/platform/nxp/Kconfig            |    2 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/imx8-isi/Kconfig   |   22 +
 drivers/media/platform/nxp/imx8-isi/Makefile  |    8 +
 .../platform/nxp/imx8-isi/imx8-isi-core.c     |  539 ++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     |  394 +++++
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  529 ++++++
 .../platform/nxp/imx8-isi/imx8-isi-debug.c    |  109 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-hw.c |  650 +++++++
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  858 ++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  867 ++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-regs.h     |  418 +++++
 .../platform/nxp/imx8-isi/imx8-isi-video.c    | 1512 +++++++++++++++++
 15 files changed, 6089 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
 create mode 100644 drivers/media/platform/nxp/imx8-isi/Kconfig
 create mode 100644 drivers/media/platform/nxp/imx8-isi/Makefile
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c


base-commit: 7e364e56293bb98cae1b55fd835f5991c4e96e7d
-- 
Regards,

Laurent Pinchart

