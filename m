Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 706F3633EF
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 12:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfGIKHf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 06:07:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36138 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfGIKHf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 06:07:35 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5375556A;
        Tue,  9 Jul 2019 12:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562666853;
        bh=6WYLbK4b5aKyL+tulSD9DGuNpICmc98RY0HDohc7V5U=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=G+E/EkFb1WGFoAU5YkCRIU4M6zgcHiUYfhlumbjLUKQ4dbk5lmSkabA2zvazuK9T+
         upuwZ9LaE45l0Z9jQEO2VPbYF1ZZoLrIRVAxE4+9qaGGhuUra+U/rcmS1wFF9kDD7S
         vBRn9XgQ0y0yU6ucssC2FOawe2UFKhl5uaMi/7es=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: fdp1: Reduce FCP not found message level to debug
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190709095952.5666-1-geert+renesas@glider.be>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <17f28f31-73e1-5170-a0d5-31ad9826defa@ideasonboard.com>
Date:   Tue, 9 Jul 2019 11:07:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190709095952.5666-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 09/07/2019 10:59, Geert Uytterhoeven wrote:
> When support for the IPMMU is not enabled, the FDP driver may be
> probe-deferred multiple times, causing several messages to be printed
> like:
> 
>     rcar_fdp1 fe940000.fdp1: FCP not found (-517)
>     rcar_fdp1 fe944000.fdp1: FCP not found (-517)
> 
> Fix this by reducing the message level to debug level, as is done in the
> VSP1 driver.

Does the lack of IPMMU prevent the FDP1 being loaded entirely?

If so is that a problem for us? (I thought we were able to run without
the IPMMU)


> Fixes: 4710b752e029f3f8 ("[media] v4l: Add Renesas R-Car FDP1 Driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The alternative would be to add an explicit check for -EPROBE_DEFER.
> ---
>  drivers/media/platform/rcar_fdp1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> index 43aae9b6bb20e3e8..c23ec127c2776f51 100644
> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -2306,7 +2306,7 @@ static int fdp1_probe(struct platform_device *pdev)
>  		fdp1->fcp = rcar_fcp_get(fcp_node);
>  		of_node_put(fcp_node);
>  		if (IS_ERR(fdp1->fcp)) {
> -			dev_err(&pdev->dev, "FCP not found (%ld)\n",
> +			dev_dbg(&pdev->dev, "FCP not found (%ld)\n",
>  				PTR_ERR(fdp1->fcp));

Should we be doing something differently here in the event of no IPMMU then?

Otherwise, if the IPMMU has become a hard dependency, should we add it
to the Kconfig dependencies?


>  			return PTR_ERR(fdp1->fcp);
>  		}
> 

--
Regards

Kieran
