Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695A32B2779
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 22:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgKMVvk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 16:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgKMVvk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 16:51:40 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864EEC0613D1;
        Fri, 13 Nov 2020 13:51:40 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 896531F46BB5
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 0/9] Stateless H.264 de-staging
Date:   Fri, 13 Nov 2020 18:51:12 -0300
Message-Id: <20201113215121.505173-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that H.264 stateless controls are solid, we can get it
out of staging.

Following some guidelines from Hans, this series creates a
new stateless control class for the stable codec controls to land.

While here, I'm including a patch from Jonas adding profiles
and levels to Rkvdec, and also made a similar fix for Cedrus.

This series was tested on a i.MX8MQ EVK board, using GStreamer:

https://gitlab.freedesktop.org/ezequielgarcia/gst-plugins-bad/-/commits/h264_stable_uapi

In case someone wants to give this a test.

Note that v4l2-compliance isn't passing, as the Hantro driver
doesn't set legal default values for the H264 SPS, PPS, etc
controls.

That's something we should fix, although it's since it's just
meant to please v4l2-compliance, we could also argue that these
controls shouldn't be expected to have any default value.

Thanks,
Ezequiel

v2:
  * Split destage changes in several patches so it's easier to review.
  * Added missing changes to drivers/media/v4l2-core/v4l2-ctrls.c.
  * Renamed V4L2_CID_CODEC_CX2341X_ and V4L2_CID_MPEG_MFC51_
  * Moved the compatibility macros for MPEG to the end of the header.

Ezequiel Garcia (8):
  media: cedrus: h264: Support profile and level controls
  media: Rename stateful codec control macros
  media: Clean stateless control includes
  media: controls: Add the stateless codec control class
  media: uapi: Move parsed H264 pixel format out of staging
  media: uapi: Move the H264 stateless control types out of staging
  media: uapi: move H264 stateless controls out of staging
  media: docs: Move the H264 stateless codec uAPI

Jonas Karlman (1):
  media: rkvdec: h264: Support profile and level controls

 .../userspace-api/media/v4l/common.rst        |   1 +
 .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 696 +---------------
 .../media/v4l/extended-controls.rst           |   8 +-
 .../media/v4l/pixfmt-compressed.rst           |  14 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
 drivers/media/common/cx2341x.c                |   4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  45 +-
 drivers/staging/media/hantro/hantro_drv.c     |  26 +-
 drivers/staging/media/hantro/hantro_h264.c    |   8 +-
 drivers/staging/media/hantro/hantro_hw.h      |   4 +-
 drivers/staging/media/rkvdec/rkvdec-h264.c    |   8 +-
 drivers/staging/media/rkvdec/rkvdec.c         |  39 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  45 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  12 +-
 include/media/fwht-ctrls.h                    |   2 +-
 include/media/h264-ctrls.h                    |  27 +-
 include/media/hevc-ctrls.h                    |  10 +-
 include/media/mpeg2-ctrls.h                   |   4 +-
 include/media/v4l2-ctrls.h                    |   1 -
 include/media/v4l2-h264.h                     |   2 +-
 include/media/vp8-ctrls.h                     |   2 +-
 include/uapi/linux/v4l2-controls.h            | 788 +++++++++++++-----
 include/uapi/linux/videodev2.h                |   8 +
 27 files changed, 1422 insertions(+), 1018 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst

-- 
2.27.0

