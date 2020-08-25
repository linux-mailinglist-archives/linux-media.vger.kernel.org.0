Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA2925101A
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 05:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728564AbgHYDxA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 23:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgHYDw7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 23:52:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9317FC061574;
        Mon, 24 Aug 2020 20:52:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id DD662298CBD
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 00/19] Clean H264 stateless uAPI
Date:   Tue, 25 Aug 2020 00:52:26 -0300
Message-Id: <20200825035245.594982-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New round for the H.264 uAPI cleanup, which as discussed
aims at being stabilized and promoted as a first-class public uAPI soon.

Changelog:

v3->v4:
* Convert enum v4l2_h264_field_reference to a __u8,
  as suggested by Hans. This reduces v4l2_ctrl_h264_slice_params
  from 536 bytes down to 152 bytes, and doesn't really change
  the uAPI. This also removes a hole in struct v4l2_h264_reference
  is removed.
* Drop 'mandatory' requirement on DECODE_MODE and START_MODE,
  in rkvdec driver.

v2->v3:
* Clarify SCALING_MATRIX present flag.
* Implement optional scaling matrix on hantro, rkvdec and cedrus.
* Make prediction weight table properly optional on cedrus.
* Rename field reference types.

v1->v2:
* Clean SLICE_PARAMS documentation, which we don't
  expect to be part of an array anymore. 
* Clarify how frame-based and slice-based modes
  are expected to work.
* Add Cedrus patches to fix field references,
  as requested by Jernej.
* Fix wrongly removed SPS in rkvdec.
* Fix rkvdec DPB reference implementation.
* Fix missing Cedrus and missing control member,
  for prediction weight table control.
* Say "raster scan" instead of "matrix" in the docs.
* Drop duplicated macros and use v4l2_h264_dpb_reference
  for the DPB reference signalling.

RFC->v1: 
* Split prediction weight table to a separate control.
* Increase size of first_mb_in_slice field.
* Cleanup DPB entry interface, to support field coding.
* Increase of DPB entry pic_num field.
* Move slice invariant fields to the per-frame control.

Ezequiel Garcia (15):
  media: uapi: h264: Further clarify scaling lists order
  media: uapi: h264: Split prediction weight parameters
  media: uapi: h264: Increase size of 'first_mb_in_slice' field
  media: uapi: h264: Clean DPB entry interface
  media: uapi: h264: Increase size of DPB entry pic_num
  media: uapi: h264: Drop SLICE_PARAMS 'size' field
  media: uapi: h264: Clarify SLICE_BASED mode
  media: uapi: h264: Clean slice invariants syntax elements
  media: uapi: h264: Rename and clarify PPS_FLAG_SCALING_MATRIX_PRESENT
  media: hantro: Don't require unneeded H264_SLICE_PARAMS
  media: rkvdec: Don't require unneeded H264_SLICE_PARAMS
  media: rkvdec: Drop unneeded per_request driver-specific control flag
  media: rkvdec: Use H264_SCALING_MATRIX only when required
  media: hantro: Use H264_SCALING_MATRIX only when required
  media: cedrus: Use H264_SCALING_MATRIX only when required

Jernej Skrabec (3):
  media: uapi: h264: Update reference lists
  media: cedrus: h264: Properly configure reference field
  media: cedrus: h264: Fix frame list construction

Philipp Zabel (1):
  media: uapi: h264: Clarify pic_order_cnt_bit_size field

 .../media/v4l/ext-ctrls-codec.rst             | 233 ++++++++++--------
 drivers/media/v4l2-core/v4l2-ctrls.c          |  28 +++
 drivers/media/v4l2-core/v4l2-h264.c           |  12 +-
 drivers/staging/media/hantro/hantro_drv.c     |   5 -
 .../staging/media/hantro/hantro_g1_h264_dec.c |  26 +-
 drivers/staging/media/hantro/hantro_h264.c    |  12 +-
 drivers/staging/media/hantro/hantro_hw.h      |   2 -
 drivers/staging/media/rkvdec/rkvdec-h264.c    |  37 ++-
 drivers/staging/media/rkvdec/rkvdec.c         |  14 +-
 drivers/staging/media/rkvdec/rkvdec.h         |   1 -
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   9 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  61 +++--
 include/media/h264-ctrls.h                    |  87 ++++---
 include/media/v4l2-ctrls.h                    |   2 +
 include/media/v4l2-h264.h                     |   3 +-
 17 files changed, 290 insertions(+), 245 deletions(-)

-- 
2.27.0

