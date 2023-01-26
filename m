Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B8A67C1B8
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 01:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236240AbjAZAdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 19:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236228AbjAZAda (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 19:33:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3BB457FE
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 16:33:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EC162B3;
        Thu, 26 Jan 2023 01:33:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674693205;
        bh=VhnBOMGlDxnqfDQDklgpidOqZtp8jGbkfFshSlWpwms=;
        h=From:To:Cc:Subject:Date:From;
        b=Bs/5Qo+PPaFEgii6JqAlU0yxjqKcPE5dY4hYjHE3QBuDC/jwBEE46UQIL9TzgLWdn
         fBDbx9HCbnB2p4d/N0/icpCgQ8Ko3X/H7g6hgEuW+yxWaLv3FY4OHN0Kyqbus05jax
         o/0GQhTHRSKHFawQLBfmo245dMk6OsbeHWTH1Gqs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH v3 0/2] media: nxp: i.MX8 ISI driver
Date:   Thu, 26 Jan 2023 02:33:18 +0200
Message-Id: <20230126003320.10047-1-laurent.pinchart@ideasonboard.com>
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

This v3 addresses all review comments on the DT bindings, and is
otherwise mostly a rebase with small cosmetic changes to the driver. The
last merge blocker is the review of the DT bindings, as the V4L2 streams
API has been merged in the Linux media tree for v6.3. If the bindings
can be reviewed in time, I'll send a pull request for the ISI driver for
v6.3 as well.

Laurent Pinchart (2):
  dt-bindings: media: Add i.MX8 ISI DT bindings
  media: nxp: Add i.MX8 ISI driver

 .../bindings/media/nxp,imx8-isi.yaml          |  152 ++
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
 15 files changed, 6176 insertions(+)
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

