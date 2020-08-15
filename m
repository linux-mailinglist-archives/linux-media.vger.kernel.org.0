Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F67245342
	for <lists+linux-media@lfdr.de>; Sat, 15 Aug 2020 23:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729605AbgHOV7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 17:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgHOVvi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:51:38 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D493C06135D
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 19:19:58 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id q9so9100168oth.5
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 19:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kotVL2MVQP+yaUdPHEdye5LclV8vVVPvzmwQlj45VGA=;
        b=RTB9HEWhawVWaOVivVEaeJlv0EDtpps/Dvnysqh+sfXQcrhgY36YW5WMpXVQ3E03De
         BfHJGAyPOioZ7kOWqdSQIe2pfq2XEO7q/+kCJMd7WFieWUtZm5DmOQH0cMzm3OFrDfl6
         KSF238ON/iriNpjcgkGO8ZZoC2u79B/Xqgw0TVxTQHwU7JtRGkNPhW8vro7AdN+J0S0v
         xEYUfZVTrcRl3KH3h2RjbwjC7XM0wFl01LmOcUK+u1taG15uYnn7vGR4pA0VoNqSagns
         N92QFNP5r9ZaE4etZxVqeRGuIt0/ShuHjQ7LIzmqB3JKtaouIOCqUaQVSS8jCnKy63HB
         eR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kotVL2MVQP+yaUdPHEdye5LclV8vVVPvzmwQlj45VGA=;
        b=qQKIVkf4ItpFvNM+yf3wb/z1Frl70L3kt5332jTyX15wfG+Jmdjhasj/qMTe5oqWb4
         4Fn+RzfrdzTgKGdGHLb85sPU8US60fqgJGPSrk3pOzaUh2KhZp6GHa93pCYnNlGY85Ux
         fQzOQacE8qPNnibJGmkaJtbx9BVogK+d+vmIolMF06Cjh85QgXFFcXYp9pVeLBQ+K+ci
         p2hdeAhkemC3hscVRQxaVUBmjQt+3ZSteuX1cAnHzRPXYqyyHcdS0RbbQmOwgDjtG2De
         hbjuov9A4TL6V6mn9f2F7YBOwYn+JPg+OJw2FzpDkm82ynskXJsx32KHxFpTtI65Iv+j
         IiAw==
X-Gm-Message-State: AOAM531Q6zhfsMa9NB2/8dSZhzoXF6aKp1Kvc/Oe6LfBKdUE+A9Nihwm
        lbpBgFLqAi55LmzPtDo+LbBySAYhAuSv/Dba+jJ9nQ==
X-Google-Smtp-Source: ABdhPJy+n0F6ds6KPCecQRLWeKyt7/kkaH52AH58xx1rQoWzIvkR4h1GmHPPbdbsDbWnnwEdgh+f7kNaM9jPgYlAeKo=
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr3758994otq.221.1597457997320;
 Fri, 14 Aug 2020 19:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200814142516.148934-1-ezequiel@collabora.com>
In-Reply-To: <20200814142516.148934-1-ezequiel@collabora.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 14 Aug 2020 19:19:45 -0700
Message-ID: <CALAqxLWytSnPugPH2Ux5=C_bzC0DLGKQyB+Szcp4LOVfhKPFqg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heap-helpers: Set dma-buf exporter name
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 14, 2020 at 7:25 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Currently the heap helper uses DEFINE_DMA_BUF_EXPORT_INFO,
> which uses KBUILD_MODNAME for the dma_buf_export_info.exp_name.
>
> This effectively makes all dma-bufs exported by the heap
> helper as coming from "heap-helpers", instead of the actual heap name
> (cma, system, etc).
>
> Fix this by adding a dma-heap name getter, and then setting
> dma_buf_export_info.exp_name.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Untested, but looks sane to me.

Acked-by: John Stultz <john.stultz@linaro.org>

On a slightly related note, I'm starting to regret the current
heap-helpers approach (Andrew probably gets an "I told you so" there
:). While it avoids a lot of duplication, it's really an all or
nothing approach, and doesn't really compare well to other drm style
helper functions.  I may eventually try to break the system and cma
implementations out of the helper code and try to consider a different
approach to avoid the duplication.

thanks
-john
