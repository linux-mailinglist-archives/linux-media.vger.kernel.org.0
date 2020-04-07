Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EED21A0D16
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 13:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgDGLy2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 07:54:28 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37417 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgDGLy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 07:54:28 -0400
Received: by mail-ot1-f66.google.com with SMTP id g23so2777603otq.4
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 04:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0gVInTGNxEeCWiXi7ByJUOtO9MudWviZXdaE8J3lgqA=;
        b=VPEUl9xy/3yJmUlwootYcY6p4TfjwfT21nYeSOLuDbZb/pT/A0Oo5rE94UPOi+4OZg
         yFdAQCVflN9aOzzhjCyyqanedD04lLYIvEYzPzF9gSn4eiOrcllF3Vr/X8k7heJs3E56
         En71LbKpsJSzl5Fi0Qrwyyl1xL2p4PQU69VnOEgi5ESpeFz7sDVbxTSpwm4hy4/7Reww
         lPiEaxRPXcvvjZJHCP3DMJ/t42nPDaP8pm/5aI8iSYKV22Md6cOmpHz58HJypLkESYEI
         qr4N3S4ziUwDnjdXeoMlTwZmKMnFxJBvGthYQ3anFsBwhVdKoh6FewkjyflHScYAwDya
         P2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0gVInTGNxEeCWiXi7ByJUOtO9MudWviZXdaE8J3lgqA=;
        b=XdbKKyCD5BdrRi+nk646Shlahcd9j2S1OYvCX5uLtqev7GInlkte99Ytd2b35bVf7+
         IQr3hUuTG6eQLShxnEzB8NuURsYJU+XU4nrrclsEeK1A53KdZlksAQx3fgrLDxK/3OxJ
         LOG8ZPieLWdDuQrcAGrtAmpux650D8wH1rPMWRJmwYwgBUW8L88KCX+0hSuh1wJknWpa
         FKQHWKxgCj0hjkKmgF4C9qz9vrPBuXXHyZ226JW0Jv0wOI722MCw2M4Rku7I3JsH25Re
         NtL214vwFPrXxz2jo7DuitTcVAlME9y2/SzC8eLjR3dDwWg3zB6ahdOJMhVfC5a6blWG
         BkDw==
X-Gm-Message-State: AGi0Puaes79N2z+pZbktt806oib8/gKS3toGne3rgJD563d80nNpshjU
        et4ARAbaJIYbqFFGTkS67cUuDongeNlEtg26qaJlooV+5G+2LQ==
X-Google-Smtp-Source: APiQypJibwnk93QQGPMuzWrmkuiGuHDu4f7E7gQDZD7dePZjiyqGqYbylYQ6+P1BIruFnQqWWTq+vi5yWHSxsysEBzE=
X-Received: by 2002:a4a:e047:: with SMTP id v7mr1484649oos.49.1586260467063;
 Tue, 07 Apr 2020 04:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200403183334.11440-1-paulb@blazebox.homeip.net>
In-Reply-To: <20200403183334.11440-1-paulb@blazebox.homeip.net>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 7 Apr 2020 17:24:16 +0530
Message-ID: <CAO_48GEmjXyA0eEpJbHoeiHjLzYvnzhorWz2t+0o4B++HMH6AQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/dma-buf/Kconfig: correct typo in description
To:     Paul Blazejowski <paulb@blazebox.homeip.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Paul,

On Sat, 4 Apr 2020 at 00:03, Paul Blazejowski <paulb@blazebox.homeip.net> wrote:
>
> While running `make oldconfig` CONFIG_DMABUF_MOVE_NOTIFY
> has a typo in Kconfig description, correct it.

Thanks for your patch.

May I request you to please run scripts/get_maintainer.pl while
submitting patches? This allows all interested people to be able to
review the patches.

>
> Signed-off-by: Paul Blazejowski <paulb@blazebox.homeip.net>
> ---
>  drivers/dma-buf/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index ef73b678419c..04dd09b1667b 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -43,10 +43,10 @@ config DMABUF_MOVE_NOTIFY
>         bool "Move notify between drivers (EXPERIMENTAL)"
>         default n
>         help
> -         Don''t pin buffers if the dynamic DMA-buf interface is available on both the
> +         Don't pin buffers if the dynamic DMA-buf interface is available on both the
>           exporter as well as the importer. This fixes a security problem where
>           userspace is able to pin unrestricted amounts of memory through DMA-buf.
> -         But marked experimental because we don''t jet have a consistent execution
> +         But marked experimental because we don't jet have a consistent execution
>           context and memory management between drivers.
>
>  config DMABUF_SELFTESTS
> --
> 2.26.0
>

Best,
Sumit.
