Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6CC3191DEA
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 01:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgCYAPh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 20:15:37 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:42372 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbgCYAPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 20:15:37 -0400
Received: by mail-ua1-f68.google.com with SMTP id m18so122850uap.9
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2020 17:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mAdTQptNFRB90va1oFe34xXDEx5hodOJMrHH9X7ZVgw=;
        b=ypZqe3r23vC5JFNZHhN9NF0wAcK2wX6fQAOnWi0xz3NVojYm9Xo9AZH/o4HK+dmXEr
         LhxUkys3w6oiSmBy87evog2O2lfkmxzE4YRUhYkXmY3145OU1ONnvm9LEngbE2DS7pw0
         sH0aRWyLwGwPj4AJ6d39WQPVcJN+VuGFcteh1KjOTRjqlXWUKppvOZDOa3BmzZEkIZQD
         C0vsafUNC7m379tURfQX/n/LF1BptzT5EbSwrfyei9JiffNQUareBofpQJaJ26DEx1AD
         7whdMJ5shdtaR1sVMHQ8Pr1b1ePoPtTP96UpCx+Nul12q/gJMGiRgytROhsanlGab7FE
         8B4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mAdTQptNFRB90va1oFe34xXDEx5hodOJMrHH9X7ZVgw=;
        b=hqCxXTrOrwTqI6fJOUdF4iLgISMDyGB6YJKlLefFkzipioLNgrWYuZZG2A1Hwyez9Q
         h2Jn4GO10fvnQq5EtfPjxRmDvI9nHR4c5seaX4lToOIuLJShJ6+RDIMDk4Dmd52Ay7PL
         nhQ56kWv7VdPCL5Ma+DhE3jrnH3YRFmuUw8sdlWkn+Imhz1LIwHW6/9hj5FkEhkUttwr
         AdUlzLTKzCs0Z9yTX8820SjgByww4rh1kKFbZvn3pG05EmiBr7UuYr3XYlrvCpbEOKAS
         c1nqUFNYLxTtoCAf9eqYr6pjXQuRgKhR6w7IuRhDrs2w68jbDv0hd7wYMc58TE5/Xmb+
         scVg==
X-Gm-Message-State: ANhLgQ3ZpYUQMaW8yGpjHhcN9ZGr7sDd8lNMeguX+yBwBQgyzq1RazTu
        46RqwMMuo29Xpl5Vl+eUaViqaRNyqtZ3dFIGfmb+fIlUkEKsrg==
X-Google-Smtp-Source: ADFU+vueNfZAEteOkuxTmhHL6e0X/c2p6XFW9JW1BLPL3jgeqwvqLb0ct5lgwQeQi3AyHmBe1pbqlyU/HdCCaf6lAcY=
X-Received: by 2002:a9f:2478:: with SMTP id 111mr622936uaq.0.1585095334646;
 Tue, 24 Mar 2020 17:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585059896.git.mchehab+huawei@kernel.org> <e39e656c49c05829f0cf9affd7918818351d09e6.1585059896.git.mchehab+huawei@kernel.org>
In-Reply-To: <e39e656c49c05829f0cf9affd7918818351d09e6.1585059896.git.mchehab+huawei@kernel.org>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 24 Mar 2020 21:15:22 -0300
Message-ID: <CAAEAJfDB27v4WoxKf_8w+LLfKo_YucOwSOEtA7pi2erpcAxxLQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/20] media: Kconfig: not all V4L2 platform drivers
 are for camera
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index 9dfea5c4b6ab..4af21fa73fcf 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -99,8 +99,7 @@ source "drivers/media/mc/Kconfig"
>  config VIDEO_DEV
>         tristate
>         depends on MEDIA_SUPPORT
> -       depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
> -       default y
> +       default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || V4L_PLATFORM_DRIVERS
>

This is missing V4L_MEM2MEM_DRIVERS. Without, some mem-to-mem drivers
will be hidden.

Thanks,
Ezequiel
