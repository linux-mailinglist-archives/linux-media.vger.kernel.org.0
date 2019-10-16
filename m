Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 548DBD93B0
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 16:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392379AbfJPOXz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 10:23:55 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38514 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbfJPOXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 10:23:55 -0400
Received: by mail-oi1-f194.google.com with SMTP id m16so20191743oic.5
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2019 07:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=d8aADCgxmyZ8oHqypZxzKpNLEg+1j6m6hSEfD2bZZ6E=;
        b=XbRhAuh2NWFaFuZe2gD5mCTyABY/fNonboBtyT26akymEycPckp21HRXpmlxB/4gZM
         HgNvu2ygFESo2XSroCL0+ewHUa4RFIxjbWVwNC2qrDJu8OyOr8cEHptQCvRkk/SICOOY
         OAPBoP3Q+aQAcsNLvzI0Y/uPWH/mQpt5cHOLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=d8aADCgxmyZ8oHqypZxzKpNLEg+1j6m6hSEfD2bZZ6E=;
        b=F9UbOmtlOkdHBLRka5Fz56bcsvkGyTmnO5ZfBq3WKncOvd884xdjubEJT9WbPr6gFs
         R/QcXCsZThtktVHwB3nhY9oagJusX8nqSeArNLEn++yM1qnqLJdmZcJOnA8dgbtFt/Lg
         SEnX/WzD7C2945wURNdqGHjUSJx7TQ/MMRlB6K/udjBrRyNevgG7IUyHYCWbcnudEv/d
         ppQ6oyhDi0aecTJwNeUqWig0u+gDakHag/0bm4HzBytk1Z2OJTnvDYU0x7RVLmJaAd3L
         4/AfcZHg9D/r4cWW1ZgYVwjuLVMPtjLKwEHcRmyfkp1to/PbXDQrYn4Z3iGISjg8CW06
         0xJw==
X-Gm-Message-State: APjAAAXsLFSlIPtCVPCRO9mTHlzx1Y2dPrFh7Jrs0cfHNGXot1mw7oTv
        8SnaBPCIVwlP5NSeS9ITiQgyz+mdbQJkoEr/VXg7mg==
X-Google-Smtp-Source: APXvYqzuLOt/wM8T1nwBtZb4ftBB93wZ6RkfWTlrEa+aK9+l2ofte9m+yhSuuxpR8A539bjHtNN2/TZQcs64htoR5Ew=
X-Received: by 2002:aca:1719:: with SMTP id j25mr3568718oii.132.1571235833084;
 Wed, 16 Oct 2019 07:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <88f748d2-43de-ae2a-b895-40d8b3be5c78@gmail.com>
 <20190917123150.GM3958@phenom.ffwll.local> <da55aa8d-f2b8-0428-ed22-23dc17f71d77@amd.com>
 <20190917131320.GU3958@phenom.ffwll.local> <e0e50037-df08-86e3-e8b2-768683e5cce0@amd.com>
 <20190917134524.GY3958@phenom.ffwll.local> <7de46ca8-8cb5-d545-42ad-6a7cb4cf753a@amd.com>
 <CAKMK7uFc6CKyF-dW6FE7Hzdz5La7N265DZu_PR7=rKXFjg4QBw@mail.gmail.com>
 <97bb8f03-7fa3-6e61-a1ff-0ffcadbc1a39@amd.com> <be8abe51-05f5-bd06-2633-0d32828e0e43@amd.com>
 <20191008085543.GF16989@phenom.ffwll.local> <511490ca-4370-6e31-8c73-13fbe3f9d893@amd.com>
In-Reply-To: <511490ca-4370-6e31-8c73-13fbe3f9d893@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 16 Oct 2019 16:23:41 +0200
Message-ID: <CAKMK7uF4vp5=Qs3QkQFKs1-ef9nG4XZFBkasbWn4N_7R4OpUbA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dma-buf: change DMA-buf locking convention
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 16, 2019 at 3:46 PM Koenig, Christian
<Christian.Koenig@amd.com> wrote:
>
> Am 08.10.19 um 10:55 schrieb Daniel Vetter:
> > On Wed, Oct 02, 2019 at 08:37:50AM +0000, Koenig, Christian wrote:
> >> Hi Daniel,
> >>
> >> once more a ping on this. Any more comments or can we get it comitted?
> > Sorry got a bit smashed past weeks, but should be resurrected now back
> > from xdc.
>
> And any more thoughts on this? I mean we are blocked for month on this
> now :(

I replied to both 1 and 2 in this series on 8th Oct. You even replied
to me in the thread on patch 2 ... but not here (I top posted since
this detour here just me being confused).
-Daniel

>
> Thanks,
> Christian.
>
> > -Daniel
> >> Thanks,
> >> Christian.
> >>
> >> Am 24.09.19 um 11:50 schrieb Christian K=C3=B6nig:
> >>> Am 17.09.19 um 16:56 schrieb Daniel Vetter:
> >>>> [SNIP]
> >>>>>>>>>>>>>>        +    /* When either the importer or the exporter
> >>>>>>>>>>>>>> can't handle dynamic
> >>>>>>>>>>>>>> +     * mappings we cache the mapping here to avoid issues
> >>>>>>>>>>>>>> with the
> >>>>>>>>>>>>>> +     * reservation object lock.
> >>>>>>>>>>>>>> +     */
> >>>>>>>>>>>>>> +    if (dma_buf_attachment_is_dynamic(attach) !=3D
> >>>>>>>>>>>>>> +        dma_buf_is_dynamic(dmabuf)) {
> >>>>>>>>>>>>>> +        struct sg_table *sgt;
> >>>>>>>>>>>>>> +
> >>>>>>>>>>>>>> +        if (dma_buf_is_dynamic(attach->dmabuf))
> >>>>>>>>>>>>>> + dma_resv_lock(attach->dmabuf->resv, NULL);
> >>>>>>>>>>>>>> +
> >>>>>>>>>>>>>> +        sgt =3D dmabuf->ops->map_dma_buf(attach,
> >>>>>>>>>>>>>> DMA_BIDIRECTIONAL);
> >>>>>>>>>>>>> Now we're back to enforcing DMA_BIDI, which works nicely
> >>>>>>>>>>>>> around the
> >>>>>>>>>>>>> locking pain, but apparently upsets the arm-soc folks who
> >>>>>>>>>>>>> want to
> >>>>>>>>>>>>> control
> >>>>>>>>>>>>> this better.
> >>>>>>>>>>>> Take another look at dma_buf_map_attachment(), we still try
> >>>>>>>>>>>> to get the
> >>>>>>>>>>>> caching there for ARM.
> >>>>>>>>>>>>
> >>>>>>>>>>>> What we do here is to bidirectionally map the buffer to avoi=
d
> >>>>>>>>>>>> the
> >>>>>>>>>>>> locking hydra when importer and exporter disagree on locking=
.
> >>>>>>>>>>>>
> >>>>>>>>>>>> So the ARM folks can easily avoid that by switching to
> >>>>>>>>>>>> dynamic locking
> >>>>>>>>>>>> for both.
> >>>>>>>>>> So you still break the contract between importer and exporter,
> >>>>>>>>>> except not
> >>>>>>>>>> for anything that's run in intel-gfx-ci so all is good?
> >>>>>>>>> No, the contract between importer and exporter stays exactly th=
e
> >>>>>>>>> same it
> >>>>>>>>> is currently as long as you don't switch to dynamic dma-buf
> >>>>>>>>> handling.
> >>>>>>>>>
> >>>>>>>>> There is no functional change for the ARM folks here. The only
> >>>>>>>>> change
> >>>>>>>>> which takes effect is between i915 and amdgpu and that is perfe=
ctly
> >>>>>>>>> covered by intel-gfx-ci.
> >>>>>>>> There's people who want to run amdgpu on ARM?
> >>>>>>> Sure there are, we even recently fixed some bugs for this.
> >>>>>>>
> >>>>>>> But as far as I know there is no one currently which is affect by
> >>>>>>> this
> >>>>>>> change on ARM with amdgpu.
> >>>>>> But don't you break them with this now?
> >>>>> No, we see the bidirectional attachment as compatible with the othe=
r
> >>>>> ones.
> >>>>>
> >>>>>> amdgpu will soon set the dynamic flag on exports, which forces the
> >>>>>> caching
> >>>>>> at create time (to avoid the locking fun), which will then result =
in a
> >>>>>> EBUSY at map_attachment time because we have a cached mapping, but
> >>>>>> it's
> >>>>>> the wrong type.
> >>>>> See the check in dma_buf_map_attachment():
> >>>>>
> >>>>>        if (attach->dir !=3D direction && attach->dir !=3D DMA_BIDIR=
ECTIONAL)
> >>>>>            return ERR_PTR(-EBUSY);
> >>>> Hm, I misread this. So yeah should work, +/- the issue that we might
> >>>> not flush enough. But I guess that can be fixed whenever, it's not
> >>>> like dma-api semantics are a great fit for us. Maybe a fixme comment
> >>>> would be useful here ... I'll look at this tomorrow or so because at=
m
> >>>> brain is slow, I'm down with the usual post-conference cold it seems
> >>>> :-/
> >>> Hope your are feeling better now, adding a comment is of course not a
> >>> problem.
> >>>
> >>> With that fixed can I get an reviewed-by or at least and acked-by?
> >>>
> >>> I want to land at least some parts of those changes now.
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>> -Daniel
> >>>>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
