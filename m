Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B25233159
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 13:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgG3L7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 07:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbgG3L7n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 07:59:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6524FC061794;
        Thu, 30 Jul 2020 04:59:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0408A9B1;
        Thu, 30 Jul 2020 13:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596110362;
        bh=zT8lcQuX4zUHQxbmkWxc2aN81+OzFVRMs861l8v28Qw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QjsUtwJkDecBgHFGWNCQ6miqWtK4y1jqlYCCv1/gNviJB3D2+t6UCU+odNwVjjj6A
         o8+jAnC6kRgWayW56NA4ofS7wubYkvMhEhwJbhEYB+fwHBrQoCfUFCPNdF7uxIG8eR
         IZHZcN+/4mxZ/qNjdPugJJ2bH2Ikw8+Bl4zhY+j0=
Date:   Thu, 30 Jul 2020 14:59:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Replace HTTP links with HTTPS ones
Message-ID: <20200730115910.GA6107@pendragon.ideasonboard.com>
References: <20200713162246.35758-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200713162246.35758-1-grandmaster@al2klimov.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

On Mon, Jul 13, 2020 at 06:22:46PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree, for v5.10.

> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely or at least not just HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 431d86e1c94b..5676dc7bc319 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -284,7 +284,7 @@ void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
>  		return;
>  
>  	/* Convert the fraction to a simple continued fraction. See
> -	 * http://mathforum.org/dr.math/faq/faq.fractions.html
> +	 * https://mathforum.org/dr.math/faq/faq.fractions.html
>  	 * Stop if the current term is bigger than or equal to the given
>  	 * threshold.
>  	 */

-- 
Regards,

Laurent Pinchart
