Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A171CBF75
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 11:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgEIJBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 05:01:55 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:56409 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgEIJBz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 05:01:55 -0400
X-Originating-IP: 212.216.150.148
Received: from uno.homenet.telecomitalia.it (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D51221C0002;
        Sat,  9 May 2020 09:01:50 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz
Subject: [PATCH v11 00/13] media: report camera properties
Date:   Sat,  9 May 2020 11:04:43 +0200
Message-Id: <20200509090456.3496481-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   I've addressed Hans comments on naming and control registration.

I've moved "dt-bindings: Add media properties" to the end so that it can be left
out if controversial.


v10->v11
- s/V4L2_ORIENTATION/V4L2_CAMERA_ORIENTATION
- Minor adjustments to the controls registration

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
  dt-bindings: Add media properties

 .../bindings/media/video-interfaces.txt       | 372 +++++++++++++++++-
 .../media/v4l/ext-ctrls-camera.rst            | 151 +++++++
 drivers/media/i2c/imx219.c                    |  12 +-
 drivers/media/i2c/ov13858.c                   |  13 +-
 drivers/media/i2c/ov5670.c                    |  14 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  61 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c         |  42 ++
 include/dt-bindings/media/video-interfaces.h  |  15 +
 include/media/v4l2-ctrls.h                    |  34 +-
 include/media/v4l2-fwnode.h                   |  47 +++
 include/uapi/linux/v4l2-controls.h            |   7 +
 11 files changed, 753 insertions(+), 15 deletions(-)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

--
2.26.1

