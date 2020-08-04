Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F72123C014
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 21:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgHDTeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 15:34:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35810 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgHDTeV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 15:34:21 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 8F5FB2983E8
Subject: Re: [PATCH v5 0/7] media: v4l2: Add extended fmt and buffer ioctls
To:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org
Cc:     tfiga@chromium.org, hiroh@chromium.org, nicolas@ndufresne.ca,
        Brian.Starkey@arm.com, kernel@collabora.com,
        boris.brezillon@collabora.com, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, frkoenig@chromium.org,
        mjourdan@baylibre.com, stanimir.varbanov@linaro.org
References: <20200804192939.2251988-1-helen.koike@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <af80b051-d138-3cdc-314c-bedb122b9f7f@collabora.com>
Date:   Tue, 4 Aug 2020 16:34:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804192939.2251988-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/4/20 4:29 PM, Helen Koike wrote:
> Hello,
> 
> This is v5 of the Extended API for formats and buffers, which introduces
> the following new ioctls:
> 
> int ioctl(int fd, VIDIOC_G_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp)
> int ioctl(int fd, VIDIOC_S_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp)
> int ioctl(int fd, VIDIOC_TRY_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp)
> 
> int ioctl(int fd, VIDIOC_EXT_CREATE_BUFS, struct v4l2_ext_create_buffers *argp)
> int ioctl(int fd, VIDIOC_EXT_QUERYBUF, struct v4l2_ext_buffer *argp)
> int ioctl(int fd, VIDIOC_EXT_QBUF, struct v4l2_ext_buffer *argp)
> int ioctl(int fd, VIDIOC_EXT_DQBUF, struct v4l2_ext_buffer *argp)
> int ioctl(int fd, VIDIOC_EXT_PREPARE_BUF, struct v4l2_ext_buffer *argp)
> 
> Please check v4 cover letter specific topic past discussions
> https://patchwork.linuxtv.org/project/linux-media/cover/20200717115435.2632623-1-helen.koike@collabora.com/
> 
> Documentation
> =============
> I added a first version of the documentation.
> I would appreciate some tips in how to organize this better, since there are
> several parts of the docs which reference the "old" API, and for now
> I just added a note pointing to the Extended API.
> 
> Instead of duplicating documentation from the code to the Docs (as used by
> most part of v4l2 documentation), I just added a reference to let Sphinx get
> the structs documentation from the code, so we can avoid duplicating.
> 
> For reviewing convenience, I uploaded the generated html docs at
> https://people.collabora.com/~koike/ext-doc-v5/userspace-api/media/v4l/ext-api.html
> 
> There is room for improvements, it would be great to get your suggestions.
> 
> uAPI
> ====
> This version have some minor changes in the uAPI structs, highlight to the
> mem_offset that was returned to struct v4l2_ext_plane, memory field that now
> is per plane, and some adjustments in field sizes and re-ordering to make
> structs the same for 32 and 64 bits (which I verified with pahole tool).
> 
> I also updated v4l2-compliance:
> https://gitlab.collabora.com/koike/v4l-utils/-/tree/ext-api/wip
> 
> We need to decide the size of the reserved fields left, how much reserved
> fields do you think we should leave for each struct?
> 
> What is next
> ============
> I would like to improve implementation (for the kernel and v4l2-compliane) and
> drop the RFC tag for next version, so please review the uAPI.

Ops, sorry, I forgot to add RFC tag when submitting. Please consider RFC for this one.

Regards,
Helen

> 
> 
> List of changes in v5:
> ======================
> * first version of Documentation
> * migrate memory from v4l2_ext_buffer to v4l2_ext_plane
> * return mem_offset to struct v4l2_ext_plane
> * change sizes and reorder fields to avoid holes in the struct and make it
>   the same for 32 and 64 bits
> * removed __attribute__ ((packed)) from uapi structs
> * set request_fd to signed
> * add documentation
> * updated some commit messages
> 
> Hans Verkuil (1):
>   media: v4l2: Add extended buffer operations
> 
> Helen Koike (6):
>   media: v4l2: Extend pixel formats to unify single/multi-planar
>     handling (and more)
>   media: videobuf2: Expose helpers to implement the _ext_fmt and
>     _ext_buf hooks
>   media: mediabus: Add helpers to convert a ext_pix format to/from a
>     mbus_fmt
>   media: vivid: Convert the capture and output drivers to
>     EXT_FMT/EXT_BUF
>   media: vimc: Implement the ext_fmt and ext_buf hooks
>   media: docs: add documentation for the Extended API
> 
>  .../userspace-api/media/v4l/buffer.rst        |   5 +
>  .../userspace-api/media/v4l/common.rst        |   1 +
>  .../userspace-api/media/v4l/dev-capture.rst   |   5 +
>  .../userspace-api/media/v4l/dev-output.rst    |   5 +
>  .../userspace-api/media/v4l/ext-api.rst       | 107 ++
>  .../userspace-api/media/v4l/format.rst        |  16 +-
>  .../userspace-api/media/v4l/user-func.rst     |   5 +
>  .../media/v4l/vidioc-ext-create-bufs.rst      |  95 ++
>  .../media/v4l/vidioc-ext-prepare-buf.rst      |  62 ++
>  .../media/v4l/vidioc-ext-qbuf.rst             | 204 ++++
>  .../media/v4l/vidioc-ext-querybuf.rst         |  79 ++
>  .../media/v4l/vidioc-g-ext-pix-fmt.rst        | 117 +++
>  .../media/common/videobuf2/videobuf2-core.c   |   2 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 560 ++++++-----
>  .../media/test-drivers/vimc/vimc-capture.c    |  61 +-
>  drivers/media/test-drivers/vimc/vimc-common.c |   6 +-
>  drivers/media/test-drivers/vimc/vimc-common.h |   2 +-
>  drivers/media/test-drivers/vivid/vivid-core.c |  70 +-
>  .../test-drivers/vivid/vivid-touch-cap.c      |  26 +-
>  .../test-drivers/vivid/vivid-touch-cap.h      |   3 +-
>  .../media/test-drivers/vivid/vivid-vid-cap.c  | 169 +---
>  .../media/test-drivers/vivid/vivid-vid-cap.h  |  15 +-
>  .../media/test-drivers/vivid/vivid-vid-out.c  | 193 ++--
>  .../media/test-drivers/vivid/vivid-vid-out.h  |  15 +-
>  drivers/media/v4l2-core/v4l2-dev.c            |  50 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 938 ++++++++++++++++--
>  include/media/v4l2-ioctl.h                    |  60 ++
>  include/media/v4l2-mediabus.h                 |  42 +
>  include/media/videobuf2-core.h                |   6 +-
>  include/media/videobuf2-v4l2.h                |  21 +-
>  include/uapi/linux/videodev2.h                | 146 +++
>  31 files changed, 2363 insertions(+), 723 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-api.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-ext-create-bufs.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-ext-prepare-buf.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-ext-qbuf.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-ext-querybuf.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-g-ext-pix-fmt.rst
> 
