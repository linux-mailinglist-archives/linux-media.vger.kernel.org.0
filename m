Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C221F1782DE
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 20:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgCCTKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 14:10:32 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37372 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgCCTKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 14:10:32 -0500
Received: by mail-ed1-f66.google.com with SMTP id t7so5826338edr.4
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 11:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jv7Ih1NyrqeNZpG1dR8gyRFpz0epRhdNQwzv72VuIfM=;
        b=O3uRmfbHh64VdAmQ/qm/TdRLtr3VzWsMlk35GCQ0l1JuNPFgo5hbwSh/l/b/kJ6zIp
         p2ekHiW/aBjc+H3XbL9cCmchVqOF4PcbUr8Uj7XwIEM2jM7I61+HidBb2dndcg3ycAzt
         RbnojAZvLK7rxv3G7Q+5s9dNqt7AkMefzVZqzibZzjsw/ARxzZYcS0wya2W5FVtJFnkk
         Ncojxn4je1V6yqKoYsuPmEpl+tJBm4VFaaxcy+zTxZzmXbkQk5qd2lMu9E9J8E1tzDg1
         GEFBgYYSdvqAN+keSv5aTnTIC947P46GTp407QMVAxFgTn1zqXyEc98AeBmhfjcNZT3b
         XN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jv7Ih1NyrqeNZpG1dR8gyRFpz0epRhdNQwzv72VuIfM=;
        b=O9JDkCflInj81YPSFA7Ft8fbAbbA1GUzX2fa+e4lrM5PzDEXqFTakRmLw8ihRaljeE
         WPrMdCIDp533iSJG7EC1Hd2QFXAqxb5BiJPEyPPaRLbYfzY9qnIajaOz/pQvovLPCTcn
         YdE6cpApYhssL3uO7V3PiSfDya9XyvZPmuCdFoxT/fIrnILbI4niw280xRzySDTp6P4E
         oOo1aGsBwcws9b1u9D1X90KN1fv01I1/pJv1NQ4on9+RuS7a9f2JzIhFY0nvYFfFl7em
         6SvfHHK197oLfObhhZ8NgQdltRyIycb+mUCO/y7q9bhweESL6h4n1FXwpTIvpS9aE4vm
         ehMg==
X-Gm-Message-State: ANhLgQ2zguSPani/dVSMowBsXDGCgNroiwbGFdX4vJxtoY9oj+VKKpaX
        H8rllJMAB6GW5g/RLsoDQoTeclDRUUx5120wIoAyxw==
X-Google-Smtp-Source: ADFU+vsmTm+PWU2FuG/IFYesXpVvcuHpos6kjEbqVQD1KKJIdmpF681WL/kjVdopso7dwT46jc/Gw12waDjkW4uto7E=
X-Received: by 2002:a50:f38e:: with SMTP id g14mr5691650edm.168.1583262630144;
 Tue, 03 Mar 2020 11:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20200225235856.975366-1-jason@jlekstrand.net> <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
 <20200226100523.GQ2363188@phenom.ffwll.local> <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
 <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com> <810a26e7-4294-a615-b7ee-18148ac70641@amd.com>
In-Reply-To: <810a26e7-4294-a615-b7ee-18148ac70641@amd.com>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Tue, 3 Mar 2020 13:10:18 -0600
Message-ID: <CAOFGe96namyeQXTvdrduM+=wkJuoWWx34CxcsJHS3fcCaKDadw@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync files
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Dave Airlie <airlied@redhat.com>,
        Jesse Hall <jessehall@google.com>,
        James Jones <jajones@nvidia.com>,
        Daniel Stone <daniels@collabora.com>,
        =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 27, 2020 at 2:28 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.02.20 um 17:46 schrieb Bas Nieuwenhuizen:
> > On Wed, Feb 26, 2020 at 4:29 PM Jason Ekstrand <jason@jlekstrand.net> w=
rote:
> >> On Wed, Feb 26, 2020 at 4:05 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>> On Wed, Feb 26, 2020 at 10:16:05AM +0100, Christian K=C3=B6nig wrote:
> >>> [SNIP]
> >>>> Just imagine that you access some DMA-buf with a shader and that ope=
ration
> >>>> is presented as a fence on the DMA-bufs reservation object. And now =
you can
> >>>> go ahead and replace that fence and free up the memory.
> >>>>
> >>>> Tricking the Linux kernel into allocating page tables in that freed =
memory
> >>>> is trivial and that's basically it you can overwrite page tables wit=
h your
> >>>> shader and gain access to all of system memory :)
> >>>>
> >>>> What we could do is to always make sure that the added fences will c=
omplete
> >>>> later than the already existing ones, but that is also rather tricky=
 to get
> >>>> right. I wouldn't do that if we don't have a rather big use case for=
 this.
> >> Right.  I thought about that but I'm still learning how dma_resv
> >> works.  It'd be easy enough to make a fence array that contains both
> >> the old fence and the new fence and replace the old fence with that.
> >> What I don't know is the proper way to replace the exclusive fence
> >> safely.  Some sort of atomic_cpxchg loop, perhaps?  I presume there's
> >> some way of doing it properly because DRM drivers are doing it all the
> >> time.
>
> First of all you need to grab the lock of the dma_resv object or you
> can't replace the exclusive nor the shared ones.
>
> This way you don't need to do a atomic_cmpxchg or anything else and
> still guarantee correct ordering.

Fixed in v3.

> > I think for an exclusive fence you may need to create a fence array
> > that includes the existing exclusive and shared fences in the dma_resv
> > combined with the added fence.
>
> Yes, that at least gives us the correct synchronization.

Fixed in v2

> > However, I'm not sure what the best way is to do garbage collection on
> > that so that we don't get an impossibly list of fence arrays.
>
> Exactly yes. That's also the reason why the dma_fence_chain container I
> came up with for the sync timeline stuff has such a rather sophisticated
> garbage collection.
>
> When some of the included fences signal you need to free up the
> array/chain and make sure that the memory for the container can be reused=
.

Currently (as of v2), I'm using dma_fence_array and being careful to
not bother constructing one if there's only one fence in play.  Is
this insufficient?  If so, maybe we should consider improving
dma_fence_array.

> >   (Note
> > the dma_resv has a lock that needs to be taken before adding an
> > exclusive fence, might be useful). Some code that does a thing like
> > this is __dma_resv_make_exclusive in
> > drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>
> Wanted to move that into dma_resv.c for quite a while since there are
> quite a few other cases where we need this.

I've roughly done that.  The primary difference is that my version
takes an optional additional fence to add to the array.  This makes it
a bit more complicated but I think I got it mostly right.

I've also written userspace code which exercises this and it seems to
work.  Hopefully, that will give a better idea of what I'm trying to
accomplish.

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037

--Jason
