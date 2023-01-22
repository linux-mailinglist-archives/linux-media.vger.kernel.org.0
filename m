Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A206C676D58
	for <lists+linux-media@lfdr.de>; Sun, 22 Jan 2023 15:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjAVOAe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Jan 2023 09:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjAVOAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Jan 2023 09:00:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363131705
        for <linux-media@vger.kernel.org>; Sun, 22 Jan 2023 06:00:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23998308;
        Sun, 22 Jan 2023 15:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674396028;
        bh=g9IYiFnyzm3ASf7jrbhBTRF2YxZ1eQHBcIB/WHc2X2k=;
        h=Date:From:To:Cc:Subject:From;
        b=QNfetYzhCKu//2rk/pYFEPKh/2PL5cEvgiYDnqB4hwV/YubPp5MtfFJ/E2zaKVpl4
         oL4pD3Fh7fu5J6/PJWtUo9cho3cyrcOPG5p/ydXJWaW6ADiAU/kkWfE0Rs3qr/O+B6
         zHVAMrTm2dLXBWEfd5DpWpJdSqkNHkEFTVq61jcw=
Date:   Sun, 22 Jan 2023 16:00:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>
Subject: [GIT PULL FOR v6.3] imx-pxp changes
Message-ID: <Y81Bei35sg22l7X0@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-pxp-next-20230116

for you to fetch changes up to 835473dc06eb8143a43ebcf39e46fb4a8efcf286:

  media: imx-pxp: convert to regmap (2023-01-16 18:26:15 +0200)

----------------------------------------------------------------
imx-pxp driver changes:

- i.MX7D support
- Media controller support
- Frame size enumeration support
- Miscellaneous cleanups and fixes

----------------------------------------------------------------
Laurent Pinchart (7):
      media: imx-pxp: Sort headers alphabetically
      media: imx-pxp: Don't set bus_info manually in .querycap()
      media: imx-pxp: Add media controller support
      media: imx-pxp: Pass pixel format value to find_format()
      media: imx-pxp: Implement frame size enumeration
      media: imx-pxp: Introduce pxp_read() and pxp_write() wrappers
      media: imx-pxp: Use non-threaded IRQ

Michael Tretter (8):
      dt-bindings: media: fsl-pxp: convert to yaml
      media: imx-pxp: detect PXP version
      media: imx-pxp: extract helper function to setup data path
      media: imx-pxp: explicitly disable unused blocks
      media: imx-pxp: disable LUT block
      media: imx-pxp: make data_path_ctrl0 platform dependent
      media: imx-pxp: add support for i.MX7D
      media: imx-pxp: convert to regmap

 .../devicetree/bindings/media/fsl,imx6ull-pxp.yaml |  88 +++++
 .../devicetree/bindings/media/fsl-pxp.txt          |  26 --
 drivers/media/platform/nxp/imx-pxp.c               | 355 +++++++++++++++------
 3 files changed, 350 insertions(+), 119 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/fsl-pxp.txt

-- 
Regards,

Laurent Pinchart
