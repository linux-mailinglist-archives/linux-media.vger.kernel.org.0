Return-Path: <linux-media+bounces-6869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA0F879216
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEAB71C2141C
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A318F53E3C;
	Tue, 12 Mar 2024 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbNyKK6s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500FA2AE8C
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239670; cv=none; b=Y5oFGRpX7GpKTLMi8IynGZC5atDhMGOGm8/coZMzenZQ432X5ccmBOULZzAj8Oo27mt3ohYTWdKdFDLjoi3+MBNa1eI9TMg/7giu215DCKBB9B4oPdPO1eWWqhJNhMAq1Q+oFg+/hm+7YO1pFvFDO+kjYxEWIBQDhLDnz5T6cuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239670; c=relaxed/simple;
	bh=iVrx8ByXB969grYJaDeA4UK6HFu845tSxgIjC2ajQ0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pcumdeh3JgEWSQ7CrTXGBKDzL3a22mjvddanXgsZWs6CRpfEOyyMwP8x6Hc1wBvxnAtKdHgnqN0HxGOdvb7YqBlSeJgNp5/tAW3Y9Ne6gfRsO/HB2HNpVXvfVp28RqOtKzX5YzRiscDThpfG4UUvewJBkbxTi+3QQHWm5cmlC8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbNyKK6s; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239668; x=1741775668;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iVrx8ByXB969grYJaDeA4UK6HFu845tSxgIjC2ajQ0k=;
  b=mbNyKK6sH/cvBI9/1ufB/zePm7gJMSV8GETaGc+VYpN3PmUKCu9lTV69
   ARsX/wpiVjc00VakZyXv4wX+rJx/HA7Jc5vrMUWyVJkNMhNp9Rr9ebGwg
   i0rhtu3RpyrgBOh8eeyGkPhjmiTZzMdheADc/h72BJqWaGRJf/UZvvzIt
   t144ek9aQ3/tnOznjiRMZ/78G8I//QZynzZ5cLnbM8/FI5bkQiEbZjGTU
   getRlPE0NHIMRTmE4pq9T5dnTwUYxqXMaWkdpOqK/7qxqk6agoGXLvin0
   mdZKklSVmCJV4kpcyJ3yecUIBp5vqAVs+UWZN8EeK0XqhdrBPgZo4FvBu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794253"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794253"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194054"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:26 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 239CA11F819;
	Tue, 12 Mar 2024 12:34:23 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 00/26] Media device lifetime management
Date: Tue, 12 Mar 2024 12:33:56 +0200
Message-Id: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
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
the MC framework.

Questions and comments are welcome.

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

Logan Gunthorpe (1):
  media: mc: utilize new cdev_device_add helper function

Sakari Ailus (24):
  Revert "[media] media: fix media devnode ioctl/syscall and unregister
    race"
  Revert "media: utilize new cdev_device_add helper function"
  Revert "[media] media: fix use-after-free in cdev_put() when app exits
    after driver unbind"
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

 Documentation/driver-api/media/mc-core.rst  |  18 +-
 drivers/media/cec/core/cec-core.c           |   2 +-
 drivers/media/mc/mc-device.c                | 256 ++++++++++++--------
 drivers/media/mc/mc-devnode.c               | 207 ++++++++++------
 drivers/media/pci/intel/ipu3/ipu3-cio2.c    |  72 ++++--
 drivers/media/platform/ti/omap3isp/isp.c    |  24 +-
 drivers/media/test-drivers/vimc/vimc-core.c |  15 +-
 drivers/media/usb/au0828/au0828-core.c      |   4 +-
 drivers/media/usb/uvc/uvc_driver.c          |   2 +-
 drivers/media/v4l2-core/v4l2-dev.c          |  64 +++--
 drivers/staging/media/sunxi/cedrus/cedrus.c |   2 +-
 include/media/media-device.h                |  53 +++-
 include/media/media-devnode.h               | 136 ++++++++---
 include/media/media-fh.h                    |  32 +++
 sound/usb/media.c                           |   8 +-
 15 files changed, 619 insertions(+), 276 deletions(-)
 create mode 100644 include/media/media-fh.h

-- 
2.39.2


