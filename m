Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00BC05A3ED3
	for <lists+linux-media@lfdr.de>; Sun, 28 Aug 2022 19:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiH1R2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 13:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiH1R2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 13:28:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A854E326ED
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 10:28:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F3CCE5
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 19:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661707687;
        bh=OZonb2YUE9MKGSuAYU4xNT5BboTd7GopR6sB44L0fOs=;
        h=Date:From:To:Subject:From;
        b=qCRcyFcXIeGJMtQoAbNeEVaamfT48yeBOHq8QLdzbWf83KDvRO4NnSjotWVy/Y32x
         hYmwRWhAT6d01kxqoJ9t1FgaSLEQsDPrewxIlWEeFIlQaezvjvBfAaRwP8/rlGn+33
         O7JahkfFPCIF7TEkF0WitLTUnSTbpKcd30LiEwks=
Date:   Sun, 28 Aug 2022 20:27:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.1] Misc fixes to NXP, TI and Xilinx platform drivers
Message-ID: <Ywuln1xotTNAvKCD@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220828

for you to fetch changes up to f52a8e3a3ab227bfad6d8cb3e006f0829e110c11:

  media: xilinx: vipp: Fix refcount leak in xvip_graph_dma_init (2022-08-28 20:25:42 +0300)

----------------------------------------------------------------
- Misc fixes to NXP, TI and Xilinx platform drivers

----------------------------------------------------------------
Miaoqian Lin (1):
      media: xilinx: vipp: Fix refcount leak in xvip_graph_dma_init

Petko Manolov (1):
      staging: media: imx: imx7-media-csi: Increase video mem limit

Slark Xiao (1):
      media: platform: ti: Fix typo 'the the' in comment

Volodymyr Kharuk (2):
      media: xilinx: csi2rxss: Add 1X12 greyscale format
      media: xilinx: video: Add 1X12 greyscale format

 drivers/media/platform/ti/davinci/vpbe.c        | 2 +-
 drivers/media/platform/ti/omap3isp/isp.c        | 2 +-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 1 +
 drivers/media/platform/xilinx/xilinx-vip.c      | 2 ++
 drivers/media/platform/xilinx/xilinx-vipp.c     | 9 +++++----
 drivers/staging/media/imx/imx7-media-csi.c      | 2 +-
 6 files changed, 11 insertions(+), 7 deletions(-)

-- 
Regards,

Laurent Pinchart
