Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603DB2B97A8
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 17:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgKSQUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 11:20:08 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:57409 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbgKSQUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 11:20:08 -0500
X-Originating-IP: 93.34.118.233
Received: from localhost.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B36311C001A;
        Thu, 19 Nov 2020 16:20:02 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v4 00/30]  media: ov5647: Support RaspberryPi Camera Module v1
Date:   Thu, 19 Nov 2020 17:19:26 +0100
Message-Id: <20201119161956.756455-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v3: https://patchwork.linuxtv.org/project/linux-media/list/?series=3813
v2: https://patchwork.linuxtv.org/project/linux-media/list/?series=3782
v1: https://patchwork.linuxtv.org/project/linux-media/list/?series=2765

Address Sakari's comments which lead to a substantial rebase and a rework
of set_pad_fmt()

Last patch which removes the 8-bit mode can be left out if the mode is
considered useful even if (locally) broken.

Compliance output is the same as v3.

Thanks
  j

Dave Stevenson (8):
  media: ov5647: Add support for PWDN GPIO.
  media: ov5647: Add support for non-continuous clock mode
  media: ov5647: Add set_fmt and get_fmt calls.
  media: ov5647: Add support for get_selection()
  media: ov5647: Set V4L2_SUBDEV_FL_HAS_EVENTS flag
  media: ov5647: Support V4L2_CID_PIXEL_RATE
  media: ov5647: Support V4L2_CID_VBLANK control
  media: ov5647: Advertise the correct exposure range

David Plowman (1):
  media: ov5647: Support gain, exposure and AWB controls

Jacopo Mondi (21):
  dt-bindings: media: i2c: Rename ov5647.yaml
  media: ov5647: Fix format initialization
  media: ov5647: Fix style issues
  media: ov5647: Replace license with SPDX identifier
  media: ov5647: Fix return value from read/write
  media: ov5647: Program mode at s_stream(1) time
  media: ov5647: Implement enum_frame_size()
  media: ov5647: Protect s_stream() with mutex
  media: ov5647: Rationalize driver structure name
  media: ov5647: Break out format handling
  media: ov5647: Rename SBGGR8 VGA mode
  media: ov5647: Add SGGBR10_1X10 modes
  media: ov5647: Use SBGGR10_1X10 640x480 as default
  media: ov5647: Implement set_fmt pad operation
  media: ov5647: Support V4L2_CID_HBLANK control
  media: ov5647: Use pm_runtime infrastructure
  media: ov5647: Rework s_stream() operation
  media: ov5647: Apply controls only when powered
  media: ov5647: Constify oe_enable/disable reglist
  media: ov5647: Support VIDIOC_SUBSCRIBE_EVENT
  media: ov5647: Remove 640x480 SBGGR8 mode

 .../i2c/{ov5647.yaml => ovti,ov5647.yaml}     |    0
 MAINTAINERS                                   |    2 +-
 drivers/media/i2c/ov5647.c                    | 1259 ++++++++++++++---
 3 files changed, 1051 insertions(+), 210 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml} (100%)

--
2.29.1

