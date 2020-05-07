Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9155A1C93D6
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 17:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgEGPJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 11:09:49 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:56799 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgEGPJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 11:09:49 -0400
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 97DDD20001B;
        Thu,  7 May 2020 15:09:45 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH v7 0/6] media: Register read-only sub-dev devnode
Date:   Thu,  7 May 2020 17:12:47 +0200
Message-Id: <20200507151253.2951492-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  dropped V4L2_SUBDEV_CAP_RW_SUBDEV as requested by Hans, updated documentation
and commit messages accordingly.

Thanks
   j

v6->v7:
- Drop V4L2_SUBDEV_CAP_RW_SUBDEV

v5.1->v6:
- Add __u32 reserved[14] field to struct v4l2_subdev_capabilities
- s/v4l2_subdev_capabilities.subdev_cap/v4l2_subdev_capabilities.capabilities
- Update documentation accordingly

v5->v5.1:
- Replace
  "media: v4l2-subdev: Assume V4L2_SUBDEV_API is selected"
  with
  "media: v4l2-subdev: Guard whole fops and ioctl hdlr"

v4->v5:
- Add "media: v4l2-subdev: Assume V4L2_SUBDEV_API is selected"
- Use BIT() instead of manual bitshifting
- Use tabs in documentation in place of 8 spaces
- minor documentation fixes

v3->v4:
- Rebase v3 on latest media master and new documentation layout
- Add SUBDEV_QUERYCAP support

v2->v3:
- Add Sakari's ack to the series
- Documentation:
  - Address Sakari' and Hans suggestions
- Implementation:
  - Rename V4L2_FL_RO_DEVNODE to V4L2_FL_SUBDEV_RO_DEVNODE
  - Limit the ability to register sub-device video device nodes to
    driver claiming support for CONFIG_VIDEO_V4L2_SUBDEV_API

v1->v2:
- Documentation:
  - Add a new patch using Laurent's suggestion to update the sub-device
    userspace API introduction
  - Take in some of Laurent's suggestions in v4l2-subdev.rst and add a new
    section in dev-subdev.rst
- Implementation:
  - As noted by Andrey, V4L2_FL_* are meant to be used as bitmasks. Use
    test_bit()/set_bit() as the rest of the v4l2 core does. It's a bit an
    overkill compared to use plain BIT() as noted by Sakari but I preferred
    consistency with the rest of the core
  - Make v4l2_device_register_subdev_nodes() and
    v4l2_device_register_ro_subdev_nodes() to v4l2-device.h and make them
    inline functions. Documentation style has been copied from other functions
    with similar implementations, such as __video_register_device() in
    v4l2-dev.h

Hans Verkuil (2):
  v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
  v4l: document VIDIOC_SUBDEV_QUERYCAP

Jacopo Mondi (4):
  Documentation: media: Update sub-device API intro
  Documentation: media: Document read-only subdevice
  media: v4l2-dev: Add v4l2_device_register_ro_subdev_node()
  media: v4l2-subdev: Guard whole fops and ioctl hdlr

 .../driver-api/media/v4l2-subdev.rst          |  53 ++++++++-
 .../userspace-api/media/v4l/dev-subdev.rst    |   5 +
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../media/v4l/vidioc-g-dv-timings.rst         |   6 +
 .../userspace-api/media/v4l/vidioc-g-std.rst  |   6 +
 .../media/v4l/vidioc-subdev-g-crop.rst        |   9 ++
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   8 ++
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   8 ++
 .../media/v4l/vidioc-subdev-g-selection.rst   |   8 ++
 .../media/v4l/vidioc-subdev-querycap.rst      | 112 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-device.c         |   7 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  69 +++++++++--
 include/media/v4l2-dev.h                      |   7 ++
 include/media/v4l2-device.h                   |  50 +++++++-
 include/uapi/linux/v4l2-subdev.h              |  16 +++
 15 files changed, 349 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst

--
2.26.1

