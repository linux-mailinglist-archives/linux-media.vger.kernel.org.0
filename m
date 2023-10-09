Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512D27BED7E
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 23:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378530AbjJIVmZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 17:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378828AbjJIVmU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 17:42:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2F1ED
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 14:42:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 751883D9;
        Mon,  9 Oct 2023 23:42:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696887731;
        bh=Ak4bN6B7nb/StZ3SJKgcb8S/wAp91DbWTu3SQmeayLs=;
        h=Date:From:To:Cc:Subject:From;
        b=wAZZLvt2Yj52UJN4esBA+Lz1Da8cIR8a5AMsK21s+PMs4h/AXNGf0AwYYXW1Z8r3B
         oXgPrtjm9+ubtLuRkyBi0kg9pAB3z9XBlCg5XsGoJt5Yti84z6u7fl4PmQ6PHNZUBm
         gH3FDL0eAfi/tP4wPI8dMoWbWuLiuA4+o8y/TlwQ=
Date:   Tue, 10 Oct 2023 00:42:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>
Subject: [GIT PULL FOR v6.7] Miscellaneous changes to the rkisp1 driver
Message-ID: <20231009214219.GA25507@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro, Hans,

The following changes since commit a1766a4fd83befa0b34d932d532e7ebb7fab1fa7:

  media: imon: fix access to invalid resource for the second interface (2023-10-07 10:55:48 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-rkisp1-next-20231010

for you to fetch changes up to 12c5b2a0154c4217e0e27465cda309851f188434:

  media: rkisp1: resizer: Fix resizer disable check when starting stream (2023-10-10 00:15:20 +0300)

----------------------------------------------------------------
Miscellaneous cleanups to the rkisp1 driver

----------------------------------------------------------------
Laurent Pinchart (14):
      MAINTAINERS: Add co-maintainer for the rkisp1 driver
      media: rkisp1: resizer: Use V4L2 subdev active state
      media: rkisp1: isp: Use V4L2 subdev active state
      media: rkisp1: csi: Use V4L2 subdev active state
      media: rkisp1: Convert hex constants to lowercase
      media: rkisp1: Constify rkisp1_v12_params_ops
      media: rkisp1: Fix line stride calculation
      media: rkisp1: Remove dual crop control register from config structure
      media: rkisp1: Program RKISP1_CIF_MI_SP_Y_PIC_SIZE register
      media: rkisp1: resizer: Constify argument and local variables
      media: rkisp1: resizer: Use v4l2_area instead of v4l2_rect to store size
      media: rkisp1: resizer: Drop unneeded local variable
      media: rkisp1: resizer: Improve debug message when configuring resizer
      media: rkisp1: resizer: Fix resizer disable check when starting stream

 MAINTAINERS                                        |   1 +
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |  24 +-
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  18 -
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    | 107 ++--
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 263 ++++-----
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |   4 +-
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   | 618 ++++++++++-----------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      | 255 ++++-----
 8 files changed, 564 insertions(+), 726 deletions(-)

-- 
Regards,

Laurent Pinchart
