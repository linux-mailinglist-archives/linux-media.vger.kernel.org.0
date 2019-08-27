Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31FD39E3DD
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 11:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfH0JW2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 05:22:28 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60911 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfH0JW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 05:22:27 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9595B1C0004;
        Tue, 27 Aug 2019 09:22:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v2 00/10] media: Report camera sensor properties
Date:   Tue, 27 Aug 2019 11:23:26 +0200
Message-Id: <20190827092339.8858-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   this second version of this series includes both the previously sent
"media: v4l2-ctrls: Add camera sensor location"
https://patchwork.kernel.org/project/linux-media/list/?series=160901
"media: i2c: ov5670: Report native size and crop bounds"
https://patchwork.kernel.org/project/linux-media/list/?series=161169
which could now be marked as superseded.

I decided to merge them together as the final intent of both series is to expose
informations on the camera sensor which are currently not available.

Retrieving the following camera static information is a requirement for the
implementation of the Android-compatiblity layer of libcamera, but I'm sure
it might prove useful for other user-space applications and libraries as well.

The series reports the following camera static informations
- Camera sensor location: by adding a new read-only control and a new DTS
  property to report it
- Camera sensor rotation: by adding a new read-only control and parsing the
  existing 'rotation' property
- Camera sensor pixel array size and active area size by using the V4L2
  subdevice selection API for two sensor of interest (these are just sensor
  patches without any core changes, but I've included them in this series
  anyway)

Compared to v1:
- Add V4L2_CID_CAMERA_SENSOR_ROTATION read-only control
- Parse the 'rotation' device property in the newly introduced
  v4l2_fwnode_register_controls() helper

As an example, a final not-to-merge patch to the coreboot ACPI tables
for the Soraka device used for development is provided as a simple usage
example of the 'rotation' and 'location' properties.
The patch is against the https://review.coreboot.org/coreboot.git master branch.

Thanks
   j

Jacopo Mondi (10):
  media: dt-bindings: Document 'location' property
  media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_LOCATION
  media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
  media: v4l2-ctrl: Add V4L2_CID_CAMERA_SENSOR_LOCATION
  media: v4l2-ctrl: Add V4L2_CID_CAMERA_SENSOR_ROTATION
  media: v4l2-fwnode: Add helper to register controls from fw
  media: i2c: ov5670: Register controls from firmware
  media: i2c: ov13858: Register controls from firmware
  media: i2c: ov5670: Report native size and crop bounds
  media: i2c: ov13858: Report native size and crop bounds

 .../bindings/media/video-interfaces.txt       | 10 ++++
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 43 ++++++++++++++
 drivers/media/i2c/ov13858.c                   | 31 ++++++++++
 drivers/media/i2c/ov5670.c                    | 27 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  4 ++
 drivers/media/v4l2-core/v4l2-fwnode.c         | 57 +++++++++++++++++++
 include/media/v4l2-fwnode.h                   | 30 ++++++++++
 include/uapi/linux/v4l2-controls.h            |  7 +++
 8 files changed, 209 insertions(+)

--
2.23.0

