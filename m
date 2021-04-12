Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8564E35C7D2
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 15:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241917AbhDLNlk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 09:41:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54888 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238881AbhDLNli (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 09:41:38 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61F3E3F0;
        Mon, 12 Apr 2021 15:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618234879;
        bh=Yw/wZQVEH1BcaYF1r7FYIcCDtqB03Gdz7x1hGwb4OBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pj+KdwAXg+afY5joKq2F6Q++4UJPoOO1d3uSkNTq/hIQb6tt0ZWWimHUlfGLQ8Bms
         TE4w5kqakddjtmc9wgLPmV3PDAMqb2cGf/TW6rbRf58UUW3LzNJOqWVle5GyTyV1SI
         dKAAPb31/3clW70FJNi6SSOt3h6+8qWHUjV2Wx7c=
Date:   Mon, 12 Apr 2021 16:40:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel][PATCH 1/4 v2] staging: media: omap4iss:
 Replace macro function by static inline function in file iss.c
Message-ID: <YHRNzq3h3LEp3Dgc@pendragon.ideasonboard.com>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
 <e302566a3d9e5180ab27eb2c2824fd1b678a6d99.1618231618.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e302566a3d9e5180ab27eb2c2824fd1b678a6d99.1618231618.git.alinesantanacordeiro@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aline,

While testing on a device isn't a requirement as you can't be expected
to have the necessary hardware, changes are expected to be at least
compile-tested before being submitted.

On Mon, Apr 12, 2021 at 09:57:09AM -0300, Aline Santana Cordeiro wrote:
> Replace macro function by static inline function.
> Issue suggested by Julia.
> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
> 
> Changes since v1:
>  - Insert file path in commit message
> 
>  drivers/staging/media/omap4iss/iss.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index c89f268a..3bbc39e 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -27,22 +27,24 @@
>  #include "iss.h"
>  #include "iss_regs.h"
>  
> -#define ISS_PRINT_REGISTER(iss, name)\
> -	dev_dbg(iss->dev, "###ISS " #name "=0x%08x\n", \
> -		iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_##name))
> +static inline iss_print_register(iss, name)
> +{
> +	dev_dbg(iss->dev, "###ISS " #name "=0x%08x\n",
> +		iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_##name));
> +}
>  
>  static void iss_print_status(struct iss_device *iss)
>  {
>  	dev_dbg(iss->dev, "-------------ISS HL Register dump-------------\n");
>  
> -	ISS_PRINT_REGISTER(iss, HL_REVISION);
> -	ISS_PRINT_REGISTER(iss, HL_SYSCONFIG);
> -	ISS_PRINT_REGISTER(iss, HL_IRQSTATUS(5));
> -	ISS_PRINT_REGISTER(iss, HL_IRQENABLE_SET(5));
> -	ISS_PRINT_REGISTER(iss, HL_IRQENABLE_CLR(5));
> -	ISS_PRINT_REGISTER(iss, CTRL);
> -	ISS_PRINT_REGISTER(iss, CLKCTRL);
> -	ISS_PRINT_REGISTER(iss, CLKSTAT);
> +	iss_print_register(iss, HL_REVISION);
> +	iss_print_register(iss, HL_SYSCONFIG);
> +	iss_print_register(iss, HL_IRQSTATUS(5));
> +	iss_print_register(iss, HL_IRQENABLE_SET(5));
> +	iss_print_register(iss, HL_IRQENABLE_CLR(5));
> +	iss_print_register(iss, CTRL);
> +	iss_print_register(iss, CLKCTRL);
> +	iss_print_register(iss, CLKSTAT);
>  
>  	dev_dbg(iss->dev, "-----------------------------------------------\n");
>  }

-- 
Regards,

Laurent Pinchart
