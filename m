Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F21DE191E05
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 01:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgCYA11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 20:27:27 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:36741 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727199AbgCYA11 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 20:27:27 -0400
Received: by mail-vs1-f66.google.com with SMTP id n6so509961vsc.3
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2020 17:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bz2N4oKpCbTRNSR33wclChTnUyQz7LVD8rMynRStNME=;
        b=uUMjGFIqDFczpSMiSKlsxO2m+pEpqP6Ca9Y9hPbe/SyvU5teKd7iqXERC1EJ2l4bWU
         5fTEaPZJmDmwkkLdAC052j16/1bCsU8Fb6h7EObEKpXJsjK1uWNjdtwZmA5xrv44cmSo
         9gtoqxGfmDD5gH1dn9oZQbEOoNPqAvuDl/pQp//cA1FHhchN1kZuz3C/JqbV1n/cxXj7
         J+6QrbqoGpgtB8QyWErffIEd/66TvtibxeDFAwpn0Dt6h4HSDCKmgaQZk0g/5rbiH8sS
         KcwUtwgRXsRU+4htnDw/RG7Q6OcOF2nukT9HSi9Q/wjhwdJuJQUFgelLInhdh7g8Ajkw
         O9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bz2N4oKpCbTRNSR33wclChTnUyQz7LVD8rMynRStNME=;
        b=KRcdq1fB3B/n7oWaV3RI47Nbc+z10CpEHZfsTOdgFSjrQFi6YLJY0NSHDbiiYam8nx
         5beAtjlWljgGS6HUSU44H33USSxPSswKtKnCw/hAbszp5YLCNmsEyjcCGWrvVOSQF+ax
         ogL4BDkgO3bNS1FiRISzHZm1RndOvEr70q13ryZ2MdWRBn6wI5FXiSKvIRO6tV1FNFjK
         bIqPMFnzcEDObUJHqxQKTotlyTG/SgVNMUdhp+ZfKOrZJEmbXXo4QYA6EonjQlteZJwk
         pBvndQCtqeKm4Oekxjw3tTLFvjSJNCvaaMfBIMST4A2IkXlGnWfpWKmk5E/hO3Hx5DSC
         u4uQ==
X-Gm-Message-State: ANhLgQ2i6Y0u3bvxJh3DYAiVTAayc2JxkX9F9GVuExi763tqJdj1jVuf
        r8a8/wTbnzzNHAyOG7jSYMazHwhvQs0RoJ/359+SUbiXw//WjA==
X-Google-Smtp-Source: ADFU+vuXCYmJUNTDcno5WTwxS1JltS1m95uBLkzhhhYPUjVwJBs2fLaXvA6DZqoWpGxDsGcYavzo7E/bxd6uHmL1fPo=
X-Received: by 2002:a67:2b05:: with SMTP id r5mr780262vsr.80.1585096044671;
 Tue, 24 Mar 2020 17:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585059896.git.mchehab+huawei@kernel.org> <e39e656c49c05829f0cf9affd7918818351d09e6.1585059896.git.mchehab+huawei@kernel.org>
In-Reply-To: <e39e656c49c05829f0cf9affd7918818351d09e6.1585059896.git.mchehab+huawei@kernel.org>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 24 Mar 2020 21:27:12 -0300
Message-ID: <CAAEAJfDQ4k-MaZrQ6roNkGL=uFEhzPe2Wh+p2ymJ0q_2Ee-JPg@mail.gmail.com>
Subject: Re: [PATCH v2 02/20] media: Kconfig: not all V4L2 platform drivers
 are for camera
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A few more comments...

On Tue, 24 Mar 2020 at 11:26, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> When the platform drivers got added, they were all part of
> complex camera support. This is not the case anymore, as we
> now have codecs and other stuff there too.
>
> So, fix the dependencies, in order to not require users to
> manually select something that it doesn't make sense.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/Kconfig          | 3 +--
>  drivers/media/platform/Kconfig | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
[..]
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index e01bbb9dd1c1..34f40c2c8c45 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -5,7 +5,6 @@
>
>  menuconfig V4L_PLATFORM_DRIVERS
>         bool "V4L platform devices"

It would be more consistent to have "V4L platform drivers".
Same applies on other _DRIVER menus with "devices" descriptions.

> -       depends on MEDIA_CAMERA_SUPPORT

Also, this same change is needed on V4L_MEM2MEM_DRIVERS.

Thanks,
Ezequiel
