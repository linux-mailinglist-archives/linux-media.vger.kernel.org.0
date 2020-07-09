Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5582F219B56
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 10:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgGIInO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 04:43:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51536 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgGIInO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 04:43:14 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC265289;
        Thu,  9 Jul 2020 10:43:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594284191;
        bh=/VoKmI/DiBrtBJiaTvk1IXoOMWdrKG9Lxw4goxipK6Y=;
        h=Subject:To:References:From:Reply-To:Date:In-Reply-To:From;
        b=ETwEaFeE4nHWgv3yOt5Q4Pa0ZjXfQiEIGfmQS9Emqs3f7vG43WziN/s4rARiu64pZ
         C3Fnbv0mo3jdm2Q6gyqO61f9Yhe/WHPSbcjWCYy8RC1pRQIO7EXtbwr/mPrNreK2WG
         JDQKA6ntcmaqms3+Qz6DTJ55pyTiy+9nCxJn6Wbc=
Subject: Re: [PATCH] TI DAVINCI SERIES MEDIA DRIVER: Replace HTTP links with
 HTTPS ones
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        prabhakar.csengg@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200709072814.24218-1-grandmaster@al2klimov.de>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <dab6510d-4b3a-7439-bff0-e927ddd2622f@ideasonboard.com>
Date:   Thu, 9 Jul 2020 09:43:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200709072814.24218-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On 09/07/2020 08:28, Alexander A. Klimov wrote:
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

This non-https link redirects to the https link already with a 301, so
the content is expectedly the same.

I doubt many people click on these links, as I guess they're usually
rendered as text so it depends on the editor, I expect as much as
anything it's 'advertising' or confirmation of the copyright notice.

But still, I've just clicked on them ... and I think this is a
reasonable step.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely or at least not HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
> 
>  drivers/media/platform/davinci/vpbe_display.c | 2 +-
>  drivers/media/platform/davinci/vpif.c         | 2 +-
>  drivers/media/platform/davinci/vpif.h         | 2 +-
>  drivers/media/platform/davinci/vpif_display.c | 2 +-
>  drivers/media/platform/davinci/vpif_display.h | 2 +-
>  include/media/davinci/vpbe_display.h          | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
> index 7ab13eb7527d..d19bad997f30 100644
> --- a/drivers/media/platform/davinci/vpbe_display.c
> +++ b/drivers/media/platform/davinci/vpbe_display.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> diff --git a/drivers/media/platform/davinci/vpif.c b/drivers/media/platform/davinci/vpif.c
> index df66461f5d4f..e9794c9fc7fe 100644
> --- a/drivers/media/platform/davinci/vpif.c
> +++ b/drivers/media/platform/davinci/vpif.c
> @@ -5,7 +5,7 @@
>   * The hardware supports SDTV, HDTV formats, raw data capture.
>   * Currently, the driver supports NTSC and PAL standards.
>   *
> - * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
>   *
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License as
> diff --git a/drivers/media/platform/davinci/vpif.h b/drivers/media/platform/davinci/vpif.h
> index 2466c7c77deb..c6d1d890478a 100644
> --- a/drivers/media/platform/davinci/vpif.h
> +++ b/drivers/media/platform/davinci/vpif.h
> @@ -1,7 +1,7 @@
>  /*
>   * VPIF header file
>   *
> - * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
>   *
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License as
> diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
> index 7d55fd45240e..46afc029138f 100644
> --- a/drivers/media/platform/davinci/vpif_display.c
> +++ b/drivers/media/platform/davinci/vpif_display.c
> @@ -2,7 +2,7 @@
>   * vpif-display - VPIF display driver
>   * Display driver for TI DaVinci VPIF
>   *
> - * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
>   * Copyright (C) 2014 Lad, Prabhakar <prabhakar.csengg@gmail.com>
>   *
>   * This program is free software; you can redistribute it and/or
> diff --git a/drivers/media/platform/davinci/vpif_display.h b/drivers/media/platform/davinci/vpif_display.h
> index af2765fdcea8..f731a65eefd6 100644
> --- a/drivers/media/platform/davinci/vpif_display.h
> +++ b/drivers/media/platform/davinci/vpif_display.h
> @@ -1,7 +1,7 @@
>  /*
>   * VPIF display header file
>   *
> - * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
>   *
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License as
> diff --git a/include/media/davinci/vpbe_display.h b/include/media/davinci/vpbe_display.h
> index 56d05a855140..6d2a93740130 100644
> --- a/include/media/davinci/vpbe_display.h
> +++ b/include/media/davinci/vpbe_display.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  #ifndef VPBE_DISPLAY_H
>  #define VPBE_DISPLAY_H
> 

