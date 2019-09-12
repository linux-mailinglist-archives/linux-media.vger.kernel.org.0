Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60FEDB1525
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbfILUJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 16:09:36 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56715 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfILUJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:09:36 -0400
X-Originating-IP: 85.243.204.24
Received: from uno.lan (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 745F72000B;
        Thu, 12 Sep 2019 20:09:32 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v3 00/11] media: Report camera sensor properties
Date:   Thu, 12 Sep 2019 22:10:44 +0200
Message-Id: <20190912201055.13964-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, third iteration following:

"media: v4l2-ctrls: Add camera sensor location"
https://patchwork.kernel.org/project/linux-media/list/?series=160901
"[v2,00/10] media: Report camera sensor properties
https://patchwork.kernel.org/cover/11116443/

Compared to v2 I have dropped the two patches reporting the sensor pixel array
size and active areas size

v2->v3:
- Expand 'rotation' property description
- s/device/system in properties description to make them applicable to
  cameras and flash LEDs
- Expand the rotation control description
- Split helper to parse properties and helper to register properties
- Drop the example coreboot patch that add properties to the Soraka device
  ACPI tables

I know there are still doubts the two properties might well apply to
modern devices with movable cameras, but I still think they cover 99% of devices
out there at the moment.

Thanks
   j

Jacopo Mondi (11):
  dt-bindings: video-interfaces: Document 'location'
  media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_LOCATION
  dt-bindings: video-interface: Expand rotation description
  media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
  media: v4l2-ctrls: Add camera location and rotation
  media: v4l2-fwnode: Add helper to parse device properties
  include: v4l2-ctrl: Sort forward declarations
  media: v4l2-ctrls: Sort includes alphabetically
  media: v4l2-ctrls: Add helper to register properties
  media: i2c: ov5670: Parse and register properties
  media: i2c: ov13858: Parse and register properties

 .../bindings/media/video-interfaces.txt       |  21 ++-
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 149 ++++++++++++++++++
 drivers/media/i2c/ov13858.c                   |  11 ++
 drivers/media/i2c/ov5670.c                    |  12 ++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  54 ++++++-
 drivers/media/v4l2-core/v4l2-fwnode.c         |  44 ++++++
 include/media/v4l2-ctrls.h                    |  36 ++++-
 include/media/v4l2-fwnode.h                   |  42 +++++
 include/uapi/linux/v4l2-controls.h            |   7 +
 9 files changed, 364 insertions(+), 12 deletions(-)

--
2.23.0

