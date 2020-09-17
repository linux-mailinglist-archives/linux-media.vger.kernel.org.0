Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD7026D5D6
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 10:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgIQIKG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 04:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIQIJr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 04:09:47 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B909AC061756
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 01:09:23 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x14so1478076oic.9
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hj748MDWz3uGjap8dFpsmQR43oB5FdmeE3PU5X76VV0=;
        b=LiGHVTAZBlNXFMLULoLuA7sDuYos0oM5OblFb/GVLUevRmNfmxziUxmN5o1oE1+kmU
         Rj3uVZ8GFXSdl/JIHrwHGB9TM+RPKb1uNIqL0MqOn18aam/SH8w9FTYGAPGf5TzhNpRe
         Pe+BiT0Mhqg6d1HSV5qM409pE0CFaTHo+UOd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hj748MDWz3uGjap8dFpsmQR43oB5FdmeE3PU5X76VV0=;
        b=on0/AiDL0eXAjELA87/mgtn9lM52KDYlb91Q/FI1tPKcDW1SJSfsU3xBE2+4i0pIbp
         o44mb8SItmnE4uVKWxsveeSQZTjrWt+4TfTtZJA3R0G5fx7B/6yyYr/G9vOC+gjOk1+1
         1MyKNqWWvMA35+k6lvSJQmfXaT5XWxz+rGJdP4KHVPfxsMV7Y86GhyCXYTnNBXAdEE5X
         pRZv7PqyTH57SpUiHsI/iPGk854IVCwr4DBujo1GAT/kFDEB7kO2CT+ciBBCRcz9DFWZ
         qLBL0c2Bt7j/UQthgSdPAUh2dptQeSjT4ZKVo9RwU8AoToVB/0C4LtXPcXkQCVVCCgpP
         R0QQ==
X-Gm-Message-State: AOAM530tgDYiojIB1/d4x+OnPhFO40crh5rXVfh/UBv/NVMADzEon9+L
        +UzVtUgbLJHq8Ic7QPslcP/swJtUd14QioW733HyyA==
X-Google-Smtp-Source: ABdhPJxnhcvTWespPIz0mwDd5lfmfASbxSQp+iv4wdI3VWmLcUZDr+o6jic2DrtQ3xdcC58bSj1uv5b78VL+7UnvPaQ=
X-Received: by 2002:aca:de41:: with SMTP id v62mr5615790oig.128.1600330163116;
 Thu, 17 Sep 2020 01:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com> <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com> <20200916095359.GD438822@phenom.ffwll.local>
 <20200916140710.GA8409@ziepe.ca> <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com> <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
In-Reply-To: <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 17 Sep 2020 10:09:12 +0200
Message-ID: <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 9:11 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.09.20 um 08:23 schrieb Daniel Vetter:
> > On Wed, Sep 16, 2020 at 5:31 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 16.09.20 um 17:24 schrieb Daniel Vetter:
> >>> On Wed, Sep 16, 2020 at 4:14 PM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 16.09.20 um 16:07 schrieb Jason Gunthorpe:
> >>>>> On Wed, Sep 16, 2020 at 11:53:59AM +0200, Daniel Vetter wrote:
> >>>>>
> >>>>>> But within the driver, we generally need thousands of these, and t=
hat
> >>>>>> tends to bring fd exhaustion problems with it. That's why all the =
private
> >>>>>> buffer objects which aren't shared with other process or other dri=
vers are
> >>>>>> handles only valid for a specific fd instance of the drm chardev (=
each
> >>>>>> open gets their own namespace), and only for ioctls done on that c=
hardev.
> >>>>>> And for mmap we assign fake (but unique across all open fd on it) =
offsets
> >>>>>> within the overall chardev. Hence all the pgoff mangling and re-ma=
ngling.
> >>>>> Are they still unique struct files? Just without a fdno?
> >>>> Yes, exactly.
> >>> Not entirely, since dma-buf happened after drm chardev, so for that
> >>> historical reason the underlying struct file is shared, since it's th=
e
> >>> drm chardev. But since that's per-device we don't have a problem in
> >>> practice with different vm_ops, since those are also per-device. But
> >>> yeah we could fish out some entirely hidden per-object struct file if
> >>> that's required for some mm internal reasons.
> >> Hui? Ok that is just the handling in i915, isn't it?
> >>
> >> As far as I know we create an unique struct file for each DMA-buf.
> > Yes dma-buf, but that gets forwarded to the original drm chardev which
> > originally exported the buffer. It's only there where the forwarding
> > chain stops. The other thing is that iirc we have a singleton
> > anon_inode behind all the dma-buf, so they'd share all the same
> > address_space and so would all alias for unmap_mapping_range (I think
> > at least).
>
> Amdgpu works by using the address_space of the drm chardev into the
> struct file of DMA-buf instead.
>
> I think that this is cleaner, but only by a little bit :)

Yeah, but it doesn't work when forwarding from the drm chardev to the
dma-buf on the importer side, since you'd need a ton of different
address spaces. And you still rely on the core code picking up your
pgoff mangling, which feels about as risky to me as the vma file
pointer wrangling - if it's not consistently applied the reverse map
is toast and unmap_mapping_range doesn't work correctly for our needs.

> Anyway I'm a bit concerned that we have so many different approaches for
> the same problem.

Yeah, I think if we can standardize this then that would be really good.
-Daniel

>
> Christian.
>
> > -Daniel
> >
> >> Regards,
> >> Christian.
> >>
> >>
> >>> -Daniel
> >>>
> >>>>>> Hence why we'd like to be able to forward aliasing mappings and ad=
just the
> >>>>>> file and pgoff, while hopefully everything keeps working. I though=
t this
> >>>>>> would work, but Christian noticed it doesn't really.
> >>>>> It seems reasonable to me that the dma buf should be the owner of t=
he
> >>>>> VMA, otherwise like you say, there is a big mess attaching the cust=
om
> >>>>> vma ops and what not to the proper dma buf.
> >>>>>
> >>>>> I don't see anything obviously against this in mmap_region() - why =
did
> >>>>> Chritian notice it doesn't really work?
> >>>> To clarify I think this might work.
> >>>>
> >>>> I just had the same "Is that legal?", "What about security?", etc..
> >>>> questions you raised as well.
> >>>>
> >>>> It seems like a source of trouble so I thought better ask somebody m=
ore
> >>>> familiar with that.
> >>>>
> >>>> Christian.
> >>>>
> >>>>> Jason
> >>>> _______________________________________________
> >>>> dri-devel mailing list
> >>>> dri-devel@lists.freedesktop.org
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7=
Cchristian.koenig%40amd.com%7Cf725d2eb6a5a49bd533f08d85ad23308%7C3dd8961fe4=
884e608e11a82d994e183d%7C0%7C0%7C637359206142262941&amp;sdata=3DqcLsl9R1gP%=
2FGY39ctsQkIzI99Bn%2F840YS17F4xudrAE%3D&amp;reserved=3D0
> >>>
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
