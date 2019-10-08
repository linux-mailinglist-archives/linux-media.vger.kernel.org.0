Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F05CF221
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 07:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbfJHF2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 01:28:09 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38171 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfJHF2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 01:28:09 -0400
Received: by mail-ed1-f67.google.com with SMTP id l21so14491533edr.5
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 22:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LapW5Mhx7A3MmJCZg7TvfQvSI/HGXIWjFByANU41b0g=;
        b=jOsITpV2dARCbBIs7CsRBuTlQkh4OLvDnEPLViJ3atMG3HrLQzr9VvEXUm72O02aKV
         Rv0PMe/QG4clTSibMQU5hNpxlbZFdvv7hvq1WAkaQEzRMe9jt+7UPHjqLGwt3KaMRIID
         CubosTQVW1ATclgVCb0CpfjWguky4G6AUmceM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LapW5Mhx7A3MmJCZg7TvfQvSI/HGXIWjFByANU41b0g=;
        b=oRPHfo2x/69uH5zPnlGyYXhT9enY5jIDx4bWTjiuCNvW6HxkLXkGKXeR41c+KrZRGr
         ao5gZrHdC+p/JjDm7IGZzllDiFenxQrmtNVTkxrQ4jC0b/fGaPpM+8z3dtAVrpwaIX/s
         6WDC69wpyn1GvkvlRMb1TuxquuDIK/Jhtd0C7/Hhjia2cnsDu/3phw8KZsTvqN/EWU3z
         2jbCSZ0ctHDA49+v5rNIDQDiQKnW6uTR7sTFGBnwOg9SD+uzbw5C2L2P0vC0vtz+1xZ3
         EkluBlt36Kh8FcXMx47qeqjMEXdv/7LMWaz6xydS8LMlegBqnmK0PBkFjvg1wiB6esj9
         gWRA==
X-Gm-Message-State: APjAAAUHjDqiPSf2nMrCcNP+MmQWq/ye0LJvkJhCs58INTM8Tsgt8iAB
        FAg/ceG6Jip/UJFSV8sMEZ7U/rDgOzeWqw==
X-Google-Smtp-Source: APXvYqwrONqargawZGlf85sx4+ob/4ld137Hgd0MA7K76cocPEFHsf/7VCTvAkP/r59iJweKqkh0Fw==
X-Received: by 2002:aa7:c812:: with SMTP id a18mr33164256edt.240.1570512486799;
        Mon, 07 Oct 2019 22:28:06 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id y9sm2149664ejj.69.2019.10.07.22.28.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2019 22:28:05 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id i16so1632594wmd.3
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 22:28:04 -0700 (PDT)
X-Received: by 2002:a1c:e404:: with SMTP id b4mr2327776wmh.90.1570512484241;
 Mon, 07 Oct 2019 22:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191007174505.10681-1-ezequiel@collabora.com> <20191007174505.10681-3-ezequiel@collabora.com>
In-Reply-To: <20191007174505.10681-3-ezequiel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Oct 2019 14:27:53 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BNu2ea3ei_imHmEwmdna0+iiSbQSv_SBsdHfP4Uh1h4Q@mail.gmail.com>
Message-ID: <CAAFQd5BNu2ea3ei_imHmEwmdna0+iiSbQSv_SBsdHfP4Uh1h4Q@mail.gmail.com>
Subject: Re: [PATCH v2 for 5.4 2/4] media: hantro: Fix H264 max frmsize
 supported on RK3288
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel, Jonas,

On Tue, Oct 8, 2019 at 2:46 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> From: Jonas Karlman <jonas@kwiboo.se>
>
> TRM specify supported image size 48x48 to 4096x2304 at step size 16 pixels,
> change frmsize max_width/max_height to match TRM.
>
> Fixes: 760327930e10 ("media: hantro: Enable H264 decoding on rk3288")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2:
> * No changes.
>
>  drivers/staging/media/hantro/rk3288_vpu_hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> index 6bfcc47d1e58..ebb017b8a334 100644
> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> @@ -67,10 +67,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
>                 .max_depth = 2,
>                 .frmsize = {
>                         .min_width = 48,
> -                       .max_width = 3840,
> +                       .max_width = 4096,
>                         .step_width = H264_MB_DIM,
>                         .min_height = 48,
> -                       .max_height = 2160,
> +                       .max_height = 2304,

This doesn't match the datasheet I have, which is RK3288 Datasheet Rev
1.4 and which has the values as in current code. What's the one you
got the values from?

Best regards,
Tomasz
