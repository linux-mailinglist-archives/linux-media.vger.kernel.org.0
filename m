Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2854346D34F
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 13:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbhLHMdm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 8 Dec 2021 07:33:42 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:40676 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbhLHMdl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Dec 2021 07:33:41 -0500
Received: by mail-ua1-f54.google.com with SMTP id y5so4361302ual.7;
        Wed, 08 Dec 2021 04:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/aTemD9/Z9Av+zCPQyZ+ifiA1+s89IMO21tmv6lvi4E=;
        b=XtFC53XPAUhrv8WaF0xcnE8tO7xW+i2rA2HrlPQPlL25pu78ENJ8t1nziJGly0obYP
         H4m4kJlao1sw1W4kp+9Wsm2NBgubJXahmiBhyohq42+1rzrozUJY5maaCqGfYdyjsc3y
         FGwWLUpJXZClYhOCtU5336C9iz+1aUsza8Ev2Om67JegRFcLKQrmLAAuBZuUi9Nb5en2
         SVhM4BWJHp0u0mjN+9NzOEV2540+UCDxbxBQ4oACEbplm0lE6yNp7ZceHLWujfgsboqA
         fBG5kPbiYam3bwsBaGwxtlTzcfOPiZ9pURcjuRn5GgFFxDi6IQwPl7wVNwOK3ZcmaF65
         kAEA==
X-Gm-Message-State: AOAM532f2Hgl4YBllXSnlq517yW/iukrR+SjKh2M4iGtLIQqaDOKXTzN
        TWE38ITwXqpDwbfT/yNZxdHoSu+9TsRvJA==
X-Google-Smtp-Source: ABdhPJwtKeSerB07Gk+qX0FTkMlYOf/jGx4kp+2DrpUPuPtJv19HEd9RDL20ebvrRtqlG6dp63G+Kg==
X-Received: by 2002:ab0:2041:: with SMTP id g1mr8069406ual.131.1638966609253;
        Wed, 08 Dec 2021 04:30:09 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id b11sm1608944vsp.6.2021.12.08.04.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 04:30:09 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id r15so4402626uao.3;
        Wed, 08 Dec 2021 04:30:08 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr8248468uar.14.1638966608547;
 Wed, 08 Dec 2021 04:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20211208121756.3051565-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20211208121756.3051565-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Dec 2021 13:29:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+ogLKoyinu1taCm1BjmiKo8bnFh3Z+Df18jonKT6nKA@mail.gmail.com>
Message-ID: <CAMuHMdX+ogLKoyinu1taCm1BjmiKo8bnFh3Z+Df18jonKT6nKA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: max9286: Use dev_err_probe() helper
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Dec 8, 2021 at 1:18 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Use the dev_err_probe() helper, instead of open-coding the same
> operation. While at it retrieve the error once and use it from
> 'ret' instead of retrieving it twice.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>

I guess that's too much credit for me ;-)

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1295,11 +1295,9 @@ static int max9286_probe(struct i2c_client *client)
>
>         priv->regulator = devm_regulator_get(&client->dev, "poc");
>         if (IS_ERR(priv->regulator)) {
> -               if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Unable to get PoC regulator (%ld)\n",
> -                               PTR_ERR(priv->regulator));
>                 ret = PTR_ERR(priv->regulator);
> +               dev_err_probe(&client->dev, ret,
> +                             "Unable to get PoC regulator\n");

You can even combine these two, as dev_err_probe() was designed
to streamline error handling, and thus returns the error again:

    ret = dev_err_probe(&client->dev, PTR_ERR(priv->regulator),
                        "Unable to get PoC regulator\n");

>                 goto err_powerdown;
>         }

Regardless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
