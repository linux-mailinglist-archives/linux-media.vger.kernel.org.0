Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 089F6191AE1
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 21:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgCXUZ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 16:25:56 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:42901 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgCXUZz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 16:25:55 -0400
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 497B110000D;
        Tue, 24 Mar 2020 20:25:51 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com
Subject: [PATCH 0/4] media: Register read-only sub-dev devnode
Date:   Tue, 24 Mar 2020 21:28:40 +0100
Message-Id: <20200324202844.1518292-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new functio v4l2_device_register_ro_subdev_nodes() to pair with
v4l2_device_register_subdev_nodes() that allows a bridge driver to register the
device node for its subdevices in read-only mode.

devnode-centric (aka non-MC) bridge drivers control their subdevices through
direct calls to v4l2 subdev operations and do not want userspace to be able
to control the subdevice configuration by calling ioctls on the sub-device
devnode. For this reason, they mostly refrain from registering any devnode at
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

Jacopo Mondi (4):
  Documentation: media: Document read-only subdevice
  media: v4l2-dev: Add v4l2_device_register_ro_subdev_node()
  media: bcm2835: Register sensor devnode as read-only
  media: bcm2835: Fix trivial whitespace error

 Documentation/media/kapi/v4l2-subdev.rst      | 38 +++++++++++++++++++
 .../media/uapi/v4l/vidioc-g-dv-timings.rst    |  6 +++
 Documentation/media/uapi/v4l/vidioc-g-std.rst |  6 +++
 .../media/uapi/v4l/vidioc-subdev-g-crop.rst   |  9 +++++
 .../media/uapi/v4l/vidioc-subdev-g-fmt.rst    |  8 ++++
 .../v4l/vidioc-subdev-g-frame-interval.rst    |  8 ++++
 .../uapi/v4l/vidioc-subdev-g-selection.rst    |  8 ++++
 .../media/platform/bcm2835/bcm2835-unicam.c   |  4 +-
 drivers/media/v4l2-core/v4l2-device.c         | 16 +++++++-
 drivers/media/v4l2-core/v4l2-subdev.c         | 19 ++++++++++
 include/media/v4l2-dev.h                      |  7 ++++
 include/media/v4l2-device.h                   | 10 +++++
 12 files changed, 136 insertions(+), 3 deletions(-)

--
2.25.1

