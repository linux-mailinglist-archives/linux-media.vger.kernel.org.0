Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B013D7929
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 16:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbhG0O55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 10:57:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53124 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbhG0O54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 10:57:56 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 71F221F432BB
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 0/4] media: visiting YUV tiled formats
Date:   Tue, 27 Jul 2021 11:57:41 -0300
Message-Id: <20210727145745.25203-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series started with the addition of the V4L2_PIX_FMT_NV12_4L4
pixel format.

Researching about tiled formats, we realized that V4L2_PIX_FMT_SUNXI_TILED_NV12
is actually a simple 32x32 linear tiled NV12, and also that so-called "HM12"
is really a 16x16 linear tiled NV12.

Therefore, I decided to tackle the big picture as much as possible
and aim at cleaning all the NV12 tiled pixel formats.

As you can expect, the current pixel formats are kept for userspace
compatibility, but considered legacy in kernel code and deprecated.

The new nomenclatures for pixel formats is already being used in
GStreamer, it's cleaner and less surprising.

v2:

* Also take care of HM12.
* Fix missing description for NV12_4L4.
* Clean V4L2_PIX_FMT_NV12MT further.

Ezequiel Garcia (4):
  media: Rename V4L2_PIX_FMT_SUNXI_TILED_NV12 to V4L2_PIX_FMT_NV12_32L32
  media: Rename V4L2_PIX_FMT_HM12 to V4L2_PIX_FMT_NV12_16L16
  media: Add NV12_4L4 tiled format
  media: Clean V4L2_PIX_FMT_NV12MT documentation

 Documentation/admin-guide/media/ivtv.rst      |  2 +-
 .../media/drivers/cx2341x-uapi.rst            |  8 ++-
 .../media/v4l/pixfmt-reserved.rst             | 22 --------
 .../media/v4l/pixfmt-yuv-planar.rst           | 50 +++++++++++++------
 drivers/media/pci/cx18/cx18-ioctl.c           |  4 +-
 drivers/media/pci/cx18/cx18-streams.c         |  8 +--
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  8 +--
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 10 ++--
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  2 +-
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |  2 +-
 drivers/media/v4l2-core/v4l2-common.c         |  3 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  2 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  2 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  4 +-
 include/uapi/linux/videodev2.h                | 19 +++++--
 16 files changed, 81 insertions(+), 70 deletions(-)

-- 
2.32.0

