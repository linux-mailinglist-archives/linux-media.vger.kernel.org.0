Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C861F25D7B9
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 13:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729942AbgIDLqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 07:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729753AbgIDLqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 07:46:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B36C061244;
        Fri,  4 Sep 2020 04:46:37 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64833540;
        Fri,  4 Sep 2020 13:46:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599219988;
        bh=mEpk9Az9O3QF+f6NJBCNg2yqlaHjwzn2twitUxjNONk=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=Vv/b8CwgfPST9pZ9orei8wTUSHV7GyfG/LkVsB3V7WbvKN01OsR0A7Fc1TpDrJpVk
         bMQx2BHNAshtmwQLLz4L5c86kO5srlpIzLLRuxMMYHi0XaEtAnGvFRGQhiE0vMVg4A
         zsdgYmEceMubPezYO+jacgX6PNieE59UhxGrxFew=
Subject: Re: [PATCH 21/29] media: atomisp: Avoid comma separated statements
To:     Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
References: <cover.1598331148.git.joe@perches.com>
 <83f22b4ca8b26d301894638c5b8c571ac0004a5e.1598331149.git.joe@perches.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <4d48fbf2-e38d-64da-f91f-5b5618506e43@ideasonboard.com>
Date:   Fri, 4 Sep 2020 12:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <83f22b4ca8b26d301894638c5b8c571ac0004a5e.1598331149.git.joe@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2020 05:56, Joe Perches wrote:
> Use semicolons and braces.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/staging/media/atomisp/pci/atomisp_subdev.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> index 6ba817f15655..52b9fb18c87f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -410,8 +410,10 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
>  
>  		if (atomisp_subdev_format_conversion(isp_sd,
>  						     isp_sd->capture_pad)
> -		    && crop[pad]->width && crop[pad]->height)
> -			crop[pad]->width -= padding_w, crop[pad]->height -= padding_h;
> +		    && crop[pad]->width && crop[pad]->height) {
> +			crop[pad]->width -= padding_w;
> +			crop[pad]->height -= padding_h;
> +		}
>  
>  		/* if subdev type is SOC camera,we do not need to set DVS */
>  		if (isp->inputs[isp_sd->input_curr].type == SOC_CAMERA)
> 

