Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F189E376C
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 18:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407767AbfJXQIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 12:08:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60810 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407736AbfJXQIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 12:08:02 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2799F97D;
        Thu, 24 Oct 2019 18:07:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571933279;
        bh=E0u5EGQJgZFUyiN+Ew4wg2qtOTUGASZhDXrztK1WyO0=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nK/l8OmNlr+RjJ4eWy01G5S9BFuLZsObwsMCONjJKC/kaZkBY8z7jPRQm0BBcch4U
         bbWW+D0tQbS7hYJZWZ8vClhZJltzm7iIcHofp0suThr/cj5SjPy5nxjZW+W+rIKSyI
         //QU+xHQ3S03d+JQsooZ7EbvQynLp3yL1mITvn6M=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: fdp1: Fix R-Car M3-N naming in debug message
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20191024130916.16444-1-geert+renesas@glider.be>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <05a62983-5132-0fcb-2e8e-70b95d44730f@ideasonboard.com>
Date:   Thu, 24 Oct 2019 17:07:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191024130916.16444-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 24/10/2019 14:09, Geert Uytterhoeven wrote:
> The official name is "R-Car M3-N", not "R-Car M3N".
> 
> Fixes: 4e8c120de9268fc2 ("media: fdp1: Support M3N and E3 platforms")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/media/platform/rcar_fdp1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> index cb93a13e1777a53e..97bed45360f088d0 100644
> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -2369,7 +2369,7 @@ static int fdp1_probe(struct platform_device *pdev)
>  		dprintk(fdp1, "FDP1 Version R-Car H3\n");
>  		break;
>  	case FD1_IP_M3N:

Should the FD1_IP_M3N naming also be updated accordingly?
I guess that's not so important.

Either way, up to you.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> -		dprintk(fdp1, "FDP1 Version R-Car M3N\n");
> +		dprintk(fdp1, "FDP1 Version R-Car M3-N\n");
>  		break;
>  	case FD1_IP_E3:
>  		dprintk(fdp1, "FDP1 Version R-Car E3\n");
> 

