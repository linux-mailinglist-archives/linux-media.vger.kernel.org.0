Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543942FEDEE
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 16:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732185AbhAUPDB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 10:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731207AbhAUN3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 08:29:51 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB026C0613D3
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 05:29:10 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id v67so2517267lfa.0
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 05:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TCBmtAGF/p0qcpEu6dpC3LB6xwiWGvLiDJYZOK21eQg=;
        b=kso9808x4AKlVCLoDuCnsIu39a5rc+GdoErbN4v9A0LeyKqKlKZnQ1dZCtCi/0HC8w
         KnpoXw6adp5LSyaXaJqzK1+/d0XrFyt+6exKUKkPuXHFe6dn1pOpw630yXpyGwMieW0j
         T6KPRzXmXWmgk8S0am1TrBzX0lIsQL5iGtEEwTwKcJfen4UKw/mkoT/Whj00fjmxTOWW
         eNJ5E1psjb4UowIw3L/ze2bL8N1I12lKlDeGZOI6qWOSHemRUyNBu/cfHfl7YMRSREJf
         y85GfZVxzSHd0veFJ2SPwAvJmAw/Q7l8G1Mm9YmwoUiNIqbqr9FVssgzQyuO802KfYmR
         eBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TCBmtAGF/p0qcpEu6dpC3LB6xwiWGvLiDJYZOK21eQg=;
        b=gUreIPxocw24c4v/ZMlvW+lXj4J3bGzpWrf3KLWZu4AtepYJWmgkdxTlOEAykO0CKr
         6wKtHxCik5bE9d5fiEwvP/FruBpoa7BSQYU5wJKSC9GUNvm6cYh2vsHzwXvX1kKYT87B
         M9NFYIErVjNZqKf4RmaDzoZggKgFwNCA5ARu95QzEdpTldbtQYjqylbKX2VG88HugkGd
         lkV7fH2hIAy/KJ+O2Jpms+ATt6ArDTbcAGovJ8ETNNS376CCWY7543YqgeevzUuNBJI6
         AsQqbuiBGoLIdWqpuYtfLDLz5mQ8+QLhEj9IzeSivUup4rcfdH1+4VnPBzFIhyE4af+c
         wiRg==
X-Gm-Message-State: AOAM532sVUBYM7eMBw1VFxtFSEMM+ZR+zQENVf++HQKoW4X3N0WY742p
        MYtHh5tG2H0+c2aQjvc2lRbVtFiLQ+sGEZAigc8bTA==
X-Google-Smtp-Source: ABdhPJxLYG8wma3X3iAjIq15alrm3ByQ9m1SEliYlbpIky8zpSJ6MErlEFnMHA3/JFYzicxGQZp2bcYAzKcs4eMeICU=
X-Received: by 2002:a19:7616:: with SMTP id c22mr4729640lff.550.1611235749239;
 Thu, 21 Jan 2021 05:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20210119204508.9256-1-john.stultz@linaro.org>
In-Reply-To: <20210119204508.9256-1-john.stultz@linaro.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 21 Jan 2021 18:58:57 +0530
Message-ID: <CAO_48GHfGPqcX8B7BC5tf0J3+RWrtjpgHpfnJ-+sVaNv3bxYiw@mail.gmail.com>
Subject: Re: [RESEND][PATCH 1/3] dma-buf: system_heap: Make sure to return an
 error if we abort
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
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
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On Wed, 20 Jan 2021 at 02:15, John Stultz <john.stultz@linaro.org> wrote:
>
> If we abort from the allocation due to a fatal_signal_pending(),
> be sure we report an error so any return code paths don't trip
> over the fact that the allocation didn't succeed.

Thanks for the patch; LGTM, will push into drm-misc-next.
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Suggested-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 17e0e9a68baf..405351aad2a8 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -363,8 +363,10 @@ static int system_heap_allocate(struct dma_heap *hea=
p,
>                  * Avoid trying to allocate memory if the process
>                  * has been killed by SIGKILL
>                  */
> -               if (fatal_signal_pending(current))
> +               if (fatal_signal_pending(current)) {
> +                       ret =3D -EINTR;
>                         goto free_buffer;
> +               }
>
>                 page =3D alloc_largest_available(size_remaining, max_orde=
r);
>                 if (!page)
> --
> 2.17.1
>

Best,
Sumit.
