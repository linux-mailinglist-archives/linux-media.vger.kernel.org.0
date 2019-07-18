Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9095E6CA41
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 09:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389350AbfGRHsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 03:48:03 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56537 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfGRHsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 03:48:03 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E97D820007;
        Thu, 18 Jul 2019 07:47:58 +0000 (UTC)
Date:   Thu, 18 Jul 2019 09:47:58 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] staging: media: sunxi: Add bool cast to value
Message-ID: <20190718074758.GD26951@aptenodytes>
References: <20190717142315.3119-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190717142315.3119-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed 17 Jul 19, 19:53, Nishka Dasgupta wrote:
> Typecast as bool the return value of cedrus_find_format in
> cedrus_check_format as the return value of cedrus_check_format is always
> treated like a boolean value.

Thanks for the patch! Could we also add !! to the returned pointer so that
we are sure that the function returns either false or true, but never a
non-zero value that is not true?

Cheers,

Paul

> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index e2b530b1a956..f00a048a0a01 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -86,7 +86,7 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
>  static bool cedrus_check_format(u32 pixelformat, u32 directions,
>  				unsigned int capabilities)
>  {
> -	return cedrus_find_format(pixelformat, directions, capabilities);
> +	return (bool)cedrus_find_format(pixelformat, directions, capabilities);
>  }
>  
>  static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
> -- 
> 2.19.1
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
