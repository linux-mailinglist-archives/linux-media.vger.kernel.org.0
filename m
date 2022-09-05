Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B73565AC83D
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 02:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbiIEAHf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Sep 2022 20:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiIEAHe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Sep 2022 20:07:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FEE728E2D
        for <linux-media@vger.kernel.org>; Sun,  4 Sep 2022 17:07:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 422016BC;
        Mon,  5 Sep 2022 02:07:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662336451;
        bh=R+54rkiyCavryxYJx2FmBE5iXEf8NSpP74eC5SBm/Bs=;
        h=Date:From:To:Cc:Subject:From;
        b=avL4wxd+lFrqo5og2GDepATJdDmfxKiyCoVjK6b7nU8p16Tgaeu47iBGCw+lA/LfT
         YSlpaSlGJfT6zRz8caCSiUSt1S8g4yqxg0HlynNxzaN9tKLA9lk46IOsP/21Q9WXSt
         r5x5/0Ik6NPkwaMUrBfJ38Z5wrwZms3aUgM/IHOI=
Date:   Mon, 5 Sep 2022 03:07:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>
Subject: [GIT PULL FOR v6.1] rkisp1 fixes and improvements
Message-ID: <YxU9tFzaGxnwMGMU@pendragon.ideasonboard.com>
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

The following changes since commit 61890ccaefaff89f5babd2c8412fd222c3f5fe38:

  media: platform: mtk-mdp3: add MediaTek MDP3 driver (2022-08-30 16:25:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220905

for you to fetch changes up to 81d9f8aa44b7484223a8157500b1de0cb0acb7ce:

  media: rkisp1: Zero v4l2_subdev_format fields in when validating links (2022-09-05 01:08:28 +0300)

----------------------------------------------------------------
Miscellaneous fixes and improvements to the rkisp1 driver

----------------------------------------------------------------
Laurent Pinchart (18):
      media: rockchip: rkisp1: Set DPCC methods enable bits inside loop
      media: rockchip: rkisp1: Mask invalid bits in DPCC parameters
      media: rockchip: rkisp1: Define macros for DPCC configurations in UAPI
      media: rkisp1: Initialize color space on ISP sink and source pads
      media: rkisp1: Allow setting color space on ISP sink pad
      media: rkisp1: Fix source pad format configuration
      media: rkisp1: Allow setting all color space fields on ISP source pad
      media: rkisp1: Configure quantization using ISP source pad
      media: rkisp1: Don't pass the quantization to rkisp1_csm_config()
      media: rkisp1: Configure CSM based on YCbCr encoding
      media: rkisp1: Initialize color space on resizer sink and source pads
      media: rkisp1: Allow setting color space on resizer sink pad
      media: rkisp1: Clean up LSC configuration code
      media: rkisp1: Store LSC register values in u32 variables
      media: rkisp1: Simplify LSC x/y size and grad register macros
      media: rkisp1: Use correct macro for gradient registers
      media: rkisp1: Configure LSC after enabling the ISP
      media: rkisp1: Zero v4l2_subdev_format fields in when validating links

 .../platform/rockchip/rkisp1/rkisp1-capture.c      |   7 +-
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  30 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 144 +++++-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 529 ++++++++++++---------
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  47 +-
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |  45 +-
 include/uapi/linux/rkisp1-config.h                 |  77 ++-
 7 files changed, 590 insertions(+), 289 deletions(-)

-- 
Regards,

Laurent Pinchart
