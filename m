Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48A9227E7D
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 13:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgGULPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 07:15:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42624 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728159AbgGULPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 07:15:43 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7B9DF283D14;
        Tue, 21 Jul 2020 12:15:40 +0100 (BST)
Date:   Tue, 21 Jul 2020 13:15:37 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Helen Koike <helen.koike@collabora.com>, Brian.Starkey@arm.com
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, tfiga@chromium.org,
        hiroh@chromium.org, nicolas@ndufresne.ca, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, mjourdan@baylibre.com,
        stanimir.varbanov@linaro.org
Subject: Re: [PATCH v4 0/6] media: v4l2: Add extended fmt and buffer ioctls
Message-ID: <20200721131537.6ff83c71@collabora.com>
In-Reply-To: <20200717115435.2632623-1-helen.koike@collabora.com>
References: <20200717115435.2632623-1-helen.koike@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Helen,

Just a few drive-by comments.

On Fri, 17 Jul 2020 08:54:29 -0300
Helen Koike <helen.koike@collabora.com> wrote:

> Hi,
> 
> I'm sorry for taking too long to submit v4.
> 
> It is not perfect, not all v4l2-compliance tests passes, but I'd like a review,
> specially on the API and potential problems, so I can focus on improving implementation
> and maybe drop the RFC tag for next version.
> 
> Follow below what changed in v4 and some items I'd like to discuss:
> 
> 
> * Ioctl to replace v4l2_pix_format
> ---------------------------------------------------------------------------------
> During last media summit, we agreed to create ioctls that replace the v4l2_pix_format
> struct and leave the other structs in the v4l2_format union alone.
> Thus I refactored the code to receive struct v4l2_ext_pix_format, and I renamed the
> ioctls, so now we have:
> 
> int ioctl(int fd, VIDIOC_G_EXT_FMT, struct v4l2_ext_pix_format *argp);

Maybe use the EXT_PIX_FMT suffix here since the struct is really only
about pixel formats.

> int ioctl(int fd, VIDIOC_S_EXT_FMT, struct v4l2_ext_pix_format *argp);
> int ioctl(int fd, VIDIOC_TRY_EXT_FMT, struct v4l2_ext_pix_format *argp);
> 
> The only valid types are V4L2_BUF_TYPE_VIDEO_CAPTURE and V4L2_BUF_TYPE_VIDEO_OUTPUT,
> all the other types are invalid with this API.
> 

[...]

> 
> 
> Boris Brezillon (5):
>   media: v4l2: Extend pixel formats to unify single/multi-planar
>     handling (and more)
>   media: videobuf2: Expose helpers to implement the _ext_fmt and
>     _ext_buf hooks
>   media: mediabus: Add helpers to convert a ext_pix format to/from a
>     mbus_fmt
>   media: vivid: Convert the capture and output drivers to
>     EXT_FMT/EXT_BUF
>   media: vimc: Implement the ext_fmt and ext_buf hooks

I think you should take ownership of these patches. The end result is
likely to be completely different from what I initially posted, and
you're the one doing the hard work here.

> 
> Hans Verkuil (1):
>   media: v4l2: Add extended buffer operations
> 
>  .../media/common/videobuf2/videobuf2-core.c   |   2 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 549 +++++-----
>  .../media/test-drivers/vimc/vimc-capture.c    |  61 +-
>  drivers/media/test-drivers/vimc/vimc-common.c |   6 +-
>  drivers/media/test-drivers/vimc/vimc-common.h |   2 +-
>  drivers/media/test-drivers/vivid/vivid-core.c |  70 +-
>  .../test-drivers/vivid/vivid-touch-cap.c      |  26 +-
>  .../test-drivers/vivid/vivid-touch-cap.h      |   3 +-
>  .../media/test-drivers/vivid/vivid-vid-cap.c  | 169 +---
>  .../media/test-drivers/vivid/vivid-vid-cap.h  |  15 +-
>  .../media/test-drivers/vivid/vivid-vid-out.c  | 193 ++--
>  .../media/test-drivers/vivid/vivid-vid-out.h  |  15 +-
>  drivers/media/v4l2-core/v4l2-dev.c            |  50 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 934 ++++++++++++++++--
>  include/media/v4l2-ioctl.h                    |  60 ++
>  include/media/v4l2-mediabus.h                 |  42 +
>  include/media/videobuf2-core.h                |   6 +-
>  include/media/videobuf2-v4l2.h                |  21 +-
>  include/uapi/linux/videodev2.h                | 144 +++
>  19 files changed, 1650 insertions(+), 718 deletions(-)
> 

