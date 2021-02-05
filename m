Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D26311024
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 19:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233580AbhBEQ7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 11:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbhBEQ5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 11:57:37 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84D4C061574;
        Fri,  5 Feb 2021 10:39:19 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 1A1F41F46981
Subject: Re: [RFC PATCH v6 00/11] media: v4l2: Add extended fmt and buffer
 ioctls
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        nicolas@ndufresne.ca, Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org
References: <20210114180738.1758707-1-helen.koike@collabora.com>
Message-ID: <2e2fc518-9c71-b82c-4630-7985bbdc544a@collabora.com>
Date:   Fri, 5 Feb 2021 15:39:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210114180738.1758707-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 1/14/21 3:07 PM, Helen Koike wrote:
> Hello,
> 
> This is v6 of the Extended API for formats and buffers (see below the new API).
> 
> The new API comes for free for old drivers through the conversion layer, which
> is independent of vb2.
> 
> I completly refactored several patches. I would like to request comments not
> only in the uAPI, but also the kAPI for drivers, and I would appreciate any
> ideas on improving the quality of the code (in short: please review everything).
> 
> NOTE: The Ext API wans't tested yet. My next step is to patch v4l2-compliance.

I implemented on libcamera to test it, please check:

    https://lists.libcamera.org/pipermail/libcamera-devel/2021-February/017169.html

Thanks,
Helen

> 
> Regression tests - v4l2-compliance with test-media script:
> 	vivid: http://ix.io/2M0G - Final Summary: 1856, Succeeded: 1856, Failed: 0, Warnings: 0)
> 	vimc: http://ix.io/2M0I - Final Summary: 488, Succeeded: 488, Failed: 0, Warnings: 0
> 
> Git: https://gitlab.collabora.com/koike/linux/-/tree/v4l2/ext-api/v6
> 
> v5: https://patchwork.linuxtv.org/project/linux-media/cover/20200804192939.2251988-1-helen.koike@collabora.com/
> v4: https://patchwork.linuxtv.org/project/linux-media/cover/20200717115435.2632623-1-helen.koike@collabora.com/
> v3: https://patchwork.linuxtv.org/cover/59345/
> v2: https://patchwork.kernel.org/project/linux-media/list/?series=101153
> v1: https://patchwork.kernel.org/project/linux-media/list/?series=93707
> 
> Conversion layer:
> =================
> 
> * Old drivers implementing only ops->vidioc_*_fmt_vid_cap supports
>   VIDIOC_*_EXT_PIX_FMT automatically with limitations[1].
> 
> * New drivers implementing only ops->vidioc_*_ext_pix_fmt_vid_cap supports
>   VIDIOC_*_FMT automatically.
> 
> * Old drivers implementing only ops->vidioc_*buf support
>   VIDIOC_EXT_*BUF automatically with limitations[2].
> 
> * New drivers should implement both ops->vidioc_*buf and ops->vidioc_*buf
>   to overcome limitations[2] and support both APIs.
>   Which is easy with vb2:
>      static const struct v4l2_ioctl_ops ioctl_ops = {
>      ...
>      +      .vidioc_ext_qbuf = vb2_ioctl_ext_qbuf,
>      +      .vidioc_ext_dqbuf = vb2_ioctl_ext_dqbuf,
>      ...
>      }
>      ...
>      +      /* Inform vb2 how to split the memory buffer in case a single one is used */
>      +      vb2_set_pixelformat(dev->pixelformat)
> 
> [1] There are some limitations in the conversion such as modifiers that are
>     ignored when converting v4l2_ext_pix_format to v4l_format
> 
> [2] Ext API allows a single buffer with planes placed in random locations,
>     which is not possible with v4l2_buffer.
> 
> 
> Major changes in v6:
> ====================
> 
> Fixed color planes vs memory planes handling.
> 
> Removed VIDIOC_EXT_PREPARE_BUF, since this is an optimization, it doesn't blocks
> the API, we can add it later (my goal was to simplify this patchset).
> 
> Removed VIDIOC_EXT_CREATE_BUFS, since this is useful only to MMAP (thus low priority)
> with the new format.
> Classic VIDIOC_CREATE_BUFS and VIDIOC_REQBUFS can still be used.
> 
> Reformulated conversion layer as per above.
> 
> Removed conversions in vb2, it is easier to add hooks to drivers.
> 
> Fixed vb2 to allow Ext API only to Video types.
> 
> API updates:
> * remove buffer and plane lengths
> * move `memory` field to v4l2_ext_buffer instead of v4l2_ext_plane
> * remove struct v4l2_plane_ext_pix_format
> * reordering
> 
> Make Ext API valid only for Video types, and not for touch, vbi, meta, etc.
> 
> Sereval code refactoring, simplification, fixes and applied suggestions from v5.
> 
> New API (for convenience):
> ==========================
> 
> int ioctl(int fd, VIDIOC_G_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp)
> int ioctl(int fd, VIDIOC_S_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp)
> int ioctl(int fd, VIDIOC_TRY_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp)
> int ioctl(int fd, VIDIOC_EXT_QBUF, struct v4l2_ext_buffer *argp)
> int ioctl(int fd, VIDIOC_EXT_DQBUF, struct v4l2_ext_buffer *argp)
> 
> struct v4l2_ext_pix_format {
> 	__u32 type;
> 	__u32 width;
> 	__u32 height;
> 	__u32 field;
> 	struct v4l2_plane_pix_format plane_fmt[VIDEO_MAX_PLANES];
> 	__u32 pixelformat;
> 	__u64 modifier;
> 	__u32 colorspace;
> 	__u32 xfer_func;
> 	union {
> 		__u32 ycbcr_enc;
> 		__u32 hsv_enc;
> 	};
> 	__u32 quantization;
> 	__u32 reserved[9];
> };
> 
> struct v4l2_ext_buffer {
> 	__u32 index;
> 	__u32 type;
> 	__u32 field;
> 	__u32 sequence;
> 	__u64 flags;
> 	__u64 timestamp;
> 	__u32 memory;
> 	__s32 request_fd;
> 	struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
> 	__u32 reserved[10];
> };
> 
> struct v4l2_ext_plane {
> 	__u32 offset;
> 	__u32 bytesused;
> 	union {
> 		__u32 mmap_offset;
> 		__u64 userptr;
> 		__s32 dmabuf_fd;
> 	} m;
> 	__u32 reserved[6];
> };
> 
> Helen Koike (11):
>   media: v4l2-common: add normalized pixelformat field to struct
>     v4l2_format_info
>   media: v4l2: Extend pixel formats to unify single/multi-planar
>     handling (and more)
>   media: v4l2: Add extended buffer (de)queue operations for video types
>   media: videobuf2-v4l2: reorganize flags handling
>   media: videobuf2: Expose helpers for Ext qbuf/dqbuf
>   media: vivid: use vb2_ioctls_ext_{d}qbuf hooks
>   media: vimc: use vb2_ioctls_ext_{d}qbuf hooks
>   media: mediabus: Add helpers to convert a ext_pix format to/from a
>     mbus_fmt
>   media: vivid: Convert to v4l2_ext_pix_format
>   media: vimc: Convert to v4l2_ext_pix_format
>   media: docs: add documentation for the Extended API
> 
>  .../userspace-api/media/v4l/buffer.rst        |   5 +
>  .../userspace-api/media/v4l/common.rst        |   1 +
>  .../userspace-api/media/v4l/dev-capture.rst   |   6 +
>  .../userspace-api/media/v4l/dev-output.rst    |   6 +
>  .../userspace-api/media/v4l/ext-api.rst       |  89 +++
>  .../userspace-api/media/v4l/format.rst        |  18 +-
>  .../userspace-api/media/v4l/user-func.rst     |   5 +
>  .../media/v4l/vidioc-ext-qbuf.rst             | 188 +++++
>  .../media/v4l/vidioc-g-ext-pix-fmt.rst        | 116 +++
>  .../userspace-api/media/v4l/vidioc-qbuf.rst   |   2 +-
>  .../media/common/videobuf2/videobuf2-core.c   |  46 +-
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 500 +++++++++---
>  .../media/test-drivers/vimc/vimc-capture.c    |  57 +-
>  drivers/media/test-drivers/vimc/vimc-common.c |   6 +-
>  drivers/media/test-drivers/vimc/vimc-common.h |   2 +-
>  drivers/media/test-drivers/vivid/vivid-core.c | 209 ++---
>  .../media/test-drivers/vivid/vivid-vid-cap.c  | 203 ++---
>  .../media/test-drivers/vivid/vivid-vid-cap.h  |  15 +-
>  .../media/test-drivers/vivid/vivid-vid-out.c  | 198 ++---
>  .../media/test-drivers/vivid/vivid-vid-out.h  |  15 +-
>  drivers/media/v4l2-core/v4l2-common.c         |  16 +-
>  drivers/media/v4l2-core/v4l2-dev.c            |  31 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 722 +++++++++++++++++-
>  include/media/v4l2-common.h                   |   3 +
>  include/media/v4l2-ioctl.h                    |  36 +
>  include/media/v4l2-mediabus.h                 |  42 +
>  include/media/videobuf2-core.h                |  33 +-
>  include/media/videobuf2-v4l2.h                |   8 +-
>  include/uapi/linux/videodev2.h                |  96 +++
>  29 files changed, 2131 insertions(+), 543 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-api.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-ext-qbuf.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-g-ext-pix-fmt.rst
> 
