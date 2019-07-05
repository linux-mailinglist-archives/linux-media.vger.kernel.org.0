Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D5960467
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 12:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbfGEK0S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 06:26:18 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:40459 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbfGEK0S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 06:26:18 -0400
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 637FD24000D;
        Fri,  5 Jul 2019 10:26:04 +0000 (UTC)
Date:   Fri, 5 Jul 2019 12:26:03 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] staging: media: sunxi: Change return type of
 cedrus_find_format()
Message-ID: <20190705102603.GA1645@aptenodytes>
References: <20190703081317.22795-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190703081317.22795-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed 03 Jul 19, 13:43, Nishka Dasgupta wrote:
> Change return type of cedrus_find_format to bool as it is only called
> once, by a function whose return value is bool, and the return value of
> cedrus_find_format is returned as-is at the call-site.
> Issue found with Coccinelle.

The purpose of this function (although definitely under-used at this point),
was to return the pointer to the element structure, not to indicate whether
the format format is part of the list or not.

In spite of that, this change reduces the use case for the function, so I do
not think it is beneficial, sorry.

Cheers,

Paul

> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index 9673874ece10..0ec31b9e0aea 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -55,8 +55,8 @@ static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
>  	return container_of(file->private_data, struct cedrus_ctx, fh);
>  }
>  
> -static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
> -						unsigned int capabilities)
> +static bool cedrus_find_format(u32 pixelformat, u32 directions,
> +			       unsigned int capabilities)
>  {
>  	struct cedrus_format *fmt;
>  	unsigned int i;
> @@ -70,13 +70,10 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
>  
>  		if (fmt->pixelformat == pixelformat &&
>  		    (fmt->directions & directions) != 0)
> -			break;
> +			return true;
>  	}
>  
> -	if (i == CEDRUS_FORMATS_COUNT)
> -		return NULL;
> -
> -	return &cedrus_formats[i];
> +	return false;
>  }
>  
>  static bool cedrus_check_format(u32 pixelformat, u32 directions,
> -- 
> 2.19.1
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
