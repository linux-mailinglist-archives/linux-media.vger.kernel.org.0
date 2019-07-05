Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 752AE60469
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 12:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbfGEK0x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 06:26:53 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58025 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727760AbfGEK0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 06:26:53 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 58E1A1C0005;
        Fri,  5 Jul 2019 10:26:50 +0000 (UTC)
Date:   Fri, 5 Jul 2019 12:26:50 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] staging: media: sunxi: Replace function
 cedrus_check_format()
Message-ID: <20190705102650.GB1645@aptenodytes>
References: <20190703081317.22795-1-nishkadg.linux@gmail.com>
 <20190703081317.22795-2-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190703081317.22795-2-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed 03 Jul 19, 13:43, Nishka Dasgupta wrote:
> Remove function cedrus_check_format as all it does is call
> cedrus_find_format.
> Rename cedrus_find_format to cedrus_check_format to maintain
> compatibility with call sites.
> Issue found with Coccinelle.

Maybe we could have a !! or a bool cast to make coccinelle happy here?

Cheers,

Paul

> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index 0ec31b9e0aea..d5cc9ed04fd2 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -55,8 +55,8 @@ static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
>  	return container_of(file->private_data, struct cedrus_ctx, fh);
>  }
>  
> -static bool cedrus_find_format(u32 pixelformat, u32 directions,
> -			       unsigned int capabilities)
> +static bool cedrus_check_format(u32 pixelformat, u32 directions,
> +				unsigned int capabilities)
>  {
>  	struct cedrus_format *fmt;
>  	unsigned int i;
> @@ -76,12 +76,6 @@ static bool cedrus_find_format(u32 pixelformat, u32 directions,
>  	return false;
>  }
>  
> -static bool cedrus_check_format(u32 pixelformat, u32 directions,
> -				unsigned int capabilities)
> -{
> -	return cedrus_find_format(pixelformat, directions, capabilities);
> -}
> -
>  static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
>  {
>  	unsigned int width = pix_fmt->width;
> -- 
> 2.19.1
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
