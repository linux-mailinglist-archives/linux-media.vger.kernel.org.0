Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4712FE726
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 11:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbhAUKI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 05:08:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728404AbhAUKIl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 05:08:41 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EB9C061575
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 02:08:01 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id bx12so1733141edb.8
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 02:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hr8G9ZRt7jscYO8CLUhH5Ds1WbiUzFjHZWuqOSMKHdU=;
        b=GvEUJalzniaiCCa2+ngQnbp8snJ8jc68JNc2fkb9RdUdyjz1evsvu63fQ07IxVoc9R
         nJroc34QzqHexVPgOQoLntzHs7TdgM1fV2/NDhT/0e9AhZZmtxWBVqiNivNKPhKSDnqz
         4PMcOGWf4jG5aa6XoWiF4r/vfplWAzWKhpvRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hr8G9ZRt7jscYO8CLUhH5Ds1WbiUzFjHZWuqOSMKHdU=;
        b=XTRqL7t4zBRgfXTxGgrt5JOpLYW1VtRrr5QG9jEnZVEEHm+WHBHPnbhYaCh7WVaEzU
         hqTFw2jemRAI/JR5uP5bIAVaV4/lVEatuGLH3mg1jMur+/I5UB/RTaay0O+3CngPV+BR
         +Pi8dG8cpmudHt7xRyfYBgGLfXGUguNPGK5R1PnxX1xjDCUeYSGxWvP9qeL3B6ytv6L3
         LboVSN/uaVOfOb7XmBpqV6HQWJvqjQCsaH5kEQ/5Y2yVEJ6Xe8B8lBsHu7+iXEDQejYS
         F5IGKVKND3fw/h7nD8wPQ651TfHRkGiGfMp+6hRsGvmMLKZd9G9X5nQmXpF1QoQnHqhP
         2kiA==
X-Gm-Message-State: AOAM532JSl09Wo05p+gCkkFEfT+GjzuYgcX/La1+86h80LvPsRGoOtz+
        d33upiIrwnelIla7X7GeSBPXSkx5INpBhw==
X-Google-Smtp-Source: ABdhPJxnt1oX6KnjNdLc5aKYZHVihQsUF0HJuTPP9Yiq1wqYbGUI/BisDtZGmzIVBbWlT7QU4qbwRA==
X-Received: by 2002:a50:8b02:: with SMTP id l2mr10267458edl.322.1611223679730;
        Thu, 21 Jan 2021 02:07:59 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id n27sm2053157eje.29.2021.01.21.02.07.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 02:07:57 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id w1so1744423ejf.11
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 02:07:56 -0800 (PST)
X-Received: by 2002:a17:906:aad1:: with SMTP id kt17mr8868059ejb.116.1611223676379;
 Thu, 21 Jan 2021 02:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20210120164446.1220-1-dafna.hirschfeld@collabora.com> <20210120164446.1220-3-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210120164446.1220-3-dafna.hirschfeld@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 21 Jan 2021 19:07:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AyE87V7u6heJp24VUXVBMzqrQ6nUVa-mVr0JUADSVq=g@mail.gmail.com>
Message-ID: <CAAFQd5AyE87V7u6heJp24VUXVBMzqrQ6nUVa-mVr0JUADSVq=g@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] media: rkisp1: stats: remove a wrong cast to u8
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Collabora Kernel ML <kernel@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, Jan 21, 2021 at 1:45 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> hist_bins is an array of type __u32. Each entry represent
> a 20 bit fixed point value as documented inline.
> The cast to u8 when setting the values is wrong. Remove it.

Thanks for the patch. See my comment inline.

>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index 3ddab8fa8f2d..4cdb180fa64d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -235,8 +235,7 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
>         pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
>         for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
>                 pbuf->params.hist.hist_bins[i] =
> -                       (u8)rkisp1_read(rkisp1,
> -                                       RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
> +                       rkisp1_read(rkisp1, RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);

Is the register guaranteed to return 0 for the upper unused 12 bits?
Should we mask them instead?

Best regards,
Tomasz
