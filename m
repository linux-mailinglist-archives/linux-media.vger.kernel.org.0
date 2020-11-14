Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5F22B2D40
	for <lists+linux-media@lfdr.de>; Sat, 14 Nov 2020 13:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgKNM6N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 07:58:13 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42617 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726701AbgKNM6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 07:58:13 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id dv83kXZ4T6t6Hdv86k3t6l; Sat, 14 Nov 2020 13:58:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605358690; bh=NuCjwiEXdyDPsGYcmGjusqNNEVjLNz8VKl8RRQKKmo0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uDGbvS4uAUOb2huz4iKIGKoRsFXurZ7Zbgw8mIWgg1iWgotGH8s+NVd4ufx9YVYW8
         Ocgu5HHjcdegkh/5opjPJd/Cym2gsC8mcql1nH4+jhp+0OADf6M5VkneWaknXnQEh3
         jAQW2xvvMJQkbgR0YT/yVJa6/7mzWn00YI3aae/goL1O6eBJVNdhjY24i4V2q2o/M0
         eK8IlV6UbhBrj86nJXDg0aoRKwX6Vue4VzIMN14VlDtqsT+8C8jneIdW+o8iOCdd92
         FosrKEbYQHnnEk7hLDJmbbeNqdVLQCAOb8lffq9pY1iPpaf29rMJGGhRk/lKFLx7ol
         BUiQw4qXDESUQ==
Subject: Re: [PATCH v2 0/9] Stateless H.264 de-staging
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201113215121.505173-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <73f46141-7fb5-925c-b9db-7af608d0dfd4@xs4all.nl>
Date:   Sat, 14 Nov 2020 13:58:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201113215121.505173-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKa6MrtpgY0w2ZVlDrENY6/Y9vZxe3Q1X1SvQ9uKpDlYVOblMdOa5araHzmWTXuc3BrYgfGAEusYvjTGDmLiro6jtVRNzsP+dH8GlSriMfRJS83n+rM0
 AxFiolDCckSwJwKTXiPXN5aJeI3ZzMGvplHht+FWyiIlANGsUJTYEIBP8hgUXT2WitWIRNtS5Wi0GpcSrkDIYlgV2NA6POLRFulIUCLQvNNq30tk5dzfrcU5
 8eV8drB2BjE3BKtFsIzSOEEQ+6SvjQ9ZhvYCJvwu1xEtP9AnMeMmef/JPygb/yItTZ590HO7lf7NrqZhZ7fexxPsXjwrnSt9W+xRx3qpuFiE1PcKGzO3EHN0
 0Zg/fhgZuAte1dHwNCp/s0I2CFVcH85NFPlQ2mZTfpt3gxydRgPb1BylOVbVb5hyn+DLB6wphdZPq6Eln6TnbBvJZTvav7F6fNIVYBvyJiaNu6l3GbDtcVF4
 +dgDqKurTho25UXU0fH1zgVr4kIpB3bx9aIZTQXUUBMpEa0ihgSVJSzyH88=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/11/2020 22:51, Ezequiel Garcia wrote:
> Now that H.264 stateless controls are solid, we can get it
> out of staging.
> 
> Following some guidelines from Hans, this series creates a
> new stateless control class for the stable codec controls to land.
> 
> While here, I'm including a patch from Jonas adding profiles
> and levels to Rkvdec, and also made a similar fix for Cedrus.
> 
> This series was tested on a i.MX8MQ EVK board, using GStreamer:
> 
> https://gitlab.freedesktop.org/ezequielgarcia/gst-plugins-bad/-/commits/h264_stable_uapi
> 
> In case someone wants to give this a test.
> 
> Note that v4l2-compliance isn't passing, as the Hantro driver
> doesn't set legal default values for the H264 SPS, PPS, etc
> controls.
> 
> That's something we should fix, although it's since it's just
> meant to please v4l2-compliance, we could also argue that these
> controls shouldn't be expected to have any default value.

This really needs to be fixed. I've ignored this issue since the API
was in staging and still changing, but when we move it out of staging,
then this issue should be tackled.

It should likely be done in std_init_compound() in v4l2-ctrls.c.

It is probably a good idea to also verify std_validate_compound(), making
sure that everything there is still valid and up to date.

And std_log() should be taught about these new controls. For compound
controls I would just log the type name, e.g. "H264_SPS" and not the
values of these compound controls.

Regards,

	Hans

> 
> Thanks,
> Ezequiel
> 
> v2:
>   * Split destage changes in several patches so it's easier to review.
>   * Added missing changes to drivers/media/v4l2-core/v4l2-ctrls.c.
>   * Renamed V4L2_CID_CODEC_CX2341X_ and V4L2_CID_MPEG_MFC51_
>   * Moved the compatibility macros for MPEG to the end of the header.
> 
> Ezequiel Garcia (8):
>   media: cedrus: h264: Support profile and level controls
>   media: Rename stateful codec control macros
>   media: Clean stateless control includes
>   media: controls: Add the stateless codec control class
>   media: uapi: Move parsed H264 pixel format out of staging
>   media: uapi: Move the H264 stateless control types out of staging
>   media: uapi: move H264 stateless controls out of staging
>   media: docs: Move the H264 stateless codec uAPI
> 
> Jonas Karlman (1):
>   media: rkvdec: h264: Support profile and level controls
> 
>  .../userspace-api/media/v4l/common.rst        |   1 +
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++
>  .../media/v4l/ext-ctrls-codec.rst             | 696 +---------------
>  .../media/v4l/extended-controls.rst           |   8 +-
>  .../media/v4l/pixfmt-compressed.rst           |  14 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
>  drivers/media/common/cx2341x.c                |   4 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  45 +-
>  drivers/staging/media/hantro/hantro_drv.c     |  26 +-
>  drivers/staging/media/hantro/hantro_h264.c    |   8 +-
>  drivers/staging/media/hantro/hantro_hw.h      |   4 +-
>  drivers/staging/media/rkvdec/rkvdec-h264.c    |   8 +-
>  drivers/staging/media/rkvdec/rkvdec.c         |  39 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  45 +-
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  12 +-
>  include/media/fwht-ctrls.h                    |   2 +-
>  include/media/h264-ctrls.h                    |  27 +-
>  include/media/hevc-ctrls.h                    |  10 +-
>  include/media/mpeg2-ctrls.h                   |   4 +-
>  include/media/v4l2-ctrls.h                    |   1 -
>  include/media/v4l2-h264.h                     |   2 +-
>  include/media/vp8-ctrls.h                     |   2 +-
>  include/uapi/linux/v4l2-controls.h            | 788 +++++++++++++-----
>  include/uapi/linux/videodev2.h                |   8 +
>  27 files changed, 1422 insertions(+), 1018 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> 

