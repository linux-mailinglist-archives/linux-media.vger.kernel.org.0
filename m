Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7B7376BB4
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 23:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhEGV1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 17:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhEGV1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 17:27:18 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6310C061761
        for <linux-media@vger.kernel.org>; Fri,  7 May 2021 14:26:16 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id l21so9285991iob.1
        for <linux-media@vger.kernel.org>; Fri, 07 May 2021 14:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=STKiO9AWpCH39xgVyEDHDKCth0FNOrDqcymI0L9meSo=;
        b=WARh69Kczqdp+LQIYesVKz6ExULo6eoSYeI7iIW/Q+OO6F+Zl5OkQNgdNgi3Jt4I8W
         c44rh4RqJQSf3jvfLzNFUDGlTH2SVWAWW5ahnXhhWlUCBacsApAEp8p+PvhlxjwEHKuU
         Gxgcpb8oh5wu5pVWwQi3ILcI5ZRmabNvZkT/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=STKiO9AWpCH39xgVyEDHDKCth0FNOrDqcymI0L9meSo=;
        b=ZhlLEpny/92CQkMwMYNKUYpL7oHq/so7vBpXnWHL16dUZfG9kILTfn8ZD5Wud/8bf0
         wdV7JPq8ya9bzBDOZkbI2vcr54C+MFrHlqRHMPZaUda/Ze+mFTQu+2Yekx4e5HmHQ3r8
         t9IuKEENqoOluMZ1tpvgTV5Rk4syNC+hwVaeq79pKbrLaDU/cRsboS0qmxuTmRqAMz6i
         r3PyLqKSuFxOEe/IqPM7ucqHhoiSMszePvtL80GWw5eVzo6w3SqcfiwGbBOHktUikUFl
         luB8ygFew2mV3mYoXfAoRJD6bCffSDLOGcgZqQMSdUzJauNVuLuXkLoJNmQEtY2z/Wuz
         Oorg==
X-Gm-Message-State: AOAM5302BC7ubG5TRh8TVo3SL/UIJZc31Sx+VeuON5EApmjF7d3aFjgq
        +vfvnxeU7maHbRwvgSYAikyidXCZKlL992wtVkfBVg==
X-Google-Smtp-Source: ABdhPJxEvAGnj2AJE+vvIJ2GGQoEcb6+aGVGE/J72s4ZVmpvaQAUKg/kHn3pW4/LwiH8dI51b1se5InfpZo3BeRnJ8s=
X-Received: by 2002:a6b:cdc6:: with SMTP id d189mr8797891iog.46.1620422776360;
 Fri, 07 May 2021 14:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620314098.git.mchehab+huawei@kernel.org> <f6efc87d96826e3d2067b874e034b5edf73bb593.1620314098.git.mchehab+huawei@kernel.org>
In-Reply-To: <f6efc87d96826e3d2067b874e034b5edf73bb593.1620314098.git.mchehab+huawei@kernel.org>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Fri, 7 May 2021 14:26:05 -0700
Message-ID: <CAJCx=gnP0oK2YqmffH=CfeWQbCcAa4hS_QRXwu49tdG3kW8TWQ@mail.gmail.com>
Subject: Re: [PATCH v5 29/30] media: i2c: video-i2c: use pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 6, 2021 at 8:23 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
>
> Use the new API, in order to cleanup the error check logic.
>

Acked-by: Matt Ranostay <matt.ranostay@konsulko.com>

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/i2c/video-i2c.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 0465832a4090..de12f38f347c 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -286,11 +286,9 @@ static int amg88xx_read(struct device *dev, enum hwmon_sensor_types type,
>         __le16 buf;
>         int tmp;
>
> -       tmp = pm_runtime_get_sync(regmap_get_device(data->regmap));
> -       if (tmp < 0) {
> -               pm_runtime_put_noidle(regmap_get_device(data->regmap));
> +       tmp = pm_runtime_resume_and_get(regmap_get_device(data->regmap));
> +       if (tmp < 0)
>                 return tmp;
> -       }
>
>         tmp = regmap_bulk_read(data->regmap, AMG88XX_REG_TTHL, &buf, 2);
>         pm_runtime_mark_last_busy(regmap_get_device(data->regmap));
> @@ -512,11 +510,9 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
>         if (data->kthread_vid_cap)
>                 return 0;
>
> -       ret = pm_runtime_get_sync(dev);
> -       if (ret < 0) {
> -               pm_runtime_put_noidle(dev);
> +       ret = pm_runtime_resume_and_get(dev);
> +       if (ret < 0)
>                 goto error_del_list;
> -       }
>
>         ret = data->chip->setup(data);
>         if (ret)
> --
> 2.30.2
>
