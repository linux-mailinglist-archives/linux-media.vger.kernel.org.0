Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6611EFEBC
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 19:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgFER0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 13:26:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38848 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgFER0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 13:26:54 -0400
Received: from localhost.localdomain (p200300cb871f5b0030b619f331cc239b.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:30b6:19f3:31cc:239b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4C3B72A4D70;
        Fri,  5 Jun 2020 18:26:51 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de
Subject: [RFC v4 0/8] v4l2: add support for colorspace conversion API (CSC) for video capture and subdevices
Date:   Fri,  5 Jun 2020 19:26:17 +0200
Message-Id: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoted from patch "v4l2: add support for colorspace conversion API (CSC)
 for video capture and subdevices":
========================================================================

For video capture it is the driver that reports the colorspace,
Y'CbCr/HSV encoding, quantization range and transfer function
used by the video, and there is no way to request something
different, even though many HDTV receivers have some sort of
colorspace conversion capabilities.

For output video this feature already exists since the application
specifies this information for the video format it will send out, and
the transmitter will enable any available CSC if a format conversion has
to be performed in order to match the capabilities of the sink.

For video capture we propose adding new v4l2_pix_format flag:
V4L2_PIX_FMT_FLAG_SET_CSC. The flag is set by the application,
the driver will interpret the ycbcr_enc/hsv_enc, and quantization fields
as the requested colorspace information and will attempt to
do the conversion it supports.

Drivers set the flags
V4L2_FMT_FLAG_CSC_YCBCR_ENC,
V4L2_FMT_FLAG_CSC_HSV_ENC,
V4L2_FMT_FLAG_CSC_QUANTIZATION,
in the flags field of the struct v4l2_fmtdesc during enumeration to
indicate that they support colorspace conversion for the respective field.
Currently the conversion of the fields 'colorspace' and 'xfer_func' is not
supported since there are no drivers that support it.

The same API is added for the subdevices. With the flag
V4L2_MBUS_FRAMEFMT_SET_CSC set by the application in VIDIOC_SUBDEV_S_FMT
ioctl and the flags V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC,
V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION set by the driver in the
VIDIOC_SUBDEV_ENUM_MBUS_CODE ioctl.

For subdevices, new 'flags' fields were added to the structs
v4l2_subdev_mbus_code_enum, v4l2_mbus_framefmt which are borrowed from the
'reserved' field

Drivers do not have to actually look at the flagsr. If the flags are not
set, then the colorspace, ycbcr_enc and quantization fields are set to
the default values by the core, i.e. just pass on the received format
without conversion.
========================================================================

The patchset includes a patch in vivid that implements the API for video capture devices
and 2 patches in rkisp1 driver that implement the API for subdevices.

Patches Summary:
----------------
patches 1,2 are bug fixes in rkisp1 driver, they are not part of the patchset
but the patchset needs those fixes for the rkisp1 implementation of the API.

patch 3 - moves the description of the v4l2_pix_format flags in the Documentation to the right
place where it should be. This is just a fix

patch 4 - Adds the API - Adds the new macros and fields and their documentation

patches 5,6 - uses the API in rkisp1 to allow userspace to change the quantization for YUV
formats. The support is added to the entities 'isp', 'resizer' 'capture' userspace
should make sure that the quantization matches along the pipe, otherwise the validation fails
when trying to stream.

patch 7 - uses the API in the capture device of vivid. Using the API, userspace is allowed to:
1. Set the ycbcr_enc function for YUV formats.
2. Set the hsv_enc function for HSV formats
3. Set the quantization for YUV and RGB formats.

patch 8 - adds the field 'hsv_enc' as a union together with 'ycbcr_enc' in struct v4l2_mbus_framefmt
and adds the flag V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC to support the API for HSV media bus formats.

Changes from v3:
----------------
- patches 1,2,3,7,8 are new (rkisp1 bug fixes, move v4l2-pixfmt flags docs, vivid patch, support for HSV media bus)

- patch 4 (The API):
1) reformulate the Documentation according to comments from Verkuil and Tomasz Figa
2) remove the code in drivers/media/v4l2-core/v4l2-subdev.c and drivers/media/v4l2-core/v4l2-ioctl.c
so that except of the new macros and fields no new code is added to the core

- patches 5,6 - refactor the rkisp1 implementation so that the userspace should set the quantization separately
to each entity. In patch 6 the validation callbacks make sure the quantizations matche.

Dafna Hirschfeld (7):
  media: staging: rkisp1: rsz: supported formats are the isp's src
    formats, not sink formats
  media: staging: rkisp1: rsz: set default format if the given format is
    not RKISP1_DIR_SRC
  media: Documentation: v4l: move table of v4l2_pix_format(_mplane)
    flags to pixfmt-v4l2.rst
  media: staging: rkisp1: allow quantization conversion from userspace
    for isp source pad
  media: staging: rkisp1: validate quantization matching in
    link_validate callbacks
  media: vivid: Add support to the CSC API
  media: v4l2: add support for the CSC API for hsv_enc on mediabus

Philipp Zabel (1):
  v4l2: add support for colorspace conversion API (CSC) for video
    capture and subdevices

 .../media/v4l/pixfmt-reserved.rst             | 17 -----
 .../media/v4l/pixfmt-v4l2-mplane.rst          | 16 ++---
 .../userspace-api/media/v4l/pixfmt-v4l2.rst   | 63 ++++++++++++++++-
 .../media/v4l/subdev-formats.rst              | 70 ++++++++++++++++++-
 .../media/v4l/vidioc-enum-fmt.rst             | 22 +++++-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      | 28 ++++++++
 .../media/videodev2.h.rst.exceptions          |  5 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 49 +++++++++++--
 .../test-drivers/vivid/vivid-vid-common.c     | 20 ++++++
 drivers/staging/media/rkisp1/rkisp1-capture.c | 26 ++++---
 drivers/staging/media/rkisp1/rkisp1-common.h  |  4 ++
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 26 ++++---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 49 +++++++++++--
 include/uapi/linux/v4l2-mediabus.h            | 13 +++-
 include/uapi/linux/v4l2-subdev.h              |  6 +-
 include/uapi/linux/videodev2.h                |  4 ++
 16 files changed, 353 insertions(+), 65 deletions(-)

-- 
2.17.1

