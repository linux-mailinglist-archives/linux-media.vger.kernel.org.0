Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD6F78D2AA
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 06:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237278AbjH3EAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 00:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241950AbjH3EAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 00:00:11 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E62ECF0
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 21:00:01 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4122129390eso18516961cf.0
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 21:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693368000; x=1693972800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtC3DCp+X9tV9ppSun12PymlfvzemQzP6kuCeERxDc4=;
        b=Onorv+TB2qY899r+6p+Gkc7KLrL5/8AHRGKQsFVpO6W+Q2wn5/XFx5vAByOF1d/R/S
         ug7hm01FVeuBh5QmLfVEJQX6Z7u70SAKSYgnb1J/2TlWzqTG0A2yofjZCRXqt+qVxCun
         DDOVPsOzxPfOEppMDQzj8Fj8UPPFS+1hmCdG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693368000; x=1693972800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtC3DCp+X9tV9ppSun12PymlfvzemQzP6kuCeERxDc4=;
        b=MkqBRSmMgc+bFXmeOP4UNUn7lySwxYVDHvW2UBU3LM/MlkPFstGCmNt7Spr/tQV6SU
         REOi71XPMJTvW55zsvn/Fz9o8ic37eQOGwuKfOIQaTmZTCV0gpKxiEH3cNgyvHU+QmvG
         yaeEz1e3KGVhkiQur5KwBnEykC6dO9LsxpGMcoZL/7AzPDtKxwGUm+EmSs3J0Us+xZ0V
         dzooe2s2W98iNlR0+MIS5uRDllLuRHegM+EjkAUH70y7j+BsfdCulTKPeiozwULK1d3h
         EdxMxihgQ5EIFfG2OHQK8fm8T21PxJcLDFJQkg5pm8iLpYH0WRfNJjqdZf9Nz9bfOxwd
         2WSw==
X-Gm-Message-State: AOJu0Yx2l487IAB4d4MNksqWa2+KyJhn6ZSNjOkIZKsJQmRZqqecGeS2
        KBXoADs1eHU1FewvM0cwSB0/Pyhy7Xs1wGgDy8npgw==
X-Google-Smtp-Source: AGHT+IFM7V+03PjE0WZabnZrTponbqkhawQ0221m28LXSTAx3lgSiFIJHHq5KmW/51VqrziENtoH4Q==
X-Received: by 2002:ac8:5a86:0:b0:40e:13e5:9663 with SMTP id c6-20020ac85a86000000b0040e13e59663mr1129957qtc.47.1693367999953;
        Tue, 29 Aug 2023 20:59:59 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id d13-20020ac800cd000000b00410957eaf3csm3499038qtg.21.2023.08.29.20.59.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 20:59:59 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-63f7c242030so26344456d6.3
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 20:59:59 -0700 (PDT)
X-Received: by 2002:a0c:a609:0:b0:64a:2b04:c10a with SMTP id
 s9-20020a0ca609000000b0064a2b04c10amr970831qva.29.1693367998728; Tue, 29 Aug
 2023 20:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230828075420.2009568-1-anle.pan@nxp.com> <CAAFQd5Cn3xQroyYtC+m+pk1jOE5i3H+FGr-y8zqhaf0Yo5p-1Q@mail.gmail.com>
 <deb735ce-7de1-e59a-9de4-1365b374b417@arm.com>
In-Reply-To: <deb735ce-7de1-e59a-9de4-1365b374b417@arm.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 30 Aug 2023 12:59:41 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DHUU4zb-J2MvtDXohwKttR_i9_C68RPjn82MFVEsjopw@mail.gmail.com>
Message-ID: <CAAFQd5DHUU4zb-J2MvtDXohwKttR_i9_C68RPjn82MFVEsjopw@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2-dma-sg: limit the sg segment size
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Anle Pan <anle.pan@nxp.com>, Christoph Hellwig <hch@lst.de>,
        m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hui.fang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 29, 2023 at 8:14=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2023-08-29 11:03, Tomasz Figa wrote:
> > Hi Anle,
> >
> > On Mon, Aug 28, 2023 at 8:57=E2=80=AFAM Anle Pan <anle.pan@nxp.com> wro=
te:
> >>
> >> When allocating from pages, the size of the sg segment is unlimited an=
d
> >> the default is UINT_MAX. This will cause the DMA stream mapping failed
> >> later with a "swiotlb buffer full" error.
> >
> > Thanks for the patch. Good catch.
> >
> >> The default maximum mapping
> >> size is 128 slots x 2K =3D 256K, determined by "IO_TLB_SEGSIZE".
> >> To fix the issue, limit the sg segment size according to
> >> "dma_max_mapping_size" to match the mapping limit.
> >>
> >> Signed-off-by: Anle Pan <anle.pan@nxp.com>
> >> ---
> >>   drivers/media/common/videobuf2/videobuf2-dma-sg.c | 9 +++++++--
> >>   1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drive=
rs/media/common/videobuf2/videobuf2-dma-sg.c
> >> index fa69158a65b1..b608a7c5f240 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >> @@ -105,6 +105,7 @@ static void *vb2_dma_sg_alloc(struct vb2_buffer *v=
b, struct device *dev,
> >>          struct sg_table *sgt;
> >>          int ret;
> >>          int num_pages;
> >> +       size_t max_segment =3D 0;
> >>
> >>          if (WARN_ON(!dev) || WARN_ON(!size))
> >>                  return ERR_PTR(-EINVAL);
> >> @@ -134,8 +135,12 @@ static void *vb2_dma_sg_alloc(struct vb2_buffer *=
vb, struct device *dev,
> >>          if (ret)
> >>                  goto fail_pages_alloc;
> >>
> >> -       ret =3D sg_alloc_table_from_pages(buf->dma_sgt, buf->pages,
> >> -                       buf->num_pages, 0, size, GFP_KERNEL);
> >> +       if (dev)
>
> dev can't be NULL, see the context above.
>
> >> +               max_segment =3D dma_max_mapping_size(dev);
> >> +       if (max_segment =3D=3D 0)
> >> +               max_segment =3D UINT_MAX;
> >> +       ret =3D sg_alloc_table_from_pages_segment(buf->dma_sgt, buf->p=
ages,
> >> +               buf->num_pages, 0, size, max_segment, GFP_KERNEL);
> >
> > One thing that I'm not sure about here is that we use
> > sg_alloc_table_from_pages_segment(), but we actually don't pass the
> > max segment size (as returned by dma_get_max_seg_size()) to it.
> > I'm also not exactly sure what's the difference between "max mapping
> > size" and "max seg size".
> > +Robin Murphy +Christoph Hellwig I think we could benefit from your
> > expertise here.
>
> dma_get_max_seg_size() represents a capability of the device itself,
> namely the largest contiguous range it can be programmed to access in a
> single DMA descriptor/register/whatever. Conversely,
> dma_max_mapping_size() is a capablity of the DMA API implementation, and
> represents the largest contiguous mapping it is guaranteed to be able to
> handle (each segment in the case of dma_map_sg(), or the whole thing for
> dma_map_page()). Most likely the thing you want here is
> min_not_zero(max_seg_size, max_mapping_size).
>

The extra complexity needed here convinces me even more that we need a help=
er...

> > Generally looking at videobuf2-dma-sg, I feel like we would benefit
> > from some kind of dma_alloc_table_from_pages() that simply takes the
> > struct dev pointer and does everything necessary.
>
> Possibly; this code already looks lifted from drm_prime_pages_to_sg(),
> and if it's needed here then presumably vb2_dma_sg_get_userptr() also
> needs it, at the very least.

That code probably predates drm_prime_pages_to_sg(), but that's
probably also the reason that it has its own issues...
I'm tempted to send a patch adding such a helper, but Christoph didn't
sound very keen on that idea. Hmm.

Best regards,
Tomasz
