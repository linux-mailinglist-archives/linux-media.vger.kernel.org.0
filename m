Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA485F6AE2
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 17:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbiJFPns (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 11:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231863AbiJFPnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 11:43:35 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85E3C149D
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 08:43:32 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id s2so3435440edd.2
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=stEbLWnXww37Yj0WLFn4pZj8xwBQXA4WUz8umMlZHhs=;
        b=QDINWQuMZNV9SOsspMp/dfIcMkPqBVJPtQ1fvfk7S+YOf+OBxZeZdi74fSZ+dv74n6
         8htruoY4zuSrKvqTrGl87xXBesxKwXc2aDGNvX0XvBV2Gr5XsUhfhk3UUsMuSOTTPGU8
         Kks1789FZfU3xn85YBXqPA63YCZNZtWkT3aTZwrLPHPyBuO+ch3AAbVOBwTFHOzy6qXn
         syGszCsr7gzSqPWMQugX30nB8hsddnrSI7taVLa7x8P2irHlOucb9zGUOdHse+Gx+Zc3
         SwK9xnNjQqf8+Xf3C9KkivavcFQD6GZTrEfcUq9mbh50sv62cQoCLDPg/3W26onLsoCW
         x1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stEbLWnXww37Yj0WLFn4pZj8xwBQXA4WUz8umMlZHhs=;
        b=TGrFOtmh6PLJryOW1TFAyh5DaWhOUYrmU9xtZQOTO9XjZ5X2jR+ROxmt2dlME2SGTY
         Oan/bal8WrkDB5oawUJuw0WBRzi9fAhErm0XK/2ZYFqbCRIHkgdyuhObMNZa3J9idbob
         tIUtG8MnsV3EmeFQtjXQdYE5jW+O1leLV/nyL5tbUI+uh7oiJeo6BBqncKg50ormSt9T
         QdRnZZp2tEJCq+Rpfp+3LuLnV344dcet9fZvdleeZOVuHNnheS7oIEOKB8C5008JEbem
         faUcjF8CMiRCBUjhNh4zGW6GGyUq7n/kI2pDA171G/Hzvvtcw549czFZh3mrdYLqDFXy
         ed4w==
X-Gm-Message-State: ACrzQf3JjoteObNGvQjnqWq35FhlXV0CA6EtsxvM6svYRJpC4f4MTC7v
        xfAxyR9Pe7iJKBc4QzBBxSZGscii+kdUryCsYdqlTQ==
X-Google-Smtp-Source: AMsMyM6gTiviabHwKDZSkH8y3iErBcGsS+GrBNSnhABvyo3h7hgJuawu0uJ3G1vOO80OpPkLRt1z804SjQWSMQhxAvk=
X-Received: by 2002:a05:6402:520e:b0:459:c11c:ea38 with SMTP id
 s14-20020a056402520e00b00459c11cea38mr348975edd.345.1665071010690; Thu, 06
 Oct 2022 08:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-9-jacopo@jmondi.org>
In-Reply-To: <20221005190613.394277-9-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 16:43:14 +0100
Message-ID: <CAPY8ntDk1WqDwFRg9jt01tEvpGwpxiCRkP7pw4H6Qwxxz3Fgng@mail.gmail.com>
Subject: Re: [PATCH 08/10] media: ar0521: Setup controls at s_stream time
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Setup all the registered controls at s_stream(1) time instead of
> manually configure gains.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Ah, lovely. I'm surprised it doesn't error out with no s_ctrl handler
for link_freq when r/w though.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ar0521.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 26bb1b8f7453..d46a51332964 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -460,7 +460,7 @@ static int ar0521_set_stream(struct ar0521_dev *sensor, bool on)
>                 if (ret)
>                         goto err;
>
> -               ret = ar0521_set_gains(sensor);
> +               ret =  __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
>                 if (ret)
>                         goto err;
>
> --
> 2.37.3
>
