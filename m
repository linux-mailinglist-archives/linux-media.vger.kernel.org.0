Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43F5C13538D
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 08:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgAIHMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 02:12:39 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:32930 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgAIHMj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 02:12:39 -0500
Received: by mail-oi1-f193.google.com with SMTP id v140so5057762oie.0;
        Wed, 08 Jan 2020 23:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PtYcl3mEZpFfv+hVyRqACv4DmdKEL3AkiUrvutZDkU4=;
        b=nQJ2jR6M1/7L783AsKTMhfbGHaRibZk4nBEplMejjh6/KywRXGsTzZj8l8TcWD8GSN
         cYJJlK07P7MQq6YyPp3+lstTpLa8irsdleOzWl8qhKyFQsEZsxJiPKT3qXDMuYv9SQQR
         artx3bofnj7nJyv4ir7cz6XihS3/PGEZ4lmga3/haJgkIZ2sRI/1aWzao+7+3QsntTN4
         lghYCj2yYiV9I+xZlaZiL7Q7j3B73gxiiuodchsuzQZ2yX0ygrlbRdtEc/K/VP7O/pEp
         3M3kJZbuCY0bgNuhVkc3osLPwBllwQ5gcUvGMeMp0mhLk1TXUERMXbeq4CgsiOL30anm
         BIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PtYcl3mEZpFfv+hVyRqACv4DmdKEL3AkiUrvutZDkU4=;
        b=VSP+e1IhgWiR10nAbNcFb9jc56Z3MUoP+UwDBaFBJZcKYY/eng8+xnQ4OoV7ydJuSu
         ABv+tUjm9T41iIgG5c529OewnUw8BahdNh0aJEboBMvzYTjxu9iS5syf+v76sE3gbSDO
         5UwjCx5tGGP3maEwn6gOvmn09E7peNTozFqVukNTDyUgStD+v/mq9OY7ZgjutRB4DCyB
         Tuz26ikwse6owYMFwOybxpY+LBwwQKngP6f3H/aCW8Yu0XhOnPUkYcl7/bCGgyBoy7UU
         tnasEXUZNCtGALJG72G7te2qMSkqAnOu6DjHKCSkx9nyEKe40twyYRcYkTuEXdVUifNm
         SJCA==
X-Gm-Message-State: APjAAAWZ7GO3bw8RMgJBcT4O70pOZxH1uUCkniDYH6b2/wrDlIli6Tay
        +jGdE6cBeVqlkHvyYEyyqoi4ac+M5Zre7/Pdavul0Cjt1h0=
X-Google-Smtp-Source: APXvYqw3YWkVF4G8KXcHhZNidvaugeK5/KWOtE8nts6to96ggdiuj6pdORYQUM5EjdxaISH4b0mqhXn1ipHoQvgqYC0=
X-Received: by 2002:a54:401a:: with SMTP id x26mr1950875oie.101.1578553958766;
 Wed, 08 Jan 2020 23:12:38 -0800 (PST)
MIME-Version: 1.0
References: <20200106143251.11684-1-pakki001@umn.edu>
In-Reply-To: <20200106143251.11684-1-pakki001@umn.edu>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 9 Jan 2020 07:12:12 +0000
Message-ID: <CA+V-a8sJEdXm7Ocs-9N2_-F42N4nLrOq=CGvrUh0Hghoh=JhoA@mail.gmail.com>
Subject: Re: [PATCH v3] media: davinci/vpfe_capture.c: Avoid BUG_ON for
 register failure
To:     Aditya Pakki <pakki001@umn.edu>
Cc:     Kangjie Lu <kjlu@umn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 6, 2020 at 2:32 PM Aditya Pakki <pakki001@umn.edu> wrote:
>
> In vpfe_register_ccdc_device(), failure to allocate dev->hw_ops
> fields calls BUG_ON(). This patch returns the error to callers
> instead of crashing. The issue was identified by a static
> analysis tool, written by us.
>
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>

Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> ---
> v2: Fix alignment of checks within the condition, as suggested by
> Hans Verkuil
>
> v1: Fixed the type to a regular variable instead of a pointer,
> also added fixes suggested by Ezequiel Garcia.
> ---
>  drivers/media/platform/davinci/vpfe_capture.c | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
> index 916ed743d716..9b1d9643589b 100644
> --- a/drivers/media/platform/davinci/vpfe_capture.c
> +++ b/drivers/media/platform/davinci/vpfe_capture.c
> @@ -168,21 +168,22 @@ int vpfe_register_ccdc_device(const struct ccdc_hw_device *dev)
>         int ret = 0;
>         printk(KERN_NOTICE "vpfe_register_ccdc_device: %s\n", dev->name);
>
> -       BUG_ON(!dev->hw_ops.open);
> -       BUG_ON(!dev->hw_ops.enable);
> -       BUG_ON(!dev->hw_ops.set_hw_if_params);
> -       BUG_ON(!dev->hw_ops.configure);
> -       BUG_ON(!dev->hw_ops.set_buftype);
> -       BUG_ON(!dev->hw_ops.get_buftype);
> -       BUG_ON(!dev->hw_ops.enum_pix);
> -       BUG_ON(!dev->hw_ops.set_frame_format);
> -       BUG_ON(!dev->hw_ops.get_frame_format);
> -       BUG_ON(!dev->hw_ops.get_pixel_format);
> -       BUG_ON(!dev->hw_ops.set_pixel_format);
> -       BUG_ON(!dev->hw_ops.set_image_window);
> -       BUG_ON(!dev->hw_ops.get_image_window);
> -       BUG_ON(!dev->hw_ops.get_line_length);
> -       BUG_ON(!dev->hw_ops.getfid);
> +       if (!dev->hw_ops.open ||
> +           !dev->hw_ops.enable ||
> +           !dev->hw_ops.set_hw_if_params ||
> +           !dev->hw_ops.configure ||
> +           !dev->hw_ops.set_buftype ||
> +           !dev->hw_ops.get_buftype ||
> +           !dev->hw_ops.enum_pix ||
> +           !dev->hw_ops.set_frame_format ||
> +           !dev->hw_ops.get_frame_format ||
> +           !dev->hw_ops.get_pixel_format ||
> +           !dev->hw_ops.set_pixel_format ||
> +           !dev->hw_ops.set_image_window ||
> +           !dev->hw_ops.get_image_window ||
> +           !dev->hw_ops.get_line_length ||
> +           !dev->hw_ops.getfid)
> +               return -EINVAL;
>
>         mutex_lock(&ccdc_lock);
>         if (!ccdc_cfg) {
> --
> 2.20.1
>
