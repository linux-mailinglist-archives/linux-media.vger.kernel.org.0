Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BBF365859
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhDTMFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:05:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57958 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhDTMFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:05:43 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6948470;
        Tue, 20 Apr 2021 14:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920311;
        bh=590xvBQw22P7+0NxfruSWTwc+eMu3HDv9jUHcEqhbHU=;
        h=From:To:Cc:Subject:Date:From;
        b=FgAkYpxvYPEglcHVEWDj4KT/qODBwk3WJQda3JYkVmqAEVhQQMWW1Ci1iLDSSeIMz
         C+kLkwzXNANhbP/Q5ElGu8q0DFipPwuJFkDzEOOXB1MmEeQUtbWPHs8HRQfbsJg0sJ
         oX5F0tisrKwsGZ6sxl4AJ1FfMX8m+gFWBSBem9zU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/35] media: ti-vpe: cal: prepare for multistream support
Date:   Tue, 20 Apr 2021 15:03:58 +0300
Message-Id: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

v2 of the series. Changes to v1:

- Addressed most of the comments from v1 review as discussed (or if I
  didn't comment, I addressed them as suggested).
- I didn't change the field handling, so (I believe) support for
  interlace is effectively disabled. I think it's better to add the
  field handling by someone who has a sensor that provides ilace frames,
  or at least has a deep understanding of v4l2 interlace.
- 7 new patches (the ones at the end of the series)

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
  media: ti-vpe: cal: use CSI-2 frame number
  media: ti-vpe: cal: add camerarx locking
  media: ti-vpe: cal: add camerarx enable/disable refcounting
  media: ti-vpe: cal: allow more than 1 source pads

 drivers/media/platform/ti-vpe/cal-camerarx.c | 248 ++++++++++--------
 drivers/media/platform/ti-vpe/cal-video.c    | 176 +++++++++----
 drivers/media/platform/ti-vpe/cal.c          | 256 +++++++++++++------
 drivers/media/platform/ti-vpe/cal.h          |  62 +++--
 drivers/media/platform/ti-vpe/cal_regs.h     |  53 +---
 5 files changed, 502 insertions(+), 293 deletions(-)

-- 
2.25.1

