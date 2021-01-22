Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E3A301016
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 23:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbhAVWgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 17:36:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729626AbhAVWgD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 17:36:03 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD52C06178B
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 14:35:21 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id o13so9742556lfr.3
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 14:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TVHHWido/EH2Vt59qdy1Zby/ZP47wr14BUSPLPmA0j4=;
        b=vRtzT2R7AO6c4k2leJdr9LSRmXNc6Xyl/1AF/P7bdVFSKXBE97fAh73Oss8ZhECx99
         tUmbI1ES3YH2WefY9ABfgwQpDa6Yk2uICzg9wT2S8oBIb7MsV5E4Ohx26IanqF6f/8lY
         ZZKGvs+Fjlfs3zVa8b6/TjZam2qMpcoJEO1oIlZRiY37NWIfIp8j89KenGVwyuV45bIB
         4oFqn+/7bkNaGaniA5pcfuPjBIej3sTakGYOkVyxozrrICb83JvbcP71N/2iYpi6nNjW
         4oEk04IiHcpIffCzEs3r5v0MJvgPra/+0VbZxFschKo/9/xGNdHScf9vQ6WQWusHo/NJ
         Do3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TVHHWido/EH2Vt59qdy1Zby/ZP47wr14BUSPLPmA0j4=;
        b=PmlVibGvt/479i3xxLP0ZKca/5F8P383bQme8SeD2apIplvaj1n5xCg35sBWReb7Y1
         uf33YOg2q8xpYAQ36721GBjgOtQOGkdantSUVl0vTG2qMW/xIeNa4CDX8bG4Rw0toOtb
         39BD44hGn0PbhoEXgXVFCK9bAAxrHrpY9PrAdWaGOiu28HewD/G6e6HiuWmgve6VblJh
         MEpocsFaOQMRC2KpyQmB1bZSZpWYyGnNx4PE98coXLTkyWSH/b++v9/qaK/QrvFbzlQa
         v3CUvTGxR2Bru1hVIxj5D0jxy69osuIEMuZ2rKFSzfq7p7TvuIoKBDsa831khCwkqvJz
         +67A==
X-Gm-Message-State: AOAM5336V70SlZiU36sSdHC/knF5HjP49H6RcjdX7XFbmMeVAqW7UOBv
        c9jRFti6Yhkeh/8AqibULUn5qHSLA02nJThhfy7/MA==
X-Google-Smtp-Source: ABdhPJy1BnxeBPTkzgt4QScOHWd/QI0f84MDBJMyCAHwV8LfTy+jZGVeA/xcg+uD8cA806qlu/XHkmck+4PXwcqcImg=
X-Received: by 2002:a19:48d0:: with SMTP id v199mr2069375lfa.535.1611354919948;
 Fri, 22 Jan 2021 14:35:19 -0800 (PST)
MIME-Version: 1.0
References: <20210119204508.9256-1-john.stultz@linaro.org> <20210119204508.9256-2-john.stultz@linaro.org>
 <CAO_48GEYGzY8cZybwrXgfODhuoAJqi4AvwbZbWd+PiYjMqKYpw@mail.gmail.com> <CAJuCfpGRkM+h16SJp7gJOaAhy+gFw1-++WP8kavOjRj3MHcpBQ@mail.gmail.com>
In-Reply-To: <CAJuCfpGRkM+h16SJp7gJOaAhy+gFw1-++WP8kavOjRj3MHcpBQ@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 22 Jan 2021 14:35:07 -0800
Message-ID: <CALAqxLW-Z3-Zcwkeuard5vfU_bAZkRRsAo2fX=3Wwp2-yURiuA@mail.gmail.com>
Subject: Re: [RESEND][PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the
 vmap_cnt go negative
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 22, 2021 at 2:21 PM Suren Baghdasaryan <surenb@google.com> wrote:
> On Thu, Jan 21, 2021 at 11:56 PM Sumit Semwal <sumit.semwal@linaro.org> wrote:
> > On Wed, 20 Jan 2021 at 02:15, John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > We shouldn't vunmap more then we vmap, but if we do, make
> > > sure we complain loudly.
> >
> > I was checking the general usage of vunmap in the kernel, and I
> > couldn't find many instances where we need to WARN_ON for the vunmap
> > count more than vmap count. Is there a specific need for this in the heaps?
>
> Hi Sumit,
> My worry was that buffer->vmap_cnt could silently go negative. But if
> this warning is not consistent with other places we do refcounted
> vmap/vunmap then feel free to ignore my suggestion.
>

Yea,
 My sense is that it didn't seem like it would hurt, and if the
warning happened to be tripped, it would be good to catch.

However, if you are skeptical, feel free to drop that patch from this
series for now (it shouldn't impact the following patches).

thanks
-john
