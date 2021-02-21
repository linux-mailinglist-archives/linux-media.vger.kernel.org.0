Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D62E320DC1
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 21:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbhBUU4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 15:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbhBUU4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 15:56:07 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE9CC061574;
        Sun, 21 Feb 2021 12:55:27 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id x19so11028225ybe.0;
        Sun, 21 Feb 2021 12:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fyF0LjaB9P2i7Lp6wc61I/btQ3dRrAgoAWpQ7eEEOi0=;
        b=AMXMDZhadbJBdedrcFda8hxcGPQzCNjWeeyaIpIinWvB2IzEf/0Gp2JDmIIghiSrya
         oE9Ehvr0PTAMObjbBMRfWwIOdy0SWWdrS0lklcB+WL17LMsGLNUlu9a4Ti9qQb3s9nLI
         bIQcrprd+csVYjSsDkPVFX+Zmbn+9LKnSg9e3pVY5aWMLtnOOVuOSmCULPCXa49BDtx6
         s+fx13KdVF7vhrBQPoIXzKABKUxxHkSlB2ZvO9kHGtZ6zNSS602eSBCqwofh1duZYwAo
         l/394c8ejzOHBIw9RXIxCXrr7gXWNMJ7v+oEcNJ7GBFZ4DzPpIpNVtttZsO1scbysudw
         SZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fyF0LjaB9P2i7Lp6wc61I/btQ3dRrAgoAWpQ7eEEOi0=;
        b=oLcCw4TgBBON+ROvjimfQDpXL6VT66uJXchOCEBJjrwIVIHTTTBe378IcmYiMqQci7
         UxNtgtVLpJSGzHCNmJO1bvXaKPWlj8FikJqTD2/9hYwRF3ibzwBGcM1ZQsZp7YC4K3K5
         Zyk7nrzjnOVUQ0B08f/WKlfXYQRULXQk+eigeFFXDMnsn+HAoyQPORdIFERE4Y+gLEcK
         yB6N7zyMVUFG0Rsczw8ibPWdhjVl0heP/YO4LyJ+Wch6/B72/rd0JrZpBJxfyVtQvIit
         BuhJIDjjofCOXsYyk+a7m7un8QbtxkqLxaAwg0rWTiMvfXwrzKw/KXO2OLR7j6Ra0oqT
         4nmg==
X-Gm-Message-State: AOAM531ZLRvWttoWw56AVebOB9JHLjcjnmXInHbhEdAaU5iEN5pfp9RE
        sBnt7UjF7TZEJrrSV6to2M0HSXvAKCUXcheQAXw=
X-Google-Smtp-Source: ABdhPJx+AizyWn+h1qrEy2y5dKAMirtiFf6UqoCnpkjAxzqgIc6xAVFIDUBnCYvlnbJcRcPttrfWqYmNtGUYDLUL4QI=
X-Received: by 2002:a25:2d07:: with SMTP id t7mr28967962ybt.127.1613940926443;
 Sun, 21 Feb 2021 12:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20210205092117.551317-1-unixbhaskar@gmail.com>
In-Reply-To: <20210205092117.551317-1-unixbhaskar@gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 21 Feb 2021 20:55:00 +0000
Message-ID: <CA+V-a8sFaW99J8tVa=1w=o37TufLgLmh0TcnSqkdaaY0SpYZdw@mail.gmail.com>
Subject: Re: [PATCH] include: media: davinci: Fixed up few trivial spellings
 in the file isif.h
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bhaskar,

Thank you for the patch.

On Fri, Feb 5, 2021 at 9:21 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
>
>
> Several spelling fixes throughout the file.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  include/media/davinci/isif.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/include/media/davinci/isif.h b/include/media/davinci/isif.h
> index e66589c4022d..8369acd26e7e 100644
> --- a/include/media/davinci/isif.h
> +++ b/include/media/davinci/isif.h
> @@ -177,7 +177,7 @@ struct isif_black_clamp {
>          * 1 - clamp value calculated separately for all colors
>          */
>         __u8 bc_mode_color;
> -       /* Vrtical start position for bc subtraction */
> +       /* Vertical start position for bc subtraction */
>         __u16 vert_start_sub;
>         /* Black clamp for horizontal direction */
>         struct isif_horz_bclamp horz;
> @@ -193,7 +193,7 @@ struct isif_color_space_conv {
>         /* Enable color space conversion */
>         __u8 en;
>         /*
> -        * csc coeffient table. S8Q5, M00 at index 0, M01 at index 1, and
> +        * csc coefficient table. S8Q5, M00 at index 0, M01 at index 1, and
>          * so forth
>          */
>         struct isif_float_8 coeff[ISIF_CSC_NUM_COEFF];
> @@ -340,7 +340,7 @@ struct isif_data_formatter {
>  };
>
>  struct isif_df_csc {
> -       /* Color Space Conversion confguration, 0 - csc, 1 - df */
> +       /* Color Space Conversion configuration, 0 - csc, 1 - df */
>         __u8 df_or_csc;
>         /* csc configuration valid if df_or_csc is 0 */
>         struct isif_color_space_conv csc;
> @@ -406,7 +406,7 @@ struct isif_config_params_raw {
>         struct isif_linearize linearize;
>         /* Data formatter or CSC */
>         struct isif_df_csc df_csc;
> -       /* Defect Pixel Correction (DFC) confguration */
> +       /* Defect Pixel Correction (DFC) configuration */
>         struct isif_dfc dfc;
>         /* Black/Digital Clamp configuration */
>         struct isif_black_clamp bclamp;
> --
> 2.30.0
>
