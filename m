Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7C861A57E4
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2020 01:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730035AbgDKXL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Apr 2020 19:11:56 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40512 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730027AbgDKXLz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Apr 2020 19:11:55 -0400
Received: by mail-ed1-f67.google.com with SMTP id ca21so4762783edb.7
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2020 16:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j1v+KX0c0vN9YAU7uM6QypK1ttzUW4y+OxpBn0M3m3M=;
        b=S6ObeyaX8+WvxpzJV4Jp692S50a2yGFQh+4wOaDJVvpFjCLDrfQyw1CF8MiCC/Hkoo
         Wu2yLceSH7wqAkDDS78Nm3CM0oxEYnNWKTuOzNspGDbKt70Ov+mkz08p+UqjRthkXDQe
         7g+ywrKByPcQX7Z4VirISCe93FyM5bqM/Cd59h6IO7TQQfn6Ng/bQpFzYYyC988z8brO
         WuH/iPJkS3KW0lt7gA2tvIDd86Q1P6r+mGijPNe3owwUZGobTjXFX8e6fSWQ1NTiM+AQ
         JfKFxArsy6uKqudGjR9mqyzywvRJikOWlwke+x9Hw9HGnRe5ql+mTFQAETohZEZ+DwUZ
         T40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j1v+KX0c0vN9YAU7uM6QypK1ttzUW4y+OxpBn0M3m3M=;
        b=Pdv+4KOtzK3eDOMYKDDR+wUuQKjm56BUaBaQouxCxx1ph3ymR19Y8U4g+YQJ/s+17b
         W7flS/1M/s/a06EvbKWQMqoeX3xD5IKJGpWj3Lh3L9kFLF3wWdLsL75DnWzykf52MpIP
         Oi788tEY+MPqa0VkiqtWiCxAV7g/jzAJUTlQ0NqFVuClfcc9jXr2hb2YS90e6QLtYseV
         T1uOrGfFgNXCPK2E7DI7ybOLg+movoCXs1ZUKlTn4qzKz3etOfvhEq4QeIOc8GgI5xUt
         glojZ0VZ9tZB/SapWziYZzRsDnAeebHQbuXA/OUv0lIa2t0/3MVW5CgGXVXp/QkOWpUl
         RqFA==
X-Gm-Message-State: AGi0PuY3ZMhjwCXnWXErwzANNR8LZqg38ziK7CbkNRE4PGIfScEaTgFO
        u46o5XnjyEAyls3/jkPKnIjpxWQQ7q+sOL/1eVTMxg==
X-Google-Smtp-Source: APiQypIQV+O4plRu4V7wCIyi5dxeIfE6EeeB3ExaZvqvAUx/G7mUWqkxg21V766Y2OZi676a3KrW4JA/WqDlJwvAoNw=
X-Received: by 2002:a17:906:2994:: with SMTP id x20mr9475367eje.156.1586646714555;
 Sat, 11 Apr 2020 16:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200410141813.29497-1-colin.king@canonical.com>
In-Reply-To: <20200410141813.29497-1-colin.king@canonical.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 11 Apr 2020 20:11:43 -0300
Message-ID: <CAAEAJfB3D7KxruC2TzeEhyeF8qGHOWUa2hKmqcptub5gciSAxQ@mail.gmail.com>
Subject: Re: [PATCH] media: gspca: remove redundant assignment to variable status
To:     Colin King <colin.king@canonical.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 Apr 2020 at 11:18, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable status is being assigned a value that is never read.
> The assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  drivers/media/usb/gspca/mr97310a.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/usb/gspca/mr97310a.c b/drivers/media/usb/gspca/mr97310a.c
> index 502fc2eaffe0..464aa61cd914 100644
> --- a/drivers/media/usb/gspca/mr97310a.c
> +++ b/drivers/media/usb/gspca/mr97310a.c
> @@ -287,7 +287,6 @@ static int zero_the_pointer(struct gspca_dev *gspca_dev)
>                         return err_code;
>
>                 err_code = cam_get_response16(gspca_dev, 0x21, 0);
> -               status = data[0];
>                 tries++;
>                 if (err_code < 0)
>                         return err_code;
> --
> 2.25.1
>
