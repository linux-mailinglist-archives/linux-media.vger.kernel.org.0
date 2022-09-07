Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 798FD5B0DB5
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 22:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiIGUEq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 16:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiIGUEo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 16:04:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7C515712
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 13:04:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3898888;
        Wed,  7 Sep 2022 22:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662581080;
        bh=/8fo2MaHtWbhieDKNXc2NOszaoako+xYAmkpgfTIMLQ=;
        h=From:To:Cc:Subject:Date:From;
        b=iQtO+wpRJYAv66XyHg0E9cNoXL/uGxKFgKm1HL0tb7IHirusYEG4iuroF+A5OHYbj
         xTlO4bcLs2AxyNhjqsK9/lfuKlPxGiYm0g/Db1x9qSw5MzKhmWVpIczWCE2LXDhnYF
         O8xkCnUQeCS2t/8XLleBTfnGrJmKMGIQN8AKA9sw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 0/6] media: imx: imx7-media-csi: Destage driver
Date:   Wed,  7 Sep 2022 23:04:18 +0300
Message-Id: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series is the last step of the imx7-media-csi driver
destaging journey. Patch 1/6 starts by decoupling the imx7-media-csi and
imx8mq-mipi-csi2 drivers in Kconfig, and patch 2/6 performs the
destaging. Patches 3/6 to 6/6 then handle the low-hanging fruits of the
staging imx cleanup by dropping features that were only used by the
imx7-media-csi driver.

The patches apply on top of [1].

https://lore.kernel.org/linux-media/20220907191547.19255-1-laurent.pinchart@ideasonboard.com

Laurent Pinchart (6):
  media: imx: Decouple imx8mq-mipi-csi2 from imx7-media-csi
  media: imx: Unstage the imx7-media-csi driver
  staging: media: imx: Drop imx_media_subdev_bound()
  staging: media: imx: Drop IMX_MEDIA_GRP_ID_CSI
  staging: media: imx: Drop unused helper functions
  staging: media: imx: Make imx_media_of_add_csi() static

 MAINTAINERS                                   |  2 +-
 drivers/media/platform/nxp/Kconfig            | 13 ++++
 drivers/media/platform/nxp/Makefile           |  1 +
 .../platform/nxp}/imx7-media-csi.c            | 24 +++++++
 drivers/staging/media/imx/Kconfig             | 17 +++--
 drivers/staging/media/imx/Makefile            |  3 +-
 drivers/staging/media/imx/TODO                | 29 --------
 .../staging/media/imx/imx-media-dev-common.c  | 14 ----
 drivers/staging/media/imx/imx-media-of.c      |  5 +-
 drivers/staging/media/imx/imx-media-utils.c   | 68 -------------------
 drivers/staging/media/imx/imx-media.h         | 13 ----
 11 files changed, 52 insertions(+), 137 deletions(-)
 rename drivers/{staging/media/imx => media/platform/nxp}/imx7-media-csi.c (97%)

-- 
Regards,

Laurent Pinchart

