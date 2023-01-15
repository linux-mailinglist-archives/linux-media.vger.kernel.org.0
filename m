Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A329766B218
	for <lists+linux-media@lfdr.de>; Sun, 15 Jan 2023 16:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjAOPcR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 10:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjAOPcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 10:32:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B70EB478
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 07:32:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDCB5308
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 16:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673796731;
        bh=pqIPCRir+q/AbPby6BxKVY1clx+ZXqvPXkzRbWYgGmk=;
        h=Date:From:To:Subject:From;
        b=nguICSeRsrwWrwkdhDllTN5bXcGj/2fau73FBlAuyaPbetIsyJQbXyzYYFBafvYC/
         vTNYqYNPki4Lrx/VHayjvMnTo3eZ0P3HfGJCzqqNcq52MAFA8MK/EZRaHw+wuysGCl
         QKTiLHNMAAWPAU8TB8jjypWoKiGFXmsDXM959NGQ=
Date:   Sun, 15 Jan 2023 17:32:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.3] Miscellaneous changes
Message-ID: <Y8Qce6/DS49icJ71@pendragon.ideasonboard.com>
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

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git media-misc-next-20230115

for you to fetch changes up to d1c36bbb42d23742c1b17799749f637ed11ee98e:

  media: imx: imx7-media-csi: fix missing clk_disable_unprepare() in imx7_csi_init() (2023-01-15 17:31:01 +0200)

----------------------------------------------------------------
Miscellaneous changes to MC core and platform drivers

----------------------------------------------------------------
Gaosheng Cui (1):
      media: ti: cal: fix possible memory leak in cal_ctx_create()

Jiasheng Jiang (1):
      media: platform: ti: Add missing check for devm_regulator_get

Laurent Pinchart (1):
      media: mc: Improve the media_entity_has_pad_interdep() documentation

Marek Vasut (1):
      dt-bindings: media: imx7-csi: Document i.MX8M power-domains property

Miaoqian Lin (1):
      media: mc: entity: Fix doc for media_graph_walk_init

Xavier Roumegue (1):
      media: dw100: Add a missing unwind goto in dw100_probe()

Yang Yingliang (1):
      media: imx: imx7-media-csi: fix missing clk_disable_unprepare() in imx7_csi_init()

 .../devicetree/bindings/media/nxp,imx7-csi.yaml         | 15 +++++++++++++++
 drivers/media/mc/mc-entity.c                            | 17 +++++++++++++++--
 drivers/media/platform/nxp/dw100/dw100.c                |  2 +-
 drivers/media/platform/nxp/imx7-media-csi.c             |  4 +++-
 drivers/media/platform/ti/cal/cal.c                     |  4 +++-
 drivers/media/platform/ti/omap3isp/isp.c                |  9 +++++++++
 include/media/media-entity.h                            |  4 +++-
 7 files changed, 49 insertions(+), 6 deletions(-)

-- 
Regards,

Laurent Pinchart
