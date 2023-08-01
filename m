Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9807576C035
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 00:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbjHAWLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 18:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbjHAWLM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 18:11:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C67212C
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 15:11:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 190D45A4
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 00:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690927803;
        bh=4OSPoVk/OrB7CepCPif4xDO3BsYLWPdFHVkk3KZrP4w=;
        h=Date:From:To:Subject:From;
        b=KFXhCw3/ZOW0ElJTqs9DB5Ky2fiP7XVjH5HH+3OwPJXXrcO9leWHnC42AIoY34Qai
         BbdwPDehL4/QRe3YplE/i1crPdly9p3yLdFGmKU5+g57xUPsKGazdY7jARtKHL5QOr
         HNhpxaVH9wmyJEV+zqzgWkebz7v7wTV2Lmg1MgNw=
Date:   Wed, 2 Aug 2023 01:11:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.6] media: NXP miscellaneous changes
Message-ID: <20230801221112.GB31500@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 60a25e001759c90f35e2e7704f3e8b0d4fb10f96:

  media: atomisp: Fix me->stages error checking in sh_css_sp_init_pipeline() (2023-07-31 11:39:28 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-next-imx-20230802

for you to fetch changes up to 0e217f58c7c9a4a881c69c56ec4a85c623a54682:

  media: imx: imx7-media-csi: Fix frame sizes enumeration (2023-08-02 01:08:19 +0300)

----------------------------------------------------------------
Miscellaneous changes for NXP media drivers

----------------------------------------------------------------
Guoniu.zhou (3):
      media: dt-bindings: nxp,imx8-isi: Add i.MX93 ISI compatible string
      media: nxp: imx8-isi: Move i.MX8 gasket configuration to an ops structure
      media: nxp: imx8-isi: Add ISI support for i.MX93

Laurent Pinchart (3):
      staging: media: imx: Merge VIDEO_IMX_CSI into VIDEO_IMX_MEDIA
      arm64: defconfig: Drop CONFIG_VIDEO_IMX_MEDIA
      media: imx: imx7-media-csi: Fix frame sizes enumeration

Lukas Bulwahn (1):
      MAINTAINERS: correct file entry in MEDIA DRIVERS FOR FREESCALE IMX7/8

Ruan Jinjie (1):
      media: nxp: Remove redundant dev_err()

Yang Yingliang (1):
      media: nxp: Fix wrong return pointer check in mxc_isi_crossbar_init()

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  5 +-
 MAINTAINERS                                        |  2 +-
 arch/arm64/configs/defconfig                       |  1 -
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  1 -
 drivers/media/platform/nxp/imx7-media-csi.c        | 14 ++--
 drivers/media/platform/nxp/imx8-isi/Makefile       |  4 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 21 +++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    | 14 +++-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 38 ++--------
 .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 85 ++++++++++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  1 -
 drivers/staging/media/imx/Kconfig                  | 17 +----
 drivers/staging/media/imx/Makefile                 |  7 +-
 13 files changed, 144 insertions(+), 66 deletions(-)
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c

-- 
Regards,

Laurent Pinchart
