Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF81367EF6
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 12:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235938AbhDVKrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 06:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235930AbhDVKrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 06:47:31 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E266C06174A;
        Thu, 22 Apr 2021 03:46:56 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id u11so17414515pjr.0;
        Thu, 22 Apr 2021 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yc9wGyWGhgFaZSQouLz2+dApxfgGjbSS67UWipX0ris=;
        b=tBH1+sBLqDZuiPdSoyrOO6NT2umNak5OQbG2/NThReyEBwRA/FlPUiSrgW4o5eQb4t
         iT8DHPHyznITtM2UcyG3Xf51W7dJcNg2eT/6PiPLf2/HuJZ+nI5n/98iRnqSCJR5P3da
         I2+5kK3S4UVbIo+nxoDE34Kj0yXaVKAAHIbyhAwQGuLMfdqzrgn2ZG3eI9IMSySfzPCt
         3C9Ab4Hb5BjPDZcCEwEA6CoBA55oznSqzy9s1VtpIjxAcESFMM0Dd2/mbQWYuBHY9OTO
         Y0E01Z5i37Eff3QTCk2fQzf1unFVF/VUaCd8y2sE83M65AbeJHXuB6RgjfnbOHzk9MRX
         WcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yc9wGyWGhgFaZSQouLz2+dApxfgGjbSS67UWipX0ris=;
        b=KLwuH5EltG1dnfeUT5dKvyZ7BYl26LDIvMjc5f5pkodYMH14Wij+NDNLtCSCY6rNxq
         ztAfiNedQjEnD8B6jSj0B75xtbfACyXCPKcUfXpg1DxMr5UucLZYnXncKqZi/sDf4ink
         Yx8Oov/SPNKPzxucPaamOPz1fE+bd72b9KDZGbLSdPFam2HURW1KBsbgCtwL6lgXOINr
         bZQS/c1YlanbrbFWkGw1+E7oKlImZ9nGyF1Ih0LbGqdlWA48H+C0WMesQkqURPBCrNmQ
         GQniBFQ+ZchNhLh8Fb5PR88Zvc9lmFov9vpWqoJbIgKLlqWE08DGadkjEh/LagGr8cqE
         tmCA==
X-Gm-Message-State: AOAM533iUG/9H2Qi1XcdZkzc6WzeG8Jo0QAoo2vfk/gLLQOH0m1XmV0I
        FCJL9hx6RRtI8WXz69JawlnwiS/wf4Qp8/Kvox4=
X-Google-Smtp-Source: ABdhPJy+ERoKJA1hCj8Oe+lftOnHwnIH8BzpBPEwxs0NMI9jWXOCPRjVXNvMvgFuC81oR7tJvfMC2+9aAoffBsOMBgQ=
X-Received: by 2002:a17:902:e546:b029:ec:a7f5:2a88 with SMTP id
 n6-20020a170902e546b02900eca7f52a88mr3078034plf.21.1619088416159; Thu, 22 Apr
 2021 03:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <202104220841.E5T3ZL3m-lkp@intel.com> <20210422001852.GA24577@de5bcc5e76b6>
In-Reply-To: <20210422001852.GA24577@de5bcc5e76b6>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 22 Apr 2021 13:46:40 +0300
Message-ID: <CAHp75VdbegA4iHJcT9s-MbU2nHHAKdaRFA_J8DqzR5BKhh-htg@mail.gmail.com>
Subject: Re: [RFC PATCH linux-next] kernel/resource: __region_intersects() can
 be static
To:     kernel test robot <lkp@intel.com>
Cc:     Alistair Popple <apopple@nvidia.com>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 22, 2021 at 4:30 AM kernel test robot <lkp@intel.com> wrote:

Can you generate a commit message as well?
Otherwise looks valid to me, thanks!

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: edede6a2ecfe ("kernel/resource: allow region_intersects users to hold resource_lock")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> ---
>  resource.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/resource.c b/kernel/resource.c
> index 8faae19f8236e..a4bc6f66136c6 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -502,8 +502,8 @@ int __weak page_is_ram(unsigned long pfn)
>  }
>  EXPORT_SYMBOL_GPL(page_is_ram);
>
> -int __region_intersects(resource_size_t start, size_t size, unsigned long flags,
> -                       unsigned long desc)
> +static int __region_intersects(resource_size_t start, size_t size, unsigned long flags,
> +                              unsigned long desc)
>  {
>         struct resource res;
>         int type = 0; int other = 0;



-- 
With Best Regards,
Andy Shevchenko
