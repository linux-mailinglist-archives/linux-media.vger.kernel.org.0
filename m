Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7966C28BFBE
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 20:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729656AbgJLSal (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 14:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgJLSak (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 14:30:40 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA67BC0613D0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 11:30:40 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n9so15154927pgf.9
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cjldt1o5nw141qF+g4+dvQJqUWO3hkhZGuyEhRhSroI=;
        b=u1F2HT/p+Q8ZUd1kQVrPxLePjB4xRCSZkTqpj1qD74XYQPCoQLR05H1s5rh7G8o1Jd
         cKsTkK4XsdlEZCvW3b3GhTCVAcOBItFllDeNmUO+gHiz16TUqh7E3BJ+MLkuEl/jYGbP
         NbzpmLmEip2q9UVxsuf+GzSNJ11l9ZvWSSkgH3UJrM83pJv/jGnphYwL8k/o7UsZqOi1
         vfTn3l5vXO9e/HpOOnbNdQHN2XZhwFxUpLNP1DnDQzRi3wNcka9IYe+BGn/A/K3UUvb4
         qrk9nOzWL5xEqd8Qvg7ebEprMw2NWqZ8qxQbDuoGzMFS6ze5vti8o3piKumCZ7A63CaX
         npCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cjldt1o5nw141qF+g4+dvQJqUWO3hkhZGuyEhRhSroI=;
        b=JRULMAT1HKd7dEFchnDko8lQhNmnY5JvQAlXcOkP+Ycf4jO1ElAkWjr29p6qzF78s9
         7UmfjpsJCwdYYgwske6HvjSsZOxZfAzJV/vTSK1OVReXIgQEpYDaI7XrZZn12iJtPrYj
         0yxSedkjqe25e9pQTwzoD21Dt6QGYgN3vr1HuVCg1IWyX5eV/l30OKwHWOibYUn05lUm
         8l/GTrPGpU/TuJUN3j/UCE7vaqMAdD8jRPAi8nlpjPsB8NGQ/DnlZFMFn1GndDoAt0Ge
         e1zmTUp/uMwIMHP5TgOYcT1vPefwD7812cTNV+TMtFXBy5Cby1kPWx4BJI2QvvRJ5fNZ
         mOVw==
X-Gm-Message-State: AOAM530MrtiL3ad8YxXh6R3M7rf8YSC+gUuToavEzk+VQhl4/PfdRIt1
        UYmSeNAZxYmEg6+SeXlbuWM+QBxx/pouSQrcO+c=
X-Google-Smtp-Source: ABdhPJyNGUoOah/DlQ2EukNnswZWpxyX5GcgdMcdVIEUqT9vDL2YT9jzaBTFtHbhD6rhkbJbQobZvbzBhvG7735ElXM=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr13860491pgj.74.1602527440342;
 Mon, 12 Oct 2020 11:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201012180414.11579-1-sakari.ailus@linux.intel.com> <20201012180414.11579-8-sakari.ailus@linux.intel.com>
In-Reply-To: <20201012180414.11579-8-sakari.ailus@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Oct 2020 21:31:29 +0300
Message-ID: <CAHp75Vc6AR_miAFu=UqV_2xWRwhv-Xcuf22kWkA2=_bJtjdaUg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] ipu3-cio2: Rename CIO2_IMAGE_MAX_LENGTH as CIO2_IMAGE_MAX_HEIGHT
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 12, 2020 at 9:09 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> CIO2_IMAGE_MAX_LENGTH is the maximum width of the image. Rename it as
> "CIO2_IMAGE_MAX_HEIGHT" in order to better describe what it is.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 6 +++---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index e42177f8c426..d9baa8bfe54f 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1094,8 +1094,8 @@ static int cio2_v4l2_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
>         /* Only supports up to 4224x3136 */
>         if (mpix->width > CIO2_IMAGE_MAX_WIDTH)
>                 mpix->width = CIO2_IMAGE_MAX_WIDTH;
> -       if (mpix->height > CIO2_IMAGE_MAX_LENGTH)
> -               mpix->height = CIO2_IMAGE_MAX_LENGTH;
> +       if (mpix->height > CIO2_IMAGE_MAX_HEIGHT)
> +               mpix->height = CIO2_IMAGE_MAX_HEIGHT;
>
>         mpix->num_planes = 1;
>         mpix->pixelformat = fmt->fourcc;
> @@ -1283,7 +1283,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
>         }
>
>         fmt->format.width = min(fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
> -       fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_LENGTH);
> +       fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_HEIGHT);
>         fmt->format.field = V4L2_FIELD_NONE;
>
>         mutex_lock(&q->subdev_lock);
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> index 7650d7998a3f..ccf0b85ae36f 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> @@ -14,7 +14,7 @@
>  #define CIO2_DMA_MASK                                  DMA_BIT_MASK(39)
>
>  #define CIO2_IMAGE_MAX_WIDTH                           4224U
> -#define CIO2_IMAGE_MAX_LENGTH                          3136U
> +#define CIO2_IMAGE_MAX_HEIGHT                          3136U
>
>  /* 32MB = 8xFBPT_entry */
>  #define CIO2_MAX_LOPS                                  8
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
