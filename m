Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F120D3FFF87
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 14:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348791AbhICMFc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 08:05:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:36822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235253AbhICMFb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Sep 2021 08:05:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C145A610A1;
        Fri,  3 Sep 2021 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630670671;
        bh=TV60G71330gY2zfcvnThkkfaUu41BxT5Wk4/0mYH3eM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=l6wTcDN8IuynfV4RLR3cWA1nB/STMdvaNKZY4NBaAijyl9nj8ddxl45GDA5aGXNDV
         vLUwjyw8vmlsom0Y5v9mbAJqmx97n+R8vdyg2lu7Y8LzKDTkih3acqC5pbgme/NsAL
         10taWYbdycj3BYmWk4WTbcmSoFA1dI41t5qhNbG5VVI/01bbbx8SxTQ97C/AxK5wYv
         zViIpEGeZA1MC2tce1uNvGP/IO4NZWvU4bweJhY343TclntwmdYP8yhvPQbpp/cgaQ
         UnEqRw0ol+tI+5k5huP+Ewqg8S9gv4QeCEuDwnGTdXEN4PuU3UgbJKgV2/2fJdbaIT
         QRUQyiZvdpBhw==
Date:   Fri, 3 Sep 2021 14:04:27 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [GIT PULL FOR v5.16] uvcvideo v4l2-compliance fixes
Message-ID: <20210903140421.1b021b6f@coco.lan>
In-Reply-To: <YSNsXylafQPuKH4H@pendragon.ideasonboard.com>
References: <YSNsXylafQPuKH4H@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 23 Aug 2021 12:37:35 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> The following changes since commit d62cd4d277cc711f781a7bdec4109c6148529b25:
> 
>   media: uvcvideo: Remove unused including <linux/version.h> (2021-08-21 09:11:04 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/pinchartl/media.git tags/uvc-next-20210823
> 
> for you to fetch changes up to 2bc2b78476b4bc5690186c2b9a4dd565be6a9913:
> 
>   media: uvcvideo: Don't spam the log in uvc_ctrl_restore_values() (2021-08-23 12:31:04 +0300)
> 
> This contains a subset of "[PATCH v10 00/21] Fix v4l2-compliance errors"
> as 17 out of the 21 patches are ready to go and don't need to be
> delayed.
> 
> ----------------------------------------------------------------
> - uvcvideo v4l2-compliance fixes
> 
> ----------------------------------------------------------------
> Hans Verkuil (1):
>       media: uvcvideo: Don't spam the log in uvc_ctrl_restore_values()
> 
> Ricardo Ribalda (16):
>       media: v4l2-ioctl: Fix check_ext_ctrls
>       media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
>       media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
>       media: v4l2-ioctl: S_CTRL output the right value
>       media: uvcvideo: Remove s_ctrl and g_ctrl
>       media: uvcvideo: Set capability in s_param
>       media: uvcvideo: Return -EIO for control errors
>       media: uvcvideo: refactor __uvc_ctrl_add_mapping
>       media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
>       media: uvcvideo: Use dev->name for querycap()
>       media: uvcvideo: Set unique vdev name based in type
>       media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE

Patches applied.

>       media: uvcvideo: Use control names from framework
>       media: uvcvideo: Check controls flags before accessing them
>       media: uvcvideo: Set error_idx during ctrl_commit errors

I didn't apply those three. The first one seems to be causing
memory leaks, and the other two are dependent on the first one.

So, I opted to skip them when merging this PR. This way, Ricardo
can just re-submit 3 patches instead of the hole series.


>       media: docs: Document the behaviour of uvcvideo driver

Patches applied.

> 
>  .../userspace-api/media/v4l/vidioc-g-ctrl.rst      |   3 +
>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   3 +
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |   4 -
>  drivers/media/usb/uvc/uvc_ctrl.c                   | 260 ++++++++++++++++-----
>  drivers/media/usb/uvc/uvc_driver.c                 |  15 +-
>  drivers/media/usb/uvc/uvc_metadata.c               |   2 +-
>  drivers/media/usb/uvc/uvc_v4l2.c                   | 105 ++++-----
>  drivers/media/usb/uvc/uvc_video.c                  |   5 +
>  drivers/media/usb/uvc/uvcvideo.h                   |  17 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  67 ++++--
>  10 files changed, 317 insertions(+), 164 deletions(-)

Thanks,
Mauro
