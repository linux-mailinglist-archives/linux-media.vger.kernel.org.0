Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB9D2BA952
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 12:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgKTLjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 06:39:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40218 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727344AbgKTLjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 06:39:24 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 318F62A3;
        Fri, 20 Nov 2020 12:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605872362;
        bh=ygioABaHvNHy8Eqt9VTHePCCXvpzema1AioblNO6ADk=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gyHBTcLFcjudRljZGYIFCItEpzezrRy6w07RbLu1rGuvZrKq0O6FtWvbjUusamMRz
         yf1mccKl0mD9MOZeJvhmAI4luKOF/YjORucdI+05mLmRaM3RemedFUiescMYHuTgA5
         H94G7zqWGaZBvCliWWSXoNhjN5tdWuBccC57WkZY=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: i2c: rdacm20: Constify static structs
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201119222248.148845-1-rikard.falkeborn@gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2f26726f-036d-8651-0de6-f8e58e8a6b9d@ideasonboard.com>
Date:   Fri, 20 Nov 2020 11:39:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119222248.148845-1-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rikard,

Thank you for the fix.

On 19/11/2020 22:22, Rikard Falkeborn wrote:
> The only usage of rdacm20_video_ops is to assign it to the video field
> in the v4l2_subdev_ops struct which is a pointer to const,  and the only
> usage of rdacm20_subdev_ops is to pass its address to
> v4l2_i2c_subdev_init() which accepts a pointer to const. Make them const
> to allow the compiler to put them in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 1ed928c4ca70..ac00a6743623 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -435,7 +435,7 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static struct v4l2_subdev_video_ops rdacm20_video_ops = {
> +static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
>  	.s_stream	= rdacm20_s_stream,
>  };
>  
> @@ -445,7 +445,7 @@ static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
>  	.set_fmt	= rdacm20_get_fmt,
>  };
>  
> -static struct v4l2_subdev_ops rdacm20_subdev_ops = {
> +static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
>  	.video		= &rdacm20_video_ops,
>  	.pad		= &rdacm20_subdev_pad_ops,
>  };
> 

