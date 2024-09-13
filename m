Return-Path: <linux-media+bounces-18269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF11E978AD0
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85F931F21C22
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A5114F12D;
	Fri, 13 Sep 2024 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EA20Rsdd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0350C2B9D2
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264037; cv=none; b=jI1rCyCXWJn4Sa66wY68QAsO2Mw5CuT2IXaSt+2KdLSKmcC2n8aunCDK2fZwYxYKTzX4FV0DrZPi7sDv6ww9jyNl/s9DJqITWR+jpy0mxxJVYw+HbO6D+hWv1YDo+qMwwT36t2geYbqYFJZog1CYsH0w+Oq9u7m556MyhhcUi4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264037; c=relaxed/simple;
	bh=zXp0ssCJ36wTDFnW2NYJmaJVXukPtvpz48qu4FQ5e3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NldCd8Rya7a96c749ukgzSWVt01BBzYetbLNTxw9X+yV8vS661NKCj5uRZgM6cAsFlmjGK3f10y5Mfntb3I+TwJpWvCVvGX/VAZDSxKWHJbF8X4DKvIIWfD3tLNbbXekqs0cNe5gSjMyaCPHi/KGja/LZFMlVRlrsFlTOW5NYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EA20Rsdd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EEAAEA5;
	Fri, 13 Sep 2024 23:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726263948;
	bh=zXp0ssCJ36wTDFnW2NYJmaJVXukPtvpz48qu4FQ5e3g=;
	h=From:To:Cc:Subject:Date:From;
	b=EA20RsddIJxZUEdmAZC4NNJJ8vm3dqr6FyZP28y4bLHYIf2ZZb9A3HknnTM1P4vj8
	 DGecN7l3cf17+MKy51AEbg0PTxhIi5c6reMNLIVDtsneRG/rTGD5c8lfGJYBQiwiI0
	 FcpehQI/6yhbMdXzKONYtOSdA9v0/++Wv0ypVNkM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 00/10] Introduce support for multi-context in V4L2 and MC
Date: Fri, 13 Sep 2024 23:46:45 +0200
Message-ID: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello list,

   this series serves as a base for the forthcoming discussion at the Linux
Media Summit in Vienna on Monday.

The series is sent as RFC but has been tested and developed on a real HW
platform, the RaspberryPi 5 PiSP Back End.

I'm not going here in great length on the background and motivations of the
series, as it will be the subject of Monday discussion, but here it is a bit
of background, by reporting the abstract presented for the Media Summit.

-------------------------------------------------------------------------------
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
userspace is needed to improve support for multi-context devices in V4L2. This
will also be useful for codecs that need more than an output and a capture video
queue.
--------------------------------------------------------------------------------

The series enables userspace to multiplex the usage of a media device and of
video devices without duplicating the number of devnodes in userspace, by
introducing the following concept in the framework:

- Media Device Context: a context created at media-device open time and stored
  in the media-fh file handle. To a media device context is associated a list
  of media entity contexts which are 'bound' to it.

- Video Device Context (and V4L2 Subdevice Context, not implemented in this RFC)
  represents an isolated execution context of a video device. By storing the
  data and the configuration of a video device userspace is allowed to
  effectively multiplex the usage of a device node. Both the Video Device Context
  and the V4L2 Subdevice Context extend the Media Entity Context base type so
  that the MC and V4L2 layers are kept independent one from each other.

- A Video Device Context is created by a new ioctl VIDIOC_BIND_CONTEXT and is
  stored in the v4l2-fh file handle. The VIDIOC_BIND_CONTEXT associates a
  Video Device Context to a Media Device Context. By binding a set of video
  devices and subdevices to a media device context userspace can create several
  isolated 'execution contexts' which can be operated independently one from
  each other.

The implementation has been tested by porting the PiSP BE driver in the last
patch to showcase the newly introduced driver API. The implementation has been
tested with a slightly modified version of libcamera with 2 concurrent camera
streams running in parallel.

Albeit I'm listed as the author of the here proposed implementation the majority
of the design (and several private review rounds) have to be attributed to
Laurent which has a much more profound understanding of the framework and its
future evolution than me. Thanks for the guidance and the several comments and
discussions.

The series is based on Sakari's
"PATCH v4 00/26] Media device lifetime management" which introduces media-fh.c
and a branch based on rpi's v6.6.y used for testing is available at
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/tree/multicontext/rpi-6.6.y/v1

For any question, see you on Monday in Vienna!

Jacopo Mondi (10):
  media: media-entity: Introduce media_entity_context
  media: media-device: Introduce media_device_context
  media: v4l2-dev: Introduce video device context
  media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
  media: Introduce default contexts
  media: v4l2-dev: Add video_device_context_from_file()
  media: v4l2-dev: Add video_device_context_from_queue()
  videobuf2-v4l2: Support vb2_queue embedded in a context
  media: media-entity: Validate context in pipeline start
  media: pispbe: Add support for multi-context

 .../media/common/videobuf2/videobuf2-v4l2.c   | 129 +++--
 drivers/media/mc/mc-device.c                  | 179 ++++++
 drivers/media/mc/mc-entity.c                  | 136 ++++-
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 509 +++++++++++++-----
 drivers/media/v4l2-core/v4l2-dev.c            | 141 ++++-
 drivers/media/v4l2-core/v4l2-fh.c             |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  64 +++
 include/media/media-device.h                  | 215 ++++++++
 include/media/media-entity.h                  | 141 ++++-
 include/media/media-fh.h                      |   4 +
 include/media/v4l2-dev.h                      | 235 ++++++++
 include/media/v4l2-fh.h                       |   3 +
 include/media/v4l2-ioctl.h                    |   5 +
 include/uapi/linux/videodev2.h                |  11 +
 14 files changed, 1576 insertions(+), 197 deletions(-)

--
2.46.0


