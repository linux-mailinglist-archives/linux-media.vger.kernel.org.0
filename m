Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25ECE2DB7D1
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 01:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgLPAer (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 19:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgLPAel (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 19:34:41 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BDC0C0613D6
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 16:34:00 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id o17so41124588lfg.4
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 16:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zj2YPVQKRFQs32LNLuK0mWD4evn16vjxArTvNU8xCYE=;
        b=zmi7gRMEKq3pV/lgDugpVABkbjYGunfv3IE8jzEnAbsXbf+Ejg0wFe38PkWiNxIzat
         UcNrSUrSe1p2sIBdGyWDONBu3AH8Kbk0NiodFDicgrBdvK70sr0gakQF29ML95jAragV
         8N13doCOA/pfONzJVu9hq8B426nbEKWVwEaZb7OphLLkthsF5Ta4dsKZ5Ek4hjMnrraY
         DGHF1s2bdcFGIUxhc8PsQ4bFHAmzraOeLADbxbYfaGcYzobyIX+X8coA5ijWWy005Ds+
         wAdnfLQ7eT6rJMO+AIq+vVrl6HWY5W3uz0vRd5Gt6zRcBSNLXP04+FjmrPL01+CWxnu5
         qKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zj2YPVQKRFQs32LNLuK0mWD4evn16vjxArTvNU8xCYE=;
        b=s+GjBJ9PMakqILSNA3gmgNHAPnuud3cgHj+JXBiuyfr6yr7yOlAR63JAcLyyqG/y1S
         f8jBYOOJwSs5tmUMhHOZXFC3AsH1DM4GIjHvRBXq3ebp09FgsVW2iQPwnnFUZ/khSEML
         nBGy1Gpk7pcTOd1v4eVHe1BqHzuU2zpVXMuiya6OtY+18CH18MhEVITZLtDj5heqbXEY
         jpEQEBrYRMi0VafGqPnN86lR9qYJZtipYKX0xlCd6PcpVnbtHLxhYNQ3mR1arzag7I5i
         P0gP6AiM07fM1Xp23hAg48of4DzCKF1rCmmwZNp+K2a55MxEGyJXvNUz3P6BQIgc+01V
         XpWA==
X-Gm-Message-State: AOAM531KFB13E3VbuRCOOP+yobz5sm2LTSWhL6NnHSak8WgDc5lXiXgd
        VCZVRib7sbYsjPAq/xw/iYCSJ9rfujGvYaN9efnl7g==
X-Google-Smtp-Source: ABdhPJyOHjNYEs+MlipEezrk74D7gW0AbcHrqq8ll/2YJyrpydKCzWHi1oI7l8bwkRbDoPAAlJpvejRCo7btrJ0F78U=
X-Received: by 2002:a2e:8e38:: with SMTP id r24mr7092267ljk.333.1608078838907;
 Tue, 15 Dec 2020 16:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20201121235002.69945-1-john.stultz@linaro.org>
 <20201121235002.69945-3-john.stultz@linaro.org> <20201215235334.GA227480@roeck-us.net>
In-Reply-To: <20201215235334.GA227480@roeck-us.net>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 15 Dec 2020 16:33:45 -0800
Message-ID: <CALAqxLXOnJPU5O5nZRnww6qNeA465syOmCPr9FY5cD_aijjzQA@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] dma-buf: heaps: Move heap-helper logic into the
 cma_heap implementation
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 15, 2020 at 3:53 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sat, Nov 21, 2020 at 11:49:59PM +0000, John Stultz wrote:
> > Since the heap-helpers logic ended up not being as generic as
> > hoped, move the heap-helpers dma_buf_ops implementations into
> > the cma_heap directly.
> >
> > This will allow us to remove the heap_helpers code in a following
> > patch.
> >
>
> mips:allmodconfig:
>
> drivers/dma-buf/heaps/cma_heap.c: In function 'cma_heap_do_vmap':
> drivers/dma-buf/heaps/cma_heap.c:195:10: error: implicit declaration of function 'vmap'
>

Ah. Looks like we need to explicitly include linux/vmalloc.h.

Thanks for the report! I'll spin up a patch, validate it and send it
out here shortly.

thanks
-john
