Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4B62744B5
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 16:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgIVOv6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 10:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgIVOv5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 10:51:57 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA19C061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 07:51:57 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so14367734ljj.12
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bzR1gxnRoZXjib0y+EllAgb8353tQk04gCemc3kID8w=;
        b=Zy8iW9TQcugkIzEGW/pU5DvFHSWArgwWW5vg1vSaanKjEpSMvnoljwAIo9Pu44WJKy
         OIoRVAgmFjK8qGjrEHgenNyFUqGf1IQROkUhyLmm3Ba7ddEv7hz2PRAEyYSTDjzNt+xG
         tu5RLsuel0ENBLwXk8A2yFHVAavL0BH7T6JiXwgzxMFhkJMVYquQc18lQhmbwjH8Awcb
         rH0cnwkrxpxui9pgGiz9pGkG10OF1SSpzfMzB5zrz4MEfaetf4yi+GJv/dKacSGIf0GF
         9RK9n80GHWdYuBN6iooSVgsSHbrifpli/ZWXsBIvpUTxGWvDhxU86W5gnQtoK5Iyvg+K
         VEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bzR1gxnRoZXjib0y+EllAgb8353tQk04gCemc3kID8w=;
        b=RVfwQjFHfDbEevwR4sImyFjpyq0raXy3dh8iRE8p+mdjwsYT5qLvGvkeBiBbCz+Uax
         U9/Y+MRlPo375+qfzuBKubBqG5hx0WKYD21fGi+TAfsNDhukSPr1ITjExFqUKF4skq1Y
         r8CzNLnWIsBNb9JDE/vTteQ8BPvU+wD6dsVV209ewEgcfuWQrxauaurC7UgNMsDjULdU
         2+chgZBEdqR7IgYLFx/zLeZ9eGoENVx5DbtWEkJI9zG27voJoXVjlNHggkLfaK2jtE5V
         L4IfyTOIKDGCS3g1K9KgFNZqcBsTpAWzNw8Jq+nZdbh2+Nc1W/+7SLVPxbqh5e/OZJTN
         lSFQ==
X-Gm-Message-State: AOAM530QhngAqwafm3WBApoLkt659S+mubBsnu2R+KwN4jn9UWBMvDIG
        87UDAvte+5ZPnsKBDkbJdpOjIYlgBp4NrXR+O8c8e6dh9+26Kh1Q
X-Google-Smtp-Source: ABdhPJzKH8OQ0ibiB5TcLvCcwuehtiNBqqIIuvG+ZJlWITOsxvhm5s/+BLFL6uh/wql70FfMyu1bYxOEWOl2C3HREcI=
X-Received: by 2002:a05:651c:552:: with SMTP id q18mr1591731ljp.248.1600786315624;
 Tue, 22 Sep 2020 07:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <1600761208-45229-1-git-send-email-zou_wei@huawei.com> <16d720b7-9bf3-ad3a-0785-76f21c87c9e1@amd.com>
In-Reply-To: <16d720b7-9bf3-ad3a-0785-76f21c87c9e1@amd.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 22 Sep 2020 20:21:42 +0530
Message-ID: <CAO_48GHVUnHm38nPSc3zYU7ZoFmZDTZdc7Du5pyrVbz6ytwgEA@mail.gmail.com>
Subject: Re: [PATCH -next] dma-buf: heaps: Remove unused variable ret
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Zou Wei <zou_wei@huawei.com>, "Andrew F. Davis" <afd@ti.com>,
        "(Exiting) Benjamin Gaignard" <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Zou,

On Tue, 22 Sep 2020 at 18:12, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 22.09.20 um 09:53 schrieb Zou Wei:
> > This patch fixes below warnings reported by coccicheck
> >
> > ./drivers/dma-buf/heaps/heap-helpers.c:202:5-8: Unneeded variable: "ret=
". Return "0" on line 215
> >
> > Signed-off-by: Zou Wei <zou_wei@huawei.com>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Going to pick this up for drm-misc-next.
Thanks Christian!
Fwiw, feel free to add my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> > ---
> >   drivers/dma-buf/heaps/heap-helpers.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/hea=
ps/heap-helpers.c
> > index d0696cf..7969510 100644
> > --- a/drivers/dma-buf/heaps/heap-helpers.c
> > +++ b/drivers/dma-buf/heaps/heap-helpers.c
> > @@ -199,7 +199,6 @@ static int dma_heap_dma_buf_begin_cpu_access(struct=
 dma_buf *dmabuf,
> >   {
> >       struct heap_helper_buffer *buffer =3D dmabuf->priv;
> >       struct dma_heaps_attachment *a;
> > -     int ret =3D 0;
> >
> >       mutex_lock(&buffer->lock);
> >
> > @@ -212,7 +211,7 @@ static int dma_heap_dma_buf_begin_cpu_access(struct=
 dma_buf *dmabuf,
> >       }
> >       mutex_unlock(&buffer->lock);
> >
> > -     return ret;
> > +     return 0;
> >   }
> >
> >   static int dma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>

Best,
Sumit.
