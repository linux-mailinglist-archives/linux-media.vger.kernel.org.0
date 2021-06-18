Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280683AC142
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 05:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhFRDX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 23:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhFRDX5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 23:23:57 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76E5C06175F
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 20:21:48 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id og14so13429314ejc.5
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 20:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6aJ7JLNwP8uQqbzACgqcuvU9N5foWZsWndyEyLlqRCY=;
        b=Bs1lVn/Fv7HQ1gsS939rabvK+bgf5OnBx3+M7rkEyVztWkpe3oLTsa8T3TpZ6VCOil
         FuB2/gbtM56yMReJ5wFMl/eXIAK1Vx5BOp+s8bekj51rQ47Dgv4UOa8M8/pgCG/wCdpG
         ndNqRM2AFGTW82VnxFJdle/ZOI8IF+k6V6D10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6aJ7JLNwP8uQqbzACgqcuvU9N5foWZsWndyEyLlqRCY=;
        b=SZ3POPOWIkRHzB51mhr2C4JfNasOpZh+PdqSMAselfEOxWmYlwdhM5PP1nGc0UIcMO
         b+2JtcKCwQ8MbtMd2pW2lgPhQaNXr1ATgEr75nJ4Bv0jXl5KSvVv8M1qhjVzMuqt+mtH
         Ns6XHJoJWeKd/KptjdhMIg1r1RRc+jagyBGSyoHeJ8mmFUW0/kjixuDr1pK8Te36iI9Q
         7PdpFoRETg/NJsTgVrdPELFpbayE63L1PU7XyFimFxnuYTncFz4QtPJ2k9ATWZdS6k1L
         s4nAf1JZsJztDsBswCTQIYxtyf5GPyrayu9jEnIZVHvfiEsDbU3bgeQc1jDU05l9EhaR
         EBXQ==
X-Gm-Message-State: AOAM532H2Kauh0p0gTMzIEVPSfNuQ9xED9JfjbT6Nf/AUTSd8WMbM7+N
        Nk0j5tbavguzn+MhRS3cmK6Suz1E7r9QvQ==
X-Google-Smtp-Source: ABdhPJwOBS6gLAir5YiqfwquEzdYiJNHy2/7EvRxvQihcYdlmAnM0aZCOKZBzwx6p8yaMTDVHdAErQ==
X-Received: by 2002:a17:907:2648:: with SMTP id ar8mr8663977ejc.67.1623986506872;
        Thu, 17 Jun 2021 20:21:46 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id og26sm425893ejc.52.2021.06.17.20.21.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 20:21:46 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id f2so8978961wri.11
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 20:21:45 -0700 (PDT)
X-Received: by 2002:a5d:4f08:: with SMTP id c8mr9725940wru.197.1623986505267;
 Thu, 17 Jun 2021 20:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org> <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
 <YMsAIVs7G2hUDR2F@google.com> <20210617080107.GA1422@lst.de>
 <CAAFQd5DiPstn-s+yQM3iMd=G9oaag39qCyX483a7-Jrn=gxWCA@mail.gmail.com>
 <20210617085233.GA4702@lst.de> <CAAFQd5DqK2gSTGjfo-vahXwMzzO9gv26cY=vV6urn3viDLPE7g@mail.gmail.com>
 <20210617100656.GA11107@lst.de>
In-Reply-To: <20210617100656.GA11107@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 18 Jun 2021 12:21:33 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CgLDkJ3t1aU2PRcGu6cGFjLXOnvMqDg62Z7Zuc8ABVHg@mail.gmail.com>
Message-ID: <CAAFQd5CgLDkJ3t1aU2PRcGu6cGFjLXOnvMqDg62Z7Zuc8ABVHg@mail.gmail.com>
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Christoph Hellwig <hch@lst.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 17, 2021 at 7:07 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jun 17, 2021 at 06:40:58PM +0900, Tomasz Figa wrote:
> > Sorry, I meant dma_alloc_attrs() and yes, it's indeed a misnomer. Our
> > use case basically has no need for the additional coherent mapping, so
> > creation of it can be skipped to save some vmalloc space. (Yes, it
> > probably only matters for 32-bit architectures.)
>
> Yes, that is the normal use case, and it is solved by using
> dma_alloc_noncoherent or dma_alloc_noncontigous without the vmap
> step.

True, silly me. Probably not enough coffee at the time I was looking at it.

With that, wouldn't it be possible to completely get rid of
dma_alloc_{coherent,attrs}() and use dma_alloc_noncontiguous() +
optional kernel and/or userspace mapping helper everywhere? (Possibly
renaming it to something as simple as dma_alloc().
