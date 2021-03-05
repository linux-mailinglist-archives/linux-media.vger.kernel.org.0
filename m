Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B160032EDA3
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 16:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhCEPD6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 10:03:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:42610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229749AbhCEPDu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Mar 2021 10:03:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FFB065016;
        Fri,  5 Mar 2021 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614956629;
        bh=CYB5uOahqcm5vO1tDEanMELbtqoPKV9sOQG4zLBtrGg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=o12bBO0KS78tNFZR2SJdQwdJ5g3xJj5W+wBASDGtYWr/hdQGz1rLCKGIpu3cuumI/
         8TkdAtCghvdmTR8MgCz4+Tt8QotXzTGjIjq+1Lv3RyPvpNrba8i0SWghqnBWa0x2Gk
         SSfWMxFk0tWP/fIQ5CFKYfDM0W5qBkY+Eb6O4rwOE/l53GDv5IKHTZvT8VFhHSiMUb
         ZsZHRT/3I80x4hWb889w1iyKjXyA2vVe4L6zAzvtXJ65AZMMyB6GfIIeNb4B0kabdH
         rgnXxFWOUjjewV53InoyTep0dGla7MRn0Z2Mji47Y/QBSa6tnHpG35neApFu0j4lgq
         nNhU5W5ITgtFw==
Date:   Fri, 5 Mar 2021 16:03:46 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [GIT PULL FOR v5.13] V4L2 stateless VP8 de-staging
Message-ID: <20210305160346.4ed7b5f3@coco.lan>
In-Reply-To: <7bcaf084-b0fd-8bf8-92df-0eee02d924a3@xs4all.nl>
References: <7bcaf084-b0fd-8bf8-92df-0eee02d924a3@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 4 Mar 2021 08:44:18 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> De-staging the VP8 codec.
> 
> Many thanks to Ezequiel for working on this!

There are more work to do:

./scripts/kernel-doc --none include/uapi/linux/v4l2-controls.h

	include/uapi/linux/v4l2-controls.h:1727: warning: bad line: 
	include/uapi/linux/v4l2-controls.h:1853: warning: expecting prototype for struct v4l2_vp8_frame. Prototype was for struct v4l2_ctrl_vp8_frame instead

And, after fixing those warnings, 3 new ones are produced:

	include/uapi/linux/v4l2-controls.h:1853: warning: Function parameter or member 'segment' not described in 'v4l2_ctrl_vp8_frame'
	include/uapi/linux/v4l2-controls.h:1853: warning: Function parameter or member 'entropy' not described in 'v4l2_ctrl_vp8_frame'
	include/uapi/linux/v4l2-controls.h:1853: warning: Function parameter or member 'coder_state' not described in 'v4l2_ctrl_vp8_frame'

Regards,
Mauro

> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13c
> 
> for you to fetch changes up to 262278126d4e1a69ea29edf7bfeb1f7efb6bf815:
> 
>   media: uapi: move VP8 stateless controls out of staging (2021-03-04 08:34:50 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Ezequiel Garcia (8):
>       media: uapi: vp8: Remove "header" from symbol names and macros
>       media: uapi: vp8: Rename v4l2_vp8_loopfilter to v4l2_vp8_loop_filter
>       media: uapi: vp8: Add proper kernel-doc documentation
>       media: uapi: Move parsed VP8 pixel format out of staging
>       media: uapi: Move the VP8 stateless control type out of staging
>       media: controls: Log VP8 stateless control in .std_log
>       media: vp8: Rename V4L2 VP8 specific macro to V4L2_VP8_
>       media: uapi: move VP8 stateless controls out of staging
> 
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 318 +++++++++++++++++++++++++++++++
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst           | 323 --------------------------------
>  Documentation/userspace-api/media/v4l/pixfmt-compressed.rst         |  15 +-
>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst        |   4 +
>  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst          |   6 +
>  Documentation/userspace-api/media/videodev2.h.rst.exceptions        |   1 +
>  drivers/media/v4l2-core/v4l2-ctrls.c                                |  39 ++--
>  drivers/staging/media/hantro/hantro_drv.c                           |   2 +-
>  drivers/staging/media/hantro/hantro_g1_vp8_dec.c                    |  55 +++---
>  drivers/staging/media/hantro/hantro_hw.h                            |   2 +-
>  drivers/staging/media/hantro/hantro_vp8.c                           |  10 +-
>  drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c                |  55 +++---
>  drivers/staging/media/sunxi/cedrus/cedrus.c                         |   2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.h                         |   2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_dec.c                     |   2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c                     | 113 +++++------
>  include/media/v4l2-ctrls.h                                          |   5 +-
>  include/media/vp8-ctrls.h                                           | 114 -----------
>  include/uapi/linux/v4l2-controls.h                                  | 195 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                                      |   4 +
>  20 files changed, 677 insertions(+), 590 deletions(-)
>  delete mode 100644 include/media/vp8-ctrls.h



Thanks,
Mauro
