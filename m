Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA605444FC
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 09:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239498AbiFIHlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 03:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233962AbiFIHlX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 03:41:23 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB471D329
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 00:41:22 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id q11so15603707oih.10
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 00:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KiAPjrEsNFd4yX3q0IWdylPjwIQ9bp9rb1QnDMoSjX0=;
        b=e0SXW8r9BLGBTe5M1XgVoS1xbYh7M4ty6nznpdj59AJaOMfP/UKMRd5Llu1upYQf+F
         dBhvG/q+EghsMA5U0XRzuI9qQmDK6qeJMusy1l5ErO/scanF+1pFLMAh3wvi5dB9oiAA
         91Xw1Rg/JDip2njgcRfpPKN6LIekqmWElUk4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KiAPjrEsNFd4yX3q0IWdylPjwIQ9bp9rb1QnDMoSjX0=;
        b=KeX/1Ik/LYpwB8az8LZ2g4f+9FR/nTntWKV3j26Z0hV/Jeu4jrppe5bxW+QsaGV/7D
         iSr6/taOEgu1hjoX3Gj+zY8TAEA41R4ha0DNkHOU5O2V9LvaIPGTUyhVpcDNeRRv5lRw
         knQtmWpy/CBprZ9QxAyiYw/GER9IB5Ve+rJQktLBGjs6d9xS6sqxKXgnDsY1HZYRddXs
         iJxmrHXR022MzaXk42eA5R7o7wtlW6+0A/nUMms+wiSST+4av0vpHBKCvQXPPaOxEXY1
         rvzk/sGbH4CwRStdZzu19Z1CFBI8GLQe5wLL/AsnKLYmwYG2pgC6CB0XvaVEyPSCabmC
         bV6w==
X-Gm-Message-State: AOAM530PFEFhaE/87wpp62Eh5ltwT7m4DSzFg5cYRE3ze0EME001k0yr
        RX8G9VOdQzqeArFPwweAzZ1yPgylW6oorA==
X-Google-Smtp-Source: ABdhPJxwFtn+QqDJb07hnaZ5D/koFCjHX68CRsU0zz/mV87s7fEUWwn0eMKwXJ0bK2BZqKUL33uUXQ==
X-Received: by 2002:a05:6808:1691:b0:2f9:4bd7:581e with SMTP id bb17-20020a056808169100b002f94bd7581emr904213oib.144.1654760481935;
        Thu, 09 Jun 2022 00:41:21 -0700 (PDT)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id u9-20020a4aae89000000b0041ba304546csm2900009oon.1.2022.06.09.00.41.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 00:41:20 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id o185so735379oib.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 00:41:20 -0700 (PDT)
X-Received: by 2002:a05:6808:d46:b0:32e:129b:bfb2 with SMTP id
 w6-20020a0568080d4600b0032e129bbfb2mr969397oik.66.1654760480041; Thu, 09 Jun
 2022 00:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220609053631.7210-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220609053631.7210-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 9 Jun 2022 09:41:09 +0200
X-Gmail-Original-Message-ID: <CANiDSCsP3fB4sM61k_fxDWL_n7Nz9Ow8roktNgZROKsWYugC3w@mail.gmail.com>
Message-ID: <CANiDSCsP3fB4sM61k_fxDWL_n7Nz9Ow8roktNgZROKsWYugC3w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Replace broken URL
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 9 Jun 2022 at 07:40, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The link to the web page that explains continued fractions is broken.
> Replace it with a link to the corresponding Wikipedia page.
>
> Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 77ac5716f99d..20d80d810d1f 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -350,7 +350,7 @@ void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
>
>         /*
>          * Convert the fraction to a simple continued fraction. See
> -        * https://mathforum.org/dr.math/faq/faq.fractions.html
> +        * https://en.wikipedia.org/wiki/Continued_fraction
>          * Stop if the current term is bigger than or equal to the given
>          * threshold.
>          */
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
