Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F391E335C
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 01:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391141AbgEZXE4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 19:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389565AbgEZXE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 19:04:56 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FE8C061A0F
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 16:04:56 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id y17so20006289ilg.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 16:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=obH5i5ZLEC+haCrlLvKdZKrgXWxLuGsWc2kPghQguLE=;
        b=kgVMTXncE2fTzJlKGbZSJKTZ0q/yknIZ8IrO7Pao+r8c6fm+zn9Qh6drDKjywE3p3j
         fmX7anB6fhoDzBNFPI1DqPh6RsSXRsA3fcg/s4hONt6mNImG3zKYcCxdbPENxn67M79+
         3KSC4Ns5EBvHo0NhZGnRQgmKKHkFmokLxvW/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=obH5i5ZLEC+haCrlLvKdZKrgXWxLuGsWc2kPghQguLE=;
        b=kU3ISt+qyEFPQHm+z+mTQXw8SNYXqHbXj3rTe1MGGgMns6jmOC/7GXEy6GDynOqZ7M
         O8jNF0MQH4Bz2iy3S9G9d5Y6isqw9WaQaQ28gVf1/Bm6rLdMBEo/Xrir/VVa9HP5oPdp
         G1Mf4s9+xFKW2kRJwFHhYDV14XF07O6ns5fy4Hew2RO7+uwCG6nP/uD7WMBCxis2LhSe
         I3RbI+NyVLPaO6J2Vxpbf8nuX51cWYQaz3m9vXfjGGklUkfC49BSvqMaraBu44jDGx4z
         SjJQhZPar9iNkVitQYpB/wV38gxivbZLHgONicx3YQ4JpX1cXamZgImyyt6d04qQEorc
         lWHQ==
X-Gm-Message-State: AOAM530nDk+4iXxeiUUJn5jeUgToQPwxGKOPwJnoNFY6Fqr0rMJsfgEs
        GM1JciDpGauHwO8SIqgHe4vnBjyfUNfgkYVuUMGELQ==
X-Google-Smtp-Source: ABdhPJxpG2ydFyfTP4tfz+dav1pL5rV0anMGDvTScjZQp+tf6p7WXzJJnDZYWiTUJMb/ELJvnJzbBcJXg+0ydzz7Rms=
X-Received: by 2002:a92:b11:: with SMTP id b17mr3390100ilf.257.1590534295569;
 Tue, 26 May 2020 16:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com> <20200515142952.20163-2-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200515142952.20163-2-dafna.hirschfeld@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 27 May 2020 01:04:44 +0200
Message-ID: <CAHD77H=LhYV31Jw_-cTvXPh0K2ocr6o97ymJ2KkmCdkH_DE7gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: staging: rkisp1: cap: change RGB24 format
 to XBGR32
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> According to the TRM, the YUV->RGB conversion outputs
> "24 bit word". What it means is that 4 bytes are used with
> 24bit for the RGB and the last byte is ignored.

I don't see this mentioned in the datasheets I have. On the other
hand, XBGR32 indeed makes much more sense, as the 3-byte RGB isn't a
very popular format. Have you validated that the hardware behavior
indeed matches that?

Best regards,
Tomasz

> This matches format V4L2_PIX_FMT_XBGR32.
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index f69235f82c45..61b9ebe577b2 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -276,7 +276,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>         },
>         /* rgb */
>         {
> -               .fourcc = V4L2_PIX_FMT_RGB24,
> +               .fourcc = V4L2_PIX_FMT_XBGR32,
>                 .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>                 .output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
>         }, {
> --
> 2.17.1
>
