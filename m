Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23B4213E48
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 19:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgGCRKa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 13:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbgGCRKa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 13:10:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DAEC061794
        for <linux-media@vger.kernel.org>; Fri,  3 Jul 2020 10:10:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 3C0452A65B6
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v5 0/7] v4l2: add support for colorspace conversion API (CSC) for video capture and subdevices
Date:   Fri,  3 Jul 2020 19:10:12 +0200
Message-Id: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
the driver will interpret the fields 'colorspace', 'ycbcr_enc/hsv_enc',
'quantization' and 'xfer_func' as the requested colorspace information
and will attempt to do the conversion it supports.

Drivers set the flags
V4L2_FMT_FLAG_CSC_COLORSPACE,
V4L2_FMT_FLAG_CSC_YCBCR_ENC,
V4L2_FMT_FLAG_CSC_HSV_ENC,
V4L2_FMT_FLAG_CSC_QUANTIZATION,
V4L2_FMT_FLAG_CSC_XFER_FUNC,
in the flags field of the struct v4l2_fmtdesc during enumeration to
indicate that they support colorspace conversion for the respective field.

The same API is added for the subdevices. With the flag
V4L2_MBUS_FRAMEFMT_SET_CSC set by the application in VIDIOC_SUBDEV_S_FMT
ioctl and the flags
V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE,
V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC,
V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION,
V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC,
V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC
set by the driver in the VIDIOC_SUBDEV_ENUM_MBUS_CODE ioctl.

For subdevices, new 'flags' fields were added to the structs
v4l2_subdev_mbus_code_enum, v4l2_mbus_framefmt which are borrowed from the
'reserved' field. In the struct 'v4l2_mbus_framefmt' and reserved2 field
is added before the flags due to padding.

Drivers do not have to actually look at the flags. If the flags are not
set, then the colorspace, ycbcr_enc/hsv_enc, quantization and xfer_func
fields are set to the default values by the core, i.e. just pass on the
received format without conversion.

The patchset includes a patch in vivid that implements the API for video capture devices
and a patch in rkisp1 driver that implement the API for subdevices.

In rkisp1, the API is used to allow userspace to set the quantizaion for
YUV formats on the source pad of the isp entity. The quantization is read-only
on the other entities and pads and do not habe to propagate.

I also removed the TODO item 'Handle quantization'
and added the TODO item 'Add uapi docs. Remeber to add documentation of how quantization is handled.'

The patchset is rebased on top of v4 of the patchset
"media: staging: rkisp1: bugs fixes and vars renames"
https://patchwork.kernel.org/cover/11611867/

A patchset for v4l-utils to support the API will also be sent

Patches Summary:
----------------
patch 1 - moves the description of the v4l2_pix_format flags in the Documentation to the right
place where it should be. This is just a fix.

patch 2 - Adds the API for video devices - Adds the new macros and fields and their documentation.
This is only for video devices.

patch 3 - uses the API in the capture device of vivid. Using the API, userspace is allowed to:
1. Set the ycbcr_enc function for YUV formats.
2. Set the hsv_enc function for HSV formats
3. Set the quantization for YUV and RGB formats.
4. Set the colorspace
5. set the xfer_func

patch 4 - add the API for subdevices - Adds the new macros and fields and their documentation.

patch 5 - replace the ycbcr_enc field of 'struct v4l2_mbus_framefmt' with a union that includes
	  also hsv_enc and add support for CSC on hsv_enc for subdevices.

patch 6 - use the API to allow userspace to set the quantizaion on the isp source pad.

patch 7 - sets the flags to 0 in the mbus enumeration of the resizer.

Changes from v4:
----------------
- This time I didn't to this patchset the patches from 'media: staging: rkisp1: bugs fixes and vars renames'
but note that this patchset is rebased on that patchset.

- I added the fields 'colorspace' 'xfer_func' to the list of fields that the CSC API supports due to
comment from Hans Verkuil. Also the vivid implementation is extended to support those fields.

- I split the patch that adds the API into two patches. One for video devices and one patch for subdevices.
This is because the two APIs are actually independent and it is easier to maintain and review two small patches
than one big patch.
Also, it can be decided that only one of those patches be accpeted.

- I changed the flags fields in 'struct v4l2_mbus_framefmt'  to __u32 and added a reserved2 field before it due to
padding.

- I changed the patch for rkisp1 so that the quantizaion can be set by userspace only on the source pad of
the isp entity and is read-only and set always to default for all other entities and pads.
The driver also does not validate matching of the quantizaion between entities.

- Added a patch to the rkisp1-resizer that sets the flags to 0 when enumerating the mbus codes.
This is because the resizer reports the same formats as the source pad of the isp entity but does
not support the quantizaion conversion.

- various small fixes due to feedback.

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
  media: Documentation: v4l: move table of v4l2_pix_format(_mplane)
    flags to pixfmt-v4l2.rst
  v4l2: add support for colorspace conversion API (CSC) for video
    capture
  media: vivid: Add support to the CSC API
  v4l2: extend the CSC API to subdevice.
  media: v4l2: add support for the subdev CSC API for hsv_enc on
    mediabus
  media: staging: rkisp1: allow quantization setting by userspace on the
    isp source pad
  media: staging: rkisp1: rsz: set flags to 0 in enum_mbus_code cb

 .../media/v4l/pixfmt-reserved.rst             | 17 ----
 .../media/v4l/pixfmt-v4l2-mplane.rst          | 16 +--
 .../userspace-api/media/v4l/pixfmt-v4l2.rst   | 81 +++++++++++++++-
 .../media/v4l/subdev-formats.rst              | 97 +++++++++++++++++--
 .../media/v4l/vidioc-enum-fmt.rst             | 35 +++++++
 .../v4l/vidioc-subdev-enum-mbus-code.rst      | 44 ++++++++-
 .../media/videodev2.h.rst.exceptions          |  7 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 74 ++++++++++++--
 .../test-drivers/vivid/vivid-vid-common.c     | 24 +++++
 drivers/staging/media/rkisp1/TODO             |  2 +-
 drivers/staging/media/rkisp1/rkisp1-capture.c | 10 --
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 18 +++-
 drivers/staging/media/rkisp1/rkisp1-resizer.c |  1 +
 include/uapi/linux/v4l2-mediabus.h            | 17 +++-
 include/uapi/linux/v4l2-subdev.h              |  9 +-
 include/uapi/linux/videodev2.h                |  6 ++
 16 files changed, 391 insertions(+), 67 deletions(-)

-- 
2.17.1

