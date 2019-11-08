Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D846BF5053
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 16:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfKHP54 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 10:57:56 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:57811 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfKHP54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 10:57:56 -0500
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9C223100002;
        Fri,  8 Nov 2019 15:57:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v5 00/11] media: Report camera sensor properties
Date:   Fri,  8 Nov 2019 16:59:33 +0100
Message-Id: <20191108155944.1040883-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, fifth iteration following:

"media: v4l2-ctrls: Add camera sensor location"
https://patchwork.kernel.org/project/linux-media/list/?series=160901
"[v2,00/10] media: Report camera sensor properties
https://patchwork.kernel.org/cover/11116443/
"[PATCH v3 00/11] media: Report camera sensor properties"
https://patchwork.kernel.org/project/linux-media/list/?series=173571
"[PATCH v4 00/11] media: Report camera sensor properties
https://patchwork.kernel.org/project/linux-media/list/?series=183859

Minimal changes indeed as I've taken in Hans' suggestion to use max-col,
max-rows in place of num-cols, nul-lines in [04/11].

I didn't address Sakari suggestion to use 0 a 'UNDEFINED' property, mostly
because 0 is a valid rotation, and for location, the user visible property
values should have been enumerated starting from 1, which seem very un-natural.
I can change if you feel strong about it though.

v4 -> v5:
- cc device tree mailing list on relevant patches
- s/num-cols/max-col and s/num-lines/max-row in 4/11

v3 -> v4:
- Minor reword in documentation of location and rotation properties
- Fix V4L2_CID_CAMERA_SENSOR_ROTATION control documentation
- Renamed helper in v4l2_ctrl_new_fwnode_properties()

v2->v3:
- Expand 'rotation' property description
- s/device/system in properties description to make them applicable to
  cameras and flash LEDs
- Expand the rotation control description
- Split helper to parse properties and helper to register properties
- Drop the example coreboot patch that add properties to the Soraka device
  ACPI tables

Patches for the coreboot provided ACPI tables for two example sensors:
https://jmondi.org/cgit/coreboot/commit/?id=53a5fc6450bd45992f14a41848b72350f257c151
https://jmondi.org/cgit/coreboot/commit/?id=2a6b9b51f0e2e7b4ca5f4eadf21df8468ebc1b3f

Thanks
   j

Jacopo Mondi (11):
  dt-bindings: video-interfaces: Document 'location' property
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
 .../media/uapi/v4l/ext-ctrls-camera.rst       | 148 ++++++++++++++++++
 drivers/media/i2c/ov13858.c                   |  11 ++
 drivers/media/i2c/ov5670.c                    |  12 ++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  52 +++++-
 drivers/media/v4l2-core/v4l2-fwnode.c         |  42 +++++
 include/media/v4l2-ctrls.h                    |  34 +++-
 include/media/v4l2-fwnode.h                   |  48 ++++++
 include/uapi/linux/v4l2-controls.h            |   7 +
 9 files changed, 363 insertions(+), 12 deletions(-)

--
2.23.0

