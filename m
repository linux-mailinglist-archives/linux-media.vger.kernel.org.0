Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45AAA630C45
	for <lists+linux-media@lfdr.de>; Sat, 19 Nov 2022 06:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbiKSFvX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Nov 2022 00:51:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiKSFvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Nov 2022 00:51:22 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DB88F3DC
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 21:51:21 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id z1so4872889qkl.9
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 21:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NYADKFfUKiUYt9pKWaup4dX2bzMkM0QGRAT1eGPqno=;
        b=HGRTPj9vM9aXazwb3zKhh5+QGoBJEBkl1pusx1Vc7lmJdwNDAhsYSgmDY3v3vXUgTG
         9lMhUXG3a+IS/MEsnO8YxC7CA9zTwUsb6p3KhMKRWWWJSoxFynmPwNtImbOxfIld8RGD
         9NO/PTV9QDtfUZV8MMmMF1yBqPDqBWT+QjUkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NYADKFfUKiUYt9pKWaup4dX2bzMkM0QGRAT1eGPqno=;
        b=oAF3zsIwGbB+YgoPI1eKtvS/8A7stEJXrlY883B0GUe6qDdViS2VBkCvjNHhxW+Kr2
         ACuMC176puQsfOqdxsdUzDECjmRw4PcnGMHXvgK48xUpeUzp3fgjQDF+oGOaOklc3Y3t
         CfUBF489URaZWGxwK2vyBl89N/DUXV1z/NEtohS73kMuqr0O51oyJisslwvPEHiDev2G
         w2VWxLLKX45fQG9NztNIM7Q6YfwPUJ1hGmIHr5JOxIn3vXK0ULm8gJ8YcfHl9QP8LSkb
         Y0BicDA+mVBopw333anLxtL/176V90J8YDSKrGrRIZl/kMzovLpx4B96PYvIilJz1/HT
         6ipQ==
X-Gm-Message-State: ANoB5plMly+dYLQr2OuqpRqiSwqeNmgcKdS2yADhxf9rXn9oJUR9Oy2R
        R6wcAr6qPT7AnEYBgE8QGOBqhTwP3GHotGfWahs/OQ==
X-Google-Smtp-Source: AA0mqf5FYax0IOSEUurOeDD3qfk4TmY/gSXgXJaM8ZFQDcp9oSPrmb1hFazcYXxZGD8hJpmsI1FcWXPJBXDOyjmEBcw=
X-Received: by 2002:a05:620a:219c:b0:6fa:cbd7:6103 with SMTP id
 g28-20020a05620a219c00b006facbd76103mr92424qka.235.1668837081109; Fri, 18 Nov
 2022 21:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-391-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-391-uwe@kleine-koenig.org>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Sat, 19 Nov 2022 13:51:09 +0800
Message-ID: <CAJCx=g=7RMZyzmOecGG0F5ctArFa8Qsvyton8+2e1TaQ2gVg=g@mail.gmail.com>
Subject: Re: [PATCH 390/606] media: i2c/video-i2c: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 19, 2022 at 6:47 AM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:
>
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Looks good to me.

Acked-by: Matt Ranostay <matt.ranostay@konsulko.com>

> ---
>  drivers/media/i2c/video-i2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.=
c
> index f15ef2d13059..dddf9827b314 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -757,9 +757,9 @@ static void video_i2c_release(struct video_device *vd=
ev)
>         kfree(data);
>  }
>
> -static int video_i2c_probe(struct i2c_client *client,
> -                            const struct i2c_device_id *id)
> +static int video_i2c_probe(struct i2c_client *client)
>  {
> +       const struct i2c_device_id *id =3D i2c_client_get_device_id(clien=
t);
>         struct video_i2c_data *data;
>         struct v4l2_device *v4l2_dev;
>         struct vb2_queue *queue;
> @@ -959,7 +959,7 @@ static struct i2c_driver video_i2c_driver =3D {
>                 .of_match_table =3D video_i2c_of_match,
>                 .pm     =3D &video_i2c_pm_ops,
>         },
> -       .probe          =3D video_i2c_probe,
> +       .probe_new      =3D video_i2c_probe,
>         .remove         =3D video_i2c_remove,
>         .id_table       =3D video_i2c_id_table,
>  };
> --
> 2.38.1
>
