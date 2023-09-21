Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A43277A99AF
	for <lists+linux-media@lfdr.de>; Thu, 21 Sep 2023 20:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjIUSRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Sep 2023 14:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjIUSQn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Sep 2023 14:16:43 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5EFA9D7
        for <linux-media@vger.kernel.org>; Thu, 21 Sep 2023 10:07:18 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-34fe2814b0dso3942355ab.3
        for <linux-media@vger.kernel.org>; Thu, 21 Sep 2023 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695316037; x=1695920837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uy5T9PYUOt3mNwpfqS7Gt38WpmrbAJ+D4814w5GplsI=;
        b=BpJyMKCxSSBiG409dxNArnThE5i0SHV56t3Xgdps/vh7kviqTbj1HcCK7aFTPZZmGG
         tajGi3SEHrrZzCCvTkPsM+MXK1u0hXOo0kWpZzFMGNIaBwIyPhA+a26CMEpCf05Ziqzs
         2bay1YvoQfKjfkW2uv0CM7VTWze2jnsuxA4dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695316037; x=1695920837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uy5T9PYUOt3mNwpfqS7Gt38WpmrbAJ+D4814w5GplsI=;
        b=Sn1nV92yAg+De+2IxB6slyipnW89ayalv8LP4UxTxoe+fWULn9hDs2J1oh00peJ9R3
         BivJmPwq8R3SLHFk37jHEzahg72ZSRs4tltbTnsLsMWZIaZThAFLJ2gXUUE4Zv2vNlwg
         NjXiiDq+ZgnvTXu9iOQlqGy63gkHy/BqXfaBLc6nwVnaNyxj8Fwh05zv158Jw26wSAnt
         0MVhv8NL1haGoEiBZiixbHYYcPvD/HI4+lC7QuyxPDVNUS+1jYMSwpmPus1oqn2qEnuF
         8QajnmrMPHadjJPq4I2ZbLPeWYy1R64cV8BhlIcEdfQJ4qdDFImGqcrFT9Fcg4uiAdVu
         7sLw==
X-Gm-Message-State: AOJu0YxPRDEAh1RqF72aQpCdQP1WyaaWr3sEFCs+ia/YSvOWuDxmPngT
        kTZy2sDMi73Vp7A3XKX7g3kss234qMKFv6g9si3RdA==
X-Google-Smtp-Source: AGHT+IG1DW4Wm/IyBIS+iVacyJOFULOFf05Zh6DsR7cuHzrn4JbkYWeOCTYmV0ije0Q4fxINZcyMIg==
X-Received: by 2002:a1f:d546:0:b0:495:ba08:79dd with SMTP id m67-20020a1fd546000000b00495ba0879ddmr5698187vkg.5.1695285321859;
        Thu, 21 Sep 2023 01:35:21 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id cn13-20020a056122428d00b004997b237391sm73177vkb.38.2023.09.21.01.35.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 01:35:20 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-496a2ff7780so313109e0c.2
        for <linux-media@vger.kernel.org>; Thu, 21 Sep 2023 01:35:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3c8a:b0:452:b96c:313b with SMTP id
 c10-20020a0561023c8a00b00452b96c313bmr1183738vsv.13.1695285320162; Thu, 21
 Sep 2023 01:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230914145812.12851-1-hui.fang@nxp.com> <CAAFQd5CcN+TiVd8vhMxQRbmrJuBGYwL5d6C0fKzOy4ujjM_JMQ@mail.gmail.com>
 <353919fd-932e-5d81-6ac5-7b51117366cd@arm.com>
In-Reply-To: <353919fd-932e-5d81-6ac5-7b51117366cd@arm.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 21 Sep 2023 17:35:03 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ABTuR9JSwsd+9mZ3Q66sY9X3NSx+G-8kJ_XRTeT-x9Bw@mail.gmail.com>
Message-ID: <CAAFQd5ABTuR9JSwsd+9mZ3Q66sY9X3NSx+G-8kJ_XRTeT-x9Bw@mail.gmail.com>
Subject: Re: [PATCH] MA-21654 Use dma_alloc_pages in vb2_dma_sg_alloc_compacted
To:     Robin Murphy <robin.murphy@arm.com>, Fang Hui <hui.fang@nxp.com>
Cc:     Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, anle.pan@nxp.com,
        xuegang.liu@nxp.com, Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 21, 2023 at 1:54=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 20/09/2023 8:41 am, Tomasz Figa wrote:
> > Hi Fang,
> >
> > On Thu, Sep 14, 2023 at 4:41=E2=80=AFPM Fang Hui <hui.fang@nxp.com> wro=
te:
> >>
> >> On system with "CONFIG_ZONE_DMA32=3Dy", if the allocated physical addr=
ess is
> >
> > First of all, thanks a lot for the patch! Please check my review commen=
ts below.
> >
> > Is CONFIG_ZONE_DMA32 really the factor that triggers the problem? My
> > understanding was that the problem was that the hardware has 32-bit
> > DMA, but the system has physical memory at addresses beyond the first
> > 4G.
>
> Indeed, without ZONE-DMA32 it would be difficult for any allocator to
> support this at all. SWIOTLB is merely a symptom - if it wasn't enabled,
> the dma_map_sgtable() operation would just fail entirely when any page
> is beyond the device's reach.
>
> >> greater than 4G, swiotlb will be used. It will lead below defects.
> >> 1) Impact performance due to an extra memcpy.
> >> 2) May meet below error due to swiotlb_max_mapping_size()
> >>     is 256K (IO_TLB_SIZE * IO_TLB_SEGSIZE).
> >> "swiotlb buffer is full (sz: 393216 bytes), total 65536 (slots),
> >> used 2358 (slots)"
> >>
> >> To avoid those defects, use dma_alloc_pages() instead of alloc_pages()
> >> in vb2_dma_sg_alloc_compacted().
> >>
> >> Suggested-by: Tomasz Figa <tfiga@chromium.org>
> >> Signed-off-by: Fang Hui <hui.fang@nxp.com>
> >> ---
> >>   drivers/media/common/videobuf2/videobuf2-dma-sg.c | 11 +++++++----
> >>   1 file changed, 7 insertions(+), 4 deletions(-)
> >>
> >
> > Please remove MA-21654 from the subject and prefix it with the right
> > tags for the path (`git log drivers/media/common/videobuf2` should be
> > helpful to find the right one).
> >
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drive=
rs/media/common/videobuf2/videobuf2-dma-sg.c
> >> index 28f3fdfe23a2..b938582c68f4 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >> @@ -58,7 +58,7 @@ struct vb2_dma_sg_buf {
> >>   static void vb2_dma_sg_put(void *buf_priv);
> >>
> >>   static int vb2_dma_sg_alloc_compacted(struct vb2_dma_sg_buf *buf,
> >> -               gfp_t gfp_flags)
> >> +               gfp_t gfp_flags, struct device *dev)
> >
> > FWIW buf->dev already points to the right device - although we would
> > need to move the assignment in vb2_dma_sg_alloc() to a place higher in
> > that function before calling this function.
> >
> >>   {
> >>          unsigned int last_page =3D 0;
> >>          unsigned long size =3D buf->size;
> >> @@ -67,6 +67,7 @@ static int vb2_dma_sg_alloc_compacted(struct vb2_dma=
_sg_buf *buf,
> >>                  struct page *pages;
> >>                  int order;
> >>                  int i;
> >> +               dma_addr_t dma_handle;
> >>
> >>                  order =3D get_order(size);
> >>                  /* Don't over allocate*/
> >> @@ -75,8 +76,9 @@ static int vb2_dma_sg_alloc_compacted(struct vb2_dma=
_sg_buf *buf,
> >>
> >>                  pages =3D NULL;
> >>                  while (!pages) {
> >> -                       pages =3D alloc_pages(GFP_KERNEL | __GFP_ZERO =
|
> >> -                                       __GFP_NOWARN | gfp_flags, orde=
r);
> >> +                       pages =3D dma_alloc_pages(dev, PAGE_SIZE << or=
der, &dma_handle,
> >
> > Hmm, when I was proposing dma_alloc_pages(), I missed that it returns
> > a DMA handle. That on its own can be handled by saving the returned
> > handles somewhere in struct vb2_dma_sg_buf, but there is a bigger
> > problem - the function would actually create a mapping if the DMA
> > device requires some mapping management (e.g. is behind an IOMMU),
> > which is undesirable, because we create the mapping ourselves below
> > anyway...
> >
> > @Christoph Hellwig @Robin Murphy  I need your thoughts on this as
> > well. Would it make sense to have a variant of dma_alloc_pages() that
> > only allocates the pages, but doesn't perform the mapping? (Or a flag
> > that tells the implementation to skip creating a mapping.)
>
> As I mentioned before, I think it might make the most sense to make the
> whole thing into a "proper" dma_alloc_sgtable() function, which can then
> be used with dma_sync_sgtable_*() as dma_alloc_pages() is used with
> dma_sync_single_*() (and then dma_alloc_noncontiguous() clearly falls as
> the special in-between case).
>

Okay, so that is the same thing that I was proposing from the
beginning of the original thread that reported the swiotlb issues.
Somehow I got convinced that it wasn't well received. Thanks for
clarifying!

Then it sounds like we just need someone to implement it?

Let me CC +Sergey Senozhatsky for visibility as well.

Best regards,
Tomasz

> Thanks,
> Robin.
>
> >> +                               DMA_BIDIRECTIONAL,
> >
> > The right value should be already available in buf->dma_dir.
> >
> >> +                               GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN=
 | gfp_flags);
> >>                          if (pages)
> >>                                  break;
> >>
> >> @@ -96,6 +98,7 @@ static int vb2_dma_sg_alloc_compacted(struct vb2_dma=
_sg_buf *buf,
> >>          }
> >>
> >>          return 0;
> >> +
> >
> > Unnecessary blank line.
> >
> >>   }
> >>
> >>   static void *vb2_dma_sg_alloc(struct vb2_buffer *vb, struct device *=
dev,
> >> @@ -130,7 +133,7 @@ static void *vb2_dma_sg_alloc(struct vb2_buffer *v=
b, struct device *dev,
> >>          if (!buf->pages)
> >>                  goto fail_pages_array_alloc;
> >>
> >> -       ret =3D vb2_dma_sg_alloc_compacted(buf, vb->vb2_queue->gfp_fla=
gs);
> >> +       ret =3D vb2_dma_sg_alloc_compacted(buf, vb->vb2_queue->gfp_fla=
gs, dev);
> >>          if (ret)
> >>                  goto fail_pages_alloc;
> >>
> >> --
> >> 2.17.1
> >>
> >
> > We also need to use dma_free_pages() to free the memory.
> >
> > Best regards,
> > Tomasz
