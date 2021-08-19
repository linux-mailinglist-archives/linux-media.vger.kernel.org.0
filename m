Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 034BC3F2044
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 20:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234161AbhHSS6W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 14:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhHSS6V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 14:58:21 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BACC061756
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 11:57:44 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 17so6755469pgp.4
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 11:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+pL/e3dMN/Ws3i4JncdgQo+mYleTxWxH91pO0PWLJkc=;
        b=W5Ybl1/Syk/AXW6g2eSCB3xLLB5MfQOvtY5dt5n25SxJq9p7g6q9ioGjh1zJ8VHWh0
         5r+nCHLPRhJeckFUGrZj4SI6y3f9+5tK5VXaU9tfT/lflXTkOw9TRnpnahE5qfeRR6ZM
         +Y68Eo8RGtIzf6V7J9T1ALTLH/GE59evROSUKEvKVacK4C7lWRhFwfSOohxH1AUWofAM
         H2vkdSw5080uzdcyXx49mYJ73GOOSq1J6cJ1vos7+65b3jDKbuev7dIgip69Y7Pd9Lho
         Ap+Ur0ZaDMpY2sVHyGvMcYWKfzVt7o3PIX1o+b1lP8COOVg+vxlw9BzsumLOwD6NhYxo
         Ytog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+pL/e3dMN/Ws3i4JncdgQo+mYleTxWxH91pO0PWLJkc=;
        b=r8D/kN5UIuGg5EuKgLrra55UzmCzqZ2mbjlpS+moFYh36pbUDei9YKNnfIUNNJKprJ
         3q4UYAr++FhBj1oRUGoQFZ4AeUcdl0AFUcU7FI0wjPqHai8nu0GsF7bkMK7xQcEAOoWE
         aeadUGKpxCcAXuz9qlI1gYVollTlEkqqWR7ZywPD9DRydCEt8Ih9j8tNDek0O3T4srxb
         oN3m2WpqCPxQCYyAnO9KLbK1NXO1RU8T6UggRXRTLbjVI3UdDtjzQBKef8OLGRkX73qO
         a9KskbNSIk2Zt0ZFQ7osgzjHZZ66+xkDIcsp89WWr7ngvvBMcNcM7VH3XURmPZ1I9xEj
         RNLw==
X-Gm-Message-State: AOAM5324ih/CD44ZG9x1brMRqN/seEc6WxyGUx5dVMY2Qmin+51hAaiP
        27C2T7phFksaOS6hlUJTSEFLjMw60i1f+vYd13EZQg==
X-Google-Smtp-Source: ABdhPJyK71zLy9qNMqrFxbyt2AhbN/GkKlbklmVO5emMKQo+9+ms7vAQuIxMRPlMupAVwRBILrt4KH3LQGBc+iW2gVI=
X-Received: by 2002:a63:db4a:: with SMTP id x10mr1503255pgi.30.1629399464139;
 Thu, 19 Aug 2021 11:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <m3tukc9tiw.fsf@t19.piap.pl>
In-Reply-To: <m3tukc9tiw.fsf@t19.piap.pl>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 19 Aug 2021 11:57:32 -0700
Message-ID: <CAJ+vNU1TbEPy8+9XpVwpHXzPDww31qcCyLvKvsxrcBJqu5L+tQ@mail.gmail.com>
Subject: Re: [PATCH v2] TDA1997x: fix tda1997x_remove()
To:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 29, 2021 at 11:59 PM Krzysztof Ha=C5=82asa <khalasa@piap.pl> wr=
ote:
>
> TDA1997x driver tried to hold two values in a single variable:
> device's "client data" pointer was first set to "sd" in
> v4l2_i2c_subdev_init(), then it was overwritten explicitly
> using dev_set_drvdata() with "state". This caused
> tda1997x_remove() to fail badly.
>
> Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
>
> diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
> index 17be95c0dcb3..fb37918b7fb5 100644
> --- a/drivers/media/i2c/tda1997x.c
> +++ b/drivers/media/i2c/tda1997x.c
> @@ -2490,7 +2490,8 @@ static const struct media_entity_operations tda1997=
x_media_ops =3D {
>  static int tda1997x_pcm_startup(struct snd_pcm_substream *substream,
>                                 struct snd_soc_dai *dai)
>  {
> -       struct tda1997x_state *state =3D snd_soc_dai_get_drvdata(dai);
> +       struct v4l2_subdev *sd =3D snd_soc_dai_get_drvdata(dai);
> +       struct tda1997x_state *state =3D to_state(sd);
>         struct snd_soc_component *component =3D dai->component;
>         struct snd_pcm_runtime *rtd =3D substream->runtime;
>         int rate, err;
> @@ -2799,7 +2800,6 @@ static int tda1997x_probe(struct i2c_client *client=
,
>                         dev_err(&client->dev, "register audio codec faile=
d\n");
>                         goto err_free_media;
>                 }
> -               dev_set_drvdata(&state->client->dev, state);
>                 v4l_info(state->client, "registered audio codec\n");
>         }
>
>

Acked-By: Tim Harvey <tharvey@gateworks.com>

Tim
