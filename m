Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9C851EA4A
	for <lists+linux-media@lfdr.de>; Sat,  7 May 2022 23:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350824AbiEGVS2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 May 2022 17:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235186AbiEGVS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 May 2022 17:18:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4771D13F7A
        for <linux-media@vger.kernel.org>; Sat,  7 May 2022 14:14:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 458DD55A
        for <linux-media@vger.kernel.org>; Sat,  7 May 2022 23:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1651958076;
        bh=AQdM20FGQnalCJLEjugmT1J2SwuEXX1AgGJGnMAwt/A=;
        h=Date:From:To:Subject:From;
        b=hMXpvZlrDA4ORzOL2h+Y4dCOp/B/PNEC/oaXDHeaIb56B4/Vt9tgQMA2zKcR2IuPr
         QWunOApX4tv4FV2XCeCuYLPEoI88iEvyf4venvEdwz0Bj6UfjJIrcdiN8G3Xi4wek6
         z7d10vG3HCEBtmavKbFTiHNkOZHnReZk1hS3CXbk=
Date:   Sun, 8 May 2022 00:14:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.19] Misc fixes and enhancements
Message-ID: <YnbhONTyrXpB+0ZW@pendragon.ideasonboard.com>
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

The following changes since commit 6c1c1eb8c87de221051b9198d40971640060842f:

  media: ext-ctrls-codec.rst: fix indentation (2022-04-25 23:55:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220508

for you to fetch changes up to 69b8819f57595d7d26a861125e78a6bc30082618:

  media: vsp1: Fix offset calculation for plane cropping (2022-05-06 13:23:58 +0300)

----------------------------------------------------------------
- Misc enhancements and fixes

----------------------------------------------------------------
Laurent Pinchart (5):
      media: cadence: cdns-csi2tx: Use mipi-csi2.h
      media: rockchip: rkisp1: Use mipi-csi2.h
      media: videobuf2-v4l2: Expose vb2_queue_is_busy() to drivers
      media: vsp1: Don't open-code vb2_fop_release()
      media: vsp1: Use vb2_queue_is_busy()

Michael Rodin (1):
      media: vsp1: Fix offset calculation for plane cropping

 drivers/media/common/videobuf2/videobuf2-v4l2.c    | 26 +++++++----------
 drivers/media/platform/cadence/cdns-csi2tx.c       |  5 ++--
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |  6 ++--
 drivers/media/platform/renesas/vsp1/vsp1_video.c   | 14 ++-------
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 34 ++++++++++++----------
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   | 11 -------
 include/media/videobuf2-v4l2.h                     | 23 +++++++++++++--
 7 files changed, 57 insertions(+), 62 deletions(-)

-- 
Regards,

Laurent Pinchart
