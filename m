Return-Path: <linux-media+bounces-12823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBCA901ECD
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFF77B25A39
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E3D770FA;
	Mon, 10 Jun 2024 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2u49iOM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270D3762D2
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013948; cv=none; b=fhRxWyfWseVx7unG+dWUTtREPr3bD6wjVKecMlqnjTyWtwTMjRNdUsRRtGVegkO6i/Uak9bZXQRLqiTydKqlQRJK3sFRbpBjUfOj6gkmAVKMYPpy9lN/yN6xtnsNOr7wx5X9zwuNA6ar7T9N8LEEUuQFGtjdw9sqOtKHHZWu1ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013948; c=relaxed/simple;
	bh=7r5qz+dSx9llSee4ytDVjAf38+5vKbZnzV0OB1IuJdw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=n3M+UyKvyuqTGzNA2fkKgfzkVzh25e7oSroSn0uoZ0AwakCVolVboLlJxgMYe7ybCprZqJ7HWV/Xxshl6J6PoK0OnCxpf6O06587MwqA3w4Zaf0MmwJkNIu6R6e1CQ9PXb+2itzIWrjMUm8ZxS+PQ0qkSY2W08uz3idWoScpB9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2u49iOM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013948; x=1749549948;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7r5qz+dSx9llSee4ytDVjAf38+5vKbZnzV0OB1IuJdw=;
  b=b2u49iOMw0zXxwzhij/p97TIemTG9u/SnSsJ6l1uzxFc6KxgnAzvSBw1
   /+kDaI2Lh4+nyaKVzpujkIBM3kDl9yMfTCaUoKN4emBvSZDNSPWYfhtNS
   QDPU3TbJe6Mr6ixHKl9Z0WU82zHa5qUnfaCNssGvMgxccf1PTGGZrtYe8
   nLXQ8zIYlXjKQsBQkdVOrpXSNG/mtPyywEfIfxgFh3GuLD/witI88+J0i
   aDw8Y1NoQBzPaSSp6SuzQBWlKFe9NeoYf0hehthX2qkmbqEZXAgMmxLZg
   ZsbC9Rbyh7qewL+IazA0plPvW9yd0yotvu4aCVaByzbNabtXS95J1s0JR
   A==;
X-CSE-ConnectionGUID: 5gydivi8SCWz2hX+p024JQ==
X-CSE-MsgGUID: lQ7muMdXQKKqu1Hvb9aAdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819870"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:45 -0700
X-CSE-ConnectionGUID: vu0y2KDFSBaCOX98+PPKgA==
X-CSE-MsgGUID: 9gt9u0u7TdCdwJkqQFz6wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137331"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D481311F855;
	Mon, 10 Jun 2024 13:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuG-004eCL-2W;
	Mon, 10 Jun 2024 13:05:40 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 00/26] Media device lifetime management
Date: Mon, 10 Jun 2024 13:05:04 +0300
Message-Id: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi folks,

This is a refresh of my 2016 RFC patchset to start addressing object
lifetime issues in Media controller. It further allows continuing work to
address lifetime management of media entities.

The underlying problem is described in detail in v4 of the previous RFC:
<URL:https://lore.kernel.org/linux-media/20161108135438.GO3217@valkosipuli.retiisi.org.uk/>.
In brief, there is currently no connection between releasing media device
(and related) memory and IOCTL calls, meaning that there is a time window
during which released kernel memory can be accessed, and that access can be
triggered from the user space. The only reason why this is not a grave
security issue is that it is not triggerable by the user alone but requires
unbinding a device. That is still not an excuse for not fixing it.

This set differs from the earlier RFC to address the issue in the
following respects:

- Make changes for ipu3-cio2 driver, too.

- Continue to provide best effort attempt to keep the window between device
  removal and user space being able to access released memory as small as
  possible. This means the problem won't become worse for drivers for which
  Media device lifetime management has not been implemented.

The latter is achieved by adding a new object, Media devnode compat
reference, which is allocated, refcounted and eventually released by the
Media controller framework itself, and where the information on registration
and open filehandles is maintained. This is only done if the driver does not
manage the lifetime of the media device itself, i.e. its release operation
is NULL.

Due to this, Media device file handles will also be introduced by this
patchset. I thought the first user of this would be Media device events but
it seems we already need them here.

Some patches are temporarily reverted in order to make reworks easier,
then applied later on. Others are not re-applied: this is a change of
direction, not development over those patches. It would be possible to
squash the reverts into others on the expense of readability, so the
reverts are maintained for that reason.

I've tested this on ipu3-cio2 with and without the refcounting patch (media:
ipu3-cio2: Release the cio2 device context by media device callback),
including failures in a few parts of the driver initialisation process in
the MC framework. I've also tested the vimc driver.

Questions and comments are welcome.

since v3:

- Rework commit message of patch re-converting to cdev_device_add(). It's
  no longer the same patch.

- Convert drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
  and drivers/media/test-drivers/visl/visl-core.c to changed
  media_devnode_is_registered() argument.

- Properly check for NULL Media device on a V4L2 device in
  video_register_media_controller().

- Don't acquire Media device graph mutex in media_device_unregister() for
  checking whether the media device is registered.

- Remove extra call to v4l2_async_nf_cleanup() in
  drivers/media/platform/ti/omap3isp/isp.c.

since v2:

- Switch to spin_{,un}lock_irq() in fw_list_lock use.

- Clarify documentatino regarding unregistering and releasing the media
  device.

- Release minor number at unregister time (vs. release time). This
  effectively caused a few patches to be dropped and one more to be added
  (mc: Clear minor number reservation at unregistration time).

- Added a comment in ipu3-cio2 driver to clarify destroying mutexes in
  cio2_queue_exit().

- In ipu3-cio2 driver:

	- Clean up the notifier in probe.

	- Unregister the sub-devices at driver unbind time.

	- Remove queue initialisation error handling. The queues are
	  released in cio2_queues_exit() later in any case.

- Clean up V4L2 device teardown as suggested by Hans.

- Rewrap added text in video_register_media_controller().

- Make media_device_{get,put}() functions (they were macros) for better
  type checking.

- Improve kerneldoc for media_device_cleanup().

- Document release function in media_file_operations.

- Correct kerneldoc documentation for struct media_devnode.

- Fix media_devnode_is_registered() usage in sound/usb/media.c that was
  missed in v2.

- Drop old git tags from revert² patches.

- Drop revert and re-applification of "media: uvcvideo: Refactor teardown
  of uvc on USB disconnect", instead take this account into other patches.

- Drop patch "ipu3-cio2: Call v4l2_device_unregister() earlier".

- Remove patch "ipu3-cio2: Request IRQ earlier" from this set, it'll be
  merged separately.

since v1:

- Align subject prefixes with current media tree practices.

- Make release changes to the vimc driver (last patch of the set). This
  was actually easy as vimc already centralised resource release to struct
  v4l2_device, so it was just moved to the media device.

- Move cdev field to struct media_devnode_compat_ref and add dev field to
  the struct, these are needed during device release. This now includes
  also the character device which is accessed by __fput(). I've now tested
  ipu3-cio2 and vimc with KASAN. As a by-product the kref in struct
  media_devnode_compat_ref becomes redundant and is removed. Both devices
  are registered in case of best effort memory safety support and used for
  refcounting.

- Drop omap3isp driver patch moving away from devm_request_irq().

- Add a patch to warn of drivers not releasing media device safely (i.e.
  relying on the best effort memory safety mechanism without refcounting).

- Add a patch to document how the best effort memory release safety helper
  works.

- Add a note on releasing driver's context with the media device, not the
  V4L2 device, in MC documentation.

- Check media device is registered before accessing its fops in
  media_read(), media_write(), media_ioctl and media_compat_ioctl().

- Document best effort media device lifetime management (new patch).

- Use media_devnode_free_minor() in unallocating device node minor number
  in media_devnode_register().

- Continue to rely on devm_register_irq() in ipu3-cio2 driver but register
  the IRQ later on (compared to v1).

- Drop the patch to move away from devm_request_irq() in omap3isp.

- Fix putting references to media device and V4L2 device in 
  v4l2_device_release().

- Add missing media_device_get() (in v1) for M2M devices in
  video_register_media_controller().

- Unconditionally set the media devnode release function in
  media_device_init(). There's no harm doing so and the caller of
  media_device_init() may set the ops after calling the function.


Laurent Pinchart (1):
  media: mc: Add per-file-handle data support

Sakari Ailus (25):
  Revert "[media] media: fix media devnode ioctl/syscall and unregister
    race"
  Revert "media: utilize new cdev_device_add helper function"
  Revert "[media] media: fix use-after-free in cdev_put() when app exits
    after driver unbind"
  media: mc, cec: Make use of cdev_device_add() again
  Revert "[media] media-device: dynamically allocate struct
    media_devnode"
  media: mc: Drop nop release callback
  media: mc: Drop media_dev description from struct media_devnode
  media: mc: Do not call cdev_device_del() if cdev_device_add() fails
  media: mc: Delete character device early
  media: mc: Clear minor number reservation at unregistration time
  media: mc: Split initialising and adding media devnode
  media: mc: Shuffle functions around
  media: mc: Initialise media devnode in media_device_init()
  media: mc: Refcount the media device
  media: v4l: Acquire a reference to the media device for every video
    device
  media: mc: Postpone graph object removal until free
  media: omap3isp: Release the isp device struct by media device
    callback
  media: ipu3-cio2: Release the cio2 device context by media device
    callback
  media: vimc: Release resources on media device release
  media: Documentation: Document how Media device resources are released
  media: mc: Maintain a list of open file handles in a media device
  media: mc: Implement best effort media device removal safety sans
    refcount
  media: mc: Warn about drivers not releasing media device safely
  media: mc: Enforce one-time registration
  media: Documentation: Document media device memory safety helper

 Documentation/driver-api/media/mc-core.rst    |  18 +-
 drivers/media/cec/core/cec-core.c             |   2 +-
 drivers/media/mc/mc-device.c                  | 258 +++++++++++-------
 drivers/media/mc/mc-devnode.c                 | 208 +++++++++-----
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  72 +++--
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |   2 +-
 drivers/media/platform/ti/omap3isp/isp.c      |  25 +-
 drivers/media/test-drivers/vimc/vimc-core.c   |  15 +-
 drivers/media/test-drivers/visl/visl-core.c   |   2 +-
 drivers/media/usb/au0828/au0828-core.c        |   4 +-
 drivers/media/usb/uvc/uvc_driver.c            |   2 +-
 drivers/media/v4l2-core/v4l2-dev.c            |  67 +++--
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   2 +-
 include/media/media-device.h                  |  53 +++-
 include/media/media-devnode.h                 | 136 ++++++---
 include/media/media-fh.h                      |  32 +++
 sound/usb/media.c                             |   8 +-
 17 files changed, 623 insertions(+), 283 deletions(-)
 create mode 100644 include/media/media-fh.h

-- 
2.39.2


