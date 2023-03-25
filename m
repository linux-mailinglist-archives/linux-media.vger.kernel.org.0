Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFD106C90BD
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 21:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjCYUhF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 16:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjCYUhF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 16:37:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A68211C
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 13:37:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B714F89F
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 21:37:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679776623;
        bh=yyYhKK8lAdctGiIOpZKKpiX6FO9Y6QgrMKHhg3lpMbg=;
        h=Date:From:To:Subject:From;
        b=EwjjFiLdZJDu00mDr9XLtrulZojESsGobjjOUAX2xuXP7QVN2YmBZF8X6e0cQ4aTW
         iDRP/TAIP29anPpXZ4yq7nqEsyRc9qNVIqPx8clMV0PG0/mn2hAHrz/ufXm5fOvf4G
         XqOi+CsQPUOGT4heWJi05KCWdO1nYGw8XAaedNH0=
Date:   Sat, 25 Mar 2023 22:37:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.4] media: Miscellaneous fixes for Renesas drivers
Message-ID: <20230325203709.GC19335@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-renesas-next-20230325

for you to fetch changes up to 0b89ff5c03d3a124b5c5a454d6137dd562a36757:

  media: rcar_fdp1: Fix refcount leak in probe and remove function (2023-03-25 22:30:21 +0200)

----------------------------------------------------------------
media: Miscellaneous fixes for Renesas drivers

----------------------------------------------------------------
Gaosheng Cui (1):
      media: vsp1: Remove unused vsp1_subdev_internal_ops declaration

Laurent Pinchart (1):
      media: vsp1: Replace vb2_is_streaming() with vb2_start_streaming_called()

Miaoqian Lin (1):
      media: rcar_fdp1: Fix refcount leak in probe and remove function

Tomi Valkeinen (1):
      media: vsp1: Add underrun debug print

 drivers/media/platform/renesas/rcar_fdp1.c        | 11 ++++++++---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c    |  3 +++
 drivers/media/platform/renesas/vsp1/vsp1_drv.c    | 11 ++++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_entity.h |  2 --
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h   |  2 ++
 drivers/media/platform/renesas/vsp1/vsp1_regs.h   |  2 ++
 drivers/media/platform/renesas/vsp1/vsp1_video.c  |  2 +-
 7 files changed, 26 insertions(+), 7 deletions(-)

-- 
Regards,

Laurent Pinchart
