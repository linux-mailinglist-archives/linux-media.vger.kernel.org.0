Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8FA18658D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 08:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729821AbgCPHWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 03:22:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33098 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbgCPHWW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 03:22:22 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 310692D6;
        Mon, 16 Mar 2020 08:22:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584343340;
        bh=1mRC66O5RR7UrJZTbWjPw+EsVQ3U3qjaZK6kO7sx8d0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qQwKH84OHvgDQeqyZ8Z+EE9oC6NjuORrwrPWmYzfSKep5uXkZMi4ckavxmpXulAyS
         RpcTgCh0pw7JAAnFQGTbuqaXZZq7AK4xUKg8Kj9gRTCIOmNJyw8EqYYCee9eJRyFhP
         Zwm4NBsPhNoANVjw6xxgGZlc+gDqwXKUvV04+eCw=
Date:   Mon, 16 Mar 2020 09:22:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH] media: v4l2-common: Add BGR666 to v4l2_format_info
Message-ID: <20200316072214.GA16123@pendragon.ideasonboard.com>
References: <20200316070123.2434-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200316070123.2434-1-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Mon, Mar 16, 2020 at 08:01:23AM +0100, Dafna Hirschfeld wrote:
> Add V4L2_PIX_FMT_BGR666 to the format table.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> Hi,
> BGR66 is needed for the rkisp1 driver.
> Currently it crashes since the call to
> v4l2_format_info returns NULL.
> 
>  drivers/media/v4l2-core/v4l2-common.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index d0e5ebc736f9..d7f82b2aa22f 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -253,6 +253,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_RGB565,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },

Isn't BGR666 stored in 3 bytes per pixel ?

>  
>  		/* YUV packed formats */
>  		{ .format = V4L2_PIX_FMT_YUYV,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },

-- 
Regards,

Laurent Pinchart
