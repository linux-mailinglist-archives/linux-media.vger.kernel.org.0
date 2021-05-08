Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991C63771E8
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 14:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhEHMzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 08:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhEHMzW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 08:55:22 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB58C061574;
        Sat,  8 May 2021 05:54:07 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id l7so15480551ybf.8;
        Sat, 08 May 2021 05:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aXVXrFw3OGzh7nVtDJeFdDpq7b/QcyboCBGX47RVf78=;
        b=aekVGnd449/i9yVzo2TgnVAsOPnB78JLrCiAFCnk9wDt3RwY1XU3/p+x9Y5QN9zCE8
         qkfWF1ownY2HwvYl4h0hrkJ6D2fnSaiM7zvCJ6MrI+2HAZYsLoEjN+3re6mxrz2aeSUD
         uv9Uz3l8feQ9VJXV6CdCYgppOBphHZG1FesPXGYK7O/STINXgZjQSal7mxumay+9UOhA
         DYVOfPARzFyDYfi/lYiDY13g0mg01I+2GFtLo9+KS7Dtwu0+h2+V52czH5+jGCvNm9C8
         2iNsrf+LbpBM4IJZgz+qYiKhVaL3Z24ST0S6XyciqFtGZR4ZwXLaCStsGVPcC2D4KhYp
         M/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aXVXrFw3OGzh7nVtDJeFdDpq7b/QcyboCBGX47RVf78=;
        b=Pd2hpZO2j9Wr9jqYlUimdh7yA0i5uS8D+RPJu0NSQELAO+XGkkFQA4AFjSyX5V5747
         uMyx0pafLavIB54B8xJuTji0our2MC89Wh8r4fHoKjGeH0a7OK/F4juQfDpg3OxtvPs8
         jbGWmq8EuO/9squ9wJIJOYCTNlIRZuWZkADVrSm74J3jsFM4hSUIrzNh04rm+uCsezFR
         zARaVFfRG8uq3VHbXtNldQYGe1qZfr03Z5Vm9s1emYXrRIohWsYU4JsyObmguaEt13Q3
         We+E4y28y9AF39/lwUeMYPL/EaZE8Sa/4p/XtRpJEITaYZlZAANP8rD9+LC5vSgbaJ2W
         f9wg==
X-Gm-Message-State: AOAM532l8mlBFow83qXfs5f3bNvG3T5tX8jOnpqL0GLm4V2hBhJ+fN5d
        0YRxOW2DBi6zTwem9XOw15I+EIFdKFf0bjynQ9vljuJQ9nllmw==
X-Google-Smtp-Source: ABdhPJyb/sC0ao9kv47LEMxG2PnSQdrq895Z/M3G/4emGSqWcKLCKYdyG3tUt5Ul/WZ46VKYX+Qcknk6SLiQmFn5GnU=
X-Received: by 2002:a25:5741:: with SMTP id l62mr19697754ybb.119.1620478447017;
 Sat, 08 May 2021 05:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <d995e27db003a26e5b5eb53b0f40b55f8015d873.1620245794.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d995e27db003a26e5b5eb53b0f40b55f8015d873.1620245794.git.christophe.jaillet@wanadoo.fr>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 8 May 2021 13:53:41 +0100
Message-ID: <CA+V-a8sd7GYGWqvDQX4Zc1Z-t+L1oSSmYUpHrVkB0-6mqVhnBA@mail.gmail.com>
Subject: Re: [PATCH V2] media: i2c: ov2659: Fix an error message
To:     christophe.jaillet@wanadoo.fr
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benoit Parrot <bparrot@ti.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christophe,

Thank you for the patch.

On Wed, May 5, 2021 at 9:17 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'ret' is known to be 0 here and printing -ENODEV wouldn't be really
> helpful. So remove it from the error message.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> V2: Remove the Fixes tag. It doesn't really fix something, it just removes
>     a useless information.
>     Just remove ret. No need to add something else.
> ---
>  drivers/media/i2c/ov2659.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 42f64175a6df..6bbbb94fdda4 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1368,8 +1368,7 @@ static int ov2659_detect(struct v4l2_subdev *sd)
>                 id = OV265X_ID(pid, ver);
>                 if (id != OV2659_ID) {
>                         dev_err(&client->dev,
> -                               "Sensor detection failed (%04X, %d)\n",
> -                               id, ret);
> +                               "Sensor detection failed (%04X)\n", id);
>                         ret = -ENODEV;
>                 } else {
>                         dev_info(&client->dev, "Found OV%04X sensor\n", id);
> --
> 2.30.2
>
