Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67F3257FA5
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 19:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgHaRcX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 13:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgHaRcU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 13:32:20 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64CC0C061755
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2020 10:32:07 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id m5so462430pgj.9
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2020 10:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zoSKkzn43e5mTD+L9xg9lYb40d7kQEj3s97HxKcmRik=;
        b=W/7LouV2XH7MpEjE1hAHe4txTdIgHBWlEGRCsrMM5jTbux+uhjIR7Y/eTOiqA6/WB6
         TzTMA64ru7fUXfJvMn5ib/kOhhUD0bIztDMCuMShy+sgwI9ZA+lfPBS5g/cSLRSSq+GY
         3eVHIDBin4XLb76t/Uz6cku3377fgl8ZfdibJm7dPWPQGW6b7L4symtskBGpgRjSmbnS
         Y52mrhHnhnEUkLPPtFNarHAkqEzrJdqADeQgsGtDXHgkY51f0hniCMHhfWvWsFB1152O
         Vp8b5xFB1Of20Llw5rzks9GVZDZzFAKpYaa152u+YTdykDsKfOG52YeeOEIni5g++x7u
         5pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zoSKkzn43e5mTD+L9xg9lYb40d7kQEj3s97HxKcmRik=;
        b=U0dppi8DQKfHoCzoLAS9rHZD1ZHnHt2tgoz9LbfgY0pTCrL6seg5fmm8F7l14mOLuf
         8I2NTvt6Gwepp8qxu5+4xF8wnorbp1wGyYogn2SJh+ZPlAc84uYoATjDqNE7Icl0iRsJ
         k1C1feEtn76W3t3o+Ne9kn/xXNrU0h8F7VT4TshOPcccBeGf8tcMKYm/xF5DYBa2m6Nl
         O7B2ozuU26EOpXDQgEqRmhEz9nzVdVmQPG64H8QWpSWt6I9BEYnZiIqqZoxAi0FjlDiK
         dTa83HvOJDDycWotnnPzdXdEDMcLkFRxMxK8A/bQKJLm+bGHGt6bCFrSLWPvzHkDFoNE
         hkLQ==
X-Gm-Message-State: AOAM532Wk9sbJDqftJ9rGDIudROZclAl10zQIrRoGjvm5orSXfwuBj/+
        h7QgVw1JA2/Ax8wARhVweP0U+wXhHNT3/ZFP6OO/oA==
X-Google-Smtp-Source: ABdhPJwomTt09QDAQN8Oni666/Eerk5uQrbUgtrj9bUOokhYnsMVMkRIsUFIuJbsvLJvAQVGenyvPr0F3OeF38zfJ0Q=
X-Received: by 2002:a63:9d09:: with SMTP id i9mr1927016pgd.381.1598895126505;
 Mon, 31 Aug 2020 10:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200830163043.10317-1-trix@redhat.com>
In-Reply-To: <20200830163043.10317-1-trix@redhat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 31 Aug 2020 10:31:55 -0700
Message-ID: <CAKwvOdkvY62xVKQcVHxMTpskO=bB2sxwiOQb+TGF0-oU2Q6unA@mail.gmail.com>
Subject: Re: [PATCH] media: tc358743: initialize variable
To:     trix@redhat.com
Cc:     matrandg@cisco.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        p.zabel@pengutronix.de, Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 30, 2020 at 9:30 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis flags this error
>
> tc358743.c:1468:9: warning: Branch condition evaluates
>   to a garbage value
>         return handled ? IRQ_HANDLED : IRQ_NONE;
>                ^~~~~~~
> handled should be initialized to false.
>
> Fixes: d747b806abf4 ("[media] tc358743: add direct interrupt handling")
> Signed-off-by: Tom Rix <trix@redhat.com>

I'm guessing there was more to the report that says that `handled`
isn't necessarily initialized along any of the paths within
tc358743_isr()?  But you should fix this for all callers of
tc358743_isr(), such as tc358743_work_i2c_poll(), not just
tc358743_irq_handler().

> ---
>  drivers/media/i2c/tc358743.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index a03dcab5ce61..c724bd1591de 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -1461,7 +1461,7 @@ static int tc358743_isr(struct v4l2_subdev *sd, u32 status, bool *handled)
>  static irqreturn_t tc358743_irq_handler(int irq, void *dev_id)
>  {
>         struct tc358743_state *state = dev_id;
> -       bool handled;
> +       bool handled = false;
>
>         tc358743_isr(&state->sd, 0, &handled);
>
> --
> 2.18.1
>


-- 
Thanks,
~Nick Desaulniers
