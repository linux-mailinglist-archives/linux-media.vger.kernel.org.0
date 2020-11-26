Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D6A2C515A
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 10:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730724AbgKZJgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 04:36:39 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39218 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389518AbgKZJgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 04:36:38 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B2CB91F45721
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
Subject: [PATCH v5 00/14] Stateless H.264 de-staging
Date:   Thu, 26 Nov 2020 06:36:04 -0300
Message-Id: <20201126093618.137292-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Another iteration, hoping we nailed it this time!

The git-diff difference between v4 and v5: http://ix.io/2Fwj.

v5:
  * Pick class g-ext-ctrls.rst patch from Hans.
  * Document V4L2_CTRL_CLASS_CODEC_STATELESS and H264 stateless fields
    in vidioc-g-ext-ctrls.rst.
  * Add videodev2 replace symbol for V4L2_CTRL_TYPE_H264_PRED_WEIGHTS.
  * Drop profile-idc macros and add a comment for it.
  * Fix old mpeg_video names in the new documentation.
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
  media: controls: Add validate failure debug message
  media: cedrus: h264: Support profile controls
  media: Rename stateful codec control macros
  media: Clean stateless control includes
  media: controls: Validate H264 stateless controls
  media: controls: Add the stateless codec control class
  media: uapi: Move parsed H264 pixel format out of staging
  media: doc: Replace symbol for V4L2_CTRL_TYPE_H264_PRED_WEIGHTS
  media: uapi: Move the H264 stateless control types out of staging
  media: controls: Log H264 stateless controls in .std_log
  media: uapi: move H264 stateless controls out of staging
  media: docs: Move the H264 stateless codec uAPI

Hans Verkuil (1):
  media: vidioc-g-ext-ctrls.rst: document V4L2_CTRL_CLASS_DETECT

Jonas Karlman (1):
  media: rkvdec: h264: Support profile and level controls

 .../userspace-api/media/v4l/common.rst        |   1 +
 .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 696 +--------------
 .../media/v4l/extended-controls.rst           |   8 +-
 .../media/v4l/pixfmt-compressed.rst           |  25 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  38 +-
 .../media/videodev2.h.rst.exceptions          |   1 +
 drivers/media/common/cx2341x.c                |   4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 204 ++++-
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
 include/uapi/linux/v4l2-controls.h            | 797 +++++++++++++-----
 include/uapi/linux/videodev2.h                |  14 +
 28 files changed, 1621 insertions(+), 1414 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
 delete mode 100644 include/media/h264-ctrls.h

-- 
2.27.0

