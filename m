Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DBD23DFD9
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730627AbgHFRyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728048AbgHFQay (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:30:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F092C0A893D;
        Thu,  6 Aug 2020 08:13:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EAAD02972D4
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
Subject: [PATCH v2 00/14] Clean H264 stateless uAPI
Date:   Thu,  6 Aug 2020 12:12:56 -0300
Message-Id: <20200806151310.98624-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here's a new round for the H.264 uAPI cleanup, which as discussed
aims at being stabilized and promoted as a first-class public uAPI soon.

It should be noted that there is already GStreamer native
support for this interface, which will be part of 1.18,
once it's released.

I have pushed a branch porting GStreamer to
support these interface changes:

https://gitlab.freedesktop.org/ezequielgarcia/gst-plugins-bad/-/commits/for_h264_uapi_v3

As was discussed the SLICE_PARAMS control is now clarified
to work for one-slice-per-request operation, using CAPTURE
buffer holding features. This is how Cedrus driver is implemented.

The other drivers currently supported Hantro and Rockchip VDEC,
as well as the MTK stateless decoder posted by Alex Courbot
operate in frame-based mode.

These "frame-based" devices parse the slice headers in hardware,
and therefore shall not support SLICE_PARAMS. To that extent,
the redundant bitstream fields are now part of the DECODE_PARAMS
control.

Hopefully now the specification documentation is clear enough.
GStreamer, Chromium and FFmpeg (which I'm sure will be implemented
as soon as we stabilize the API) should serve as reference examples
on how the API is consumed.

Changelog:

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

Ezequiel Garcia (10):
  media: uapi: h264: Further clarify scaling lists order
  media: uapi: h264: Split prediction weight parameters
  media: uapi: h264: Increase size of 'first_mb_in_slice' field
  media: uapi: h264: Clean DPB entry interface
  media: uapi: h264: Increase size of DPB entry pic_num
  media: uapi: h264: Drop SLICE_PARAMS 'size' field
  media: uapi: h264: Clarify SLICE_BASED mode
  media: uapi: h264: Clean slice invariants syntax elements
  media: hantro: Don't require unneeded H264_SLICE_PARAMS
  media: rkvdec: Don't require unneeded H264_SLICE_PARAMS

Jernej Skrabec (3):
  media: uapi: h264: Update reference lists
  media: cedrus: h264: Properly configure reference field
  media: cedrus: h264: Fix frame list construction

Philipp Zabel (1):
  media: uapi: h264: Clarify pic_order_cnt_bit_size field

 .../media/v4l/ext-ctrls-codec.rst             | 224 ++++++++++--------
 drivers/media/v4l2-core/v4l2-ctrls.c          |  28 +++
 drivers/media/v4l2-core/v4l2-h264.c           |  12 +-
 drivers/staging/media/hantro/hantro_drv.c     |   5 -
 .../staging/media/hantro/hantro_g1_h264_dec.c |  21 +-
 drivers/staging/media/hantro/hantro_h264.c    |   8 +-
 drivers/staging/media/hantro/hantro_hw.h      |   2 -
 drivers/staging/media/rkvdec/rkvdec-h264.c    |  27 +--
 drivers/staging/media/rkvdec/rkvdec.c         |   5 -
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 +
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  49 ++--
 include/media/h264-ctrls.h                    |  80 ++++---
 include/media/v4l2-ctrls.h                    |   2 +
 include/media/v4l2-h264.h                     |   3 +-
 16 files changed, 257 insertions(+), 219 deletions(-)

-- 
2.27.0

