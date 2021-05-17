Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A683B3828D4
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 11:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbhEQJxS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 17 May 2021 05:53:18 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:40683 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229474AbhEQJxS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 05:53:18 -0400
Received: by mail-vs1-f52.google.com with SMTP id o192so2780542vsd.7;
        Mon, 17 May 2021 02:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MYWhLCGDlcd6D8Z4xh0ec24MABNFcRQopm1qOI1sbhU=;
        b=lzkeQ1TQvWPGFhP+W/Pk4jVUaJ5bscoZc/OiZ7Dp8u4PRAesCaCxyVNAGzoNP2rXsm
         4psKztI1xTv6O6UwA8or1O2+hueFDPs4utrySRXr613Wh8ltz/Ye+K7lhv663IZ553hF
         aeRTU/tfxGne0bi0fjU+Qmh4kQQHLnNCf9gHQ/CKmm0K1qmYAGm5jdasWZLZYphXYUoN
         cAaTtpPzZPWW+oVJv4fqBq9tT0whIPyz2QNPzqK5z0TlC2H640v66Ve96tp7c0hQNWn4
         DqH1itqXszykTxA03Zd+g37/xjjdfSV71lMTD6b0a0YT96r7BjPMNiTL/Bq59eg3mBlT
         FAIQ==
X-Gm-Message-State: AOAM532EyCvOEyXCpr1ZZk8ZjKEOUSwpFmwxJ+NrLXN0VvDryWQKvsZ1
        lqEIVCzjyml6Oyr+31uhueIMLXMZYXKnEedmzJO9ywgB4J4=
X-Google-Smtp-Source: ABdhPJyADzOth5fOo91dVZ84XkRcwe4ji7fS58goTOcVqwWQjRBxpniHG9fQFe3Wsi5wxHj75jWdWs6sJg3GnXvT7Xk=
X-Received: by 2002:a67:fb52:: with SMTP id e18mr9965897vsr.18.1621245120564;
 Mon, 17 May 2021 02:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210513140914.742677-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210513140914.742677-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 May 2021 11:51:48 +0200
Message-ID: <CAMuHMdXnduG8q4tmXTgOEgHdyqqVQgXs7s93rif_4yQ-foJGWw@mail.gmail.com>
Subject: Re: [PATCH v2] media: rcar-csi2: Enable support for r8a77961
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, May 13, 2021 at 4:10 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Enable support for M3-W+ (r8a77961).
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: LUU HOAI <hoai.luu.ub@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> * Changes since v1
> - Do not piggy back on the M3-W (r8a7796) quirks as they are different.

But for now they're still handled the same way...

> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1112,6 +1112,11 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
>         .num_channels = 4,
>  };
>
> +static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
> +       .hsfreqrange = hsfreqrange_m3w_h3es1,
> +       .num_channels = 4,
> +};

... as rcar_csi2_info_r8a77961 has the same contents as rcar_csi2_info_r8a7796?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
