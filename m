Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1436B3A64B7
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbhFNL2I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:28:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58054 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235259AbhFNL0G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:26:06 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27090A59;
        Mon, 14 Jun 2021 13:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669841;
        bh=qz0IoES5smSrH41GNtxX9RaxhcybQSzjz7CBzwPWeeU=;
        h=From:To:Cc:Subject:Date:From;
        b=EwOfpx+DHvzEUhyIvHFXw6hcOO/UqMUTQjFJH60xRMa9dMkJmN61vvaR2Pl+UxeXk
         n9lR8xTqGHpIhjJQWVKGcvTuHMUoDqK/eyzvw7aCgnFqgzsw0yG2qeAYrV2Kf+l4pY
         vPpX+6y91+unXlZsZohH0GgzdsYrG02b4TS+Olmg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 00/35] media: ti-vpe: cal: improvements towards multistrea
Date:   Mon, 14 Jun 2021 14:23:10 +0300
Message-Id: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is v4 of the series, previous can be found from:

https://lore.kernel.org/linux-media/20210524110909.672432-1-tomi.valkeinen@ideasonboard.com/

This version is a slightly reduced one, as I've dropped topmost patches
adding multiplexed streams, which need more work and depend on the v4l2
core changes. I have also dropped "media: ti-vpe: cal: use CSI-2 frame
number" as due to racy HW, it very difficult to get right.

Other changes in the version:
- Added missing mutex_destroy()
- Some cosmetic improvements
- Fixed error handling in cal_async_notifier_complete

Everything else but "media: ti-vpe: cal: handle cal_ctx_v4l2_register
error" has a reviewed-by.

I believe this series is ready for merging.

The series is based on Hans' pull request which contains "media:
v4l2-subdev: add subdev-wide state struct".

 Tomi

Tomi Valkeinen (35):
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
  media: ti-vpe: cal: add camerarx locking
  media: ti-vpe: cal: add camerarx enable/disable refcounting
  media: ti-vpe: cal: allow more than 1 source pads
  media: ti-vpe: cal: add embedded data support

 drivers/media/platform/ti-vpe/cal-camerarx.c | 247 ++++++++++-------
 drivers/media/platform/ti-vpe/cal-video.c    | 176 ++++++++----
 drivers/media/platform/ti-vpe/cal.c          | 272 +++++++++++++------
 drivers/media/platform/ti-vpe/cal.h          |  66 +++--
 drivers/media/platform/ti-vpe/cal_regs.h     |  53 +---
 5 files changed, 521 insertions(+), 293 deletions(-)

-- 
2.25.1

