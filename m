Return-Path: <linux-media+bounces-38384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 975C3B10CCB
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99E877ACA92
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F792D9ED3;
	Thu, 24 Jul 2025 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n+vsQIU5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3192C327B;
	Thu, 24 Jul 2025 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366232; cv=none; b=KECi0WKUB53Tb2SC2joW3ysWlMTZBb7yQmmax+kNpfrQ/CNh+hZJ8lQ/w09v+CYdwID6Xz++XQ+KY6/yEeWCFVpzDbhg1An1zSxFwnlQxc+kjyynTv8Ro7aLtLPRFXcBu7g0oKp4RxcSpLWow+U9GAZ6IkrfCTA4wID8yaaigAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366232; c=relaxed/simple;
	bh=I2DfFvSzoohaF8QaBJl3+Mx/Tsj5HbstN1YNZnjJmWM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mCJ3wfimLcKeByoIIVebloapk3aZUX8U5oqeMk7dHDsBan4JIU5mU04wYbnO4JOPI35ScbM9QsfS3DZLthwh8Ph2yKwhogXdsqmttMtnDIEaGgr5BmDJ+aoNdEBbkjLnQGi+miTy53gYINHQ0qcpkO0wEQIEcNN1l1wOmw9GiSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n+vsQIU5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05B1EC79;
	Thu, 24 Jul 2025 16:09:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366188;
	bh=I2DfFvSzoohaF8QaBJl3+Mx/Tsj5HbstN1YNZnjJmWM=;
	h=From:Subject:Date:To:Cc:From;
	b=n+vsQIU5+axMze5JAIq6Q/orPUNGoynBOU2+YS2j3l5XTpj+TPtANUEX/53Wf8AtP
	 kvhIqBJ+Dt6No47eehM+pap3u+8qD0ZAsLSAVYeeplm9KI86yQ3KZvk+nk0horh2yd
	 /XcJ5t8RCk2rlOHCV55ZILzda3i3UNo3lXruTIOg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 00/27] media: Add support for multi-context operations
Date: Thu, 24 Jul 2025 16:10:07 +0200
Message-Id: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8+gmgC/32NQQ6CMBBFr0Jm7Zi2oEVX3sOwKGWUSaA1bSUYw
 t0tJG5dvv+T9xaIFJgiXIsFAk0c2bsM6lCA7Y17EnKXGZRQJ6HlGcf3kNh6l2hOOBp2AzvC7ca
 y0herrapabSALXoEePO/ye5O555h8+OytSW7rT6v/aSeJAmtprKwvOSDKG3dkonetN6E7Wj9Cs
 67rF+O3kcTLAAAA
X-Change-ID: 20250716-multicontext-mainline-2025-3479c7c24b7a
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11585;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=I2DfFvSzoohaF8QaBJl3+Mx/Tsj5HbstN1YNZnjJmWM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7N+u8dCU4tewo31CN4YD5BPwaMD4AE8hxvv
 al5DxHRCiSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zQAKCRByNAaPFqFW
 PI1/EADD3AVRXdMSw09qi1KjFELdP795UEv3Tsp7We2TymIEvw9pRPr5l+HcLfT2FboxT3ioxHO
 9FgEzPrOzOptYKmKOLxfGKKLzKWGDPP+SJeRBBcjpyN4A3R/DRNTSLMxa1Ig3vX8+NLJ0ceU5Sg
 oW6A83otc7/bZlVjXtRUaqM3/6LL8tD77sFLiKFHJygQDxqmKztHsk7kyTUOuqf+5m3LeCymT7D
 BSUXoKceWHTTgVUMSLcfbtRkpzcRDOqBHJQvXTyTsIaB37Tc7z1ioym2Nhlkr1pOZEi6ltn/DtM
 I/Z3n1uJOxbxkQTP7AQzhj5hhl6hNsDYkw2C6B5CRshZBkVjD6UPLcW/3FD3rbLjCRVz9HHmRkT
 02BKLtxcP63vYwm52SKNbUSSS395B1tkFwPk/oiznDqqKtJNHVxhuANWvA/uBied5/IHJ2ELmU8
 Tf7ilNj7RlAlVnY8T9tpfjfsLNaAZhTZnzKDS26WUeRkCp0yTfWs/Z9Ic4rlAz2hHfOWQZztnO6
 91aujEAoKPXdW/nLEV+QcYhrVAA+FSLxBo9lx55WKH+dOilzgZg+hJ/giA/4axe0LnJEj96ePtR
 7EmEwQFjyUhadpfBTUQwjx9Ul5z7HISK+l6b8/gfBqCinoHlUBrEd3kRBbcOZM8VfGLvoBdCOaU
 d1najEngK2+Uwxw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Modern ISPs are designed to handle multiple "streams" of data, not necessarily
related to the same image or video stream.

The hardware resources are generally time-multiplexed between different
execution contexts at the hardware or firmware level and in order to operate the
ISP with multiple video sources it is necessary for drivers to keep track of
per-context data and resources.

In V4L2 the M2M framework supports multiple contexts through multiple opens of
the same video device. This doesn't however support drivers exposing multiple
video devices and sub-devices. Several out-of-tree drivers implement
multi-context support by registering multiple 'logical' instances of the same
media graph, one for each context. This effectively multiplies the number of
video device nodes and subdevice nodes. Userspace applications open one media
graph instance and operate on the corresponding video devices, under the
impression of dealing with a dedicated instance of the sole underlying hardware
resource.

This solution is however a short term hack, it doesn't scale well when the
number of contexts grow. ISPs such as the Mali C55 have been designed to process
8 cameras concurrently, and other ISPs may do more.

For this reason, a solution to expose and manage multiple execution contexts
without duplicating the number of media, video and sub-devices registered to
userspace is needed to improve support for multi-context devices in V4L2.

The series enables userspace to multiplex the usage of a media device and of
video devices without duplicating the number of devnodes in userspace, by
introducing the following concept in the framework:

- Media Device Context: a context created at media-device open time and stored
  in the media-fh file handle. To a media device context is associated a list
  of media entity contexts which are 'bound' to it.

- Video Device Context: represents an isolated execution context of a
  video device. By storing the data and the configuration of a video
  device userspace is allowed to effectively multiplex the usage of a
  device node.

- Video Subdevice Context: represents an isolated execution context of
  v4l2 subdevice. It stores that subdev state which is now available in
  three locations:
  - in the file handle: for TRY formats
  - in the subdevice: for ACTIVE formats to support operations of subdevices
    drivers that do not implement context support
  - in the subdevice default context: for ACTIVE formats to support
    operations of subdevice drivers that implement context support and
    are operated by non-context-aware userspace
  - in the subdevice file-handle context: for ACTIVE formats to support
    operations of subdevices drivers that implement context support and
    are  bound to a media device context

  Both the Video Device Context and the V4L2 Subdevice
  Context extend the Media Entity Context base type so that the MC and
  V4L2 layers are kept independent one from each other.

- A Video Device Context is created by a new ioctl VIDIOC_BIND_CONTEXT and is
  stored in the v4l2-fh file handle.

- A V4L2 Subdevice context is created by a new ioctl
  VIDIOC_SUBDEV_BIND_CONTEXT and is stored in the v4l2_subdev_fh file
  handle.

  The VIDIOC_BIND_CONTEXT and VIDIOC_SUBDEV_BIND_CONTEXT ioctls associates a
  Video/Subdevice Context to a Media Device Context. By binding a set of video
  devices and subdevices to a media device context userspace can create several
  isolated 'execution contexts' which can be operated independently one from
  each other.

- A V4L2 Video Device and V4L2 Subdevice default context is made
  created to allow drivers that implement multi-context support but are
  operated by userspace that is not context aware (IOW doesn't call
  VIDIOC_BIND_CONTEXT).

The first 20 patches implement the above described changes in the
framework:

  media: v4l2-subdev: Validate media links with context
  media: mc-entity: Add link_validate_context
  media: media-entity: Support context in pipeline_start
  media: v4l2-subdev: Get state from context
  media: v4l2-subdev: Add subdev state accessor helpers
  media: v4l2_subdev: Introduce default context
  media: Documentation: Add VIDIOC_SUBDEV_BIND_CONTEXT
  media: v4l2-subdv: Introduce VIDIOC_SUBDEV_BIND_CONTEXT
  media: v4l2-subdev: Introduce v4l2 subdev context
  media: videobuf2-v4l2: Support vb2_queue embedded in a context
  media: v4l2-dev: Add video_device_context_from_queue()
  media: v4l2-dev: Add video_device_context_from_file()
  media: Introduce default contexts
  media: v4l2-dev: Documentation: Add VIDIOC_BIND_CONTEXT
  media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
  media: v4l2-dev: Introduce video device context
  media: media-device: Introduce media device context
  media: media-entity: Introduce media_entity_context
  media: mc: Maintain a list of open file handles in a media device
  media: mc: Add per-file-handle data support

For testing the implementation I used a Raspberry Pi5, implementing
support for multiple contexts in the ISP driver. The PiSP BE driver
however only implements video devices, as the single ISP subdev is not
exposed to userspace and doesn't require any configuration. To test the
V4L2 subdev context operations I had to first expose the ISP subdev to
userspace and implement link validation and pipeline allocation for it.
This is implemented in the following 6 patches NOT FOR INCLUSION in
mainline but just here for reference

 [DNI] media: pisp_be: Register devnode to userspace
 [DNI] media: pisp_be: Implement link validation
 [DNI] media: pisp_be: Implement set/get_pad_fmt
 [DNI] media: pisp_be: Add support for subdev state
 [DNI] media: pisp_be: Start and stop the media pipeline

Finally, the last patch (again NOT FOR INCLUSION) ports the ISP driver
to support multi-context operations and provides a reference for the
multi-context API usage by drivers:

 [DNI] media: pisp_be: Add support for multi-context

The multi-context support has been tested with a version of libcamera
that binds all video devices and the ISP subdevice in an execution
context and allows to stream two cameras at the same time using the same
media graph.

In order to validate the fact that introducing context support in
drivers doesn't break existing userspace which is not context-aware,
capturing from a single camera with [mainline libcamera + ISP subdev
configuration] has been tested as well.

CI pipeline:
- https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1472617
- checkpatch errors are due to "DNI" prefix in last patches
- static check errors seems unrelated to this set of patches but to
  existing code
- checkpatch error are due to the usage of "Generic" which checkpatch
  doesn't like

Branch for testing:
- kernel patches:
  https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/multicontext/mainline/2025
- libcamera multi-context:
  https://git.libcamera.org/libcamera/jmondi/libcamera.git/log/?h=multicontext/rpi/mc
- libcamera single context:
  https://git.libcamera.org/libcamera/jmondi/libcamera.git/log/?h=multicontext/rpi/subdev-no-multi-context

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v2:
- Add "media: uapi: Add 'flags' to media_device_info"
- Fix robots complaints by protecting users of symbols only defined if
  CONFIG_MEDIA_CONTROLLER with pre-processor guards
- Link to v1: https://lore.kernel.org/r/20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com

rfc->v1 Compared to the RFC version sent in September 2024:
  - Implement support for V4L2 Subdevice context
  - Implement context-aware pipeline start and link validation
  - Break out from Sakari's media lifetime series the only 2 required
    patches that introduce media_device_fh
  - Test the BE ISP subdevice by implementing support for the ISP
    subdevice in the BE driver

---
Jacopo Mondi (25):
      media: media-entity: Introduce media_entity_context
      media: media-device: Introduce media device context
      media: v4l2-dev: Introduce video device context
      media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
      media: Documentation: Add VIDIOC_BIND_CONTEXT
      media: v4l2-dev: Introduce default contexts
      media: v4l2-dev: Add video_device_context_from_file()
      media: v4l2-dev: Add video_device_context_from_queue()
      media: videobuf2-v4l2: Support vb2_queue embedded in a context
      media: v4l2-subdev: Introduce v4l2 subdev context
      media: v4l2-subdev: Introduce VIDIOC_SUBDEV_BIND_CONTEXT
      media: Documentation: Add VIDIOC_SUBDEV_BIND_CONTEXT
      media: v4l2_subdev: Introduce default context
      media: v4l2-subdev: Add subdev state accessor helpers
      media: v4l2-subdev: Get state from context
      media: media-entity: Support context in pipeline_start
      media: mc-entity: Add link_validate_context
      media: v4l2-subdev: Validate media links with context
      media: uapi: Add 'flags' to media_device_info
      [DNI] media: pisp_be: Start and stop the media pipeline
      [DNI] media: pisp_be: Add support for subdev state
      [DNI] media: pisp_be: Implement set/get_pad_fmt
      [DNI] media: pisp_be: Implement link validation
      [DNI] media: pisp_be: Register devnode to userspace
      [DNI] media: pisp_be: Add support for multi-context

Laurent Pinchart (1):
      media: mc: Add per-file-handle data support

Sakari Ailus (1):
      media: mc: Maintain a list of open file handles in a media device

 .../media/mediactl/media-ioc-device-info.rst       |   6 +-
 .../userspace-api/media/mediactl/media-types.rst   |  13 +
 .../userspace-api/media/v4l/user-func.rst          |   2 +
 .../media/v4l/vidioc-bind-context.rst              |  80 +++
 .../media/v4l/vidioc-subdev-bind-context.rst       |  81 +++
 drivers/media/common/videobuf2/videobuf2-v4l2.c    | 139 ++--
 drivers/media/mc/mc-device.c                       | 213 +++++-
 drivers/media/mc/mc-devnode.c                      |  20 +-
 drivers/media/mc/mc-entity.c                       | 220 +++++-
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 775 ++++++++++++++++-----
 drivers/media/v4l2-core/v4l2-dev.c                 | 158 ++++-
 drivers/media/v4l2-core/v4l2-device.c              |  11 +-
 drivers/media/v4l2-core/v4l2-fh.c                  |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  72 ++
 drivers/media/v4l2-core/v4l2-subdev.c              | 414 ++++++++++-
 include/media/media-device.h                       | 230 ++++++
 include/media/media-devnode.h                      |  21 +-
 include/media/media-entity.h                       | 163 ++++-
 include/media/media-fh.h                           |  37 +
 include/media/v4l2-dev.h                           | 252 +++++++
 include/media/v4l2-fh.h                            |   3 +
 include/media/v4l2-ioctl.h                         |   7 +
 include/media/v4l2-subdev.h                        | 293 ++++++--
 include/uapi/linux/media.h                         |   6 +-
 include/uapi/linux/v4l2-subdev.h                   |  11 +
 include/uapi/linux/videodev2.h                     |  11 +
 26 files changed, 2890 insertions(+), 349 deletions(-)
---
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
change-id: 20250716-multicontext-mainline-2025-3479c7c24b7a

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


