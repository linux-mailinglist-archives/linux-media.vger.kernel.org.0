Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DF0223AD6
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 13:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgGQLy7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 07:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGQLy7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 07:54:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61A6C061755;
        Fri, 17 Jul 2020 04:54:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 629F52A5766
From:   Helen Koike <helen.koike@collabora.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>, tfiga@chromium.org,
        hiroh@chromium.org, nicolas@ndufresne.ca, Brian.Starkey@arm.com,
        kernel@collabora.com, boris.brezillon@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, mjourdan@baylibre.com,
        stanimir.varbanov@linaro.org
Subject: [PATCH v4 0/6] media: v4l2: Add extended fmt and buffer ioctls
Date:   Fri, 17 Jul 2020 08:54:29 -0300
Message-Id: <20200717115435.2632623-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I'm sorry for taking too long to submit v4.

It is not perfect, not all v4l2-compliance tests passes, but I'd like a review,
specially on the API and potential problems, so I can focus on improving implementation
and maybe drop the RFC tag for next version.

Follow below what changed in v4 and some items I'd like to discuss:


* Ioctl to replace v4l2_pix_format
---------------------------------------------------------------------------------
During last media summit, we agreed to create ioctls that replace the v4l2_pix_format
struct and leave the other structs in the v4l2_format union alone.
Thus I refactored the code to receive struct v4l2_ext_pix_format, and I renamed the
ioctls, so now we have:

int ioctl(int fd, VIDIOC_G_EXT_FMT, struct v4l2_ext_pix_format *argp);
int ioctl(int fd, VIDIOC_S_EXT_FMT, struct v4l2_ext_pix_format *argp);
int ioctl(int fd, VIDIOC_TRY_EXT_FMT, struct v4l2_ext_pix_format *argp);

The only valid types are V4L2_BUF_TYPE_VIDEO_CAPTURE and V4L2_BUF_TYPE_VIDEO_OUTPUT,
all the other types are invalid with this API.


* Modifiers
---------------------------------------------------------------------------------
I understand that unifying DRM and V4L2 pixel formats is not possible, but I'd like
to unify the modifiers [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/drm/drm_fourcc.h#n290

Should we use the DRM modifiers directly in the V4L2 API?
Or should we move this header to a common place and change the prefix? (which requires
us to sync with DRM community).
Or should we create a v4l2 header, defining V4L2_ prefixed macros mapping to DRM_
macros?

For now, patch 1/6 includes drm/drm_fourcc.h and it is using DRM_FORMAT_MOD_*

As discussed before, It would be nice to have documentation describing DRM fourcc
equivalents (I'm not sure if someone started this already), listing the number of
planes per format.

We should also document which pixelformats are valid for the EXT_API, since multiplanar
and tile versions like V4L2_PIX_FMT_NV12MT_16X16 (which seems equivalent to
DRM_FORMAT_MOD_SAMSUNG_16_16_TILE, and could have a more generic name) should be
replaced by a modifier.

Regarding flags [2] field in struct v4l2_pix_format_mplane [3]:
The only defined flag is V4L2_PIX_FMT_FLAG_PREMUL_ALPHA, and it is only used by vsp1 driver.
Which I believe could be replaced by a modifier, to avoid another field that changes
pixel formats, so I removed it from the EXT API (we can always add it back later with
the reserved fields).

[2] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/pixfmt-reserved.html#format-flags
[3] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/pixfmt-v4l2-mplane.html?highlight=v4l2_pix_format_mplane#c.v4l2_pix_format_mplane

We also discussed to add a new ENUM_FMT_EXT ioctl to return all pixelformats + modifiers
combinations. I still didn't add it in this version, but I don't think it affects
what is in this RFC and it can be added later.


* Buffers/Plane offset
---------------------------------------------------------------------------------

My understanding is that inside a memory buffer we can have multiple planes in random
offsets.
I was comparing with the DRM API [4], where it can have the same dmabuf for multiple
planes in different offsets, and I started to think we could simplify our API, so
I took the liberty to do some more changes, please review struct v4l2_ext_plane in
this RFC.

I removed the data_offset, since it is unused (See Laurent's RFC repurposing this
field [5]). And comparing to the DRM API, it seems to me we only need a single offset
field.

We could also check about overlapping planes in a memory buffer, but this is complicated
if we use the same memory buffer with different v4l2_ext_buffer objects. We can also leave
to the driver to check situations that may cause HW errors.

[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/drm/drm_mode.h#n489
[5] https://patchwork.linuxtv.org/patch/29177/


* Multistream Channels
---------------------------------------------------------------------------------
During last media summit, we discussed about adding a channel number to the API to
support multistreams. i.e, to have multiple queues through a single video node.

Use cases:

    - Blitters: can take multiple streams as input, which would require multiple OUTPUT queues.

    As Nicolas was explaining me:
    "The blitters comes with a lot of variation between hardware. Most blitters at
    least support 3 frames buffer. 2 inputs and one output. The second input is usually
    optional, as the output buffer data is not always overwritten (e.g. SRC_OVER
    blend or 1 input). Some of them have additional solid color or pattern that can
    be used too. Advanced blitters will have composition feature, and may support more
    input buffers to reduce the added latency that would be normally done through cascading
    the operations. Note that each input can have different size and different cropping
    region. Many blitters can scale and render to a sub-region of the CAPTURE buffer."

    - Multis-calers: can produce multiple streams, which would require multiple CAPTURE queues.

    As Nicolas was explaining me:
    "This type of HW (or soft IP) is commonly found on HW used to produce internet
    streams for fragmented and scalable protocols (HLS, DASH).  Basically they are
    used to transform one stream into multiple sized streams prior from being encoded."

Modeling as channels allows the API to have synchronized Start/Stop between queues,
and also avoid the complexity of using the Media API in a topology with multiple video
nodes, which complicates userspace.

This requires adding a new channel id in ioctls for formats (G_FMT/S_FMT/TRY_FMT), and
also for buffers (QBUF/DBUF).
We also need a mechanism to enumerate channels and their properties.
Since we don't have a clear view how this would work, for now I'm leaving reserved bits
in the structs, so we can add them later.


* Timecode
---------------------------------------------------------------------------------
During last media summit, we discussed to return the v4l2_timecode field to the API,
since Nicolas mentioned that, even if it is not used by any upstreamed driver, it
is used by out-of-tree drivers.

I've been discussing with Nicolas about this, and we can avoid adding too many metadata
to the buffer struct by using the Read-Only Request API [6] for retrieving more information
when required, similar to HDR.

The RO Request API has the ability to read a control using a request that has already
completed, the control value lives as long as the request object. If it's not read
(or if there was no request), the data is simply ignored/discard.

Since no upstream driver uses the timecode field, there are no conversions that need
to be done.

[6] https://patchwork.kernel.org/cover/11635927/


* Other changes (and some questions) in this version:
---------------------------------------------------------------------------------
- Added reserved fields to struct

- The only difference between previously proposed VIDIOC_EXT_EXPBUF and VIDIOC_EXPBUF,
was that with VIDIOC_EXT_EXPBUF we can export multiple planes at once. I think we
can add this later, so I removed it from this RFC to simplify it.

- v4l2_buffer [7] has a memory field (enum v4l2_memory [8]). We kept this field in
struct v4l2_ext_buffer, buf I was wondering if this shouldn't be in struct v4l2_ext_plane
instead.

[7] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/buffer.html?highlight=v4l2_buffer#c.v4l2_buffer
[8] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/buffer.html?highlight=v4l2_memory#c.v4l2_memory

- In struct v4l2_ext_pix_format, we have:

        struct v4l2_plane_ext_pix_format plane_fmt[VIDEO_MAX_PLANES];

The number of planes can be deducted from plane_fmt[i].sizeimage != 0, so I removed
the num_planes field. Please let me know if we can't use sizeimage for this.
In DRM, we know the number of planes from drm_mode_fb_cmd2 by the number of handle
args passed which are not 0.
This also avoids num_planes to be bigger then VIDEO_MAX_PLANES.

- Added flags field to struct v4l2_ext_create_buffers


* Fixed bugs here and there
---------------------------------------------------------------------------------
I fixed some bugs found with v4l2-compliance (not all of them yet),
through script v4l-utils/contrib/test/test-media.

I adapted what Boris did for v4l-utils in previous version to this version:
https://gitlab.collabora.com/koike/v4l-utils/-/tree/ext-api/wip

Boris' questions regarding DMABUF in last version still holds [9].

[9] https://patchwork.linuxtv.org/project/linux-media/cover/20191008091119.7294-1-boris.brezillon@collabora.com/


Please, let me know your feedback,
Helen


Boris Brezillon (5):
  media: v4l2: Extend pixel formats to unify single/multi-planar
    handling (and more)
  media: videobuf2: Expose helpers to implement the _ext_fmt and
    _ext_buf hooks
  media: mediabus: Add helpers to convert a ext_pix format to/from a
    mbus_fmt
  media: vivid: Convert the capture and output drivers to
    EXT_FMT/EXT_BUF
  media: vimc: Implement the ext_fmt and ext_buf hooks

Hans Verkuil (1):
  media: v4l2: Add extended buffer operations

 .../media/common/videobuf2/videobuf2-core.c   |   2 +
 .../media/common/videobuf2/videobuf2-v4l2.c   | 549 +++++-----
 .../media/test-drivers/vimc/vimc-capture.c    |  61 +-
 drivers/media/test-drivers/vimc/vimc-common.c |   6 +-
 drivers/media/test-drivers/vimc/vimc-common.h |   2 +-
 drivers/media/test-drivers/vivid/vivid-core.c |  70 +-
 .../test-drivers/vivid/vivid-touch-cap.c      |  26 +-
 .../test-drivers/vivid/vivid-touch-cap.h      |   3 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 169 +---
 .../media/test-drivers/vivid/vivid-vid-cap.h  |  15 +-
 .../media/test-drivers/vivid/vivid-vid-out.c  | 193 ++--
 .../media/test-drivers/vivid/vivid-vid-out.h  |  15 +-
 drivers/media/v4l2-core/v4l2-dev.c            |  50 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          | 934 ++++++++++++++++--
 include/media/v4l2-ioctl.h                    |  60 ++
 include/media/v4l2-mediabus.h                 |  42 +
 include/media/videobuf2-core.h                |   6 +-
 include/media/videobuf2-v4l2.h                |  21 +-
 include/uapi/linux/videodev2.h                | 144 +++
 19 files changed, 1650 insertions(+), 718 deletions(-)

-- 
2.26.0

