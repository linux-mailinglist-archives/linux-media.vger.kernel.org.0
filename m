Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E854818A405
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 21:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgCRUrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 16:47:51 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35783 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgCRUru (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 16:47:50 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4E73D20002;
        Wed, 18 Mar 2020 20:47:45 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org
Subject: [PATCH v7 00/11] media: Report camera sensor properties
Date:   Wed, 18 Mar 2020 21:50:23 +0100
Message-Id: <20200318205034.949531-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series has been floating around for quite a long time already.

This v7 is rebased on latest media master and the only change is actually
the rotation property description.

While working on libcamera we have gone through a -long- discussion and several
attempts to provide a precise definition for the camera rotation.  We came up
with a pretty lengthy description which I have replicated exactly here in the
DTS property definition. The description is meant to be read by integrators
which need a reference in order to properly calculate the rotation of their
camera modules. The property is thus expanded to be defined as the rotation
difference between to reference systems, precisely defined to reduce the
risk of having different interpretations between different camera module
integrators.

In the V4L2_CID_CAMERA_SENSOR_ROTATION control documentation I tried to provide
a description on how to use the control from a user point of view. The
description is meant to be read by application developers, which needs to
know how to rotate images to compensate the camera rotation. The value of the
control is exactly the same as the property one, but described from a consumer
point of view.

The rest of the series is unchanged.

Thanks
   j

Jacopo Mondi (11):
  dt-bindings: video-interfaces: Document 'location' property
  media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_LOCATION
  dt-bindings: video-interface: Replace 'rotation' description
  media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
  media: v4l2-ctrls: Add camera location and rotation
  media: v4l2-fwnode: Add helper to parse device properties
  include: v4l2-ctrl: Sort forward declarations
  media: v4l2-ctrls: Sort includes alphabetically
  media: v4l2-ctrls: Add helper to register properties
  media: i2c: ov5670: Parse and register properties
  media: i2c: ov13858: Parse and register properties

 .../bindings/media/video-interfaces.txt       | 372 +++++++++++++++++-
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 153 +++++++
 drivers/media/i2c/ov13858.c                   |  11 +
 drivers/media/i2c/ov5670.c                    |  12 +
 drivers/media/v4l2-core/v4l2-ctrls.c          |  52 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c         |  42 ++
 include/media/v4l2-ctrls.h                    |  34 +-
 include/media/v4l2-fwnode.h                   |  47 +++
 include/uapi/linux/v4l2-controls.h            |   7 +
 9 files changed, 718 insertions(+), 12 deletions(-)

--
2.25.1

