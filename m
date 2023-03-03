Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1176C6A935F
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 10:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjCCJHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 04:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjCCJHp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 04:07:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7636B231D3
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 01:07:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 325F0B816C8
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 09:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E40FC433EF;
        Fri,  3 Mar 2023 09:07:40 +0000 (UTC)
Message-ID: <85f6411a-bce7-5b22-34b8-e7e1a36ec18c@xs4all.nl>
Date:   Fri, 3 Mar 2023 10:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/26] Media device lifetime management
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 01/02/2023 22:45, Sakari Ailus wrote:
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
> Both ipu3-cio2 and omap3isp drivers are relieved of devm_request_irq() use,
> as device_release() releases the resources before calling the driver's
> remove function. While further work will be required also on these drivers
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

Most of this series looks good.

You can add my:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

for patches 1-17, 19, 20 and 22.

As I mentioned in my review of patch 21, I don't think 18 and 21 belong to
this series.

I am also not keen on patch 25 (and thus 23 and 24 that it needs). Perhaps
take that out for now for more discussion later?

I would like to see some more drivers to be converted: specifically uvc
and the test drivers (vidtv, vim2m, vimc, visl, vivid). uvc because it is
widely used, the test drivers because they function as reference code.

Finally, I don't think this series addresses another life-cycle problem:
unbinding subdevices when they are still being used, either by userspace
or a bridge driver.

I have patches for that here:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=subdev-kref

I think these are pretty much independent from this patch series, but
I'll wait with posting them until this is merged.

Background: we have an fpga that implements subdevices and also
(depending on the configuration) complete v4l2 platform drivers.

When the fpga is unloaded when going to standby, subdevices and/or
platform drivers just disappear, and without correct life-time management
you get crashes. Basically exactly the same problem as you have with the
media device.

Regards,

	Hans

> 
> 
> Daniel Axtens (1):
>   media: uvcvideo: Refactor teardown of uvc on USB disconnect
> 
> Laurent Pinchart (1):
>   media: Add per-file-handle data support
> 
> Logan Gunthorpe (1):
>   media: utilize new cdev_device_add helper function
> 
> Sakari Ailus (23):
>   Revert "[media] media: fix media devnode ioctl/syscall and unregister
>     race"
>   Revert "media: utilize new cdev_device_add helper function"
>   Revert "[media] media: fix use-after-free in cdev_put() when app exits
>     after driver unbind"
>   Revert "media: uvcvideo: Refactor teardown of uvc on USB disconnect"
>   Revert "[media] media-device: dynamically allocate struct
>     media_devnode"
>   media device: Drop nop release callback
>   media: Do not call cdev_device_del() if cdev_device_add() fails
>   media-device: Delete character device early
>   media: Split initialising and adding media devnode
>   media: Shuffle functions around
>   media device: Initialise media devnode in media_device_init()
>   media device: Refcount the media device
>   v4l: Acquire a reference to the media device for every video device
>   media-device: Postpone graph object removal until free
>   omap3isp: Release the isp device struct by media device callback
>   omap3isp: Don't use devm_request_irq()
>   media: Add nop implementations of media_device_{init,cleanup}
>   media: ipu3-cio2: Call v4l2_device_unregister() earlier
>   media: ipu3-cio2: Don't use devm_request_irq()
>   media: ipu3-cio2: Release the cio2 device context by media device
>     callback
>   media: Maintain a list of open file handles in a media device
>   media: Implement best effort media device removal safety sans
>     refcounting
>   media: Document how Media device resources are released
> 
>  Documentation/driver-api/media/mc-core.rst    |  12 +-
>  drivers/media/cec/core/cec-core.c             |   2 +-
>  drivers/media/mc/mc-device.c                  | 279 +++++++++++-------
>  drivers/media/mc/mc-devnode.c                 |  94 +++---
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  75 +++--
>  drivers/media/platform/ti/omap3isp/isp.c      |  33 ++-
>  drivers/media/usb/au0828/au0828-core.c        |   4 +-
>  drivers/media/usb/uvc/uvc_driver.c            |   2 +-
>  drivers/media/v4l2-core/v4l2-dev.c            |  13 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   2 +-
>  include/media/media-device.h                  |  56 +++-
>  include/media/media-devnode.h                 |  99 ++++---
>  include/media/media-fh.h                      |  32 ++
>  13 files changed, 476 insertions(+), 227 deletions(-)
>  create mode 100644 include/media/media-fh.h
> 

