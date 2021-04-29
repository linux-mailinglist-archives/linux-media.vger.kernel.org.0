Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C3436ECA0
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 16:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239981AbhD2OtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 10:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232820AbhD2OtQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 10:49:16 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AE8C06138B;
        Thu, 29 Apr 2021 07:48:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id BFCE51F43316
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
Subject: [PATCH v7 00/10] MPEG-2 stateless API cleanup and destaging
Date:   Thu, 29 Apr 2021 11:48:08 -0300
Message-Id: <20210429144818.67105-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Seventh round.

v7:
* Fix padding in v4l2_ctrl_mpeg2_picture.
* Fix V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE.

v6: 
* Reorder patch "media: controls: Log MPEG-2 stateless control in .std_log"
  to avoid a new compile warning.
* Remove "reserved" field in mpeg2 sequence control, noted by Hans.
* Reorder "flags" field in mpeg2 picture control, noted by Hans.
* Typos and comments fixes, noted by Hans.

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
  media: uapi: Move the MPEG-2 stateless control type out of staging
  media: controls: Log MPEG-2 stateless control in .std_log
  media: uapi: move MPEG-2 stateless controls out of staging

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 214 +++++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 217 ------------------
 .../media/v4l/pixfmt-compressed.rst           |  11 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  12 +
 .../media/v4l/vidioc-queryctrl.rst            |  18 +-
 .../media/videodev2.h.rst.exceptions          |   5 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 122 +++++++---
 drivers/staging/media/hantro/hantro_drv.c     |   9 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        | 110 ++++-----
 drivers/staging/media/hantro/hantro_hw.h      |   2 +-
 drivers/staging/media/hantro/hantro_mpeg2.c   |   2 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    | 106 ++++-----
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  10 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   5 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |  97 +++-----
 include/media/mpeg2-ctrls.h                   |  82 -------
 include/media/v4l2-ctrls.h                    |  11 +-
 include/uapi/linux/v4l2-controls.h            | 112 +++++++++
 include/uapi/linux/videodev2.h                |   7 +
 20 files changed, 610 insertions(+), 552 deletions(-)
 delete mode 100644 include/media/mpeg2-ctrls.h

-- 
2.30.0

