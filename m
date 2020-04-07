Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE281A1008
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 17:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbgDGPTH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 11:19:07 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:47573 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbgDGPTH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 11:19:07 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B686DFF809;
        Tue,  7 Apr 2020 15:19:02 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 0/3] media: Register read-only sub-dev devnode
Date:   Tue,  7 Apr 2020 17:21:54 +0200
Message-Id: <20200407152157.1686474-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new function v4l2_device_register_ro_subdev_nodes() to pair with
v4l2_device_register_subdev_nodes() that allows a bridge driver to register the
device node for its subdevices in read-only mode.

Devnode-centric (aka non-MC) bridge drivers control their subdevices through
direct calls to v4l2 subdev operations and do not want userspace to be able
to control the subdevice configuration by calling ioctls on the sub-device
devnode. For this reason, they usually refrain from registering any devnode at
all for their subdevices.

However it is sometimes required for userspace to access the sub-dev device
nodes to collect information on the actual configuration, without changing
the one currently applied to the device.

This requirement became pressing while working on libcamera on devnode-centric
platforms that do not expose any sub-device for their camera sensor to prevent
userspace from changing their configuration. To allow them to register device
node and being guaranteed to retain control of the subdevice configuration this
series proposes a way to register device nodes in read-only to restrict
access to all ioctls that could potentially affect the sub-dev configuration.

Thanks
   j

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

Jacopo Mondi (3):
  Documentation: media: Update sub-device API intro
  Documentation: media: Document read-only subdevice
  media: v4l2-dev: Add v4l2_device_register_ro_subdev_node()

 Documentation/media/kapi/v4l2-subdev.rst      | 53 ++++++++++++++++++-
 Documentation/media/uapi/v4l/dev-subdev.rst   |  5 ++
 .../media/uapi/v4l/vidioc-g-dv-timings.rst    |  6 +++
 Documentation/media/uapi/v4l/vidioc-g-std.rst |  6 +++
 .../media/uapi/v4l/vidioc-subdev-g-crop.rst   |  9 ++++
 .../media/uapi/v4l/vidioc-subdev-g-fmt.rst    |  8 +++
 .../v4l/vidioc-subdev-g-frame-interval.rst    |  8 +++
 .../uapi/v4l/vidioc-subdev-g-selection.rst    |  8 +++
 drivers/media/v4l2-core/v4l2-device.c         |  7 ++-
 drivers/media/v4l2-core/v4l2-subdev.c         | 19 +++++++
 include/media/v4l2-dev.h                      |  7 +++
 include/media/v4l2-device.h                   | 50 +++++++++++++++--
 12 files changed, 178 insertions(+), 8 deletions(-)

--
2.26.0

