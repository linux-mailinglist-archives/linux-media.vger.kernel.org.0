Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07DF954D600
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 02:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244949AbiFPATp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 20:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239840AbiFPATo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 20:19:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A1B39BAF
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 17:19:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30F2FA49;
        Thu, 16 Jun 2022 02:19:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655338781;
        bh=6/11e/kinWSnexRPCbPLWlO4Z/z5QmiHMdaa8gS0sLg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JpRsWG/oOnOQdQeLJoaSgB1cxLbV2xJoRf2WHmNOYdTtB8lWMmipMrOQJcWp/i9Rl
         xk2qNAo1bnw/eeJflL7W46zMWcJWDpakXXPHos3mtfCVb9BlooNHskD2BL78a9MXSu
         9uofCqdy7u38xC8QJm6tLozMAYLZ6Oamu4OJpg1U=
Date:   Thu, 16 Jun 2022 03:19:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 00/55] media: rkisp1: Cleanups and add support for i.MX8MP
Message-ID: <Yqp3ElqySn9zbw4G@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patches.

On Wed, Jun 15, 2022 at 04:10:32AM +0900, Paul Elder wrote:
> Hello,
> 
> This series depends on v4 of "media: rkisp1: Misc bug fixes and cleanups" [1].
> 
> The ISP integrated in the i.MX8MP is nearly the same as the rkisp1, and
> so we can reuse the rkisp1 driver for it.
> 
> This series does some cleanup and refactoring of the rkisp1 driver,
> (patches 1/55 to 46/55), and then adds support for the i.MX8MP (patches
> 47/55 to 55/55).

I have a few questions about the i.MX8MP support (the main one being
about the version numbering scheme), which I'll ask in replies to the
corresponding patches. Patches 01/55 to 46/55 could be merged already,
once reviewed of course. As the series is large, let's see if we can
motivate any reviewer :-)

> [1] https://lore.kernel.org/linux-media/Ymbxs2p9Tuf331qM@pendragon.ideasonboard.com/T/
> 
> Laurent Pinchart (38):
>   media: rkisp1: Enable compilation on ARCH_MXC
>   media: rkisp1: Disable runtime PM in probe error path
>   media: rkisp1: Read the ID register at probe time instead of streamon
>   media: rkisp1: Rename rkisp1_match_data to rkisp1_info
>   media: rkisp1: Access ISP version from info pointer
>   media: rkisp1: cap: Print debug message on failed link validation
>   media: rkisp1: Move sensor .s_stream() call to ISP
>   media: rkisp1: Reject sensors without pixel rate control at bound time
>   media: rkisp1: Create link from sensor to ISP at notifier bound time
>   media: rkisp1: Create internal links at probe time
>   media: rkisp1: Rename rkisp1_subdev_notifier() to
>     rkisp1_subdev_notifier_register()
>   media: v4l2-async: Add notifier operation to destroy asd instances
>   media: rkisp1: Fix sensor source pad retrieval at bound time
>   media: rkisp1: isp: Start CSI-2 receiver before ISP
>   media: rkisp1: csi: Handle CSI-2 RX configuration fully in
>     rkisp1-csi.c
>   media: rkisp1: csi: Rename CSI functions with a common rkisp1_csi
>     prefix
>   media: rkisp1: csi: Move start delay to rkisp1_csi_start()
>   media: rkisp1: csi: Pass sensor pointer to rkisp1_csi_config()
>   media: rkisp1: csi: Constify argument to rkisp1_csi_start()
>   media: rkisp1: isp: Don't initialize ret to 0 in rkisp1_isp_s_stream()
>   media: rkisp1: isp: Pass mbus type and flags to rkisp1_config_cif()
>   media: rkisp1: isp: Rename rkisp1_device.active_sensor to source
>   media: rkisp1: isp: Add container_of wrapper to cast subdev to
>     rkisp1_isp
>   media: rkisp1: isp: Add rkisp1_device backpointer to rkisp1_isp
>   media: rkisp1: isp: Pass rkisp1_isp pointer to internal ISP functions
>   media: rkisp1: isp: Move input configuration to rkisp1_config_isp()
>   media: rkisp1: isp: Merge ISP_ACQ_PROP configuration in single
>     variable
>   media: rkisp1: isp: Initialize some variables at declaration time
>   media: rkisp1: isp: Fix whitespace issues
>   media: rkisp1: isp: Constify various local variables
>   media: rkisp1: isp: Rename rkisp1_get_remote_source()
>   media: mc-entity: Add a new helper function to get a remote pad
>   media: mc-entity: Add a new helper function to get a remote pad for a
>     pad
>   media: rkisp1: isp: Disallow multiple active sources
>   media: rkisp1: csi: Plumb the CSI RX subdev
>   media: rkisp1: Add infrastructure to support ISP features
>   media: rkisp1: Make the internal CSI-2 receiver optional
>   media: rkisp1: Configure gasket on i.MX8MP
> 
> Paul Elder (17):
>   media: rkisp1: debug: Add dump file in debugfs for MI buffer registers
>   media: rkisp1: debug: Add debugfs files to monitor MI and ISP
>     interrupts
>   media: rkisp1: Save info pointer in rkisp1_device
>   media: rkisp1: Make rkisp1_isp_mbus_info common
>   media: rkisp1: Split CSI handling to separate file
>   media: rkisp1: csi: Implement a V4L2 subdev for the CSI receiver
>   media: rkisp1: Use fwnode_graph_for_each_endpoint
>   dt-bindings: media: rkisp1: Add port for parallel interface
>   media: rkisp1: Support the ISP parallel input
>   dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
>   media: rkisp1: Add match data for i.MX8MP ISP
>   media: rkisp1: Add and set registers for crop for i.MX8MP
>   media: rkisp1: Add and set registers for output size config on i.MX8MP
>   media: rkisp1: Add i.MX8MP-specific registers for MI and resizer
>   media: rkisp1: Shift DMA buffer addresses on i.MX8MP
>   media: rkisp1: Add register definitions for the test pattern generator
>   media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP
> 
>  .../bindings/media/rockchip-isp1.yaml         |  30 +-
>  Documentation/driver-api/media/mc-core.rst    |   4 +-
>  .../driver-api/media/v4l2-subdev.rst          |   6 +
>  drivers/media/mc/mc-entity.c                  |  69 ++
>  .../media/platform/rockchip/rkisp1/Kconfig    |   2 +-
>  .../media/platform/rockchip/rkisp1/Makefile   |   1 +
>  .../platform/rockchip/rkisp1/rkisp1-capture.c |  49 +-
>  .../platform/rockchip/rkisp1/rkisp1-common.c  | 148 ++++
>  .../platform/rockchip/rkisp1/rkisp1-common.h  | 130 +++-
>  .../platform/rockchip/rkisp1/rkisp1-csi.c     | 525 ++++++++++++++
>  .../platform/rockchip/rkisp1/rkisp1-csi.h     |  28 +
>  .../platform/rockchip/rkisp1/rkisp1-debug.c   |  55 +-
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 440 +++++++-----
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 679 +++++++-----------
>  .../platform/rockchip/rkisp1/rkisp1-params.c  |   2 +-
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  87 +++
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  43 +-
>  .../platform/rockchip/rkisp1/rkisp1-stats.c   |   4 +-
>  drivers/media/v4l2-core/v4l2-async.c          |  10 +
>  include/media/media-entity.h                  |  63 ++
>  include/media/v4l2-async.h                    |   2 +
>  include/uapi/linux/rkisp1-config.h            |   3 +
>  22 files changed, 1735 insertions(+), 645 deletions(-)
>  create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>  create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h

-- 
Regards,

Laurent Pinchart
