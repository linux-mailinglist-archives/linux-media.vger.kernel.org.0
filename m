Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24423A1C99
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 20:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhFISTs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 14:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhFISTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 14:19:47 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67782C061574;
        Wed,  9 Jun 2021 11:17:40 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id e7so13030625plj.7;
        Wed, 09 Jun 2021 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8zmeGfil6Un6NA08A7Kw0kuzyxjRcQgMr5s8V6JVF6Y=;
        b=sOVmCvqnC1sfTqDYfpxFzbHIdTv0JMyafG8+2piksXhgw4p9vpaKIqlVtHFAzI/sVO
         rx2eOpU2zGl88pUyD3eE54q9C45OSTxEUWvn4kKIHogsMJ01uOkdad022RC+NQqG0imJ
         iwMc3/Y/K4SPUFCyV8pteuRa3kuG//oa+ccNWANO7+PxjEzv1ujprl2tS6nxm8YMI02U
         2jdyme2Wz66LLgGfP0E7gp7hL4OvFZX0YGtpN9bFBJNgBJzBj3KLLAh+jU94nFMDQak2
         C9DLzBkeawhHQmBSdGae0JBy3hWdJiXslqeC6QN4nQFkxkSovVrVcvvcB7TsREvUorDg
         xH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8zmeGfil6Un6NA08A7Kw0kuzyxjRcQgMr5s8V6JVF6Y=;
        b=T+tOJ+hJF36lB2D0xdFCZ5t7R1+BsTNDaH/GxOaY56cIqDpqu9RhgvrYRyOv150rK5
         jLJt9tGYhk1uVEcI/n0VxdZHjmek+H5Y2jQ7ZLaHo9rFq9TQ5QS3MPP4hRGH2Rxz9h7c
         F0V/aCmYfK0gmbBztb0hUP+Opz9wCjDIuR95LUwk9Rgl4qYMocC803PRqWMSMBnqMLAY
         CwpNLcn38ISwKeOdTBzJwEpLDauqxe1f3ynl8GmQCKv5NoSqu8jQiBDEyKv39K2b5JGM
         Xr6wIyKddfOJiNrU3qTIOvW943NzYGOg7KNQWh3wJ5skITFUTgZcjVPvT5QVtNuw5Wlu
         00Yg==
X-Gm-Message-State: AOAM53349HdyskdH9tAF1ajLyvKkevTELsknoi11Wzy8hAH2C0qM/Yez
        9geWrJJo5hMXMqqI1bHRhzgVHEwMO9yiZ7YJzOg=
X-Google-Smtp-Source: ABdhPJzc6XIClEMrBoSl1eFW8eFnqWGroG1ShEj4jKWR0ThgjpUA2xiq3mraBMfFQ10+mwM6GV4M4Pza3hxNUmSOssQ=
X-Received: by 2002:a17:90a:80c5:: with SMTP id k5mr12072536pjw.129.1623262659893;
 Wed, 09 Jun 2021 11:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210609072409.1357327-1-libaokun1@huawei.com>
In-Reply-To: <20210609072409.1357327-1-libaokun1@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Jun 2021 21:17:23 +0300
Message-ID: <CAHp75VesvRMGY25WP-ZQaqWE-kyyp25GsvM8h=yMfO5U6r1gDA@mail.gmail.com>
Subject: Re: [PATCH -next v2] media: staging: atomisp: use list_move_tail
 instead of list_del/list_add_tail in atomisp_compat_css20.c
To:     Baokun Li <libaokun1@huawei.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kaixu Xia <kaixuxia@tencent.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        YueHaibing <yuehaibing@huawei.com>, yangjihong1@huawei.com,
        yukuai3@huawei.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 9, 2021 at 4:32 PM Baokun Li <libaokun1@huawei.com> wrote:
>
> Using list_move_tail() instead of list_del() + list_add_tail() in atomisp_compat_css20.c.

Have you considered using list_splice() instead of entire while-loops?
Or something similar from list.h...

>         while (!list_empty(&asd->s3a_stats_in_css)) {
>                 s3a_buf = list_entry(asd->s3a_stats_in_css.next,
>                                      struct atomisp_s3a_buf, list);
> -               list_del(&s3a_buf->list);
> -               list_add_tail(&s3a_buf->list, &asd->s3a_stats);
> +               list_move_tail(&s3a_buf->list, &asd->s3a_stats);
>         }
>         while (!list_empty(&asd->s3a_stats_ready)) {
>                 s3a_buf = list_entry(asd->s3a_stats_ready.next,
>                                      struct atomisp_s3a_buf, list);
> -               list_del(&s3a_buf->list);
> -               list_add_tail(&s3a_buf->list, &asd->s3a_stats);
> +               list_move_tail(&s3a_buf->list, &asd->s3a_stats);
>         }

>         while (!list_empty(&asd->dis_stats_in_css)) {
>                 dis_buf = list_entry(asd->dis_stats_in_css.next,
>                                      struct atomisp_dis_buf, list);
> -               list_del(&dis_buf->list);
> -               list_add_tail(&dis_buf->list, &asd->dis_stats);
> +               list_move_tail(&dis_buf->list, &asd->dis_stats);
>         }

>                 while (!list_empty(&asd->metadata_in_css[i])) {
>                         md_buf = list_entry(asd->metadata_in_css[i].next,
>                                             struct atomisp_metadata_buf, list);
> -                       list_del(&md_buf->list);
> -                       list_add_tail(&md_buf->list, &asd->metadata[i]);
> +                       list_move_tail(&md_buf->list, &asd->metadata[i]);
>                 }
>                 while (!list_empty(&asd->metadata_ready[i])) {
>                         md_buf = list_entry(asd->metadata_ready[i].next,
>                                             struct atomisp_metadata_buf, list);
> -                       list_del(&md_buf->list);
> -                       list_add_tail(&md_buf->list, &asd->metadata[i]);
> +                       list_move_tail(&md_buf->list, &asd->metadata[i]);
>                 }

-- 
With Best Regards,
Andy Shevchenko
