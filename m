Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC5E63643
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 14:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfGIM4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 08:56:06 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47133 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725947AbfGIM4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jul 2019 08:56:06 -0400
Received: from [IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea] ([IPv6:2001:983:e9a7:1:10f:829c:8d05:60ea])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kpf6hlZDg0SBqkpf9h2mdZ; Tue, 09 Jul 2019 14:56:04 +0200
Subject: Re: [PATCH 2/9] v4l: Add definitions for missing 16-bit RGB4444
 formats
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190328070723.26553-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190328070723.26553-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <da6f3198-98e3-a6ae-f6a3-4fc2d82db833@xs4all.nl>
Date:   Tue, 9 Jul 2019 14:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190328070723.26553-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKfmxBTKXNZweMrFwXst2RcJUbet5KbPq3+CwUL8924yE4a/UHLH1MLQNE5YGrImcK0m5CIUygHwee7ybMV6xdQl8I+0J9lgTUk5MgpPOWKvtYzDixED
 +bnsE5+PYjJjSGdbknnI2C2/M1HVbGhsVtVddlWBbwhJzV+2ec8XWEhg2niKs0iOMlbOaqiXNgZ2nB7FzXwuJG8AEwOkbMQ2Vzc7YeNT1eb1YN0hix5jBMDA
 snkGm8dIhhFB4liZ+YsGOrFlOTeP+xQrJ+ISqTvRhwHnPcMZZdWmjgNWp/NF7a3dAmvGRjPeUDsMftchcljsgO2C3FTUCNcdeEzgQfyO3XBkQ/CmVZ+odABO
 CYCWSmiPFZdFGFw4DZvnc+rctSRcSQB7IQh1VmF3nMflGa8N02h6jl9UM0QavLQZMDTfNpq+4gcF3ULhyVBJ/gby4YtU3lLkUY2XV2JbkTaYipy+tYA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 3/28/19 8:07 AM, Laurent Pinchart wrote:
> The V4L2 API is missing the 16-bit RGB4444 formats for the RGBA, RGBX,
> ABGR, XBGR, BGRA and BGRX component orders. Add them, using the same
> 4CCs as DRM.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../media/uapi/v4l/pixfmt-packed-rgb.rst      | 138 ++++++++++++++++++
>  include/uapi/linux/videodev2.h                |   6 +
>  2 files changed, 144 insertions(+)
> 

<snip>

> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 4e5222726719..df9fa78a6ab7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -514,6 +514,12 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_RGB444  v4l2_fourcc('R', '4', '4', '4') /* 16  xxxxrrrr ggggbbbb */
>  #define V4L2_PIX_FMT_ARGB444 v4l2_fourcc('A', 'R', '1', '2') /* 16  aaaarrrr ggggbbbb */
>  #define V4L2_PIX_FMT_XRGB444 v4l2_fourcc('X', 'R', '1', '2') /* 16  xxxxrrrr ggggbbbb */
> +#define V4L2_PIX_FMT_RGBA444 v4l2_fourcc('R', 'A', '1', '2') /* 16  rrrrgggg bbbbaaaa */
> +#define V4L2_PIX_FMT_RGBX444 v4l2_fourcc('R', 'X', '1', '2') /* 16  rrrrgggg bbbbxxxx */
> +#define V4L2_PIX_FMT_ABGR444 v4l2_fourcc('A', 'B', '1', '2') /* 16  aaaabbbb ggggrrrr */
> +#define V4L2_PIX_FMT_XBGR444 v4l2_fourcc('X', 'B', '1', '2') /* 16  xxxxbbbb ggggrrrr */
> +#define V4L2_PIX_FMT_BGRA444 v4l2_fourcc('B', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */

Hmm, 'BA12' clashes with V4L2_PIX_FMT_SGRBG12 which has the same fourcc.
That fourcc makes no sense for V4L2_PIX_FMT_SGRBG12 and I suspect it was
a mistake, but it's been in use since 2014.

I think V4L2_PIX_FMT_BGRA444 should get a different fourcc and be backported to 5.2.

Can you address this issue?

Regards,

	Hans

> +#define V4L2_PIX_FMT_BGRX444 v4l2_fourcc('B', 'X', '1', '2') /* 16  bbbbgggg rrrrxxxx */
>  #define V4L2_PIX_FMT_RGB555  v4l2_fourcc('R', 'G', 'B', 'O') /* 16  RGB-5-5-5     */
>  #define V4L2_PIX_FMT_ARGB555 v4l2_fourcc('A', 'R', '1', '5') /* 16  ARGB-1-5-5-5  */
>  #define V4L2_PIX_FMT_XRGB555 v4l2_fourcc('X', 'R', '1', '5') /* 16  XRGB-1-5-5-5  */
> 

