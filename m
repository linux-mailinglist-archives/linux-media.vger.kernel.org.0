Return-Path: <linux-media+bounces-7219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1DF87EC7A
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 16:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2056FB21FDC
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 15:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B67535CC;
	Mon, 18 Mar 2024 15:47:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBA552F8D
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710776825; cv=none; b=JlwnH9VHUw8ssCZ/fUMX/1PRqwRrRn4jtJYVbAs6zuGtoRDKLfLp0IUPkU7B6uoPVRlapp6znD1Ddi8VDycSuEaklyreXg5R6r0uYM9e8i3CzoRx0y2R3d7FmSUDpPtWSA4TF69AMItE3mxGTrMqn7wH+9AT/zOvc1FWsHj53A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710776825; c=relaxed/simple;
	bh=4LjiOhO/axNK1vsLhxc8ozfKaMLxSdo3m+e7FUWILcQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=PYc/zZ0A2Iit5aZRo50rlyU9fkuLhmxlJzS8Hwtw9ajOO+SWik+HVybzwOo/X7Ch6tH1CmJGyA+0IKSB9GIOKpSJefhWX1cG5SaRDkiK89ELozil6jL8qOGA09HWQVQfQ9IL4A5wQhAQZ6FjzmqbrVAK359IL7rUW4yN3i4G6GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13058C43390;
	Mon, 18 Mar 2024 15:47:03 +0000 (UTC)
Message-ID: <60427350-38b9-40f1-b31e-b2990b46cbed@xs4all.nl>
Date: Mon, 18 Mar 2024 16:47:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.10] Add REMOVE_BUF ioctl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

This pull request introduces the new VIDIOC_REMOVE_BUFS ioctl, the
counterpart of VIDIOC_CREATE_BUFS. This makes it possible to remove
buffers, and so make it much easier to support dynamic resolution changes
for m2m devices and codecs in particular.

This PR contains v21 of the patch series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=12431

With an updated patch 3/9:

https://patchwork.linuxtv.org/project/linux-media/patch/20240318134856.110687-1-benjamin.gaignard@collabora.com/

The patch adding the v4l2-compliance tests for this feature is here:

https://patchwork.linuxtv.org/project/linux-media/patch/20240314153415.197534-3-benjamin.gaignard@collabora.com/

Besides adding support for this to the media test drivers, this also adds this
feature to the verisilicon hantro driver.

Many thanks to Benjamin Gaignard for working on this. It's a long desired
feature, so it is nice to see this finally land.

Regards,

	Hans

The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:

  media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-rmbufs

for you to fetch changes up to 763bcbde2b37d5aba799b7da45f4f2231b302a04:

  media: verisilicon: Support removing buffers on capture queue (2024-03-18 15:32:51 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (9):
      media: videobuf2: Update vb2_is_busy() logic
      media: videobuf2: Add min_reqbufs_allocation field to vb2_queue structure
      media: test-drivers: Set REQBUFS minimum number of buffers
      media: core: Rework how create_buf index returned value is computed
      media: core: Add bitmap manage bufs array entries
      media: core: Free range of buffers
      media: v4l2: Add REMOVE_BUFS ioctl
      media: v4l2: Add mem2mem helpers for REMOVE_BUFS ioctl
      media: verisilicon: Support removing buffers on capture queue

 Documentation/userspace-api/media/v4l/user-func.rst          |   1 +
 Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst |  85 ++++++++++++++++++++
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst     |   1 +
 drivers/media/common/videobuf2/videobuf2-core.c              | 223 +++++++++++++++++++++++++++++++++++++----------------
 drivers/media/common/videobuf2/videobuf2-v4l2.c              |  34 ++++++--
 drivers/media/platform/verisilicon/hantro_v4l2.c             |   1 +
 drivers/media/test-drivers/vicodec/vicodec-core.c            |   1 +
 drivers/media/test-drivers/vimc/vimc-capture.c               |   3 +-
 drivers/media/test-drivers/visl/visl-video.c                 |   1 +
 drivers/media/test-drivers/vivid/vivid-core.c                |   9 ++-
 drivers/media/test-drivers/vivid/vivid-meta-out.c            |   4 -
 drivers/media/test-drivers/vivid/vivid-touch-cap.c           |   4 -
 drivers/media/v4l2-core/v4l2-dev.c                           |   3 +
 drivers/media/v4l2-core/v4l2-ioctl.c                         |  30 +++++++
 drivers/media/v4l2-core/v4l2-mem2mem.c                       |  15 ++++
 include/media/v4l2-ioctl.h                                   |   4 +
 include/media/v4l2-mem2mem.h                                 |   2 +
 include/media/videobuf2-core.h                               |  52 ++++++++++---
 include/media/videobuf2-v4l2.h                               |   2 +
 include/uapi/linux/videodev2.h                               |  17 ++++
 20 files changed, 396 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst

