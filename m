Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7C335C53F
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238970AbhDLLf2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52572 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237565AbhDLLf2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:28 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F2023F0;
        Mon, 12 Apr 2021 13:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227309;
        bh=FVu5Y6ACmJOxFMXP//4K4dVIL+8hVDLCkvnnqEKdYUc=;
        h=From:To:Cc:Subject:Date:From;
        b=QGWWogwbDPiQa8CZnn5Ryg+HHimIg75oljFJB6/gANl/ikWm0Rp4oVcBl1jod2+nE
         CCEZdZlUB3WUpWfQYnTHNFD+4QPQY39z+v+6mdInN7s7ZYxfLV81Bg6YBaZB0AynOp
         nRMwpRVIVbbdUgqbZvQ4NmD9kkUn+nSqCA8DmUs4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 00/28] media: ti-vpe: cal: prepare for multistream support
Date:   Mon, 12 Apr 2021 14:34:29 +0300
Message-Id: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I'm working on adding multistream support to TI CAL driver. This series
is a preparation series: it does not add any new features, but adds
code needed for multistreaming. In other words, with this series the
driver works just like it used to.

The multistream code is not ready yet, but I'd like to start cleaning up
my work branch by getting the "probably ok" patches reviewed and
possibly merged.

 Tomi

Tomi Valkeinen (28):
  media: ti-vpe: cal: add g/s_parm for legacy API
  media: ti-vpe: cal: fix error handling in cal_camerarx_create
  media: ti-vpe: cal: remove unused cal_camerarx->dev field
  media: ti-vpe: cal: rename "sensor" to "source"
  media: ti-vpe: cal: move global config from cal_ctx_wr_dma_config to
    runtime resume
  media: ti-vpe: cal: use v4l2_get_link_freq
  media: ti-vpe: cal: add cal_ctx_prepare/unprepare
  media: ti-vpe: cal: change index and cport to u8
  media: ti-vpe: cal: Add PPI context
  media: ti-vpe: cal: Add pixel processing context
  media: ti-vpe: cal: rename cal_ctx->index to dma_ctx
  media: ti-vpe: cal: rename CAL_HL_IRQ_MASK
  media: ti-vpe: cal: clean up CAL_CSI2_VC_IRQ_* macros
  media: ti-vpe: cal: catch VC errors
  media: ti-vpe: cal: remove wait when stopping camerarx
  media: ti-vpe: cal: disable ppi and pix proc at ctx_stop
  media: ti-vpe: cal: allocate pix proc dynamically
  media: ti-vpe: cal: add 'use_pix_proc' field
  media: ti-vpe: cal: add cal_ctx_wr_dma_enable and fix a race
  media: ti-vpe: cal: add vc and datatype fields to cal_ctx
  media: ti-vpe: cal: fix cal_ctx_v4l2_register error handling
  media: ti-vpe: cal: set field always to V4L2_FIELD_NONE
  media: ti-vpe: cal: fix typo in a comment
  media: ti-vpe: cal: add mbus_code support to cal_mc_enum_fmt_vid_cap
  media: ti-vpe: cal: rename non-MC funcs to cal_legacy_*
  media: ti-vpe: cal: init ctx->v_fmt correctly in MC mode
  media: ti-vpe: cal: remove cal_camerarx->fmtinfo
  media: ti-vpe: cal: support 8 DMA contexts

 drivers/media/platform/ti-vpe/cal-camerarx.c | 157 ++++++-------
 drivers/media/platform/ti-vpe/cal-video.c    | 163 +++++++++----
 drivers/media/platform/ti-vpe/cal.c          | 232 ++++++++++++-------
 drivers/media/platform/ti-vpe/cal.h          |  37 +--
 drivers/media/platform/ti-vpe/cal_regs.h     |  51 +---
 5 files changed, 381 insertions(+), 259 deletions(-)

-- 
2.25.1

