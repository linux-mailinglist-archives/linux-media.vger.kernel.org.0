Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1035765414
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 11:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfGKJqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 05:46:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfGKJq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 05:46:29 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCED3CC;
        Thu, 11 Jul 2019 11:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562838388;
        bh=DkpWRvffNHYIS24u6Q4vXfgevuK5xaDW42Kh6CeFPIE=;
        h=Subject:To:References:From:Reply-To:Date:In-Reply-To:From;
        b=Qpd0HB94LWLKWAveLfOH2w7lqsubMsbe7dYkRcQHPZkAUlwOaX7+a/+N7bvs9I5Fm
         DEBJieOdZNXoRnBO6yccvDwNolXGBI+b2AyIF1tONxH0009CPla9KeO2w+VS+rxTU3
         olFkaCd01PhXjIGCLw+6lxkm3VqpOUFYDN5lkkU4=
Subject: Re: [PATCH for 5.3] videodev2.h: change V4L2_PIX_FMT_BGRA444 define:
 fourcc was already in use
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <27374021-a714-f49f-5ea2-9ebfd1992e54@xs4all.nl>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <4e30d54c-4cfe-1f7e-9d14-3118c6866f94@ideasonboard.com>
Date:   Thu, 11 Jul 2019 10:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <27374021-a714-f49f-5ea2-9ebfd1992e54@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 11/07/2019 09:53, Hans Verkuil wrote:
> The V4L2_PIX_FMT_BGRA444 define clashed with the pre-existing V4L2_PIX_FMT_SGRBG12
> which strangely enough used the same fourcc, even though that fourcc made no sense
> for a Bayer format. In any case, you can't have duplicates, so change the fourcc of
> V4L2_PIX_FMT_BGRA444.

Aha - I started looking at this this morning as well, and I see you've
beaten me to a patch.

That's a good thing anyway, as I was worried about what the actual code
should be instead, but hey I got to spend some time looking at how these
are all laid out.

There's not a lot of choice of letters left, with BA12 and RA12,
consumed, so GA12 seems reasonable.

It's a shame the SRGB formats didn't choose an 'S' leading char or such.

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: <stable@vger.kernel.org>      # for v5.2 and up

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9d9705ceda76..2427bc4d8eba 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -518,7 +518,13 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_RGBX444 v4l2_fourcc('R', 'X', '1', '2') /* 16  rrrrgggg bbbbxxxx */
>  #define V4L2_PIX_FMT_ABGR444 v4l2_fourcc('A', 'B', '1', '2') /* 16  aaaabbbb ggggrrrr */
>  #define V4L2_PIX_FMT_XBGR444 v4l2_fourcc('X', 'B', '1', '2') /* 16  xxxxbbbb ggggrrrr */
> -#define V4L2_PIX_FMT_BGRA444 v4l2_fourcc('B', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
> +
> +/*
> + * Originally this had 'BA12' as fourcc, but this clashed with the older
> + * V4L2_PIX_FMT_SGRBG12 which inexplicably used that same fourcc.
> + * So use 'GA12' instead for V4L2_PIX_FMT_BGRA444.
> + */
> +#define V4L2_PIX_FMT_BGRA444 v4l2_fourcc('G', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
>  #define V4L2_PIX_FMT_BGRX444 v4l2_fourcc('B', 'X', '1', '2') /* 16  bbbbgggg rrrrxxxx */
>  #define V4L2_PIX_FMT_RGB555  v4l2_fourcc('R', 'G', 'B', 'O') /* 16  RGB-5-5-5     */
>  #define V4L2_PIX_FMT_ARGB555 v4l2_fourcc('A', 'R', '1', '5') /* 16  ARGB-1-5-5-5  */
> 

