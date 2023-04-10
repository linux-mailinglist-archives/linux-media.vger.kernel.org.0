Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F76F6DC2DD
	for <lists+linux-media@lfdr.de>; Mon, 10 Apr 2023 05:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjDJDN4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Apr 2023 23:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjDJDNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Apr 2023 23:13:53 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4C730C6
        for <linux-media@vger.kernel.org>; Sun,  9 Apr 2023 20:13:46 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id b23so767630qkn.10
        for <linux-media@vger.kernel.org>; Sun, 09 Apr 2023 20:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1681096426; x=1683688426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntZMy55/xSRNn21X5fqVWQquJJJq/aQ2W9wX/ILyeb8=;
        b=We/zlPuaa3SYC+/fX5BSFNlnzgUbsr1Gg6ULkayZ/xS/v8Vs0BTm6b5vlt4Zb2C1dH
         17b7yAPL1b2bNrRWXHgMUBx38MpmEOVQ4cZjJrHbMrl0Ubg24ajqElFvhyTVs1M/9BDB
         rctP07xaMeu0kh8CZqa30Q6dfPLSH1B+ylOXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681096426; x=1683688426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntZMy55/xSRNn21X5fqVWQquJJJq/aQ2W9wX/ILyeb8=;
        b=Ei/xz33gnLEvzPf0/2G/Qj3RSmc3QFK8xiZvPt/PmgqjgZw1iimuSIyLtKVF34jDJ7
         OMdGujHELKe+I+3VOd7Dlkdx3kr/Af7/yZOzj2z3LbMv5agqxBUMOupHgJVQatxVxO/B
         YDfl/bvkSRdSCsO/f0SyKgJITeSpPhCD68ss1YKPeJ0Q1AOKs+GLDiWRsui4td6be9Ro
         alPAHZSHvYRZe6F1mASufNo/c07Ko5gwFPp1efjtqR+7KwzzQWgkqOMBsysI93WZQIap
         Jr0ylD36Za7VB3IDdh/lCOQ+tJ6svnhyL50Odl2SGep/+7CQPkQZbzpMn4CphcMGQ7aI
         mNYw==
X-Gm-Message-State: AAQBX9dDho/DLHJnWVE1wACjetHp4wm2uAHQfl1Wg2bfYbuehPyIwJE7
        oWpXGeAfsVBkmkwIm3z8StZm+he4q9z3F0vefsf/y8a8GA5Uq/mpJRYB6w==
X-Google-Smtp-Source: AKy350Zjr5nQvJ/lph5fNAEe0swSQUFFph/fm06j5NLpwC5FIRX+xJ+i6lqgl1Rn2EN+OxEd3AaqoyLG3nj7T8ikW0M=
X-Received: by 2002:a05:620a:c46:b0:743:6092:91b4 with SMTP id
 u6-20020a05620a0c4600b00743609291b4mr2936652qki.14.1681096425847; Sun, 09 Apr
 2023 20:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230407150015.79715-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407150015.79715-1-krzysztof.kozlowski@linaro.org>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Sun, 9 Apr 2023 20:13:35 -0700
Message-ID: <CAJCx=gmcRAvkBcBdEUk++rLsdiPbhOYcSkQ2Dk2evR4trFS1Vg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: video: constify pointers to hwmon_channel_info
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 7, 2023 at 8:00=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Statically allocated array of pointed to hwmon_channel_info can be made
> const for safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Matt Ranostay <matt.ranostay@konsulko.com>

>
> ---
>
> This depends on hwmon core patch:
> https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@=
linaro.org/
>
> Therefore I propose this should also go via hwmon tree.
>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> ---
>  drivers/media/i2c/video-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.=
c
> index dddf9827b314..abd472dcd497 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -274,7 +274,7 @@ static const struct hwmon_channel_info amg88xx_temp =
=3D {
>         .config =3D amg88xx_temp_config,
>  };
>
> -static const struct hwmon_channel_info *amg88xx_info[] =3D {
> +static const struct hwmon_channel_info * const amg88xx_info[] =3D {
>         &amg88xx_temp,
>         NULL
>  };
> --
> 2.34.1
>
