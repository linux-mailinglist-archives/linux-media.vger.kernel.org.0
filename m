Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 670211627D5
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 15:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgBROO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 09:14:57 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46700 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgBROO5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 09:14:57 -0500
Received: by mail-oi1-f195.google.com with SMTP id a22so20180578oid.13
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2020 06:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hujydpLDAIwrQEmjt1moUxKixDzmIxfIWJaumohuz2g=;
        b=K9LdXn685lyoQKi12Lal8eKFtSVF7O6kGgeme9bWuIGw2C/AaTib0jfa9KosLkaM5D
         3VMESgody7G0LQMX8ACqLGMfERvyMBlyEaR96uTEpAYMdfi8ZzKtAW1ba3Lh8f65UByw
         dpyVr0qMlsKPd0TT23MLxHtjNbkiKXMbEZNF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hujydpLDAIwrQEmjt1moUxKixDzmIxfIWJaumohuz2g=;
        b=dOlj789YiVYz3VuBY1xNyvr09TroAcoe2A9+H2M4j+8hooNL20SlDqY9sZ/1uDYDrh
         Ln24uZvl/SrXGeBarWo1hhrIAeoFo+/ti4BaNBceV1r2ikfVp+xOCrzmcB3mfxK0N/8F
         TnONnJajteJFWIf4TLzT2wljZEAKd76lBOS/JkhOMKQ/8/08YYLHu1UyTVJH4Js/cxjR
         0X3Z59Uw6UFg5mMTEEYaJ7/0X/IQ4cwTA4zskQW1RxGXs4voESvVZtTUUa897CN0q2jr
         7lNX5sGW/reE+DQBhAH+fxipX21wuVJG9FccTM4mxCLOoLTTfx9orB+g48wwmj7msyUf
         4dsQ==
X-Gm-Message-State: APjAAAVaGmOD95TlENSFkP+abzKNlFsd9zKMggvvdvkr/LaXY8LvIvpw
        krv1P2VStVJ03Itq5DXyM8CkyqbkoLbXjrc79U08xA==
X-Google-Smtp-Source: APXvYqxmhP/i2CWA/jLwh/X5PQyBCOK06TIIexdtLpaooBTFKMia+m5jnBCXaOMn+y8Wem2t7DpcOrgTUON6RMqg5CE=
X-Received: by 2002:a05:6808:319:: with SMTP id i25mr1373711oie.128.1582035295462;
 Tue, 18 Feb 2020 06:14:55 -0800 (PST)
MIME-Version: 1.0
References: <20191029104049.9011-1-christian.koenig@amd.com>
 <20191029104049.9011-2-christian.koenig@amd.com> <20191105102045.GC10326@phenom.ffwll.local>
 <cb607ed5-eaeb-5332-d1de-77cae8512c1d@gmail.com>
In-Reply-To: <cb607ed5-eaeb-5332-d1de-77cae8512c1d@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 18 Feb 2020 15:14:44 +0100
Message-ID: <CAKMK7uHuD1PP4uX2868=oY7mbpfWr76bjjFd9GreP=fm+b17gA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dma-buf: add dynamic DMA-buf handling v14
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 18, 2020 at 2:20 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 05.11.19 um 11:20 schrieb Daniel Vetter:
> > On Tue, Oct 29, 2019 at 11:40:45AM +0100, Christian K=C3=B6nig wrote:
> > [SNIP]
> >> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >> index d377b4ca66bf..ce293cee76ed 100644
> >> --- a/drivers/dma-buf/dma-buf.c
> >> +++ b/drivers/dma-buf/dma-buf.c
> >> @@ -529,6 +529,10 @@ struct dma_buf *dma_buf_export(const struct dma_b=
uf_export_info *exp_info)
> >>                  exp_info->ops->dynamic_mapping))
> >>              return ERR_PTR(-EINVAL);
> >>
> >> +    if (WARN_ON(!exp_info->ops->dynamic_mapping &&
> >> +                (exp_info->ops->pin || exp_info->ops->unpin)))
> >> +            return ERR_PTR(-EINVAL);
> > Imo make this stronger, have a dynamic mapping iff there's both a pin a=
nd
> > unpin function. Otherwise this doesn't make a lot of sense to me.
>
> I want to avoid that for the initial implementation. So far dynamic only
> meant that we have the new locking semantics.
>
> We could make that mandatory after this patch set when amdgpu is
> migrated and has implemented the necessary callbacks.

Ok if we go with CONFIG_EXPERIMENTAL_DYN_DMABUF or whatever it's going
to be called I'm totally ok if we just note this somewhere as a FIXME
(maybe just inline in a code comment next to the main #ifdef in
dma-buf.h. Same for all your other comments below.

Cheers, Daniel

>
> >> [SNIP]
> >> @@ -821,13 +877,23 @@ struct sg_table *dma_buf_map_attachment(struct d=
ma_buf_attachment *attach,
> >>              return attach->sgt;
> >>      }
> >>
> >> -    if (dma_buf_is_dynamic(attach->dmabuf))
> >> +    if (dma_buf_is_dynamic(attach->dmabuf)) {
> >>              dma_resv_assert_held(attach->dmabuf->resv);
> >> +            if (!attach->importer_ops->move_notify) {
> > Imo just require ->move_notify for importers that give you an ops
> > function. Doesn't really make sense to allow dynamic without support
> > ->move_notify.
>
> Same thing here. We could make that mandatory and clean it up after
> migrating amdgpu.
>
> >> [SNIP]
> >> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >> index af73f835c51c..7456bb937635 100644
> >> --- a/include/linux/dma-buf.h
> >> +++ b/include/linux/dma-buf.h
> >> @@ -93,14 +93,40 @@ struct dma_buf_ops {
> >>       */
> >>      void (*detach)(struct dma_buf *, struct dma_buf_attachment *);
> >>
> >> +    /**
> >> +     * @pin:
> >> +     *
> >> +     * This is called by dma_buf_pin and lets the exporter know that =
the
> >> +     * DMA-buf can't be moved any more.
> > I think we should add a warning here that pinning is only ok for limite=
d
> > use-cases (like scanout or similar), and not as part of general buffer
> > management.
> >
> > i915 uses temporary pins through it's execbuf management (and everywher=
e
> > else), so we have a _lot_ of people in dri-devel with quite different
> > ideas of what this might be for :-)
>
> Yeah, that is also a good idea for us. Wrote a one liner, but you might
> want to double check the wording.
>
> >> [SNIP]
> >> @@ -141,9 +167,6 @@ struct dma_buf_ops {
> >>       *
> >>       * This is called by dma_buf_unmap_attachment() and should unmap =
and
> >>       * release the &sg_table allocated in @map_dma_buf, and it is man=
datory.
> >> -     * It should also unpin the backing storage if this is the last m=
apping
> >> -     * of the DMA buffer, it the exporter supports backing storage
> >> -     * migration.
> > This is still valid for non-dynamic exporters. Imo keep but clarify tha=
t.
>
> OK, changed.
>
> >> [SNIP]
> >> @@ -438,16 +491,19 @@ static inline bool dma_buf_is_dynamic(struct dma=
_buf *dmabuf)
> >>   static inline bool
> >>   dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
> >>   {
> >> -    return attach->dynamic_mapping;
> >> +    return !!attach->importer_ops;
> > Hm why not do the same for exporters, and make them dynamic iff they ha=
ve
> > pin/unpin?
>
> Same thing as before, to migrate amdgpu to the new interface first and
> then make it mandatory.
>
> I think I will just write a cleanup patch into the series which comes
> after the amdgpu changes.
>
> Thanks,
> Christian.



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
