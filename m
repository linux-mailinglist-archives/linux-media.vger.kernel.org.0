Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976D22DD977
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 20:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728966AbgLQTla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 14:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728201AbgLQTla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 14:41:30 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3425C0617A7
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 11:40:49 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 23so60597863lfg.10
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 11:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8co+g7fqtv1R652W4I2zAoCxF1rMu+SazXF7/blE/U=;
        b=lzm25lfu8A9lVmaAyBbIOBWJ8Tvv7cGOCF5jF3olsIEHnfbSvmLawXeSOIjV7tAt3A
         PaDGhDOA8egVr6Opm3LeXG8IGLh/yvvdOZ7OczqcqqgsTQf7V2RWmkIANJlEo05uHiSh
         o/35BNZtoaSRjejmRFxV/1997Uq3BIzVefTK35yMwUkRjOdvEby1rZ6csXwIo9L9LgAS
         8NiwImIyVHoHicSrvPN9GSfKcPzXQ0t++eBLRRvaRrpnmG73ryORqUEckMRC8n6WF4mi
         sh8hh8BZ+LK9dX0PDiNQ/Vrhneba1Pd3AbfqusoTLjIB3zWRgblXZxaQudfExqYnI2gT
         NLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8co+g7fqtv1R652W4I2zAoCxF1rMu+SazXF7/blE/U=;
        b=F0yYKnjoLcI/90FF/pfX00VC3k3Fz+vY9+Os3SjmxutoE54j6F+GYD/sf5wj9Yd2A8
         QNELcpt6SM25KBiEO2DGUKmC9MK1qTFAWOxrHhzkuS6Bjg5ronsTay78m8qpjNFqU2OU
         eYVllNwW+2Xj1iGyRuG6xKH4w+4swqDlAsEK0M43uvzJ5QCPvbxyxYdPrmpS9Q1jjGQi
         Tvu5eB9BZPBM+vSUfMS8yNDi9W7YyoULmAyI1f1fm91D9WgMe30ZT7MRR4wV09Vfgxvt
         6jv7bgRFkb/l3/uRztaDQNF/g6lr7EYtIPYCY1ucoNxWmTCWMAkkNhOvJVJMWg9U+6JC
         oATQ==
X-Gm-Message-State: AOAM533hM/272ed4y+7OXh0wTjxL+d0ufAjk8Fg05hOPPddHKP/kvdU7
        XbC5JySP2yTUUTwXG+jvi14yqyKYjxnbLp5y+N/6OQ==
X-Google-Smtp-Source: ABdhPJyoxlYF6cA7yW0ADQXLLbDXp4SbBvfrxe+y5InSW7WfeoagGLAqOVcdA6uvNnjcrreaKO7zIKYkZ32rMSlVSlI=
X-Received: by 2002:a2e:3506:: with SMTP id z6mr391593ljz.257.1608234048140;
 Thu, 17 Dec 2020 11:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20201217123053.2166511-1-siyanteng01@gmail.com>
In-Reply-To: <20201217123053.2166511-1-siyanteng01@gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 17 Dec 2020 11:40:37 -0800
Message-ID: <CALAqxLW_zQZi=x9PXb9Uf+gPntm=5Q8vDWa_Gs+TjHbyqu_dZQ@mail.gmail.com>
Subject: Re: [PATCH] cma_heap: fix implicit function declaration
To:     siyanteng01@gmail.com
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 17, 2020 at 4:31 AM <siyanteng01@gmail.com> wrote:
>
> From: siyanteng <siyanteng01@gmail.com>
>
> When building cma_heap the following error shows up:
>
> drivers/dma-buf/heaps/cma_heap.c:195:10: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
> 195 |  vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
>     |          ^~~~
>     |          kmap
>
> Use this include: linux-next/include/linux/vmalloc.h
>
> Signed-off-by: siyanteng <siyanteng01@gmail.com>

Thanks for submitting this! My apologies for the trouble!

We already have a similar patch queued here:
  https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-next-fixes&id=8075c3005e4b1efa12dbbf6e84bc412a713de92c
so hopefully that will land upstream soon.

thanks again!
-john
