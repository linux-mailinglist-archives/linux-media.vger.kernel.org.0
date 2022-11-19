Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBFD0631143
	for <lists+linux-media@lfdr.de>; Sat, 19 Nov 2022 23:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbiKSWkF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Nov 2022 17:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbiKSWkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Nov 2022 17:40:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C408D18B2E
        for <linux-media@vger.kernel.org>; Sat, 19 Nov 2022 14:40:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05604749;
        Sat, 19 Nov 2022 23:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668897599;
        bh=l8fNoip1Z+vqLK40UgGkfAbWuF9UYwUlZxbXI0DNImI=;
        h=Date:From:To:Cc:Subject:From;
        b=frT1mF4kcVvNPvoWgr/8NwCFXmku/l9RoPsNHDMPyptbnBe5PjUOWLMbVwH+3/ppq
         4jSVFLrCLbbae0jTSxp1IvMfB/sO/fg4jdhRhedvI2J1hDNqBzmNWQ7X/qdhltYZfR
         oeCLIrDpziqjTSBQL/9w0uRreftZ9Aw+co4o4XgQ=
Date:   Sun, 20 Nov 2022 00:39:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [GIT PULL FOR v6.2] imx7-media-csi destaging & misc patches
Message-ID: <Y3lbLjxTe1P5TJsm@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 1e284ea984d3705e042b6b07469a66f1d43371e3:

  Merge git://linuxtv.org/sailus/media_tree into media_stage (2022-11-08 08:46:21 +0000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20221120

for you to fetch changes up to 5cffd1d3ac76accf990ad309d7dd1968d9b88a45:

  media: i2c: aptina-pll: Remove a useless include (2022-11-20 00:33:16 +0200)

I've included a small fix for aptina-pll which Sakari hasn't included in
any of his pull requests AFAIK. The rest doesn't requires special
explanations, there are a few small fixes to omap4iss and
imx7-media-csi, as well as destaging of the imx7-media-csi driver.

----------------------------------------------------------------
- Fast track queued buffers in imx7-media-csi
- Destage imx7-media-csi driver
- Small cleanups for omap4iss and aptina-pll

----------------------------------------------------------------
Christophe JAILLET (2):
      media: imx: imx7-media-csi: Remove a useless include
      media: i2c: aptina-pll: Remove a useless include

Ian Cowan (1):
      media: staging: omap4iss: remove cacheflush import

Laurent Pinchart (5):
      media: imx: imx7-media-csi: Move variable to loop scope
      media: imx: imx7-media-csi: Rename phys variables to dma_addr
      media: imx: imx7-media-csi: Clear BIT_MIPI_DOUBLE_CMPNT for <16b formats
      media: imx: Decouple imx8mq-mipi-csi2 from imx7-media-csi
      media: imx: Unstage the imx7-media-csi driver

Paul Elder (1):
      media: imx: imx7-media-csi: Add support for fast-tracking queued buffers

 MAINTAINERS                                        |   2 +-
 drivers/media/i2c/aptina-pll.c                     |   1 -
 drivers/media/platform/nxp/Kconfig                 |  13 ++
 drivers/media/platform/nxp/Makefile                |   1 +
 .../imx => media/platform/nxp}/imx7-media-csi.c    | 138 ++++++++++++++++++---
 drivers/staging/media/imx/Kconfig                  |  17 +--
 drivers/staging/media/imx/Makefile                 |   3 +-
 drivers/staging/media/imx/TODO                     |  29 -----
 drivers/staging/media/omap4iss/iss_video.c         |   2 -
 9 files changed, 145 insertions(+), 61 deletions(-)
 rename drivers/{staging/media/imx => media/platform/nxp}/imx7-media-csi.c (91%)

-- 
Regards,

Laurent Pinchart
