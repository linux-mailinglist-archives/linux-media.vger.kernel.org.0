Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658BA3AD2FB
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 21:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234101AbhFRTkk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 15:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhFRTkj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 15:40:39 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F1CC061574;
        Fri, 18 Jun 2021 12:38:30 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5F2001F44CE8
Message-ID: <fbf31c292fde2f7dafb1441fc85a1ead34fdf96d.camel@collabora.com>
Subject: Re: [PATCH v3 4/8] media: Add P010 video format
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Fri, 18 Jun 2021 16:38:17 -0300
In-Reply-To: <20210618131526.566762-5-benjamin.gaignard@collabora.com>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
         <20210618131526.566762-5-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, 2021-06-18 at 15:15 +0200, Benjamin Gaignard wrote:
> P010 is a YUV format with 10-bits per pixel with interleaved UV.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 2:
>  - Add documentation about P010 padding
>  - Fix the number of bits per component (16)
> 
>  .../media/v4l/pixfmt-yuv-planar.rst           | 78 ++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-common.c         |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 090c091affd2..af400d37c8fd 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -100,8 +100,13 @@ All components are stored with the same number of bits per component.
>        - Cb, Cr
>        - No
>        - 64x32 macroblocks
> -
> -        Horizontal Z order
> +    * - V4L2_PIX_FMT_P010

Do we have support in GStreamer (or elsewhere) for this?

Thanks,
Ezequiel

