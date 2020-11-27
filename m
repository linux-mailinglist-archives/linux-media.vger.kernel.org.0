Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF762C686C
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 16:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbgK0PGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 10:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbgK0PGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 10:06:11 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C67C0613D1;
        Fri, 27 Nov 2020 07:06:11 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 971421F46408
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
Message-ID: <a4ecf6ea-8afa-9d7f-9d60-f63562f0b17d@collabora.com>
Date:   Fri, 27 Nov 2020 12:06:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20200804192939.2251988-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

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



I'm fixing the format and buffer conversions to separate planes per color
component as pointed by Tomasz.
It turns out this it a bit more complicated and will require changes in vb2
driver ops interface.

I want to share my approach in case you see that I'm missing something while
I'm implementing it, or if I'm making wrong assumptions. So I wrote different
scenarios below. Please check, specially the NOTEs in the scenarios.

Thanks!

----------------------------------------

Considerations:
* Multiplanar API vs Singleplanar API.
* M-variant vs non-M-variant,
* data_offset is only available in Multiplanar API, not in single planar.
* Single buffer: contiguous planes or not.
* Memory buffers vs color components (planes)
* Planes with offsets or not.

NOTE: I'm assuming that multiplanar and singleplanar capabilities are mutually exclusive,
      i.e. if a driver reports V4L2_CAP_VIDEO_CAPTURE_MPLANE then it won't report
      V4L2_CAP_VIDEO_CAPTURE, which means that only multiplanar API is valid,
      and if V4L2_CAP_VIDEO_CAPTURE is reported, then _MPLANE isn't and only singleplanar
      API is valid and supported by the driver.

NOTE: I'm assuming both non-M-variants and M-variants are acceptable and
      equivalent for the Ext API.
      If we have two pixelformats that are equivalent, then we chose one to be the
      normalized format.

NOTE: Just for the sake of the examples below, I'm assuming that all M-variants have
      non-M-variants (which I'm considering that will be the normalized form), but
      I'm not doing this assumption in the code and it doesn't seem to be a problem.

===========================================
A: Scenarios where:
	userspace -> implements clasic API
	driver -> implements ext API
-------------------------------------------

QUESTION: if we want a ext_reqbuf, then queue_setup() (or a ext_queue_setup)
	  should return a buffer per plane? Or a buffer for all planes? Which
	  method should be favored? Also, see NOTE A-1.3.
	  Another option is: ext_reqbufs won't be supported, and leave to userspace
	  to decide this in ext_create_bufs.
	  For the examples below, I'm assuming reqbuf isn't supported

Case A-1: Single planar API
- I'm assuming that M-variants pixelformats are invalid
- I'm assuming the driver report in its capabilities only V4L2_CAP_VIDEO_CAPTURE/OUTPUT/M2M,
  and not the MPLANE equivalent.

	FORMATS:
	1. framework receives v4l2_format
	2. framework converts to v4l2_ext_pix_format, separating color components
	   per plane, in the best effort way (without returning errors).
	3. v4l2_ext_pix_format gets processed
	4. framework converts back to v4l2_format and sent to userspace.

	CREATE BUFFER:
	1. vb2 receives v4l2_buffer from userspace
	2. vb2 converts to v4l2_ext_buffer, dividing the buffer per color component.
	   Planes will be part of the same buffer, just in a different offset.

		NOTE A-1.1: vb2 needs to know the pixelformat and image size to
			    calculate the number of color components and plane's
			    offset for the conversion, my current solution is to
			    add another callback in vb2_ops to get the format.
			    See NOTE A-2.3.

	3. memory sizes is validated by queue_setup()
	4. vb2 converts it back to v4l2_buffer and sends to userspace

	REQ BUFFER:
	1. vb2 calls queue_setup to ask the driver about the number of memory
	   buffers in a frame buffer
	2. queue_setup() returns with a single memory buffer with contiguous planes.

		NOTE A-1.2: If the driver decides to add offset between planes, we
			    won't be able to convert back to v4l2_buffer and we
			    fail. Even if we repurpose data_offset, there is
			    no data_offset for single plane API

		NOTE A-1.3: I need to send a hint to queue_setup() to tell the
			    driver if we need a single mem-buffer for all planes
			    or a different mem-buffer per plane.
			    Or maybe implement a ext_queue_setup().

	3. v4l2_ext_buffer is created
	3. v4l2_ext_buffer is converted to v4l2_buffer and returned to userspace.

	QUEUE BUFFER:
	1. vb2 receives v4l2_buffer from userspace (only index and type that matters)
	2. vb2 converts to v4l2_ext_buffer
	3. vb2_buffer is validated by .buf_prepare() and gets processed.
	4. v4l2_ext_buffer is converted to v4l2_buffer and sent to userspace.


Case A-2: Multiplanar API with non-M-variant pixelformat
- I'm assuming the driver only reports V4L2_CAP_VIDEO_*_MPLANE

	FORMATS: Same as Case A-1, just changing fields from v4l2_format to use
		 mplane API.

	CREATE BUFFER: If data-offset is zero, same as Case A-1.

		NOTE A-2.1: If data_offset isn't zero, then I return an error,
			    since we don't support it. Unless if we re-pourpose
			    the data_offset field as previously proposed.
			    But this looks non consistent with single planar,
			    see NOTE A-1.2.

	REQ BUFFER:
	1. vb2 calls queue_setup to ask the driver about the number of memory
	   buffers in a frame buffer
	2. If queue_setup() return a single mem-buffer then it is the same as
	   Case A-1.

		NOTE A-2.2: If driver returns multiple buffers, then we can't
			    convert back to clasic non-M-variant and we fail.
			    My proposed solution is adding a hint to queue_setup(),
			    see NOTE A-1.3.
			    This hint would depend if the API was multiplanar
			    or not, and if it was M-variant or not.

	QUEUE BUFFER:
	1. vb2 receives v4l2_buffer from userspace (index, type and planes array are filled)
	2. vb2 converts v4l2_buffer to v4l2_ext_buffer according to the pixelformat.

		NOTE: A-2.3: to convert this properly, I thought we could use
			     buf_prepare() to get the updated information of the
			     pixelformat ans sizeimage, but .buf_prepare() is called
			     after this conversion, so we need to call v4l2_g_ext_pix_format()
			     from vb2 somehow, my current solution is to add another
			     callback in vb2_ops.

	2. vb2 gets vb2_buffer from index and fills vb2_v4l2_buffer.planes from
	   the converted v4l2_ext_buffer.
	3. vb2_buffer is validated by .buf_prepare() and gets processed.
	4. v4l2_buffer is converted back to v4l2_ext_buffer and sent to userspace.

Case A-3: Multiplanar API with M-variant pixelformat
- I'm assuming the driver only reports V4L2_CAP_VIDEO_*_MPLANE

	FORMATS:
	1. framework receives v4l2_format
	2. framework converts to v4l2_ext_pix_format, which is easier, we just
	   need to normalize the pixelformat.
	3. v4l2_ext_pix_format gets processed
	4. framework converts back to v4l2_format keeping the original and sends
	   pixelformat to userspace.

		NOTE A-3.1: I need to save the original pixelformat, so I can
			    know that I need to convert back to M-variant.

	CREATE BUFFERS:
	1. vb2 receives v4l2_buffer from userspace
	2. vb2 converts to v4l2_ext_buffer, which is easier, besides complication
	   from NOTE A-1.1.
	3. vb2 validates the sizes with queue_setup()
	4. vb2 converts it back to v4l2_buffer and sends to userspace

	REQ BUFFER:
	1. vb2 calls queue_setup to ask the driver about the number of memory
	   buffers in a frame buffer
	2. If queue_setup() returns a mem buffer per component then we can continue.

		NOTE A-3.2: If driver doesn't return a different mem_buffer per
			    color component, then we can't convert back to clasic
			    M-variant and we fail, another reason to a hint in
			    queue_setup(). See NOTE A-1.3 and A-2-2.

	QUEUE BUFFER: same as Case A-2.

===========================================
B: Scenarios where:
	userspace -> implements ext API
	driver -> implements classic API
-------------------------------------------
- I'm assuming that userspace won't differentiate V4L2_CAP_VIDEO_* from V4L2_CAP_VIDEO_*_MPLANE
- I'm not handling the case where we could have the two first planes in a memory buffer
  and a third plane in another memory buffer

Case B-1: Single memory buffer with contiguous planes / driver single planar API

	FORMATS:
	1. framework receives v4l2_ext_pix_format
	2. framework converts to v4l2_format non non-M-variant pixelformat (we
	   know we need to convert o non-M-variants because of the driver's
	   capabilities)
	3. v4l2_format gets processed
	4. framework converts back to v4l2_ext_pix_format and sends to userspace.

	CREATE BUFFERS:
	1. vb2 receives v4l2_ext_buffer from userspace with single mem buffer
	   and contiguous planes.
	2. vb2 converts to v4l2_buffer with a single plane
	3. v4l2_buffer is validated by queue_setup()
	4. vb2 converts back to v4l2_ext_format and sends to userspace.

Case B-2: Single memory buffer with contiguous planes / driver multi planar API

	FORMATS:
	1. framework receives v4l2_ext_pix_format
	2. framework converts to v4l2_format non non-M-variant pixelformat

		QUESTION: should we convert to M-variant instead?

	3. v4l2_format gets processed

		QUESTION: if it fails, should we convert to M-variant and re-try?

	4. framework converts back to v4l2_ext_pix_format and sent to userspace.

Case B-3: Single memory buffer with non contiguous planes

	FORMATS: same as B-1 or B-2 (if mplane API or not)

	CREATE BUFFERS:
	1. vb2 receives v4l2_ext_buffer from userspace with single mem buffer
	   and non contiguous planes.
	2. we fail, since we can't convert to v4l2_buffer

Case B-3: Multi memory buffers / driver is single planar API

	FORMATS: Same as Case B-2

	CREATE BUFFERS:
	1. vb2 receives v4l2_ext_buffer from userspace requesting a memory buffer
	   per plane.
	2. we fail, since driver doesn't support it

Case B-4: Multi memory buffers / driver is multi planar API

	FORMATS: Same as Case B-2

	CREATE BUFFERS:
	1. vb2 receives v4l2_ext_buffer from userspace requesting a memory buffer
	   per plane.
	2. vb2 convert v4l2_ext_buffer to v4l2_buffer using multiplanar API
	3. v4l2_buffer is validated by queue_setup()
	4. vb2 converts back to v4l2_ext_format and sends to userspace.


Regards,
Helen
