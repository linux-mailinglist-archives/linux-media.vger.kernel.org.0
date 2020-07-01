Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B230B210A89
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 13:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730399AbgGALuy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 07:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730159AbgGALux (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 07:50:53 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F58AC061755
        for <linux-media@vger.kernel.org>; Wed,  1 Jul 2020 04:50:53 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 95so10520318otw.10
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2020 04:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NVob0ht+U8pNgfjDQrHBX34FcQW437wfU3ZeV7D0RuA=;
        b=bhcwQHJMxAGtFPyBQ5eY/2DzNvMQZ0gxJz25nmeWyZhHFQeXbzw7I1tU9yMrBSwbhq
         GpXzmc2d77jan86WU3lnLC/f37XAhq7I3nj/Ud5MxR2NsU+8qqrrenSJ8QT3PS3Yd2HO
         WZDJOl5abIE63DpXZWrwLlb1GWcV+wM/Xxc7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NVob0ht+U8pNgfjDQrHBX34FcQW437wfU3ZeV7D0RuA=;
        b=jc/HQnTRK5wuFm8869oU71YC30xv5olE2p7BGpqpxdz3XSGN+05WfkmOlZnbubektp
         S+ZNmXrqEONOWl6HrpwNa2LK1ljTxNRfM6Zw2k8b6VA7uuailFcLmYVYwokZ4tnmoUhY
         gWPq0myZO+HQHUmDkQbHP7n6E6/bYb/EarLC2GACuf2pld0aLhF0dkckuJLn1n8WDXV2
         8e6UuPKTyqkyZu9PJmIbYUP4JKJiml5DW6ajtvAd1wDfRljOgqipWv2Ibyxqk+ekW03K
         hgdk9uRRqXSQ3hEnhJcwyDnCZhY2CCwPI1xzlR+Yv4RoabzYX8/ATusp8qIx5Ac0Xe6R
         YQCw==
X-Gm-Message-State: AOAM530lcnAwJGmDY14zkAm5/Q84P3fjuR2yVlK8YGOwEsdtLpKldoHi
        kBgIpWJtrTX8Hx1/eJb6iS2EBAu/LgAeiJfr09+whw==
X-Google-Smtp-Source: ABdhPJzuhUYDGzoVqw7VfT6QA2g0y9nFhCw6PsVYMQvjENJx18Q3x1ONVY7LMMFKkczWIhYx3VaIrBiizht+fmKEFm8=
X-Received: by 2002:a9d:d55:: with SMTP id 79mr22087629oti.281.1593604252854;
 Wed, 01 Jul 2020 04:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200701112559.22669-1-christian.koenig@amd.com>
In-Reply-To: <20200701112559.22669-1-christian.koenig@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 1 Jul 2020 13:50:41 +0200
Message-ID: <CAKMK7uHqNaQPwATQf=Jfs6oQ=YEemHSHTEtC2=VqvNf+bMh_sQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as DMA-buf maintainer
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 1, 2020 at 1:26 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> As discussed on the list.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 40474982a21d..5d7130f8d342 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5089,6 +5089,7 @@ F:        fs/dlm/
>
>  DMA BUFFER SHARING FRAMEWORK
>  M:     Sumit Semwal <sumit.semwal@linaro.org>
> +M:     Christian K=C3=B6nig <christian.koenig@amd.com>
>  L:     linux-media@vger.kernel.org
>  L:     dri-devel@lists.freedesktop.org
>  L:     linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
