Return-Path: <linux-media+bounces-2761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE401819CE8
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083F61C2270E
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5314B20B04;
	Wed, 20 Dec 2023 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6OBFreZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BC9208B5
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068639; x=1734604639;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6jeERmWSCwARtWfHMM5JjvSiqWEGcojGp/enr66PTtU=;
  b=D6OBFreZEmJUKj1pmFI9ddd1AuSlccZXFrRXasScYhFD7t8LZv+CWIdX
   DcddnkqjYPcpt63tfoLN6NL5d9qshzJ9JhaXiRNFw8jGSlxztXp7C2Qjm
   d4HbCKKKKhX4xKc2sP5V2b+CZP1x5vT5I8Of5XsUOU//LBfuhnYLdmOn7
   GYW+mQ0tzI8sAecdpIYHKGEvApseX1uLqgcsNoxxzyxJf7YehA5jGg+BU
   imTgZbwxsT4uhKvWcs6VQO4SKN6mPs+ohrBNXKof9wl1/Hkj2X3y5yC4W
   LUkhNsdF2mWEeD7vlN433kp3ddlODO8D9saeDo1CRv0WNARXMVcM57iAV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174298"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174298"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544224"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544224"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:17 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0916F11FB5E;
	Wed, 20 Dec 2023 12:37:13 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 00/29] Media device lifetime management
Date: Wed, 20 Dec 2023 12:36:44 +0200
Message-Id: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

Both ipu3-cio2 and omap3isp drivers are relieved of devm_request_irq() use,
as device_release() releases the resources before calling the driver's
remove function. While further work will be required also on these drivers
to safely stop he hardware at unbind time, I don't see a reason not to merge
these patches now.

Some patches are temporarily reverted in order to make reworks easier, then
applied later on.

I've tested this on ipu3-cio2 with and without the refcounting patch (media:
ipu3-cio2: Release the cio2 device context by media device callback),
including failures in a few parts of the driver initialisation process in
the MC framework.

Questions and comments are welcome.

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

Daniel Axtens (1):
  media: uvcvideo: Refactor teardown of uvc on USB disconnect

Laurent Pinchart (1):
  media: mc: Add per-file-handle data support

Logan Gunthorpe (1):
  media: mc: utilize new cdev_device_add helper function

Sakari Ailus (26):
  Revert "[media] media: fix media devnode ioctl/syscall and unregister
    race"
  Revert "media: utilize new cdev_device_add helper function"
  Revert "[media] media: fix use-after-free in cdev_put() when app exits
    after driver unbind"
  Revert "media: uvcvideo: Refactor teardown of uvc on USB disconnect"
  Revert "[media] media-device: dynamically allocate struct
    media_devnode"
  media: mc: Drop nop release callback
  media: mc: Do not call cdev_device_del() if cdev_device_add() fails
  media: mc: Delete character device early
  media: mc: Split initialising and adding media devnode
  media: mc: Shuffle functions around
  media: mc: Initialise media devnode in media_device_init()
  media: mc: Refactor media devnode minor clearing
  media: mc: Unassign minor only if it has been assigned
  media: mc: Refcount the media device
  media: v4l: Acquire a reference to the media device for every video
    device
  media: mc: Postpone graph object removal until free
  media: omap3isp: Release the isp device struct by media device
    callback
  media: ipu3-cio2: Call v4l2_device_unregister() earlier
  media: ipu3-cio2: Request IRQ earlier
  media: ipu3-cio2: Release the cio2 device context by media device
    callback
  media: vimc: Release resources on media device release
  media: Documentation: Document how Media device resources are released
  media: mc: Maintain a list of open file handles in a media device
  media: mc: Implement best effort media device removal safety sans
    refcount
  media: mc: Warn about drivers not releasing media device safely
  media: Documentation: Document media device memory safety helper

 Documentation/driver-api/media/mc-core.rst  |  18 +-
 drivers/media/cec/core/cec-core.c           |   2 +-
 drivers/media/mc/mc-device.c                | 260 ++++++++++++--------
 drivers/media/mc/mc-devnode.c               | 230 +++++++++++------
 drivers/media/pci/intel/ipu3/ipu3-cio2.c    |  70 ++++--
 drivers/media/platform/ti/omap3isp/isp.c    |  24 +-
 drivers/media/test-drivers/vimc/vimc-core.c |  15 +-
 drivers/media/usb/au0828/au0828-core.c      |   4 +-
 drivers/media/usb/uvc/uvc_driver.c          |   2 +-
 drivers/media/v4l2-core/v4l2-dev.c          |  65 +++--
 drivers/staging/media/sunxi/cedrus/cedrus.c |   2 +-
 include/media/media-device.h                |  46 +++-
 include/media/media-devnode.h               | 136 +++++++---
 include/media/media-fh.h                    |  32 +++
 14 files changed, 632 insertions(+), 274 deletions(-)
 create mode 100644 include/media/media-fh.h

-- 
2.39.2


