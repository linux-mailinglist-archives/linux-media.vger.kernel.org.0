Return-Path: <linux-media+bounces-13430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B79ED90AD6F
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 13:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 396681F232DC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 11:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22241953BA;
	Mon, 17 Jun 2024 11:55:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4528D194C8E
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718625356; cv=none; b=aDH50vbf34qsQzA41jUSP/TivFrRjYqTz062zvlMfKzhLQ7oym9zv4Q+QRKuX1RNP5DXYUxWXGAcI1DcxUBw/Y6jTM4QT9W7WVNwqi4XUKmpCt4neQ+kMPiIxxJz5xnTQRQJ7iCyi5uLaY0Oc/hDcmEs394YlyOYeXzSUCZ6Pk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718625356; c=relaxed/simple;
	bh=6WBt8uixZfvhY4JOLa09QU62XPMPdtpAyyKaCcbaG34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYb3gS6ReLQ2rZeaV+EyUKAGw59Vhul5/bb/hACHM2qd4bwkv4VMsTLTyY95lqj1tqjLr8SsYU5Tue0PFovZ0yN79FMneSUKzDOjaMSqxeIbrnPn/dpWI9Y1rg+drvaioWvT/ouQr0erdcauN/GMydH+r2k2ygRwCPmQF8UD7Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3252EC2BD10;
	Mon, 17 Jun 2024 11:55:55 +0000 (UTC)
Message-ID: <7b5e8220-2081-439e-962f-01a4e7839cef@xs4all.nl>
Date: Mon, 17 Jun 2024 13:55:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/26] Media device lifetime management
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2024 12:05, Sakari Ailus wrote:
> Hi folks,
> 
> This is a refresh of my 2016 RFC patchset to start addressing object
> lifetime issues in Media controller. It further allows continuing work to
> address lifetime management of media entities.
> 
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
> 
> Due to this, Media device file handles will also be introduced by this
> patchset. I thought the first user of this would be Media device events but
> it seems we already need them here.
> 
> Some patches are temporarily reverted in order to make reworks easier,
> then applied later on. Others are not re-applied: this is a change of
> direction, not development over those patches. It would be possible to
> squash the reverts into others on the expense of readability, so the
> reverts are maintained for that reason.
> 
> I've tested this on ipu3-cio2 with and without the refcounting patch (media:
> ipu3-cio2: Release the cio2 device context by media device callback),
> including failures in a few parts of the driver initialisation process in
> the MC framework. I've also tested the vimc driver.

You need to convert at least one m2m test driver (vicodec and ideally also
vim2m). M2M device have their own media controller setup, so it is good to
have at least one converted.

Regards,

	Hans

> 
> Questions and comments are welcome.
> 
> since v3:
> 
> - Rework commit message of patch re-converting to cdev_device_add(). It's
>   no longer the same patch.
> 
> - Convert drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
>   and drivers/media/test-drivers/visl/visl-core.c to changed
>   media_devnode_is_registered() argument.
> 
> - Properly check for NULL Media device on a V4L2 device in
>   video_register_media_controller().
> 
> - Don't acquire Media device graph mutex in media_device_unregister() for
>   checking whether the media device is registered.
> 
> - Remove extra call to v4l2_async_nf_cleanup() in
>   drivers/media/platform/ti/omap3isp/isp.c.
> 
> since v2:
> 
> - Switch to spin_{,un}lock_irq() in fw_list_lock use.
> 
> - Clarify documentatino regarding unregistering and releasing the media
>   device.
> 
> - Release minor number at unregister time (vs. release time). This
>   effectively caused a few patches to be dropped and one more to be added
>   (mc: Clear minor number reservation at unregistration time).
> 
> - Added a comment in ipu3-cio2 driver to clarify destroying mutexes in
>   cio2_queue_exit().
> 
> - In ipu3-cio2 driver:
> 
> 	- Clean up the notifier in probe.
> 
> 	- Unregister the sub-devices at driver unbind time.
> 
> 	- Remove queue initialisation error handling. The queues are
> 	  released in cio2_queues_exit() later in any case.
> 
> - Clean up V4L2 device teardown as suggested by Hans.
> 
> - Rewrap added text in video_register_media_controller().
> 
> - Make media_device_{get,put}() functions (they were macros) for better
>   type checking.
> 
> - Improve kerneldoc for media_device_cleanup().
> 
> - Document release function in media_file_operations.
> 
> - Correct kerneldoc documentation for struct media_devnode.
> 
> - Fix media_devnode_is_registered() usage in sound/usb/media.c that was
>   missed in v2.
> 
> - Drop old git tags from revert² patches.
> 
> - Drop revert and re-applification of "media: uvcvideo: Refactor teardown
>   of uvc on USB disconnect", instead take this account into other patches.
> 
> - Drop patch "ipu3-cio2: Call v4l2_device_unregister() earlier".
> 
> - Remove patch "ipu3-cio2: Request IRQ earlier" from this set, it'll be
>   merged separately.
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
> 
> Laurent Pinchart (1):
>   media: mc: Add per-file-handle data support
> 
> Sakari Ailus (25):
>   Revert "[media] media: fix media devnode ioctl/syscall and unregister
>     race"
>   Revert "media: utilize new cdev_device_add helper function"
>   Revert "[media] media: fix use-after-free in cdev_put() when app exits
>     after driver unbind"
>   media: mc, cec: Make use of cdev_device_add() again
>   Revert "[media] media-device: dynamically allocate struct
>     media_devnode"
>   media: mc: Drop nop release callback
>   media: mc: Drop media_dev description from struct media_devnode
>   media: mc: Do not call cdev_device_del() if cdev_device_add() fails
>   media: mc: Delete character device early
>   media: mc: Clear minor number reservation at unregistration time
>   media: mc: Split initialising and adding media devnode
>   media: mc: Shuffle functions around
>   media: mc: Initialise media devnode in media_device_init()
>   media: mc: Refcount the media device
>   media: v4l: Acquire a reference to the media device for every video
>     device
>   media: mc: Postpone graph object removal until free
>   media: omap3isp: Release the isp device struct by media device
>     callback
>   media: ipu3-cio2: Release the cio2 device context by media device
>     callback
>   media: vimc: Release resources on media device release
>   media: Documentation: Document how Media device resources are released
>   media: mc: Maintain a list of open file handles in a media device
>   media: mc: Implement best effort media device removal safety sans
>     refcount
>   media: mc: Warn about drivers not releasing media device safely
>   media: mc: Enforce one-time registration
>   media: Documentation: Document media device memory safety helper
> 
>  Documentation/driver-api/media/mc-core.rst    |  18 +-
>  drivers/media/cec/core/cec-core.c             |   2 +-
>  drivers/media/mc/mc-device.c                  | 258 +++++++++++-------
>  drivers/media/mc/mc-devnode.c                 | 208 +++++++++-----
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  72 +++--
>  .../vcodec/decoder/mtk_vcodec_dec_drv.c       |   2 +-
>  drivers/media/platform/ti/omap3isp/isp.c      |  25 +-
>  drivers/media/test-drivers/vimc/vimc-core.c   |  15 +-
>  drivers/media/test-drivers/visl/visl-core.c   |   2 +-
>  drivers/media/usb/au0828/au0828-core.c        |   4 +-
>  drivers/media/usb/uvc/uvc_driver.c            |   2 +-
>  drivers/media/v4l2-core/v4l2-dev.c            |  67 +++--
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   2 +-
>  include/media/media-device.h                  |  53 +++-
>  include/media/media-devnode.h                 | 136 ++++++---
>  include/media/media-fh.h                      |  32 +++
>  sound/usb/media.c                             |   8 +-
>  17 files changed, 623 insertions(+), 283 deletions(-)
>  create mode 100644 include/media/media-fh.h
> 


