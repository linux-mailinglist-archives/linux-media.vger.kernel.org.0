Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4C667D287
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 18:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjAZRGR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 12:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjAZRGP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 12:06:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CAB59EE
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 09:06:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EF882B3;
        Thu, 26 Jan 2023 18:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674752767;
        bh=FlcoGWof9onn1qBOdfroYivCOvL0cQh2/y187duiPKo=;
        h=From:To:Cc:Subject:Date:From;
        b=DjGBU0yajW3lkgQZ02lWBrp3co179Yj2uxKzRhrLVXWfRaesQHerDPrp6qOtoupmL
         pEw9Z2dWGanWOMI9+/VzTVAvKdq8bwF2y+SX6WpUOo0mP7EJVd136ghaQzBhAvCvje
         gBPrWXNydavcBcfRCvYVirGenqcNeX8hkSA/gI78=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH v4 0/3] media: nxp: i.MX8 ISI driver
Date:   Thu, 26 Jan 2023 19:06:00 +0200
Message-Id: <20230126170603.11896-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds a new driver for the Imaging Sensor Interface,
an IP core found in various NXP i.MX8 SoCs, including the i.MX8MN and
the i.MX8MP.

This v4 addresses a review comment on the DT bindings, and adds an
example for the i.MX8MN integration (in 1/3).

Patch 2/3 is new and moves the bindings from using a 'ports' node with a
single 'port' to just a 'port' node for the i.MX8MN. I don't like it
much as it makes the bindings more complicated, but I can live with that
if there's no other option. I've kept the patch separate to show the
impact and make it easy to drop it if needed. I can squash it with 1/3
or keep it separate when sending a pull request, I don't mind either
way.

The driver, in patch 3/3, is unchanged.

Laurent Pinchart (3):
  dt-bindings: media: Add i.MX8 ISI DT bindings
  dt-bindings: media: imx8-isi: Use 'port' instead of 'ports' for
    i.MX8MN
  media: nxp: Add i.MX8 ISI driver

 .../bindings/media/nxp,imx8-isi.yaml          |  178 ++
 MAINTAINERS                                   |    7 +
 drivers/media/platform/nxp/Kconfig            |    2 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/imx8-isi/Kconfig   |   22 +
 drivers/media/platform/nxp/imx8-isi/Makefile  |    8 +
 .../platform/nxp/imx8-isi/imx8-isi-core.c     |  645 +++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     |  395 +++++
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  529 ++++++
 .../platform/nxp/imx8-isi/imx8-isi-debug.c    |  109 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-hw.c |  651 +++++++
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  858 ++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  867 ++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-regs.h     |  418 +++++
 .../platform/nxp/imx8-isi/imx8-isi-video.c    | 1512 +++++++++++++++++
 15 files changed, 6202 insertions(+)
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

-- 
Regards,

Laurent Pinchart

