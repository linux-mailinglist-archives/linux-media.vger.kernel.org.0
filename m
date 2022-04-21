Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B77DB50AB10
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 23:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442272AbiDUWAl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 18:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442269AbiDUWAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 18:00:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 787484EA1C
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 14:57:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7B24492;
        Thu, 21 Apr 2022 23:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650578266;
        bh=E4DtSGhm5KeJjIL6VlsFXH2qK69AKiycL3vJBGXy3uw=;
        h=Date:From:To:Cc:Subject:From;
        b=sEuNCHxN5TwCvip0NTx7iWLMJ/6Rk+oSRALzsMwXdtqPEpDPQh85vlh4yu62iDJJF
         KwEmnV8udfXd7e9MieLMrEIKNBEA+ywaAoBjTGvl6IDgCIXpQCLXfweW5CeYDwrMu/
         JUfESzzamV59GXa5JIrPw2gvE0q7omPK30OwM/as=
Date:   Fri, 22 Apr 2022 00:57:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [GIT PULL FOR v5.19] imx-mipi-csis improvements
Message-ID: <YmHTWoXzK4xfk94B@pendragon.ideasonboard.com>
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

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220422

for you to fetch changes up to 90fddde6077ae9644b6765c2f8817977317265eb:

  media: imx: imx-mipi-csis: Fix active format initialization on source pad (2022-04-22 00:49:22 +0300)

----------------------------------------------------------------
imx-mipi-csis driver improvements

----------------------------------------------------------------
Jacopo Mondi (3):
      media: imx: imx-mipi-csis: Simplify mipi_csis_s_stream()
      media: imx: imx-mipi-csis: Drop powered flag
      media: imx: imx-mipi-csis: Protect mipi_csis_dump_regs()

Laurent Pinchart (6):
      media: imx: imx-mipi-csis: Rename csi_state to mipi_csis_device
      media: imx: imx-mipi-csis: Don't use .s_power()
      media: imx: imx-mipi-csis: Drop unneeded system PM implementation
      media: imx: imx-mipi-csis: Don't stop streaming at runtime suspend time
      media: imx: imx-mipi-csis: Simplify runtime PM implementation
      media: imx: imx-mipi-csis: Fix active format initialization on source pad

 drivers/media/platform/nxp/imx-mipi-csis.c | 677 +++++++++++++----------------
 1 file changed, 313 insertions(+), 364 deletions(-)

-- 
Regards,

Laurent Pinchart
