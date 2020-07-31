Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62630234BA9
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 21:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbgGaTiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 15:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgGaTiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 15:38:20 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD814C061574
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2020 12:38:19 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id l84so15139645oig.10
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2020 12:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cp3GygB7F0b136lUhJrRkyNW4lR2kBcOJ00svd2oGS0=;
        b=hRQTBt285hvDUY6CCaz910g2/xt+HvaTmkAFVvlGGkdmkHiPE1mWrZ6J9b98CS3oFF
         4rerhbQBqnGLLScHR+8hvSGAJGGP7HVCGfBf5URhTql94iKw/HXcIx853Ij74GkbeYQu
         z72JXvTJ0rU8caEPLxCkBL4MRokdEX1NcN2rLbiWAK6JWMBWavJM9B38gI1PeAnyws1H
         gt651BF1uJrsSvrDpQlZU+1dw83n7w3F0xuRWk1v5cWG4C7mhK2LPwtt5jkz94BhBR3d
         L5Rbx5xMULzWXTOBpbK36qGb/u4/6bb7abBJrfUfRNub9BusEMQLIXoFn0BNqa57XgUE
         OCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cp3GygB7F0b136lUhJrRkyNW4lR2kBcOJ00svd2oGS0=;
        b=hUP915MMCfXsI1KDhgdhqy74EgYMvB/C6z69m7mdE3d27M9xMJOMmovqN8gZmu2Ftb
         eXMSktrfX6Z31nBTecWlV0bGktRm/95+2QHNef8kHG6y5WzRZoJxuvCpN5f1F0nDeXlC
         DBqhd8ICtBX68fPiPBXs+p0ktZXnfzpbILn0HAtTb4Kxt4GTZ6krwYTPJ3VvIDhvW9ZP
         9Wqs0uryr7UD1l/TClC6CtWY1B0BngWGOLf2qg/RGFn4e+9UaiYxI2IPFSP294u+4L3H
         wXzWmuzpxU66QpEYcE+TTfbGJ392lec8Uh3FfLPUkCQMrs9JuPvgbHzdne6wibLpKQhe
         b/Iw==
X-Gm-Message-State: AOAM531A4yi7w1TvGr6bbW9a6MMEGhVN5gMdcyBi4AHVIsinmekLaoin
        r+nqls7V3Umpgm/tfQHrdzAAClsR70F/gYxilkNn4CLv
X-Google-Smtp-Source: ABdhPJxRdmWM2JVXS+XJYjkXLwgmye2vV//B6mH9jWnOac/U12I6qldoTC6vypuWGHyySsNeb29bO+jhRX9xVpW97f0=
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr4344099oif.10.1596224299067;
 Fri, 31 Jul 2020 12:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
 <CALAqxLXuJQOCXcpyWwyBFZGFK_dEgG0edEEf2=vOpAw6Ng8mBQ@mail.gmail.com> <eacfc713-e98a-78fa-b316-3943600813d0@socionext.com>
In-Reply-To: <eacfc713-e98a-78fa-b316-3943600813d0@socionext.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 31 Jul 2020 12:38:07 -0700
Message-ID: <CALAqxLVzUnc5CH_pA7h3ygXFPRz05KtNZx+_M3eAXXrm7hhGBQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Introduce dma_heap_add_cma() for
 non-default CMA heap
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-media@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 31, 2020 at 2:32 AM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
> On 2020/07/29 4:17, John Stultz wrote:
> > Do you have a upstream driver that you plan to make use this new call?
>
> Unfortunately I don't have an upstream driver using this call.
>
> This call is called from dma-buf heaps "importer" or "customer",
> and I only made an example (do nothing) importer driver
> to test the call.
>
> > We want to have in-tree users of code added.
>
> I think this is a generic way to use non-default CMA heaps, however,
> we need in-tree "importer" drivers to want to use non-default CMA heaps.
> I don't find it from now.
>

Yea, I and again, I do agree this is functionality that will be
needed. But we'll need to wait for a user (camera driver, etc which
would utilize the reserved cma region) before we can merge it
upstream. :(  Do let me know if you have an out of tree driver that
would make use of it, and we can see what can be done to help upstream
things.

thanks
-john
