Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE3D31D449
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 04:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhBQDf2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 22:35:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhBQDf2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 22:35:28 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D649BC061574
        for <linux-media@vger.kernel.org>; Tue, 16 Feb 2021 19:34:46 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j19so19253416lfr.12
        for <linux-media@vger.kernel.org>; Tue, 16 Feb 2021 19:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K6ClV9WQZhTlq31fja027+gqOEx4sDzqdH+51wX1w3c=;
        b=c6Cq+38qOZ6JG95uMApK2jqKu6ZeTMD9XdRpuTu/hkf7fnO4hv/4m3mfTtIALc3/VQ
         mKAjxwQPOp5ikMNiVuEwPZF0hC0BMdwY83uWwZU6LwPBckBToQn0IpSdwfT+CprlaAnL
         XkBdEYlzCKqE+32Yon6sYtpEX8TjpNKEnUKAeW8k3ATf7ZfB/MGFhDAPRxTF8cuZA/Jy
         TLwBa2/KOIkeZr45wVIAZL8jLeoXkuENEb70vtFW1bYTtWTQ47vqwl6QqnTIwgZaf5RQ
         Nogzk4+PxQgYBRsqfsX1e3BWMnwAlBE19EYSvarXzAicZTATb7PeVDrGbVCf4pntFhd+
         aktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K6ClV9WQZhTlq31fja027+gqOEx4sDzqdH+51wX1w3c=;
        b=XIr/nEspIvnde9yjHL3dHBEnhNkwhpXA/iMvF3afkryb27ap9IQrI9DNQX4Sy9spqF
         IuDjQ6b/Uo2+klL95UFjOYWEj5UUucl9VXEFA85CRnrnMGaGGpNubBjkrAjrZybggW67
         xw94mcqFlMOWtvCGRNp/crvEJ7/+W0Yf1yG9SmiQVOKq+U2irz7+DKxp1FVuvbGqKNda
         k9U3h/PchUL50zxR9o6Hr+GuoVIwKmSsqxl1nbNR0qzTebvXLtLshS5mq0T1qcfuvw2j
         b0AsPl0msetryJ82Tn/mHkE05YSPJ2wDeu/tKVbBGdHo3Wzjt3cEHhsvtLV+GgdY+Ben
         bI2g==
X-Gm-Message-State: AOAM5312thRqfI7XliMt1g2hjBsin2lFhzSgOMw33gKxZE9WOxttDy5+
        LLlQ9U09S1hMeH0O9oIFBTkhlPJAKi/PMthwbA1aBQ==
X-Google-Smtp-Source: ABdhPJxysxIy/VrbdaSC0XmUvIn0Un9Pwkqyakx/MSJGvy6j8MgI5c2OADHkkDaLXvGbmN91jMuwVWZUVQm8jiSYH4E=
X-Received: by 2002:a19:9c5:: with SMTP id 188mr12965565lfj.626.1613532885268;
 Tue, 16 Feb 2021 19:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch> <CALAqxLWqgLXxry8FhVSK9xC2geiPOA+fTdC-oRENS9iG5AJz=A@mail.gmail.com>
In-Reply-To: <CALAqxLWqgLXxry8FhVSK9xC2geiPOA+fTdC-oRENS9iG5AJz=A@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 16 Feb 2021 19:34:33 -0800
Message-ID: <CALAqxLUzbpNfebqAp7E4A=fNhyJntBOAjjBumFSDco73jp=srQ@mail.gmail.com>
Subject: Re: [PATCH] drm-buf: Add debug option
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        David Stevens <stevensd@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 16, 2021 at 7:30 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Jan 13, 2021 at 6:06 AM Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
> >
> > We have too many people abusing the struct page they can get at but
> > really shouldn't in importers. Aside from that the backing page might
> > simply not exist (for dynamic p2p mappings) looking at it and using it
> > e.g. for mmap can also wreak the page handling of the exporter
> > completely. Importers really must go through the proper interface like
> > dma_buf_mmap for everything.
> >
> > Just an RFC to see whether this idea has some stickiness. default y
> > for now to make sure intel-gfx-ci picks it up too.
> >
> > I'm semi-tempted to enforce this for dynamic importers since those
> > really have no excuse at all to break the rules.
> >
> > Unfortuantely we can't store the right pointers somewhere safe to make
> > sure we oops on something recognizable, so best is to just wrangle
> > them a bit by flipping all the bits. At least on x86 kernel addresses
> > have all their high bits sets and the struct page array is fairly low
> > in the kernel mapping, so flipping all the bits gives us a very high
> > pointer in userspace and hence excellent chances for an invalid
> > dereference.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: David Stevens <stevensd@chromium.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  drivers/dma-buf/Kconfig   |  8 +++++++
> >  drivers/dma-buf/dma-buf.c | 49 +++++++++++++++++++++++++++++++++++----
> >  2 files changed, 53 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > index 4f8224a6ac95..cddb549e5e59 100644
> > --- a/drivers/dma-buf/Kconfig
> > +++ b/drivers/dma-buf/Kconfig
> > @@ -50,6 +50,14 @@ config DMABUF_MOVE_NOTIFY
> >           This is marked experimental because we don't yet have a consi=
stent
> >           execution context and memory management between drivers.
> >
> > +config DMABUF_DEBUG
> > +       bool "DMA-BUF debug checks"
> > +       default y
> > +       help
> > +         This option enables additional checks for DMA-BUF importers a=
nd
> > +         exporters. Specifically it validates that importers do not pe=
ek at the
> > +         underlying struct page when they import a buffer.
> > +
> >  config DMABUF_SELFTESTS
> >         tristate "Selftests for the dma-buf interfaces"
> >         default n
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 1c9bd51db110..6e4725f7dfde 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -666,6 +666,30 @@ void dma_buf_put(struct dma_buf *dmabuf)
> >  }
> >  EXPORT_SYMBOL_GPL(dma_buf_put);
> >
> > +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *atta=
ch,
> > +                                      enum dma_data_direction directio=
n)
> > +{
> > +       struct sg_table *sg_table;
> > +
> > +       sg_table =3D attach->dmabuf->ops->map_dma_buf(attach, direction=
);
> > +
> > +#if CONFIG_DMABUF_DEBUG
>
>
> Hey Daniel,
>   I just noticed a build warning in a tree I pulled this patch into.
> You probably want to use #ifdef here, as if its not defined we see:
> drivers/dma-buf/dma-buf.c:813:5: warning: "CONFIG_DMABUF_DEBUG" is not
> defined, evaluates to 0 [-Wundef]
>
Nevermind. I see its already fixed in drm-misc-next.

thanks
-john
