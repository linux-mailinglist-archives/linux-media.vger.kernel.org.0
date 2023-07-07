Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C495374B51F
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 18:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjGGQa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 12:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjGGQa4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 12:30:56 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F528AA
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 09:30:55 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so5495600a12.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jul 2023 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688747454; x=1691339454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dqgukRfqrFrhrt1p1hUdzd1Rj1sugUmY3uUdgFTwZOY=;
        b=etPCTjfls+4IfZLCht+lyZtnRqYY1ZPc8bQDSs2g8aEtBrTuMuM6gi+pA44H/bPh/F
         fksz6HwUESJeqAvF6KUcN/0m6gaVh+f2n46Z0x6nqxUoEnjuKGDBUCtG1xE6Aqf1inPj
         9c2X5fQwKMMMSCFavFS1B8N87d05vDGn100cBU7kZ2dzYjX6pHYGzOI4IV6xXQcNHE0p
         YtDF1RlSjVTt+XSCdE5lSmUCHjhSVX+XP7sZg7vidvlmtWXqxnJK70KoAeYORT53gZws
         jy/Mbp0iflX8NynFr2cN6C1ERnhRQr3W9rpxQuXeOTw74s4kor6Z8zG1v2WuPtH2s7Tg
         PDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688747454; x=1691339454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqgukRfqrFrhrt1p1hUdzd1Rj1sugUmY3uUdgFTwZOY=;
        b=D3dfABYBYSGpBPk0CN9dBVxJul9MUy68Derm5ue7s6ggREr548iNrBymJ+Lj3MKbQA
         NFX244VBXUtCynngEvqCxMaafR6h31WEEkdh7+axRpSp3gvOlhoDFY/EtkpRvuLDM+SR
         I4AzRp1BwyGRP60ieeZBD3VklHhg1v//q1CeCnMSh1fgaB3ZZSyQ5elfI7Ckk0/nCnwW
         i9dwyqBwA4CV6KGaNj1bKLs1TS3Nz28uPt9UWoezrywjJI2NR+38n4j0vgy+KPUZ/Gfw
         2ERCzpS+xI8pWiKeca7LG4st5vDDJ00e+hk/ljMgGatgxK+WkD6txzxZ80GfXNYGWNRJ
         u6+Q==
X-Gm-Message-State: ABy/qLZ+dGF4v7MMR2nUGsyqPEryFMHXQl+RSeXb1nrs+VYWaL7PkEm9
        bfKlj89OlBsjCtllMmseaJc=
X-Google-Smtp-Source: APBJJlGup1Z/8iiJKNAivMYYr4qYhIPzez7pgXt6+fQsjEIjjHBIvsAwSKY71jneKLo2lPgUTTfVSw==
X-Received: by 2002:a17:906:530b:b0:973:84b0:b077 with SMTP id h11-20020a170906530b00b0097384b0b077mr5466832ejo.33.1688747453619;
        Fri, 07 Jul 2023 09:30:53 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-59-106.cust.vodafonedsl.it. [188.217.59.106])
        by smtp.gmail.com with ESMTPSA id o26-20020a17090608da00b00992f1a3b9bfsm2390485eje.170.2023.07.07.09.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 09:30:53 -0700 (PDT)
Date:   Fri, 7 Jul 2023 18:30:51 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: Re: [PATCH 1/5] media: i2c: imx219: Rename mbus codes array
Message-ID: <ZKg9u04hvr+3qTia@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230704103611.149631-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-2-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704104057.149837-2-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Jul 04, 2023 at 12:40:53PM +0200, Jacopo Mondi wrote:
> From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> 
> The imx219 is using the name codes[] for the mbus format which is not
> easy to read and know what it means. Change it to imx219_mbus_formats.

What about:

The imx219 is using the name "codes" for the mbus formats array.
This is not easy to read and know what it means. Change it to
"imx219_mbus_formats"

> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f9471c9e3a74..998a673a4290 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -345,7 +345,7 @@ static const char * const imx219_supply_name[] = {
>   * - v flip
>   * - h&v flips
>   */
> -static const u32 codes[] = {
> +static const u32 imx219_mbus_formats[] = {
>  	MEDIA_BUS_FMT_SRGGB10_1X10,
>  	MEDIA_BUS_FMT_SGRBG10_1X10,
>  	MEDIA_BUS_FMT_SGBRG10_1X10,
> @@ -578,17 +578,17 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
>  
>  	lockdep_assert_held(&imx219->mutex);
>  
> -	for (i = 0; i < ARRAY_SIZE(codes); i++)
> -		if (codes[i] == code)
> +	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
> +		if (imx219_mbus_formats[i] == code)
>  			break;
>  
> -	if (i >= ARRAY_SIZE(codes))
> +	if (i >= ARRAY_SIZE(imx219_mbus_formats))
>  		i = 0;
>  
>  	i = (i & ~3) | (imx219->vflip->val ? 2 : 0) |
>  	    (imx219->hflip->val ? 1 : 0);
>  
> -	return codes[i];
> +	return imx219_mbus_formats[i];
>  }
>  
>  static void imx219_set_default_format(struct imx219 *imx219)
> @@ -731,11 +731,11 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>  {
>  	struct imx219 *imx219 = to_imx219(sd);
>  
> -	if (code->index >= (ARRAY_SIZE(codes) / 4))
> +	if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
>  		return -EINVAL;
>  
>  	mutex_lock(&imx219->mutex);
> -	code->code = imx219_get_format_code(imx219, codes[code->index * 4]);
> +	code->code = imx219_get_format_code(imx219, imx219_mbus_formats[code->index * 4]);
>  	mutex_unlock(&imx219->mutex);
>  
>  	return 0;
> @@ -831,14 +831,14 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  
>  	mutex_lock(&imx219->mutex);
>  
> -	for (i = 0; i < ARRAY_SIZE(codes); i++)
> -		if (codes[i] == fmt->format.code)
> +	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
> +		if (imx219_mbus_formats[i] == fmt->format.code)
>  			break;
> -	if (i >= ARRAY_SIZE(codes))
> +	if (i >= ARRAY_SIZE(imx219_mbus_formats))
>  		i = 0;
>  
>  	/* Bayer order varies with flips */
> -	fmt->format.code = imx219_get_format_code(imx219, codes[i]);
> +	fmt->format.code = imx219_get_format_code(imx219, imx219_mbus_formats[i]);
>  
>  	mode = v4l2_find_nearest_size(supported_modes,
>  				      ARRAY_SIZE(supported_modes),
> -- 
> 2.40.1

Make sense for use "imx219_mbus_formats" instead of generic name "codes".
Looks good to me. Thanks for the patch.

Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Regards,
Tommaso

> 
