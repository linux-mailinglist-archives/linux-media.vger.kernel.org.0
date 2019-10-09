Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC81D0C28
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 12:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730407AbfJIKEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 06:04:48 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:48465 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730289AbfJIKEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 06:04:48 -0400
Received: from [IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060] ([IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060])
        by smtp-cloud8.xs4all.net with ESMTPA
        id I8ppibZvqop0AI8pqiOnBp; Wed, 09 Oct 2019 12:04:46 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benoit Parrot <bparrot@ti.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] ti-vpe maintenance, add
 V4L2_CTRL_TYPE_AREA/V4L2_CID_UNIT_CELL_SIZE
Message-ID: <e74ba649-28a5-a936-531c-aa2e0419384f@xs4all.nl>
Date:   Wed, 9 Oct 2019 12:04:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCkb7gCtvCzRa11RgW4PiTBtkHWzrulq6av7Uga5fuZSGmysYSRao8CQMxBQIPHfFr2haKuDdcZ05ZWS0sfrg8fPrGhW1U6CrCt150/84AI9UUz+QbDL
 lLjj+Rme6uZ2qx9lkAYjoRpFYRHJhGEz2BHavCIBnH9G0ijYU1Zx0D3MAFvIXB7MxrKQ5opgZ4xzdstksFwMHccLBQOtQ0757Ck9JJYH+VmCSgVFTq4AkKzX
 zQp/T8/vVUINvsRRIKcv5xbLGKYZIXYPQmcA6dFrBOLuCFLMB0eL6ObNql24RSp6rw+KcZ5408qtrl2YT8+I7OiVSTP/4A9untRaWcXIjWk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR adds support for V4L2_CID_UNIT_CELL_SIZE and the V4L2_CTRL_TYPE_AREA
control type. It also adds support for providing a default value for compound
controls (will be useful for stateless codec support as well).

It also adds a maintenance series for ti-vpe. Note the addition of a pixel
encoding enum for v4l2_format_info.

Regards,

	Hans

The following changes since commit 219031a6e7dff52a066e8b074adc0697f501e3d3:

  media: venus: fix build on 32bit environments (2019-10-08 13:46:36 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5h

for you to fetch changes up to 66eb437d3f37932238bb24691979930c8a7d60b5:

  media: ti-vpe: vpe: don't rely on colorspace member for conversion (2019-10-09 11:30:41 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benoit Parrot (18):
      media: ti-vpe: Fix a parallel build issue
      media: ti-vpe: vpe: Fix Motion Vector vpdma stride
      media: ti-vpe: vpe: Add missing null pointer checks
      media: ti-vpe: vpe: Remove unnecessary use of container_of
      media: ti-vpe: vpe: fix a v4l2-compliance failure causing a kernel panic
      media: ti-vpe: vpe: fix a v4l2-compliance warning about invalid pixel format
      media: ti-vpe: vpe: Make sure YUYV is set as default format
      media: ti-vpe: vpe: fix a v4l2-compliance failure about invalid sizeimage
      media: ti-vpe: vpe: fix a v4l2-compliance failure about frame sequence number
      media: ti-vpe: vpe: ensure buffers are cleaned up properly in abort cases
      media: ti-vpe: vpdma: Use fixed type for address in descriptor
      media: ti-vpe: Set the DMA mask and coherent mask
      media: ti-vpe: vpe: use standard struct instead of duplicating fields
      media: ti-vpe: vpe: fix v4l2_compliance issue related to xfer_func
      media: ti-vpe: csc: rgb-to-yuv HD full range coeff are wrong
      media: v4l2-common: add pixel encoding support
      media: v4l2-common: add RGB565 and RGB55 to v4l2_format_info
      media: ti-vpe: vpe: don't rely on colorspace member for conversion

Nikhil Devshatwar (2):
      media: ti-vpe: Add support for SEQ_BT
      media: ti-vpe: Add support for NV21 format

Ram Prasad (1):
      media: ti-vpe: Set MAX height supported to 2048 pixels

Ricardo Ribalda Delgado (8):
      media: v4l2-core: Implement v4l2_ctrl_new_std_compound
      Documentation: v4l2_ctrl_new_std_compound
      media: add V4L2_CTRL_TYPE_AREA control type
      Documentation: media: Document V4L2_CTRL_TYPE_AREA
      media: add V4L2_CID_UNIT_CELL_SIZE control
      Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
      media: v4l2-ctrl: Add new helper v4l2_ctrl_ptr_create
      media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE

 Documentation/media/kapi/v4l2-controls.rst              |   9 ++
 Documentation/media/uapi/v4l/ext-ctrls-image-source.rst |  10 ++
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst       |   6 +
 Documentation/media/videodev2.h.rst.exceptions          |   1 +
 drivers/media/i2c/imx214.c                              |   9 ++
 drivers/media/platform/Makefile                         |   4 +-
 drivers/media/platform/ti-vpe/csc.c                     | 254 ++++++++++++++++++++----------
 drivers/media/platform/ti-vpe/csc.h                     |   4 +-
 drivers/media/platform/ti-vpe/vpdma.c                   |  11 +-
 drivers/media/platform/ti-vpe/vpdma.h                   |   2 +
 drivers/media/platform/ti-vpe/vpdma_priv.h              |   5 +-
 drivers/media/platform/ti-vpe/vpe.c                     | 394 ++++++++++++++++++++++++++++-------------------
 drivers/media/v4l2-core/v4l2-common.c                   | 128 +++++++--------
 drivers/media/v4l2-core/v4l2-ctrls.c                    |  76 ++++++++-
 include/media/v4l2-common.h                             |  33 +++-
 include/media/v4l2-ctrls.h                              |  76 +++++++++
 include/uapi/linux/v4l2-controls.h                      |   1 +
 include/uapi/linux/videodev2.h                          |   6 +
 18 files changed, 707 insertions(+), 322 deletions(-)
