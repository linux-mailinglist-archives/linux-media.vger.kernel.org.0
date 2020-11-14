Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0142B2D37
	for <lists+linux-media@lfdr.de>; Sat, 14 Nov 2020 13:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgKNMx5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 07:53:57 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:53891 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726307AbgKNMx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 07:53:56 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id dv3tkXY6H6t6Hdv3wk3sk7; Sat, 14 Nov 2020 13:53:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605358433; bh=T70DtHo2iBiGwHo0jUxq3RCSLEWiH4Ay/V26m4E2cto=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FUm8vHzz4mp5UbTbGLVmoyNyxlRgN7a1khwdRD9ib9A4lSuj+sgzHWSS+9uLwhrjM
         Cr2htUZ8F1EBL9yxf32cBrWWG4dkhn1SrPe9J3HzIorav6HvtFxPhWCDv8ZPY5bSjB
         n4X7gpVAtmp4jscJ2MP9/kf4mg9qbZGq2TszLi6l8p17CtRfXIIckvXtM4HuM6WXSn
         pGGwRoZNOzx4rr8eDSg6leREdsURJcUpLoa74kqkDBY8LfsLZumpI5RmnrD+GN7vEq
         hx20bzJxp12xU4ax9kRYXSsk2w9pIzVMbmfPvswY72LUToImZDvK2rxcqUPQy9qBUG
         65Dq5kdL6kL0Q==
Subject: Re: [PATCH v2 3/9] media: Rename stateful codec control macros
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201113215121.505173-1-ezequiel@collabora.com>
 <20201113215121.505173-4-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5b563695-bb40-8309-042b-10c6910d773c@xs4all.nl>
Date:   Sat, 14 Nov 2020 13:53:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201113215121.505173-4-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKm5LnN/KOfNQQGdTw9ZYz5VhLH3n81dICk98F+Inncup6t8G5s9Fzm6QMmOCLvxb3tWaI51xgS0wyJXgTbL9cdRaiB6XBTzv81blTd69Jp/2vlxSB+n
 1REtsP84FxRgEd92Jg2EF6CWsV0UN1/H0wSCL/AoKIWe8NXP0vz1aA51OgS0P2ukuVGJthqa8LnDPJQ6zmcURiOCbqlemP32RSsX+CraQecmjwKIs3WQQ7B3
 I5pQrVmb8RkAVgJPaQqTzifuIscN3xht8vdnIb1ItjlLkLI7HpAy96Wq920RbeWHoJo4DAMsX2V53SRd1Ec1Fg9rTQJOSEMi+sdfES59EKPqiUEco8O2azN/
 5wiaXMEVpULomc1JI6mFyFJwugplnKmTUldyDuxevQG7VEF0Z1JNS8N7Dix2pymQm/1Wbjl23S7WCn+fymVXziqlUDo42edcK02XnxQquNKKSn1sEqekFhQC
 H9QsH7cMJdQbRR8Og7RQDq/HUu3zcjRWN8OaX1mCyKFhkuG7Kg26PVVlrvg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/11/2020 22:51, Ezequiel Garcia wrote:
> For historical reasons, stateful codec controls are named
> as {}_MPEG_{}. While we can't at this point sanely
> change all control IDs (such as V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER),
> we can least change the more meaningful macros such as classes
> macros.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
>  .../media/v4l/ext-ctrls-codec.rst             |   4 +-
>  .../media/v4l/extended-controls.rst           |   8 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
>  drivers/media/common/cx2341x.c                |   4 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |   4 +-
>  include/media/fwht-ctrls.h                    |   2 +-
>  include/media/h264-ctrls.h                    |  16 +-
>  include/media/hevc-ctrls.h                    |  10 +-
>  include/media/mpeg2-ctrls.h                   |   4 +-
>  include/media/vp8-ctrls.h                     |   2 +-
>  include/uapi/linux/v4l2-controls.h            | 409 +++++++++---------
>  14 files changed, 242 insertions(+), 233 deletions(-)
> 

<snip>

> @@ -1177,4 +1177,13 @@ enum v4l2_detect_md_mode {
>  #define V4L2_CID_DETECT_MD_THRESHOLD_GRID	(V4L2_CID_DETECT_CLASS_BASE + 3)
>  #define V4L2_CID_DETECT_MD_REGION_GRID		(V4L2_CID_DETECT_CLASS_BASE + 4)
>  
> +/* MPEG-compression definitions kept for backwards compatibility */
> +#ifndef __KERNEL__
> +#define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> +#define V4L2_CID_MPEG_CLASS             (V4L2_CTRL_CLASS_MPEG | 1)
> +#define V4L2_CID_MPEG_BASE              (V4L2_CTRL_CLASS_MPEG | 0x900)
> +#define V4L2_CID_MPEG_CX2341X_BASE	(V4L2_CTRL_CLASS_MPEG | 0x1000)
> +#define V4L2_CID_MPEG_MFC51_BASE	(V4L2_CTRL_CLASS_MPEG | 0x1100)

Don't copy the offset value here, just keep this as a straight aliases, e.g.:

#define V4L2_CID_MPEG_MFC51_BASE	V4L2_CID_CODEC_MFC51_BASE

It's safer that way.

Regards,

	Hans

> +#endif
> +
>  #endif
> 

