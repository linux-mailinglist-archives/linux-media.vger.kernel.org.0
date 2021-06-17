Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D4B3AB3E3
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 14:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhFQMp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 08:45:58 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40845 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230473AbhFQMp5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 08:45:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id trN3lp2PThg8ZtrN6lTsF6; Thu, 17 Jun 2021 14:43:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623933829; bh=jwvUmsHaquoe2ckc+u26W6/PLSKafPpCBXDZOT+R39s=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BbVazoxztYlxPkMrtPdpBZC7JwEy2hzuKahupSPbFV0n8uyuyoOkZevgJ2id9nuzc
         JkG2mEmifSSSY+73P3QxyV2/H/3SSNKpgE8kLkHogvgQXCfti00us3yPOWTivl5CQH
         TzhrxwEmBRtcIj7dXfU/hKksJjJd0Y5QAQXQjjupZQY4O0pYHcCM1ow9tz90lQF9YK
         K3I0yqWwT4DgmRGd1R1lpvL4LfOoHQTgfzV6OgAFw8ZoSjDgYOttRObzmeX9uYgUke
         wkGs7keHIv5WNa89HSOuPRDUOPdskwie3SOCnFnKzk1Hqvf3GTv3R33yuNi2O8L4mE
         xrR3TkcFnndzQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] ti-vpe: cal: improvements towards multistream
Message-ID: <df45f248-fe1e-4dc7-b26a-51a36bba90bb@xs4all.nl>
Date:   Thu, 17 Jun 2021 14:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP3NPf9Lc70BKiqhTzPFtRc9R7d4GNP1Fv2EeSCBYrWbZAQciJwjmba7oaZQSPQok+oNPumnSDIufMj8cvuCzSy+8eB/kHftvKYVWmgNYdmo6CRuoD6Z
 vm5Q6yugaFgScOKAWQgary/KdQOwWkCjJeIF6VFwlCwy+EWxRIvqhRTfrFy4uOlvhn5HjCQzBbVTPUkWTL+iKc3F24H3QuZ78uMOrJKBcTv3yz3faBLXgEri
 nt5YXtHQNJJ8V2XUBaMzsA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 198bb646e8553e8abd8d83492a27b601ab97b75d:

  media: i2c: rdacm20: Re-work ov10635 reset (2021-06-17 12:08:55 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14q

for you to fetch changes up to 9919d1ae39582196a1852c86fb728c643d4145fa:

  media: ti-vpe: cal: add embedded data support (2021-06-17 14:37:40 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Tomi Valkeinen (35):
      media: ti-vpe: cal: add g/s_parm for legacy API
      media: ti-vpe: cal: fix error handling in cal_camerarx_create
      media: ti-vpe: cal: remove unused cal_camerarx->dev field
      media: ti-vpe: cal: rename "sensor" to "source"
      media: ti-vpe: cal: move global config from cal_ctx_wr_dma_config to runtime resume
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

 drivers/media/platform/ti-vpe/cal-camerarx.c | 247 +++++++++++++++++++++++++++++----------------------
 drivers/media/platform/ti-vpe/cal-video.c    | 176 +++++++++++++++++++++++++++----------
 drivers/media/platform/ti-vpe/cal.c          | 272 +++++++++++++++++++++++++++++++++++++++------------------
 drivers/media/platform/ti-vpe/cal.h          |  66 ++++++++++----
 drivers/media/platform/ti-vpe/cal_regs.h     |  53 +++--------
 5 files changed, 521 insertions(+), 293 deletions(-)
