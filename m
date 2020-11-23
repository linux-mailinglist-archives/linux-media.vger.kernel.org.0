Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765E52C0DD8
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 15:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728941AbgKWOkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 09:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728889AbgKWOkU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 09:40:20 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F92C0613CF;
        Mon, 23 Nov 2020 06:40:19 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 080121F449A6
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
Subject: [PATCH v4 00/13] Stateless H.264 de-staging
Date:   Mon, 23 Nov 2020 11:39:47 -0300
Message-Id: <20201123144000.81310-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Seems we are converging, as this iteration is really small.

Just like v3, this iteration (plus a patch for VP8 VP8_FRAME_HEADER initialization,
which I'll send shortly) passes v4l2-compliance with no failures.

As an additional test, Fluendo's JVT-AVC_V1 conformance test [1] passes with
score 72/135, for the Hantro driver on i.MX8MQ (Hantro G1 VPU).
Considering the Hantro driver only supports 4:2:0 and 4:0:0, this score
looks quite good.

[1] https://github.com/fluendo/fluster/

Thanks,
Ezequiel

v4:
  * Minor documentation fixes.
  * Remove media/h264-ctrls.h, which was missing before.
  * Thanks to feedback from Jernej, std_validation_compound
    is now more complete, initializing non-present syntax elements.
v3:
  * Dropped level control from Cedrus, as agreed.
  * Add support for H264 stateless controls in std_log and std_validate_compound.
  * Added a ctrl debug error message, to help debug validation issues.
  * Style minor fixes as requested by Hans.
v2:
  * Split destage changes in several patches so it's easier to review.
  * Added missing changes to drivers/media/v4l2-core/v4l2-ctrls.c.
  * Renamed V4L2_CID_CODEC_CX2341X_ and V4L2_CID_MPEG_MFC51_
  * Moved the compatibility macros for MPEG to the end of the header.

Ezequiel Garcia (12):
  media: ctrls: Add validate failure debug message
  media: cedrus: h264: Support profile controls
  media: Rename stateful codec control macros
  media: Clean stateless control includes
  media: uapi: h264: Add profile_idc macros
  media: controls: Validate H264 stateless controls
  media: controls: Add the stateless codec control class
  media: uapi: Move parsed H264 pixel format out of staging
  media: uapi: Move the H264 stateless control types out of staging
  media: controls: Log H264 stateless controls in .std_log
  media: uapi: move H264 stateless controls out of staging
  media: docs: Move the H264 stateless codec uAPI

Jonas Karlman (1):
  media: rkvdec: h264: Support profile and level controls

 .../userspace-api/media/v4l/common.rst        |   1 +
 .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 696 +--------------
 .../media/v4l/extended-controls.rst           |   9 +-
 .../media/v4l/pixfmt-compressed.rst           |  21 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
 drivers/media/common/cx2341x.c                |   4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 198 ++++-
 drivers/staging/media/hantro/hantro_drv.c     |  26 +-
 drivers/staging/media/hantro/hantro_h264.c    |   8 +-
 drivers/staging/media/hantro/hantro_hw.h      |   4 +-
 drivers/staging/media/rkvdec/rkvdec-h264.c    |   8 +-
 drivers/staging/media/rkvdec/rkvdec.c         |  39 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  43 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  12 +-
 include/media/fwht-ctrls.h                    |   2 +-
 include/media/h264-ctrls.h                    | 406 ---------
 include/media/hevc-ctrls.h                    |  10 +-
 include/media/mpeg2-ctrls.h                   |   4 +-
 include/media/v4l2-ctrls.h                    |   1 -
 include/media/v4l2-h264.h                     |   2 +-
 include/media/vp8-ctrls.h                     |   2 +-
 include/uapi/linux/v4l2-controls.h            | 804 +++++++++++++-----
 include/uapi/linux/videodev2.h                |   8 +
 27 files changed, 1582 insertions(+), 1412 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
 delete mode 100644 include/media/h264-ctrls.h

-- 
2.27.0

