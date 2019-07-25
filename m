Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5B3974CFA
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 13:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391816AbfGYLY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 07:24:29 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44643 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391270AbfGYLY3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 07:24:29 -0400
Received: from [IPv6:2001:420:44c1:2579:64cb:e917:d1ce:4f27] ([IPv6:2001:420:44c1:2579:64cb:e917:d1ce:4f27])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qbrDhDsLkLqASqbrHhTIzl; Thu, 25 Jul 2019 13:24:28 +0200
Subject: Re: [PATCH v2] staging: media: sunxi: Add bool cast to value
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        maxime.ripard@bootlin.com, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
References: <20190722060651.6538-1-nishkadg.linux@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <960d6d68-dff0-1774-8173-b5b1dd0d32f3@xs4all.nl>
Date:   Thu, 25 Jul 2019 13:24:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190722060651.6538-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLx4YLBHUEn8dqW0jvm89k2W2gS8HhdbGSV+CNnBVPSVEv89oOd4fAvMAcxKxp+mp1+XOgGDcWUuNfxXHQsSHc6H/RWmuF4f3xMi0ki/GDVu8lhI+Yt0
 3V6KPrjO3eopSlnMl8A8vHRtenHxvzKqKK22VedvJ4qBX8xePwtODq8PsnbLHBFgQ0hEEBt4TDAJrhWrFwnfBNasiJx1aN+XUMGuRemTLTy6yUrTEKCagqxM
 IgzAgghHC2mKYj9hb33X7JW0I7uuJRmrNiwwJQla1RhPKaqdljstPBrtpn0VRhhVvjMAJCWWhYmR4323ktduuLK5bhaEfaXsNrEDC++NojkS2PnJTQihQcr6
 Cq8vooBLM3fARSl0GulZpv7zl07PHY+FXbxkuhicL/R5zJ7sj1QpqamjuY0Lk4lX9cHXVaakpstPOZrHoTmQGL09syJ9yen1jnOr8iQ7pdrmR52H09wm08et
 y16yofHaB2SOEtQWo6Mkr4QN9qdKN3bKQzvfO4d4Ka9vryrQurIgvBkrziiLndgvWoavkQEsZ+G3/bg9ILZvfLsCfMEL3OoDVzJ+3fDRSNwGL5jjQyXzmAXJ
 UGw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/22/19 8:06 AM, Nishka Dasgupta wrote:
> Typecast as bool the return value of cedrus_find_format in
> cedrus_check_format as the return value of cedrus_check_format is always
> treated like a boolean value.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
> Changes in v2:
> - Add !! to the returned pointer to ensure that the return value is
>   always either true or false, and never a non-zero value other than
>   true.
> 
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index e2b530b1a956..b731745f21f8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -86,7 +86,7 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
>  static bool cedrus_check_format(u32 pixelformat, u32 directions,
>  				unsigned int capabilities)
>  {
> -	return cedrus_find_format(pixelformat, directions, capabilities);
> +	return !!(bool)cedrus_find_format(pixelformat, directions, capabilities);

Why not write:

	return cedrus_find_format(pixelformat, directions, capabilities) != NULL;

That way coccinelle should be happy, and it is clear that cedrus_find_format
returns a pointer and that we return true if it is non-NULL.

Regards,

	Hans

>  }
>  
>  static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
> 

