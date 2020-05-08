Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63011CA7A2
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 11:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgEHJ65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 05:58:57 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:59853 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgEHJ64 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 05:58:56 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D5E95FF806;
        Fri,  8 May 2020 09:58:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz
Subject: [PATCH v10 00/13] media: report camera properties
Date:   Fri,  8 May 2020 12:01:45 +0200
Message-Id: <20200508100158.3437161-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   this v10 is not just a rename s/location/orientation as the documentation
around the property has changed slightly as well and should probably be re-read.

Anyway, most notable change is indeed the usa of 'orientation' in place of
location, so that we have an 'orientation' DT property, a
V4L2_CID_CAMERA_ORIENTATION control id and V4L2_ORIENTATION_* control values.

A new patch 'dt-bindings: Add media properties' add an header to help DT users
by providing macros for the currently supported locations.

I've added a patch for a new sensor driver I have used for testing (imx219) and
made the V4L2_CID_CAMERA_ORIENTATION a menu control as it was meant to be.

I know the additional DT header could slow the series inclusion, I'm fine
leaving it out if it proves controversial.

The result of the two new controls inspected with v4l2-ctl -L for a camera
with EXTERNAL orientation and 180 degrees rotation is the following:

------------------------------------------------------------------------------------------------------------------
Camera Controls

             camera_orientation 0x009a0922 (menu)   : min=0 max=2 default=2 value=2 flags=read-only
				0: Front Camera
				1: Back Camera
				2: External Camera
         camera_sensor_rotation 0x009a0923 (int)    : min=180 max=180 step=1 default=180 value=180 flags=read-only
------------------------------------------------------------------------------------------------------------------

Thanks
   j

v9->v10:
- s/location/orientation and documentation update
- Add DT bindings header for media properties
- Make V4L2_CID_CAMERA_ORIENTATION a TYPE_MENU control
- Add patch for imx219

v8->v9:
- Rebased on media master which has moved media documentation

v7->v8:
- Add Rob's ack to 03/11
- Address Hans typographical comments in 03/11

Jacopo Mondi (13):
  dt-bindings: video-interfaces: Document 'orientation' property
  dt-bindings: video-interface: Replace 'rotation' description
  dt-bindings: Add media properties
  media: v4l2-ctrl: Document V4L2_CID_CAMERA_ORIENTATION
  media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
  media: v4l2-ctrls: Add camera orientation and rotation
  media: v4l2-fwnode: Add helper to parse device properties
  include: v4l2-ctrl: Sort forward declarations
  media: v4l2-ctrls: Sort includes alphabetically
  media: v4l2-ctrls: Add helper to register properties
  media: i2c: ov5670: Parse and register properties
  media: i2c: ov13858: Parse and register properties
  media: i2c: imx219: Parse and register properties

 .../bindings/media/video-interfaces.txt       | 372 +++++++++++++++++-
 .../media/v4l/ext-ctrls-camera.rst            | 151 +++++++
 drivers/media/i2c/imx219.c                    |  12 +-
 drivers/media/i2c/ov13858.c                   |  13 +-
 drivers/media/i2c/ov5670.c                    |  14 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  63 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c         |  42 ++
 include/dt-bindings/media/video-interfaces.h  |  15 +
 include/media/v4l2-ctrls.h                    |  34 +-
 include/media/v4l2-fwnode.h                   |  47 +++
 include/uapi/linux/v4l2-controls.h            |   7 +
 11 files changed, 755 insertions(+), 15 deletions(-)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

--
2.26.1

