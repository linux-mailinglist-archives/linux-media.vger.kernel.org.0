Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72CDC353503
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 20:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236323AbhDCSIL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 14:08:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42266 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhDCSIL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 14:08:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8B7111F4580D
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 00/10] MPEG-2 stateless API cleanup and destaging
Date:   Sat,  3 Apr 2021 15:07:46 -0300
Message-Id: <20210403180756.175881-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

Over the last few weeks Daniel Almeida and Nicolas Dufresne
have been working on GStreamer v4l2codecs support for stateless
MPEG-2 decoding.

This allowed us to re-review the MPEG-2 specification and re-discuss
the API with some additional insight. The API now looks quite cleaner,
and hopefully ready for destaging.

This series is mostly thanks to Daniel and Nicolas!

Patches 1 to 7 cleanup the API, and patches 8 to 10 move it
out of staging.

This is tested on i.MX8M and RK3399 platforms, using GStreamer
v4l2codecs, which will be upstream very soon.

v5:
* Rename "quantization" to "quantisation", so the terminology
  matches the MPEG-2 specification.
  This is the only change in v5, compared to v4.

v4:
* Rework and clarify quantization matrices control semantics.
* Move reference buffer fields to the picture parameter control.
* Remove slice parameters control. This can be added back in the
  future if needed, but for now it's not used.
  See patch 6/9 for details.
* Destage the API.

v3:
* No API changes, just minor boilerplate fixes for the new
  controls to be properly exposed, initialized and validated.

v2:
* Fixed bad use of boolean negation in a flag, which
  was fortunately reported by 0day bot.

Ezequiel Garcia (10):
  media: uapi: mpeg2: Rename "quantization" to "quantisation"
  media: uapi: mpeg2: rework quantisation matrices semantics
  media: uapi: mpeg2: Cleanup flags
  media: uapi: mpeg2: Split sequence and picture parameters
  media: uapi: mpeg2: Move reference buffer fields
  media: hantro/cedrus: Remove unneeded slice size and slice offset
  media: uapi: mpeg2: Remove V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS
  media: controls: Log MPEG-2 stateless control in .std_log
  media: uapi: Move the MPEG-2 stateless control type out of staging
  media: uapi: move MPEG-2 stateless controls out of staging

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 218 +++++
 .../media/v4l/ext-ctrls-codec.rst             | 217 -----
 .../media/v4l/pixfmt-compressed.rst           |  11 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  12 +
 .../media/v4l/vidioc-queryctrl.rst            |  18 +-
 .../media/videodev2.h.rst.exceptions          |   5 +-
 drivers/media/v4l2-core/v4l2-async-core.c     | 880 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 118 ++-
 drivers/staging/media/hantro/hantro_drv.c     |   9 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        | 110 +--
 drivers/staging/media/hantro/hantro_hw.h      |   2 +-
 drivers/staging/media/hantro/hantro_mpeg2.c   |   2 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    | 106 +--
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  10 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   5 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |  97 +-
 include/media/mpeg2-ctrls.h                   |  82 --
 include/media/v4l2-ctrls.h                    |  11 +-
 include/uapi/linux/v4l2-controls.h            | 114 +++
 include/uapi/linux/videodev2.h                |   7 +
 21 files changed, 1492 insertions(+), 552 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-async-core.c
 delete mode 100644 include/media/mpeg2-ctrls.h

-- 
2.30.0

