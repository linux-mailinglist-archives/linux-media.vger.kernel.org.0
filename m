Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7243022160D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 22:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgGOUWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 16:22:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37088 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgGOUWy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 16:22:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id AA8492A5175
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
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/7] media: Clean H264 stateless uAPI
Date:   Wed, 15 Jul 2020 17:22:23 -0300
Message-Id: <20200715202233.185680-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The recent patch posted by Jernej (which I'm including for context),
encouraged me to address all the known issues in the uAPI.

I hope we can finally make this uAPI interface
public; and then also address the other codec
interfaces so we can move the codec drivers out of staging.

It should be noted that there is already GStreamer native
support for this interface, which will be part of 1.18,
once it's released [1], as well as support in Chromium [2].

I have pushed a branch porting GStreamer to
support these interface changes:

https://gitlab.freedesktop.org/ezequielgarcia/gst-plugins-bad/-/commits/for_h264_uapi_v2

The main changes are:

* Split prediction weight table to a separate control.
* Increase size of first_mb_in_slice field.
* Cleanup DPB entry interface, to support field coding.
* Increase of DPB entry pic_num field.
* Move slice invariant fields to the per-frame control.

I'm adding here the change from Jernej, and a change from
Philipp Zabel which apparently fell thru the cracks.

Ezequiel Garcia (8):
  media: uapi: h264: Further clarify scaling lists order
  media: uapi: h264: Split prediction weight parameters
  media: uapi: h264: Increase size of 'first_mb_in_slice' field
  media: uapi: h264: Cleanup DPB entry interface
  media: uapi: h264: Increase size of DPB entry pic_num
  media: uapi: h264: Clean slice invariants syntax elements
  media: hantro: Don't require unneeded H264_SLICE_PARAMS
  media: rkvdec: Don't require unneeded H264_SLICE_PARAMS

Jernej Skrabec (1):
  media: uapi: h264: Update reference lists

Philipp Zabel (1):
  media: uapi: h264: Clarify pic_order_cnt_bit_size field

 .../media/v4l/ext-ctrls-codec.rst             | 192 +++++++++++-------
 drivers/media/v4l2-core/v4l2-ctrls.c          |  25 +++
 drivers/media/v4l2-core/v4l2-h264.c           |  12 +-
 drivers/staging/media/hantro/hantro_drv.c     |   5 -
 .../staging/media/hantro/hantro_g1_h264_dec.c |  21 +-
 drivers/staging/media/hantro/hantro_h264.c    |   8 +-
 drivers/staging/media/hantro/hantro_hw.h      |   2 -
 drivers/staging/media/rkvdec/rkvdec-h264.c    |  18 +-
 drivers/staging/media/rkvdec/rkvdec.c         |   5 -
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  21 +-
 include/media/h264-ctrls.h                    |  80 +++++---
 include/media/v4l2-h264.h                     |   3 +-
 14 files changed, 234 insertions(+), 161 deletions(-)

-- 
2.27.0

