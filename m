Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A94618F6CB
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 15:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgCWOZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 10:25:43 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38992 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgCWOZm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 10:25:42 -0400
Received: by mail-io1-f68.google.com with SMTP id c19so14284103ioo.6
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RU40jWGhj6lpOmcR0rhPbXxuDL08twmkF5lowZlfdA4=;
        b=On3knLcVMH7gqWiW24pMmTOlwxhJsmZOhwh2r4ySimnUYot7WSDpY+1cbATjWSI1oU
         1Ye6cPD3cflw7nxYJK/ZIjWEYTTU+DSSWLfJX0001yf/+y+sCBjuwpZkgOhvbapUV248
         AWzDQPwoYqsqVnInKAPEX70g4G9weVWMyiz0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RU40jWGhj6lpOmcR0rhPbXxuDL08twmkF5lowZlfdA4=;
        b=ORzc7fx1V/+TlPhozSfJPh7R0lEzdfq/+f0wHGPA5iJuI6F2oqSCb6H96WJFCin6KL
         9WdZ8aPtSQRNXSsvGBwHD38K30LHfaUPxul8Ijkx8Bc/h3Pe4jwRMoSQgphlplTkTJ25
         OiSBL0RCF6wn7591rP3tO340ic5YTawTkf4QZhI99j70SeUruWNwxOF9+uwECqaDHqJ+
         D00NpSQETF4/WCyGdcCun87BdwAD9WTpymASMKZsqLWaiFfzmg/Rop2dWIZpAJ0o3frI
         LYrK6DOE2kpxKt9mISaSwp7+nhXROCHEQ57OjaKcqlCefSnf60jF9lLJI65mp8JRyjGO
         opVQ==
X-Gm-Message-State: ANhLgQ0lAhWsU4wDlaUfzWVVbjss/Ui94pRsvTOCqn5X3TL7d0oVQDEb
        lanFrVpS71xncAY84iJM0i+6DlvxNc/QZg==
X-Google-Smtp-Source: ADFU+vuK8CeX9NHLdAyLzDGpZsLAGmk0SS7HcDH/yS8DAgbsx34F3wOIYvLsaaYo1oQ/4D2GmVj1uQ==
X-Received: by 2002:a02:a813:: with SMTP id f19mr20023219jaj.35.1584973540463;
        Mon, 23 Mar 2020 07:25:40 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id p189sm4358909iof.17.2020.03.23.07.25.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2020 07:25:40 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id h131so14341567iof.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 07:25:40 -0700 (PDT)
X-Received: by 2002:a6b:3c01:: with SMTP id k1mr5299442iob.120.1584973539652;
 Mon, 23 Mar 2020 07:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <1584973116-13148-1-git-send-email-bingbu.cao@intel.com>
In-Reply-To: <1584973116-13148-1-git-send-email-bingbu.cao@intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 23 Mar 2020 15:25:26 +0100
X-Gmail-Original-Message-ID: <CAAFQd5DqLWhSdu6oB8M1=5h_SakMCPo4eu-Fd17rkgoiucL-fg@mail.gmail.com>
Message-ID: <CAAFQd5DqLWhSdu6oB8M1=5h_SakMCPo4eu-Fd17rkgoiucL-fg@mail.gmail.com>
Subject: Re: [PATCH] media: staging: imgu: do not hold spinlock during freeing
 mmu page table
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Mon, Mar 23, 2020 at 3:15 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
>
> The spinlock should not be hold during ImgU page alloc and free, the
> irq should be enabled during memory cache flush - cpa_flush(). The
> spinlock should be released before freeing pages table.

Thanks for the patch! Would be good to explain why it is so.

Otherwise feel free to add

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu3/ipu3-mmu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
> index 5f3ff964f3e7..cb9bf5fb29a5 100644
> --- a/drivers/staging/media/ipu3/ipu3-mmu.c
> +++ b/drivers/staging/media/ipu3/ipu3-mmu.c
> @@ -174,8 +174,10 @@ static u32 *imgu_mmu_get_l2pt(struct imgu_mmu *mmu, u32 l1pt_idx)
>         spin_lock_irqsave(&mmu->lock, flags);
>
>         l2pt = mmu->l2pts[l1pt_idx];
> -       if (l2pt)
> -               goto done;
> +       if (l2pt) {
> +               spin_unlock_irqrestore(&mmu->lock, flags);
> +               return l2pt;
> +       }
>
>         spin_unlock_irqrestore(&mmu->lock, flags);
>
> @@ -190,8 +192,9 @@ static u32 *imgu_mmu_get_l2pt(struct imgu_mmu *mmu, u32 l1pt_idx)
>
>         l2pt = mmu->l2pts[l1pt_idx];
>         if (l2pt) {
> +               spin_unlock_irqrestore(&mmu->lock, flags);
>                 imgu_mmu_free_page_table(new_l2pt);
> -               goto done;
> +               return l2pt;
>         }
>
>         l2pt = new_l2pt;
> @@ -200,7 +203,6 @@ static u32 *imgu_mmu_get_l2pt(struct imgu_mmu *mmu, u32 l1pt_idx)
>         pteval = IPU3_ADDR2PTE(virt_to_phys(new_l2pt));
>         mmu->l1pt[l1pt_idx] = pteval;
>
> -done:
>         spin_unlock_irqrestore(&mmu->lock, flags);
>         return l2pt;
>  }
> --
> 2.7.4
>
