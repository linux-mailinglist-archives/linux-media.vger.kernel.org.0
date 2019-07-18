Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15BC86D666
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 23:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391431AbfGRVXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 17:23:42 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42088 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbfGRVXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 17:23:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so13176219pff.9
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2019 14:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qMusGExo/4n7tjYsdiRBxr2+eOsOxIvhg6GNsS6h/VU=;
        b=A/Jgq0UAId/tqrsgZ3n1oD1nwV+a4MytDfdNUhZbeJiRzMgPMGwA7oTedadzpGMHCT
         I9avxhIhWrbv0g09wgtISjzsthyBB5qsmvMPQJhsBvcYgvCqtldjQ8chLXFhrm/bFlz+
         NQQOdK26pfln6Kk9uL8zfFiEyh3jl2dasIFvzdjLMuCjLxhc0Moh2XgiPUje/ijlixiT
         CDeiyvWJDxMF3HYysXZ134jGDPkxu83cgTNMMUMeHDbFFpQ06cy12c47RUzxUGliIYCM
         Xcbn7WQGW/+UKVFoE0g5CM3TOO8EM6oMCoHr5t1mdBCyLdw+8YzvcG9fv3Kc0PCO2Ib5
         9FPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qMusGExo/4n7tjYsdiRBxr2+eOsOxIvhg6GNsS6h/VU=;
        b=CbKS5az9NS1JU6l10tg8kLWMfNrSg4BXWhk5GgBSZsGnS/ZZ9M/lD2QLGg6QeSn4wO
         5FMMPAo4I1cNAAhvNG3TSp7I6zTmYv1GwEZVJC30HB7Qqc4amfZ9obxA3uKXODFuVkZb
         WgyC7YfXCR3/HU42TjmcYvlTS3yIPGSO4fzgd2Ku9jHlNOT08d83vH3TmbR+AL2s8003
         BKSm4/ZH3xbBZj01521+anI5wR8MYue9M/4u0e0jSaosh8guEi5RIbB3NznI7NUtw/QU
         iSZvBj8MXXL88rQFX/fNtUBut7mQZh1OqFcMtNRG12PjRpduUhMk9C4hzVwFf8DCfZ5H
         SVfw==
X-Gm-Message-State: APjAAAXRS7S7CcwjkmBuFPE4LcHk7z2sAfhNQ0cvlWJLTgSI8oGv6obn
        iDa73dbw3knEgD+YTCbdgm0JLmVlZO62CF4cEBxc/g==
X-Google-Smtp-Source: APXvYqxDZUBzH3HKrxpUAhL/zKBxCHCsy2uwkURdpVBA6Sf7UmRSy+3v2QdQc9xur5HS5uQ+FGNdozTxhr5JyvPEtK0=
X-Received: by 2002:a63:2cd1:: with SMTP id s200mr46339342pgs.10.1563485021175;
 Thu, 18 Jul 2019 14:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190718141652.3323402-1-arnd@arndb.de>
In-Reply-To: <20190718141652.3323402-1-arnd@arndb.de>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 18 Jul 2019 14:23:30 -0700
Message-ID: <CAKwvOdnEnsVOu+kJUF8=pppAZ7=nSBe6a-nZdnChH_YmhA-jcg@mail.gmail.com>
Subject: Re: [PATCH] media: vivid: work around high stack usage with clang
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Johan Korsnes <johan.korsnes@gmail.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Gabriel Francisco Mandaji <gfmandaji@gmail.com>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 18, 2019 at 7:16 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Building a KASAN-enabled kernel with clang ends up in a case where too
> much is inlined into vivid_thread_vid_cap() and the stack usage grows
> a lot, possibly when the register allocation fails to produce efficient
> code and spills a lot of temporaries to the stack. This uses more
> than twice the amount of stack than the sum of the individual functions
> when they are not inlined:
>
> drivers/media/platform/vivid/vivid-kthread-cap.c:766:12: error: stack frame size of 2208 bytes in function 'vivid_thread_vid_cap' [-Werror,-Wframe-larger-than=]
>
> Marking two of the key functions in here as 'noinline_for_stack' avoids
> the pathological case in clang without any apparent downside for gcc.

Thanks for the patch, should be one less warning for CI.
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Not sure how much effort we want to put into fixing clang to not
> get into this case. I could open an llvm bug report if something
> thinks this has a chance of getting fixed there.
> ---
>  drivers/media/platform/vivid/vivid-kthread-cap.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
> index 6cf495a7d5cc..4f94897e6303 100644
> --- a/drivers/media/platform/vivid/vivid-kthread-cap.c
> +++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
> @@ -232,8 +232,8 @@ static void *plane_vaddr(struct tpg_data *tpg, struct vivid_buffer *buf,
>         return vbuf;
>  }
>
> -static int vivid_copy_buffer(struct vivid_dev *dev, unsigned p, u8 *vcapbuf,
> -               struct vivid_buffer *vid_cap_buf)
> +static noinline_for_stack int vivid_copy_buffer(struct vivid_dev *dev, unsigned p,
> +               u8 *vcapbuf, struct vivid_buffer *vid_cap_buf)
>  {
>         bool blank = dev->must_blank[vid_cap_buf->vb.vb2_buf.index];
>         struct tpg_data *tpg = &dev->tpg;
> @@ -670,7 +670,8 @@ static void vivid_cap_update_frame_period(struct vivid_dev *dev)
>         dev->cap_frame_period = f_period;
>  }
>
> -static void vivid_thread_vid_cap_tick(struct vivid_dev *dev, int dropped_bufs)
> +static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
> +                                                        int dropped_bufs)
>  {
>         struct vivid_buffer *vid_cap_buf = NULL;
>         struct vivid_buffer *vbi_cap_buf = NULL;
> --
> 2.20.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190718141652.3323402-1-arnd%40arndb.de.



-- 
Thanks,
~Nick Desaulniers
