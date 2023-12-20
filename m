Return-Path: <linux-media+bounces-2791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3115819D61
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C51D289086
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C15220B2E;
	Wed, 20 Dec 2023 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q90jg7p/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F40820DC3
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E6E8833;
	Wed, 20 Dec 2023 11:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1703069496;
	bh=WshXH402MBDsxV23iygLGr6A/shYm50EU+jKMqK0pLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q90jg7p/j+iPw2DMA4iJr4GYT+25hUuqp2Z6OW/iwjrxAr1eMTa+N9Vu4l1uxEyxa
	 0t8EP7FMOsEUBNAi+cFAvvHyvqIO1kq3srpSNLIWLi5hkVu4NEKZhuZn38sGlojd4K
	 cBwdpt2oaTQttoW/H5QSoKZ+Vrj1ADm21qsV8dOY=
Date: Wed, 20 Dec 2023 12:52:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 00/29] Media device lifetime management
Message-ID: <20231220105232.GK29638@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-1-sakari.ailus@linux.intel.com>

On Wed, Dec 20, 2023 at 12:36:44PM +0200, Sakari Ailus wrote:
> Hi folks,
> 
> This is a refresh of my 2016 RFC patchset to start addressing object
> lifetime issues in Media controller. It further allows continuing work to
> address lifetime management of media entities.

I think you win the prize of the refresh for the oldest patch series.
Thanks for not dropping the ball. One day we'll make the media subsystem
healthy :-)

> The underlying problem is described in detail in v4 of the previous RFC:
> <URL:https://lore.kernel.org/linux-media/20161108135438.GO3217@valkosipuli.retiisi.org.uk/>.
> In brief, there is currently no connection between releasing media device
> (and related) memory and IOCTL calls, meaning that there is a time window
> during which released kernel memory can be accessed, and that access can be
> triggered from the user space. The only reason why this is not a grave
> security issue is that it is not triggerable by the user alone but requires
> unbinding a device. That is still not an excuse for not fixing it.
> 
> This set differs from the earlier RFC to address the issue in the
> following respects:
> 
> - Make changes for ipu3-cio2 driver, too.
> 
> - Continue to provide best effort attempt to keep the window between device
>   removal and user space being able to access released memory as small as
>   possible. This means the problem won't become worse for drivers for which
>   Media device lifetime management has not been implemented.
> 
> The latter is achieved by adding a new object, Media devnode compat
> reference, which is allocated, refcounted and eventually released by the
> Media controller framework itself, and where the information on registration
> and open filehandles is maintained. This is only done if the driver does not
> manage the lifetime of the media device itself, i.e. its release operation
> is NULL.

Interesting. I'll check that when reviewing the patches.

> Due to this, Media device file handles will also be introduced by this
> patchset. I thought the first user of this would be Media device events but
> it seems we already need them here.

Nice, it will become a useful feature.

> Both ipu3-cio2 and omap3isp drivers are relieved of devm_request_irq() use,
> as device_release() releases the resources before calling the driver's
> remove function.

Are you sure about that ? device_release() is the .release() function
for device_ktype, which means it's called when the last reference to a
struct device disappears. That should be way after .remove().

> While further work will be required also on these drivers
> to safely stop he hardware at unbind time, I don't see a reason not to merge
> these patches now.
> 
> Some patches are temporarily reverted in order to make reworks easier, then
> applied later on.
> 
> I've tested this on ipu3-cio2 with and without the refcounting patch (media:
> ipu3-cio2: Release the cio2 device context by media device callback),
> including failures in a few parts of the driver initialisation process in
> the MC framework.
> 
> Questions and comments are welcome.
> 
> since v1:
> 
> - Align subject prefixes with current media tree practices.
> 
> - Make release changes to the vimc driver (last patch of the set). This
>   was actually easy as vimc already centralised resource release to struct
>   v4l2_device, so it was just moved to the media device.
> 
> - Move cdev field to struct media_devnode_compat_ref and add dev field to
>   the struct, these are needed during device release. This now includes
>   also the character device which is accessed by __fput(). I've now tested
>   ipu3-cio2 and vimc with KASAN. As a by-product the kref in struct
>   media_devnode_compat_ref becomes redundant and is removed. Both devices
>   are registered in case of best effort memory safety support and used for
>   refcounting.
> 
> - Drop omap3isp driver patch moving away from devm_request_irq().
> 
> - Add a patch to warn of drivers not releasing media device safely (i.e.
>   relying on the best effort memory safety mechanism without refcounting).
> 
> - Add a patch to document how the best effort memory release safety helper
>   works.
> 
> - Add a note on releasing driver's context with the media device, not the
>   V4L2 device, in MC documentation.
> 
> - Check media device is registered before accessing its fops in
>   media_read(), media_write(), media_ioctl and media_compat_ioctl().
> 
> - Document best effort media device lifetime management (new patch).
> 
> - Use media_devnode_free_minor() in unallocating device node minor number
>   in media_devnode_register().
> 
> - Continue to rely on devm_register_irq() in ipu3-cio2 driver but register
>   the IRQ later on (compared to v1).
> 
> - Drop the patch to move away from devm_request_irq() in omap3isp.
> 
> - Fix putting references to media device and V4L2 device in 
>   v4l2_device_release().
> 
> - Add missing media_device_get() (in v1) for M2M devices in
>   video_register_media_controller().
> 
> - Unconditionally set the media devnode release function in
>   media_device_init(). There's no harm doing so and the caller of
>   media_device_init() may set the ops after calling the function.
> 
> Daniel Axtens (1):
>   media: uvcvideo: Refactor teardown of uvc on USB disconnect
> 
> Laurent Pinchart (1):
>   media: mc: Add per-file-handle data support
> 
> Logan Gunthorpe (1):
>   media: mc: utilize new cdev_device_add helper function
> 
> Sakari Ailus (26):
>   Revert "[media] media: fix media devnode ioctl/syscall and unregister
>     race"
>   Revert "media: utilize new cdev_device_add helper function"
>   Revert "[media] media: fix use-after-free in cdev_put() when app exits
>     after driver unbind"
>   Revert "media: uvcvideo: Refactor teardown of uvc on USB disconnect"
>   Revert "[media] media-device: dynamically allocate struct
>     media_devnode"
>   media: mc: Drop nop release callback
>   media: mc: Do not call cdev_device_del() if cdev_device_add() fails
>   media: mc: Delete character device early
>   media: mc: Split initialising and adding media devnode
>   media: mc: Shuffle functions around
>   media: mc: Initialise media devnode in media_device_init()
>   media: mc: Refactor media devnode minor clearing
>   media: mc: Unassign minor only if it has been assigned
>   media: mc: Refcount the media device
>   media: v4l: Acquire a reference to the media device for every video
>     device
>   media: mc: Postpone graph object removal until free
>   media: omap3isp: Release the isp device struct by media device
>     callback
>   media: ipu3-cio2: Call v4l2_device_unregister() earlier
>   media: ipu3-cio2: Request IRQ earlier
>   media: ipu3-cio2: Release the cio2 device context by media device
>     callback
>   media: vimc: Release resources on media device release
>   media: Documentation: Document how Media device resources are released
>   media: mc: Maintain a list of open file handles in a media device
>   media: mc: Implement best effort media device removal safety sans
>     refcount
>   media: mc: Warn about drivers not releasing media device safely
>   media: Documentation: Document media device memory safety helper
> 
>  Documentation/driver-api/media/mc-core.rst  |  18 +-
>  drivers/media/cec/core/cec-core.c           |   2 +-
>  drivers/media/mc/mc-device.c                | 260 ++++++++++++--------
>  drivers/media/mc/mc-devnode.c               | 230 +++++++++++------
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c    |  70 ++++--
>  drivers/media/platform/ti/omap3isp/isp.c    |  24 +-
>  drivers/media/test-drivers/vimc/vimc-core.c |  15 +-
>  drivers/media/usb/au0828/au0828-core.c      |   4 +-
>  drivers/media/usb/uvc/uvc_driver.c          |   2 +-
>  drivers/media/v4l2-core/v4l2-dev.c          |  65 +++--
>  drivers/staging/media/sunxi/cedrus/cedrus.c |   2 +-
>  include/media/media-device.h                |  46 +++-
>  include/media/media-devnode.h               | 136 +++++++---
>  include/media/media-fh.h                    |  32 +++
>  14 files changed, 632 insertions(+), 274 deletions(-)
>  create mode 100644 include/media/media-fh.h

-- 
Regards,

Laurent Pinchart

