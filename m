Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4FA4B5A23
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 19:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236590AbiBNSmq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 13:42:46 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234397AbiBNSmp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 13:42:45 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E3D6A038
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 10:42:29 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id AB65D1C0003;
        Mon, 14 Feb 2022 18:42:15 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com, alexander.stein@ew.tq-group.com,
        dorota.czaplejewicz@puri.sm
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 0/8] media: imx: Destage imx7-mipi-csis with fixes on top
Date:   Mon, 14 Feb 2022 19:43:10 +0100
Message-Id: <20220214184318.409208-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  this series includes patches from two series previously sent
https://lore.kernel.org/linux-media/20220119112024.11339-1-jacopo@jmondi.org/
https://lore.kernel.org/linux-media/20220211180216.290133-1-jacopo@jmondi.org/

Which can now be marked as superseded.

The first 2 patches performs the de-staging of the imx7-mipi-csis driver and
takes into account comments recevied there.

The rest of the series builds on top of the comment received on:
https://lore.kernel.org/linux-media/20220119112024.11339-3-jacopo@jmondi.org/

If DUAL pixel mode is used in the CSIS driver, then the CSI block of the IMX8MM
SoC needs to be operated in dual mode as well. To do so, create per-SoC
configurations in imx7-media-csi.c and only set dual mode for the MM model
leaving the other ones untouched as they connect to a different CSI-2 receiver
which instead operates in single mode.

I've only tested on i.MX8MP which is not affected by these changes, so I
hope I've not broke anything. Laurent could you test on MM to see if it works
now ?

On top two small patches I was carrying in my tree to add more formats to the
CSIS driver.

Series based on top of the most recent media master branch.

Thanks
  j

Jacopo Mondi (9):
  media: imx: De-stage imx7-mipi-csis
  media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
  staging: media: imx: Add more compatible strings
  staging: media: imx: Define per-SoC info
  staging: media: imx: Use DUAL pixel mode if available
  media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
  media: imx: imx-mipi-csis: Add RGB565_1X16
  media: imx: imx-mipi-csis: Add RGB/BGR888

 Documentation/admin-guide/media/imx7.rst      |  2 +-
 ...-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} |  2 +-
 .../bindings/media/nxp,imx7-csi.yaml          |  1 +
 MAINTAINERS                                   |  4 +-
 drivers/media/platform/Kconfig                |  1 +
 drivers/media/platform/Makefile               |  1 +
 drivers/media/platform/imx/Kconfig            | 24 +++++++++
 drivers/media/platform/imx/Makefile           |  1 +
 .../platform/imx/imx-mipi-csis.c}             | 44 ++++++++++++++--
 drivers/staging/media/imx/Makefile            |  1 -
 drivers/staging/media/imx/imx-media.h         | 44 ++++++++++++++++
 drivers/staging/media/imx/imx7-media-csi.c    | 52 ++++++++++++++-----
 12 files changed, 153 insertions(+), 24 deletions(-)
 rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} (98%)
 create mode 100644 drivers/media/platform/imx/Kconfig
 create mode 100644 drivers/media/platform/imx/Makefile
 rename drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c} (97%)

--
2.35.0

