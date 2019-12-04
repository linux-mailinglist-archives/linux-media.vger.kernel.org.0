Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3DF8113751
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 22:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbfLDV6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 16:58:14 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35134 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDV6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 16:58:13 -0500
Received: by mail-wr1-f67.google.com with SMTP id g17so1072846wro.2
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2019 13:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hIOYqKmmmpvYBf3JvRvJwW76NwBUzC3d92a7ZQ9APOc=;
        b=DjbgCmOZGCpbB1cVT/DWIysPtavfNH7OPlRt9M1OK0t7lYlqzl9B/SanQzAd9xvedV
         JAIh6f1/TeSiY9N0ECD5BqwGm7EXnJ6W/o7O0XvH0u/ruih0hWw4HEiU7TBfsy+zK0Og
         hzEnu9N8QQNwlyqEP26IoCuiiKF6mPcYu03nwMNDVKOm17XY3KzpBTrvQJVsxbRCrnTu
         Yd0guLnCm7HNXBd8X+0iKTX5DOIBQcoX/NBaxtYBeGG9AUV8uGjswsQNx5B/HhV/rbkb
         be+GIrzT24KwOhNbWhKDY7BgSCQc3TNTegqAN/lq3S1otn1zKfwW7xcCRhlca9Yn13lU
         yCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hIOYqKmmmpvYBf3JvRvJwW76NwBUzC3d92a7ZQ9APOc=;
        b=Y1m/xuKy6bSp2a+CRXxOHYr9rFaUMgrSzhwLu65++7ayNGTmMfoP7L8UIr3EcDtNfU
         hh7NtjUOxJKBD0stpPz+srLB3RhjiRrWx/OlYedP7TUsyehrETbBQITrW3dSpn/EBLKm
         BO/WcFwffDi8FFrhFRtBGVVGbpOhO55aGcyJ7QeM2eFv1O0CDTfjZh5CyoN1ZyoL2f+G
         4n+gdIxcfvxdslOS/qW77LCClzbgdTRR93ovFSRbp58is18D6oLrIbLQSaWVBVZIt0uL
         p+x73O2UlxrQsY4wpTQUuEvu3FvyejCysjjgypGQjdFmXw++OXuqVxzhS+UX8Zv9XIl2
         XA6g==
X-Gm-Message-State: APjAAAV5Zck4gwsY8TuIxQ0yTlPD3OOoQlwCFdACzjMmsb+5YHDFBz6u
        060Ti2F967jTsG+aGbqzPo2dv6njnCh5TxWVYl8=
X-Google-Smtp-Source: APXvYqz34tHD22JxN7p2KuRnBVNDtkFtDP+Bu7c/rRmS0sUMVBdKkzgud+fUiVEBi/ytgoRY/psrGk4bpGfX3XNxdM0=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr6651016wrq.206.1575496691523;
 Wed, 04 Dec 2019 13:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 4 Dec 2019 16:57:59 -0500
Message-ID: <CADnq5_O8V7N9jV1ZDCuL3WWCW2CwNSjXnx70Z1fDQpm9ObBWwA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Match on dma_buf|fence|resv anywhere
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 4, 2019 at 4:51 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> I've spent a bit too much time reviewing all kinds of users all over
> the kernel for this buffer sharing infrastructure. And some of it is
> at least questionable.
>
> Make sure we at least see when this stuff flies by.
>
> Acked-by: Dave Airlie <airlied@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 375dbea8bc88..c1e3da2c1947 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4941,6 +4941,7 @@ F:        include/linux/dma-buf*
>  F:     include/linux/reservation.h
>  F:     include/linux/*fence.h
>  F:     Documentation/driver-api/dma-buf.rst
> +K:     dma_(buf|fence|resv)
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>
>  DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
