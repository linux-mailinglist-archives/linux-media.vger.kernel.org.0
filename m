Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1995834BA56
	for <lists+linux-media@lfdr.de>; Sun, 28 Mar 2021 03:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbhC1BVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 21:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhC1BUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 21:20:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1614DC0613B1
        for <linux-media@vger.kernel.org>; Sat, 27 Mar 2021 18:20:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B62A0527
        for <linux-media@vger.kernel.org>; Sun, 28 Mar 2021 03:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616894426;
        bh=aQY2QtOa2iVTpfKEqvQfrJCzn74lCWpRKAzNrZMmoSc=;
        h=Date:From:To:Subject:From;
        b=b61NLPeWGK+ACkGrO7qQcrwKj105VHjKCbVnruRMadr8muzfVJ4ASnfJMkQJUYziA
         EFT87N6lpAwEA1tgC+B89l9t2seUADw/o4EjoOr/RzHiWRVIgrDSORI+dtXV5X8Dpr
         dI9UaeFk//+5iQZ4m0vYaZSQIN/L86nANKeBSizk=
Date:   Sun, 28 Mar 2021 04:19:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.13] Miscellaneous changes
Message-ID: <YF/Zr/HtUaKH3EKA@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 97b34809ec240d82c82af97626c2071a4062e0e6:

  media: staging: atomisp: reduce kernel stack usage (2021-03-23 16:55:52 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20210328

for you to fetch changes up to ce2d205a0f09353f1d6e8b861f14012218ad426f:

  media: dt-bindings: media: renesas,drif: Add r8a77965 support (2021-03-28 02:54:17 +0200)

----------------------------------------------------------------
Misc changes for v5.13 (uvcvideo, i.MX7 and R-Car DRIF)

----------------------------------------------------------------
Fabrizio Castro (4):
      MAINTAINERS: Update MAINTAINERS for Renesas DRIF driver
      media: dt-bindings: media: renesas,drif: Convert to json-schema
      media: dt-bindings: media: renesas,drif: Add r8a77990 support
      media: dt-bindings: media: renesas,drif: Add r8a77965 support

Laurent Pinchart (9):
      dt-bindings: media: nxp,imx7-mipi-csi2: Drop the reset-names property
      dt-bindings: media: nxp,imx7-mipi-csi2: Drop fsl,csis-hs-settle property
      dt-bindings: media: nxp,imx7-mipi-csi2: Indent example with 4 spaces
      dt-bindings: media: nxp,imx7-mipi-csi2: Expand descriptions
      media: imx: imx7_mipi_csis: Runtime suspend in .s_stream() error path
      media: imx: imx7_mipi_csis: Don't take state->lock in .link_setup()
      media: imx: imx7_mipi_csis: Ensure pads are connected
      media: uvcvideo: Fix XU id print in forward scan
      media: uvcvideo: Support devices that report an OT as an entity source

 .../bindings/media/nxp,imx7-mipi-csi2.yaml         |  94 ++++---
 .../devicetree/bindings/media/renesas,drif.txt     | 177 -------------
 .../devicetree/bindings/media/renesas,drif.yaml    | 279 +++++++++++++++++++++
 MAINTAINERS                                        |   4 +-
 drivers/media/usb/uvc/uvc_driver.c                 |  34 ++-
 drivers/staging/media/imx/imx7-mipi-csis.c         |  27 +-
 6 files changed, 371 insertions(+), 244 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.yaml

-- 
Regards,

Laurent Pinchart
