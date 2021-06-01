Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1183F397379
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 14:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhFAMsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 08:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbhFAMsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 08:48:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2D6C061574;
        Tue,  1 Jun 2021 05:46:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3C0F88C;
        Tue,  1 Jun 2021 14:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622551613;
        bh=pEVvmyFStsOwrTtf+TJW7eOTlI/2Bu2ObexnAPsjg1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LVH9e96ZzxEBe9OxvsKUkdLcT1KcuKyzPyLZxa9IR7alvgqTs5TVS1G//vlZ9I9Ym
         sBArtMpicHvJcJss2Yhm89DYJZh78gqirWFfsHX6xKOgq9uNsFA/j9+41eJl0g0Va7
         25N8BfrhGtz4PB8PsCDN1AA/q2W875ZIxxceUzbE=
Date:   Tue, 1 Jun 2021 15:46:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     trix@redhat.com
Cc:     rmfrfs@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx: imx7_mipi_csis: convert some switch cases to
 the default
Message-ID: <YLYsMifcjA2c0eDN@pendragon.ideasonboard.com>
References: <20210531174300.2594109-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210531174300.2594109-1-trix@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tom,

Thank you for the patch.

On Mon, May 31, 2021 at 10:43:00AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Static analysis reports this false positive
> imx7-mipi-csis.c:1027:2: warning: 4th function call argument is
>   an uninitialized value
> 
> The variable 'align' is falsely reported as uninitialized.
> Even though all the cases are covered in the
> 	switch (csis_fmt->width % 8) {
> 
> Because there is no default case, it is reported as uninialized.
> 
> Improve the switch by converting the most numerous set of cases
> to the default and silence the false positive.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index d573f3475d28..330f283030ec 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -1016,10 +1016,8 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  	case 6:
>  		align = 2;
>  		break;
> -	case 1:
> -	case 3:
> -	case 5:
> -	case 7:
> +	default:
> +		/* 1, 3, 5, 7 */
>  		align = 3;
>  		break;
>  	}

-- 
Regards,

Laurent Pinchart
