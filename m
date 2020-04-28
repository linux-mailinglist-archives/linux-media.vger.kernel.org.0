Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2C41BCE1E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 23:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgD1VDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 17:03:07 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:41567 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgD1VDG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 17:03:06 -0400
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B972F200002;
        Tue, 28 Apr 2020 21:03:01 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH v5 0/6]  media: Register read-only sub-dev devnode
Date:   Tue, 28 Apr 2020 23:06:03 +0200
Message-Id: <20200428210609.6793-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v5 addresses a few comments from Sakari and Laurent on documentation and
introduces "media: v4l2-subdev: Assume V4L2_SUBDEV_API is selected"
which removes checks for CONFIG_V4L2_SUBDEV_API from v4l2-subdev.c as
the subdevice device node is only registered if that option was selected in
first place.

Copy of v4 and v3 cover letter is below reported

-------------------------------------------------------------------------------
v4 is now rebased on top of latest media master which has moved documentation
around quite a bit.

v4 includes two patches originally from Hans to add support for SUBDEV_QUERYCAP
ioctl. Compared to its initial version only capabilities flags and version are
reported.
https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=subdev-querycap

I chose to report both the RO and RW capabilities flag to make it possible for
userspace to test on both cases, as RW was the 'standard' so far, the flag could
be removed if considered not necessary.

Checkpatch reports:
WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#44: FILE: drivers/media/v4l2-core/v4l2-subdev.c:344:
+		cap->version = LINUX_VERSION_CODE;

but I see LINUX_VERSION_CODE being used to version the media controller as well,
so I assume it's a false positive.

-------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------

Thanks
   j

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
  media: v4l2-subdev: Assume V4L2_SUBDEV_API is selected

 .../driver-api/media/v4l2-subdev.rst          |  53 +++++++-
 .../userspace-api/media/v4l/dev-subdev.rst    |   5 +
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../media/v4l/vidioc-g-dv-timings.rst         |   6 +
 .../userspace-api/media/v4l/vidioc-g-std.rst  |   6 +
 .../media/v4l/vidioc-subdev-g-crop.rst        |   9 ++
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   8 ++
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   8 ++
 .../media/v4l/vidioc-subdev-g-selection.rst   |   8 ++
 .../media/v4l/vidioc-subdev-querycap.rst      | 114 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-device.c         |   7 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  41 +++++--
 include/media/v4l2-dev.h                      |   7 ++
 include/media/v4l2-device.h                   |  50 +++++++-
 include/uapi/linux/v4l2-subdev.h              |  15 +++
 15 files changed, 322 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst

--
2.26.1

