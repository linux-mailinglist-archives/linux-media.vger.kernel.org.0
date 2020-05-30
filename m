Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04E81E90EC
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 13:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgE3Lv2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 07:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728433AbgE3Lv2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 07:51:28 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04383C03E969;
        Sat, 30 May 2020 04:51:28 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id b18so4090711oti.1;
        Sat, 30 May 2020 04:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xCXAfOioBbxUVL8mTl6H9BT4lkk40qtADdxo9zWE6eo=;
        b=O5BSzgPzPryy0HvONiyGE6SzGpUrGWja9Etknk/zTZsMqXvtbronBpfqQ+28vFoND3
         F/EWaNUuenDPs/HyK+CzAcP9Kq+LHbTR1cEvEPZ6eYD66oFWn5huq6kLY9Pa4Nr7jbSj
         MS+NcGDOwvu/tHjds7XDBf4c3/b2XQrb7ZlZB7niYEDgF7kgK6+lAPlP72+9ww4SK5ZE
         q0JI31YnsV54OfYU6mb9JvTXJyZxYJwk5G8b3EharS/3YNiU+Du1xqvc9LEERMZ4MTVg
         1k1zyE3b/+eoHnsJxR7i2llwH8GphvYdwVx9X3QeaPqZnIb1JLbJ+fUiGPNhfdkGeag1
         ts7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xCXAfOioBbxUVL8mTl6H9BT4lkk40qtADdxo9zWE6eo=;
        b=otqaxoJCjsazjAdhAlU34YJNfrfC3TBlSrRaL6+1wznqIAqNfebfEeeWMptxlLWdaG
         xYP/9ez/WxTuC7KP0w0gmgpdxuaZ7V6RCFmqZGkL+fvNWBflCPXYn5LpEnjxreQ0bdg3
         6+bqTCFrkg/djr0G15N8t38dsSHxLd3KNggM1OQlxVe7VKj7ufJ1q+q/cnZVPGyGkQy4
         ZrE9pqhXcbkbQIsPQ1g+6nra7JxVVEEm8dZ8euwBxuv8p+1zB1nqVfX0CeLurEXtpfxN
         1vG8I3tPQ1cKbUblPIaBEoiO/BHE/pLh6gxruY9QQf7RrXykefXFJzoUb0B8vtx6rSa3
         MlQg==
X-Gm-Message-State: AOAM533zLE0CoZld6qiy0riFZj4TkJPfwhiyROnahPrryxd8fKr8FWRB
        HygNwK0AintGH2R+2vub2okYrL/iMznAZXS95EVFNIiLHbd9cQ==
X-Google-Smtp-Source: ABdhPJyHeCjjJSLzxv1tIaoOH1mGg2gr+XlitIE0KgERclS6lN2L9BMw6/SY6GLYX7SGy6+jZnATMtP1Q1Y1/+t6aGk=
X-Received: by 2002:a05:6830:1658:: with SMTP id h24mr9208019otr.43.1590839487411;
 Sat, 30 May 2020 04:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200528132605.18339-1-bparrot@ti.com> <20200528132605.18339-2-bparrot@ti.com>
In-Reply-To: <20200528132605.18339-2-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 30 May 2020 12:51:01 +0100
Message-ID: <CA+V-a8saE25M48f1tQDSYBkPvZtg4XoCJjuJ2PV5CAkB3ak1Tw@mail.gmail.com>
Subject: Re: [Patch 1/2] media: v4l2-rect.h: add enclosed rectangle helper
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

Thank you for the patch.

On Thu, May 28, 2020 at 2:26 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Add a helper function to check if one rectangle is enclosed inside
> another.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  include/media/v4l2-rect.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar

> diff --git a/include/media/v4l2-rect.h b/include/media/v4l2-rect.h
> index 8800a640c224..bd587d0c0dc3 100644
> --- a/include/media/v4l2-rect.h
> +++ b/include/media/v4l2-rect.h
> @@ -184,4 +184,24 @@ static inline bool v4l2_rect_overlap(const struct v4l2_rect *r1,
>         return true;
>  }
>
> +/**
> + * v4l2_rect_enclosed() - is r1 enclosed in r2?
> + * @r1: rectangle.
> + * @r2: rectangle.
> + *
> + * Returns true if @r1 is enclosed in @r2.
> + */
> +static inline bool v4l2_rect_enclosed(struct v4l2_rect *r1,
> +                                     struct v4l2_rect *r2)
> +{
> +       if (r1->left < r2->left || r1->top < r2->top)
> +               return false;
> +       if (r1->left + r1->width > r2->left + r2->width)
> +               return false;
> +       if (r1->top + r1->height > r2->top + r2->height)
> +               return false;
> +
> +       return true;
> +}
> +
>  #endif
> --
> 2.17.1
>
