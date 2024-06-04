Return-Path: <linux-media+bounces-12493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC418FA8E1
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 05:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B951128277A
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 03:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B004513D62C;
	Tue,  4 Jun 2024 03:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DWFE1Vhh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D5E12E1CA
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 03:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717473384; cv=none; b=kuRvdemtv3N9uZ3eoM3iPvg/xsqq6ZfCb8UBXaCf/S1xS48U/dZ7KdX5rE8hc2iy3ZZK4TrG1YHBY60DipyH0zKXfoaPk5u/BNf87JV5QnI/4q79pr6DINibrubr9c7OP7S2VGZ2NWo43HgTC0cLlFqR/8TqF8FLqPMfK4KB6a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717473384; c=relaxed/simple;
	bh=mHXgPM0idrkvpWy4WEofMHfrZ2QLUXAxoJs7eU28Fv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwNOZeXLa1oJ2CNDn033MSfE9Gxo1dA1KoEg/g1/ysm/Sy4xRe+kjKoAdPtKCETIz2MpsxLx4GXItLYmrgQdFdWvj5oRTMTQlZ1kZdlLnfJ9SyyieFTdzwdCb2e0KS4BsAkj02WFNQeucuDH0mg0zE5wJToDwaJph4xkOQPqSd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DWFE1Vhh; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-24cbb884377so3036731fac.0
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2024 20:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717473381; x=1718078181; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glxAekBxG1qX120qrzwPVl/Cxyu5TyqDV6yGj04DPhY=;
        b=DWFE1VhhjQ3ToVNcuScI4qIgQmzZBiYYek4fEf7FRo+HF2JlNuS3UWMxAIp24Vd8Vq
         eyhVNANzsi+f3H1WH6n2yuHMUg8IRa5cP6/KdjYsPpbpoUiioZZgC819EnJdZpMouoa/
         t3sNxKmjoi26Z5jrHzdI5IELbp5bfl3yG8kIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717473381; x=1718078181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=glxAekBxG1qX120qrzwPVl/Cxyu5TyqDV6yGj04DPhY=;
        b=VBkN/nT5Do4Hu7HMl3wdCHirvYwVNR0ykfxpl4TyuZehxMzd28M+UGzfR+O+5cJjSz
         PY4uN29L4hIt9yiJzEp+9izv0+2vX39f0nftTOeljxguoG8XUZYpYIk559uKQ1ajnbsb
         DJ0V+Z4nuwvNaKHx7Y9O9I3RYNhzlT+E0FiT4iiAdgNhm5mDGsJhfdOs7A3Y4zrck6Cd
         03Cb8ZSFBTCAYNaSitZdb/dBz5Gw9W4Dzh5u8/8/CQHe7B1JPzyswYPdSBLZFhOW3VIo
         2wfSJsHA5GEWSWmicQjuw7eTgSxaw4Ocx1rV2ydB226ojugnJ654nJCOJjVDlybsvWr3
         Hqmg==
X-Forwarded-Encrypted: i=1; AJvYcCUZbVWbEVtfy+cMNAyRE02UmbD4X7mY6dGR/7840ptH6qBwfZ765q4vRY6vg9NRy54Z5UtGjSNPVG6Mx3tzzFHDd78FbzQKXBiWE80=
X-Gm-Message-State: AOJu0Yx6DPPeIh6IjdSKX4WYQCTuGs6dehJukX7Mz57pYsmF4248bilw
	RvxpuwuRx9zbILdQLYltt/g3xnOfcq4jsxAXknVIy81B69Dht4SrsZtlhryL+g==
X-Google-Smtp-Source: AGHT+IH7ASHVvyBgmF5witWsSve57ox3+Oazzz28VTnvjWZqozyO4y4t7a/MV6bCZ6g4Up5m89w7Jg==
X-Received: by 2002:a05:6871:3326:b0:24f:c235:d64e with SMTP id 586e51a60fabf-2508c1c095dmr12452854fac.57.1717473381036;
        Mon, 03 Jun 2024 20:56:21 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242aec7d0sm6430141b3a.99.2024.06.03.20.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 20:56:20 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:56:17 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yunke Cao <yunkec@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: videobuf2-core: release all planes first
 in __prepare_dmabuf()
Message-ID: <u3roumaosyac7rarzdzxlekrib3n6sbo66epfo7dno24zbzwn2@xojpr7r3fxlm>
References: <20240403091306.1308878-1-yunkec@chromium.org>
 <20240403091306.1308878-2-yunkec@chromium.org>
 <idyreh3tm33dappbaoek43urhr75jhcu44l6d67qszos42yhcp@mqxlfmdmryto>
 <CAEDqmY4Tyz33qv7U_r87EgfxXq0dJiUGPHggoeU2F4XVVNm9Zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEDqmY4Tyz33qv7U_r87EgfxXq0dJiUGPHggoeU2F4XVVNm9Zw@mail.gmail.com>

On Thu, May 30, 2024 at 01:13:13PM +0900, Yunke Cao wrote:
> Hi Tomasz,
> 
> Thanks for the review.
> 
> On Fri, May 17, 2024 at 8:11 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > Hi Yunke,
> >
> > On Wed, Apr 03, 2024 at 06:13:04PM +0900, Yunke Cao wrote:
> > > The existing implementation, validating planes, checking if the planes
> > > changed, releasing previous planes and reaquiring new planes all happens in
> > > the same for loop.
> > >
> > > Split the for loop into 3 parts
> > > 1. In the first for loop, validate planes and check if planes changed.
> > > 2. Call __vb2_buf_dmabuf_put() to release all planes.
> > > 3. In the second for loop, reaquire new planes.
> > >
> > > Signed-off-by: Yunke Cao <yunkec@chromium.org>
> > > ---
> > >  .../media/common/videobuf2/videobuf2-core.c   | 64 ++++++++++---------
> > >  1 file changed, 34 insertions(+), 30 deletions(-)
> > >
> >
> > Thanks for the second revision and sorry for the delay. Please check my
> > comments inline.
> >
> > > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> > > index b6bf8f232f48..702f7b6f783a 100644
> > > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > > @@ -1341,11 +1341,13 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
> > >       for (plane = 0; plane < vb->num_planes; ++plane) {
> > >               struct dma_buf *dbuf = dma_buf_get(planes[plane].m.fd);
> > >
> > > +             planes[plane].dbuf = dbuf;
> > > +
> > >               if (IS_ERR_OR_NULL(dbuf)) {
> > >                       dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
> > >                               plane);
> > >                       ret = -EINVAL;
> > > -                     goto err;
> > > +                     goto err_put_dbuf;
> >
> > nit: Maybe err_put_planes, since we're cleaning up the planes[] array?
> >
> 
> err_put_planes sounds good to me.
> 
> > >               }
> > >
> > >               /* use DMABUF size if length is not provided */
> > > @@ -1356,17 +1358,14 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
> > >                       dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum length %u\n",
> > >                               planes[plane].length, plane,
> > >                               vb->planes[plane].min_length);
> > > -                     dma_buf_put(dbuf);
> > >                       ret = -EINVAL;
> > > -                     goto err;
> > > +                     goto err_put_dbuf;
> > >               }
> > >
> > >               /* Skip the plane if already verified */
> > >               if (dbuf == vb->planes[plane].dbuf &&
> > > -                     vb->planes[plane].length == planes[plane].length) {
> > > -                     dma_buf_put(dbuf);
> > > +                 vb->planes[plane].length == planes[plane].length)
> > >                       continue;
> > > -             }
> > >
> > >               dprintk(q, 3, "buffer for plane %d changed\n", plane);
> > >
> > > @@ -1375,29 +1374,30 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
> > >                       vb->copied_timestamp = 0;
> > >                       call_void_vb_qop(vb, buf_cleanup, vb);
> >
> > Would it make sense to also move these two to the if (reacquired) part
> > below, since they are done once for the entire vb?
> >
> 
> Yes, Will do in the next version.
> 
> > >               }
> > > +     }
> > >
> > > -             /* Release previously acquired memory if present */
> > > -             __vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
> > > -             vb->planes[plane].bytesused = 0;
> > > -             vb->planes[plane].length = 0;
> > > -             vb->planes[plane].m.fd = 0;
> > > -             vb->planes[plane].data_offset = 0;
> >
> > I don't see the code below setting the 4 fields above to zero. Is it
> > intended?
> >
> 
> I thought these were not necessary anymore.
> But now that I look more carefully, it is useful when there is an error below.
> I will add them back in the next version. Thanks for catching this!
> 

Actually, original code would leave the fields in a weird state in case of
an error too. Maybe we could set all the fields to 0 in
__vb2_plane_dmabuf_put(), so that we always have the vb2 struct in a clean
state regardless of where we fail? (Could be a separate patch.)

> > > +     if (reacquired) {
> > > +             __vb2_buf_dmabuf_put(vb);
> > > +
> > > +             for (plane = 0; plane < vb->num_planes; ++plane) {
> > > +                     /* Acquire each plane's memory */
> > > +                     mem_priv = call_ptr_memop(attach_dmabuf,
> > > +                                               vb,
> > > +                                               q->alloc_devs[plane] ? : q->dev,
> > > +                                               planes[plane].dbuf,
> > > +                                               planes[plane].length);
> > > +                     if (IS_ERR(mem_priv)) {
> > > +                             dprintk(q, 1, "failed to attach dmabuf\n");
> > > +                             ret = PTR_ERR(mem_priv);
> > > +                             goto err_put_dbuf;
> >
> > Hmm, I think in this case we need to also clean up the partially acquired
> > planes of vb.
> >
> > > +                     }
> > >
> > > -             /* Acquire each plane's memory */
> > > -             mem_priv = call_ptr_memop(attach_dmabuf,
> > > -                                       vb,
> > > -                                       q->alloc_devs[plane] ? : q->dev,
> > > -                                       dbuf,
> > > -                                       planes[plane].length);
> > > -             if (IS_ERR(mem_priv)) {
> > > -                     dprintk(q, 1, "failed to attach dmabuf\n");
> > > -                     ret = PTR_ERR(mem_priv);
> > > -                     dma_buf_put(dbuf);
> > > -                     goto err;
> > > +                     vb->planes[plane].dbuf = planes[plane].dbuf;
> > > +                     vb->planes[plane].mem_priv = mem_priv;
> > >               }
> > > -
> > > -             vb->planes[plane].dbuf = dbuf;
> > > -             vb->planes[plane].mem_priv = mem_priv;
> > > +     } else {
> > > +             for (plane = 0; plane < vb->num_planes; ++plane)
> > > +                     dma_buf_put(planes[plane].dbuf);
> > >       }
> > >
> > >       /*
> > > @@ -1413,7 +1413,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
> > >               if (ret) {
> > >                       dprintk(q, 1, "failed to map dmabuf for plane %d\n",
> > >                               plane);
> > > -                     goto err;
> > > +                     goto err_put_vb2_buf;
> > >               }
> > >               vb->planes[plane].dbuf_mapped = 1;
> > >       }
> >
> > I think this entire loop can also go under the (reacquired) case, since
> > (!reacquired) means that all the planes were identical (and thus are
> > alreday mapped). Given that now we release all the planes in one go, we
> > could even simplify it by dropping the dbuf_mapped check from the loop.
> >
> > > @@ -1437,7 +1437,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
> > >               ret = call_vb_qop(vb, buf_init, vb);
> > >               if (ret) {
> > >                       dprintk(q, 1, "buffer initialization failed\n");
> > > -                     goto err;
> > > +                     goto err_put_vb2_buf;
> > >               }
> > >       }
> >
> > Same for this block.
> >
> > >
> > > @@ -1445,11 +1445,15 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
> > >       if (ret) {
> > >               dprintk(q, 1, "buffer preparation failed\n");
> > >               call_void_vb_qop(vb, buf_cleanup, vb);
> > > -             goto err;
> > > +             goto err_put_vb2_buf;
> > >       }
> > >
> > >       return 0;
> > > -err:
> > > +
> > > +err_put_dbuf:
> > > +     for (plane = 0; plane < vb->num_planes; ++plane)
> >
> > dma_buf_put() will throw a warning if the dmabuf pointer is NULL and just
> > plain crash if IS_ERR(), so we shouldn't call it on array elements that we
> > didn't succeed for.
> >
> 
> I see. Will do in the next version.
> 
> > > +             dma_buf_put(planes[plane].dbuf);
> > > +err_put_vb2_buf:
> > >       /* In case of errors, release planes that were already acquired */
> > >       __vb2_buf_dmabuf_put(vb);
> >
> > Actually, would it make sense to invert the order of clean-up steps here?
> > In case if only the first loop fails, we don't really need to do anything with
> > vb. Or am I missing something?
> >
> 
> It seems the original implementation will call __vb2_buf_dmabuf_put(vb)
> whenever dma_buf_get() returns err or length < min_length. I was trying
> to keep the same behavior here. Do you have any preference?
> 
> Also, if "call_vb_qop(vb, buf_prepare, vb);" fails, I think we only need
> __vb2_buf_dmabuf_put(), but not dma_buf_put().

I see, fair enough. I also reread the function to double check that we're
not double cleaning anything and it looks good to me.

Best regards,
Tomasz

