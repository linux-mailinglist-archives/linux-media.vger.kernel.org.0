Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249F038E4DE
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbhEXLKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbhEXLKq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:10:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF5EC061574
        for <linux-media@vger.kernel.org>; Mon, 24 May 2021 04:09:17 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 828BE140C;
        Mon, 24 May 2021 13:09:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854555;
        bh=xmNEETQ8Vy9VvfsOWDuweZflLjv9wzge9hrpI8+b+bo=;
        h=From:To:Cc:Subject:Date:From;
        b=tPwWCEX3PiBDI3heHHDVwmLVWEvvAEkbOrAlQdqaYba0Or/dMplnkMO6Bc1/WwvnF
         Gav/CmBiRngge34lAjzQJYnzjFaWa0ZlIncfARpq5qXbKJkR7cpCA2/n3uVeKKIt1z
         IIzl2wchd/eIYlo+qgGrowT1EDR4OJIPeMAv5oY4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 00/38] media: ti-vpe: cal: multistream & embedded data support
Date:   Mon, 24 May 2021 14:08:31 +0300
Message-Id: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is v3 of the CAL series to add multiplexed streams and embedded
data support.

This is based on the v7 of the v4l2 core changes to add multiplexed
streams:

https://lore.kernel.org/linux-media/20210524104408.599645-1-tomi.valkeinen@ideasonboard.com/

I didn't receive any comments on the v2 of the series, so the patches up
to and including "media: ti-vpe: cal: allow more than 1 source pads"
have very little changes. The patches after that add the multiplexed
streams and embedded data support, which are now based on the new
approach in the above mentioned v7 series

 Tomi

Tomi Valkeinen (38):
  media: ti-vpe: cal: add g/s_parm for legacy API
  media: ti-vpe: cal: fix error handling in cal_camerarx_create
  media: ti-vpe: cal: remove unused cal_camerarx->dev field
  media: ti-vpe: cal: rename "sensor" to "source"
  media: ti-vpe: cal: move global config from cal_ctx_wr_dma_config to
    runtime resume
  media: ti-vpe: cal: use v4l2_get_link_freq
  media: ti-vpe: cal: add cal_ctx_prepare/unprepare
  media: ti-vpe: cal: change index and cport to u8
  media: ti-vpe: cal: Add CSI2 context
  media: ti-vpe: cal: Add pixel processing context
  media: ti-vpe: cal: rename cal_ctx->index to dma_ctx
  media: ti-vpe: cal: rename CAL_HL_IRQ_MASK
  media: ti-vpe: cal: clean up CAL_CSI2_VC_IRQ_* macros
  media: ti-vpe: cal: catch VC errors
  media: ti-vpe: cal: remove wait when stopping camerarx
  media: ti-vpe: cal: disable csi2 ctx and pix proc at ctx_stop
  media: ti-vpe: cal: allocate pix proc dynamically
  media: ti-vpe: cal: add 'use_pix_proc' field
  media: ti-vpe: cal: add cal_ctx_wr_dma_enable and fix a race
  media: ti-vpe: cal: add vc and datatype fields to cal_ctx
  media: ti-vpe: cal: handle cal_ctx_v4l2_register error
  media: ti-vpe: cal: set field always to V4L2_FIELD_NONE
  media: ti-vpe: cal: fix typo in a comment
  media: ti-vpe: cal: add mbus_code support to cal_mc_enum_fmt_vid_cap
  media: ti-vpe: cal: rename non-MC funcs to cal_legacy_*
  media: ti-vpe: cal: init ctx->v_fmt correctly in MC mode
  media: ti-vpe: cal: remove cal_camerarx->fmtinfo
  media: ti-vpe: cal: support 8 DMA contexts
  media: ti-vpe: cal: cleanup phy iteration in cal_remove
  media: ti-vpe: cal: fix ctx uninitialization
  media: ti-vpe: cal: fix queuing of the initial buffer
  media: ti-vpe: cal: use CSI-2 frame number
  media: ti-vpe: cal: add camerarx locking
  media: ti-vpe: cal: add camerarx enable/disable refcounting
  media: ti-vpe: cal: allow more than 1 source pads
  media: ti-vpe: cal: add embedded data support
  media: ti-vpe: cal: use frame desc to get vc and dt
  media: ti-vpe: cal: add multiplexed streams support

 drivers/media/platform/ti-vpe/cal-camerarx.c | 565 ++++++++++++++-----
 drivers/media/platform/ti-vpe/cal-video.c    | 273 +++++++--
 drivers/media/platform/ti-vpe/cal.c          | 334 ++++++++---
 drivers/media/platform/ti-vpe/cal.h          |  74 ++-
 drivers/media/platform/ti-vpe/cal_regs.h     |  53 +-
 5 files changed, 951 insertions(+), 348 deletions(-)

-- 
2.25.1

