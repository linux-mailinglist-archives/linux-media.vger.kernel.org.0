Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5748FAA1
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 08:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfHPGKT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 02:10:19 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35439 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfHPGKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 02:10:18 -0400
Received: by mail-ed1-f66.google.com with SMTP id w20so4193838edd.2
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 23:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uUYvRyue9FGskJ3l1UQX+2Vp9Bb6R1xGHmkTsgUXzF4=;
        b=iUvS9EHoV8CFmgesX9w8v/Y5KG1wTwYCYNSDJXCNn7EAdnjqOjRJSuS6H7LBdQiTaB
         fiidm0Lz6rpqntRyFhJa8xi3RUd2YKFco+b/i1HdXCRdt43X8ntJfiKp/oqJ8LwfLpsz
         IVowngEIvcXVFpW0uy72odixrnjWWOV44LoY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uUYvRyue9FGskJ3l1UQX+2Vp9Bb6R1xGHmkTsgUXzF4=;
        b=KQgW+7s+b1vOIvUhSiRmSA+9/7LIXtRujimFr+htOvPUmmqBkDtM43ku/GLPRaFTjG
         DHr8/ns/BY9kxoYtv6UvTQwGydbGNvpROwwTx2dGau92aLfZidNV2Sv6cD/zTV2KWfPJ
         8L3cpGbXBSloGhONE+5l+XxqtYIsz1+BCwvpVSoBzj41X89Qa/R7R3tiI4gmddUOXMO4
         AZjhuMAiRhxlUw6/vRYdq2obX+KnVBL+vjDHZ7NGwJFQuo3codtEfokXXGXhVejBkosH
         +nfcsNHB8v+IruztmoOjVPO1v53YPecLMJWVKyKEaWFbFJilbGlCctAEwqIc31wAXxry
         XRCA==
X-Gm-Message-State: APjAAAVF3NRem8ffq9gCcQyu88hNrvDYRtwIDGDAJ6IzJlFmmutP80W8
        HtcpopKhgkNRB67ZNdR6Z18KFxQCEiZwKw==
X-Google-Smtp-Source: APXvYqzGm16hZ4izhrasSB6BWjIPfbZskxy2hhO8+Vz8dzwUSxgZuFAyCpaH7KvQwOJVcqu9lA6jog==
X-Received: by 2002:a17:906:7c49:: with SMTP id g9mr5474629ejp.262.1565935816602;
        Thu, 15 Aug 2019 23:10:16 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id x11sm668276eju.26.2019.08.15.23.10.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 23:10:15 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id p77so2455889wme.0
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 23:10:15 -0700 (PDT)
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr5641661wmh.90.1565935815233;
 Thu, 15 Aug 2019 23:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <1565926419-2228-1-git-send-email-bingbu.cao@intel.com>
In-Reply-To: <1565926419-2228-1-git-send-email-bingbu.cao@intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 16 Aug 2019 15:10:02 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Db7_cridF5KzuUOujgiUT8fqczRX6T-yyM5P9W9Ut-Mw@mail.gmail.com>
Message-ID: <CAAFQd5Db7_cridF5KzuUOujgiUT8fqczRX6T-yyM5P9W9Ut-Mw@mail.gmail.com>
Subject: Re: [PATCH] media: staging: imgu: make imgu work on low frequency for
 low input
To:     Cao Bing Bu <bingbu.cao@intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Yeh, Andy" <andy.yeh@intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Fri, Aug 16, 2019 at 12:25 PM <bingbu.cao@intel.com> wrote:
>
> From: Bingbu Cao <bingbu.cao@intel.com>
>
> Currently, imgu is working on 450MHz for all cases, however
> in some cases (input frame less than 2.3MP), the imgu
> did not need work in high frequency.
> This patch make imgu work on 200MHz if the imgu input
> frame is less than 2.3MP to save power.
>

Thanks for the patch! Please see my comments inline.

> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css.c  | 7 ++++---
>  drivers/staging/media/ipu3/ipu3-css.h  | 3 ++-
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 6 ++++++
>  drivers/staging/media/ipu3/ipu3.c      | 6 ++++--
>  drivers/staging/media/ipu3/ipu3.h      | 1 +
>  5 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
> index fd1ed84c400c..590ed7e182a6 100644
> --- a/drivers/staging/media/ipu3/ipu3-css.c
> +++ b/drivers/staging/media/ipu3/ipu3-css.c
> @@ -210,12 +210,13 @@ static int imgu_hw_wait(void __iomem *base, int reg, u32 mask, u32 cmp)
>
>  /* Initialize the IPU3 CSS hardware and associated h/w blocks */
>
> -int imgu_css_set_powerup(struct device *dev, void __iomem *base)
> +int imgu_css_set_powerup(struct device *dev, void __iomem *base, bool low_power)
>  {
> -       static const unsigned int freq = 450;
> +       unsigned int freq;

How about making freq the argument to this function rather than
introducing some artificial boolean?

>         u32 pm_ctrl, state, val;
>
> -       dev_dbg(dev, "%s\n", __func__);
> +       freq = low_power ? 200 : 450;
> +       dev_dbg(dev, "%s with freq %u\n", __func__, freq);
>         /* Clear the CSS busy signal */
>         readl(base + IMGU_REG_GP_BUSY);
>         writel(0, base + IMGU_REG_GP_BUSY);
> diff --git a/drivers/staging/media/ipu3/ipu3-css.h b/drivers/staging/media/ipu3/ipu3-css.h
> index 6b8bab27ab1f..882936a9dae9 100644
> --- a/drivers/staging/media/ipu3/ipu3-css.h
> +++ b/drivers/staging/media/ipu3/ipu3-css.h
> @@ -187,7 +187,8 @@ bool imgu_css_is_streaming(struct imgu_css *css);
>  bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe);
>
>  /******************* css hw *******************/
> -int imgu_css_set_powerup(struct device *dev, void __iomem *base);
> +int imgu_css_set_powerup(struct device *dev, void __iomem *base,
> +                        bool low_power);
>  void imgu_css_set_powerdown(struct device *dev, void __iomem *base);
>  int imgu_css_irq_ack(struct imgu_css *css);
>
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 3c7ad1eed434..dcc2a0476e49 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -182,6 +182,12 @@ static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
>                 fmt->format.height = clamp(fmt->format.height,
>                                            IPU3_INPUT_MIN_HEIGHT,
>                                            IPU3_INPUT_MAX_HEIGHT);
> +
> +               /* input less than 2.3MP, ask imgu to work with low freq */
> +               if ((fmt->format.width * fmt->format.height) < (2048 * 1152))

Why 2048 * 1152 specifically if we just care about the number of
pixels? Also it's slightly more than 2.3Mpix (2.359296 Mpix) making
the comment inaccurate.

> +                       imgu->low_power = true;
> +               else
> +                       imgu->low_power = false;

There should be no need to store this, as we should have access to the
exact format when we start streaming. Could you move the check there?

Also, we have 2 pipes. How do they play together?

Best regards,
Tomasz
