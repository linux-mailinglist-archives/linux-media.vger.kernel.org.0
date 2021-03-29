Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28CC34D6AF
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 20:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhC2SOI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 14:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbhC2SOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 14:14:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43483C061574;
        Mon, 29 Mar 2021 11:14:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 865781F455BD
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
Subject: [PATCH v4 0/9] MPEG-2 stateless API cleanup and destaging
Date:   Mon, 29 Mar 2021 15:13:20 -0300
Message-Id: <20210329181329.48006-1-ezequiel@collabora.com>
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

Patches 1 to 6 cleanup the API, and patches 7 to 9 move it
out of staging.

This is tested on i.MX8M and RK3399 platforms, using GStreamer
v4l2codecs, which will be upstream very soon.

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

Ezequiel Garcia (9):
  media: uapi: mpeg2: Rework quantization matrices semantics
  media: uapi: mpeg2: Cleanup flags
  media: uapi: mpeg2: Split sequence and picture parameters
  media: uapi: mpeg2: Move reference buffer fields
  media: hantro/cedrus: Remove unneeded slice size and slice offset
  media: uapi: mpeg2: Remove V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS
  media: controls: Log MPEG-2 stateless control in .std_log
  media: uapi: Move the MPEG-2 stateless control type out of staging
  media: uapi: Move MPEG-2 stateless controls out of staging

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 218 ++++++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 217 -----------------
 .../media/v4l/pixfmt-compressed.rst           |  11 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  12 +
 .../media/v4l/vidioc-queryctrl.rst            |  18 +-
 .../media/videodev2.h.rst.exceptions          |   3 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 110 ++++++---
 drivers/staging/media/hantro/hantro_drv.c     |   9 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  95 ++++----
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  94 ++++----
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  10 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   3 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   8 +-
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |  89 +++----
 include/media/mpeg2-ctrls.h                   |  82 -------
 include/media/v4l2-ctrls.h                    |   7 +-
 include/uapi/linux/v4l2-controls.h            | 114 +++++++++
 include/uapi/linux/videodev2.h                |   7 +
 18 files changed, 586 insertions(+), 521 deletions(-)
 delete mode 100644 include/media/mpeg2-ctrls.h

-- 
2.30.0

