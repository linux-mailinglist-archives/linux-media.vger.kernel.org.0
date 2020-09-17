Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589EA26D396
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 08:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgIQGXf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 02:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgIQGXc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 02:23:32 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DC8C061756
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 23:23:31 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id z26so1186550oih.12
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 23:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t5xSYs5WyUHGoVugyXIsV4oBDVq0zP8fjjYyhPxmS5A=;
        b=VYwPjvy48TS158UnDBYgLFV8dLYTcm9kR1KQGEhIw/AOhPMVqcFjtf4qMuMDH5vVx+
         FPsUGl1T9D37jThKoIE1tgSPSJrgXvgVwjl3/lAkLs4w0OqP0vq1bkZMABCQ9059UFw9
         5vfWDwoa5rpsgJhfXrlf42ZrGwPdGMXJsMq00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t5xSYs5WyUHGoVugyXIsV4oBDVq0zP8fjjYyhPxmS5A=;
        b=ZeAGCExrh3NMw2G9HjI+nw9rt+rTYOl8scL6GhLPw1b1A9WG8dlW6XGU1mRJp/8few
         TJJoNRgF40wIeydlkUBDEKeJk3w/un1bOPh2C/qX7m2+SMskIUpt1yzPZSQaym/V//A2
         +xPUzgkjSDzhKMDl+TeIDB8IBt96/gdvimdz7v2vNy6d6Ree2spTQHGbCGDGeXT1PXBH
         kl7k3A+zWEKd/h9r/rfKTmkq9zrVTNrhApHtz/v3Gi26FzqAjZTEIGowah/OeevHRwZH
         zKtm8wH+zEoTnfASCCRmEJyG3jyFmmLQfkTTHe96LQA2SwTfEa/3NtKJuDyY0EXpjwS2
         dx2w==
X-Gm-Message-State: AOAM53124J8S3s27MOnGVcfiGIkvZ93yfkFrirxF3GK/gR6mJsjHbERQ
        5b/IozandK1AMo2vuEY1VwKRMBNwL/8RuV6Cd7xFgX8xXJgztQ==
X-Google-Smtp-Source: ABdhPJzB3ReC52Ku2iqgR54KZacCgPTbpQb6FYFGgv4R5udMulfkKOhc4e2KvAwA9Q2qQA7f0ioN8nPBsAA6wdCsyJs=
X-Received: by 2002:aca:6083:: with SMTP id u125mr5461400oib.14.1600323810870;
 Wed, 16 Sep 2020 23:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com> <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com> <20200916095359.GD438822@phenom.ffwll.local>
 <20200916140710.GA8409@ziepe.ca> <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com> <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
In-Reply-To: <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 17 Sep 2020 08:23:19 +0200
Message-ID: <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
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

On Wed, Sep 16, 2020 at 5:31 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 16.09.20 um 17:24 schrieb Daniel Vetter:
> > On Wed, Sep 16, 2020 at 4:14 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 16.09.20 um 16:07 schrieb Jason Gunthorpe:
> >>> On Wed, Sep 16, 2020 at 11:53:59AM +0200, Daniel Vetter wrote:
> >>>
> >>>> But within the driver, we generally need thousands of these, and tha=
t
> >>>> tends to bring fd exhaustion problems with it. That's why all the pr=
ivate
> >>>> buffer objects which aren't shared with other process or other drive=
rs are
> >>>> handles only valid for a specific fd instance of the drm chardev (ea=
ch
> >>>> open gets their own namespace), and only for ioctls done on that cha=
rdev.
> >>>> And for mmap we assign fake (but unique across all open fd on it) of=
fsets
> >>>> within the overall chardev. Hence all the pgoff mangling and re-mang=
ling.
> >>> Are they still unique struct files? Just without a fdno?
> >> Yes, exactly.
> > Not entirely, since dma-buf happened after drm chardev, so for that
> > historical reason the underlying struct file is shared, since it's the
> > drm chardev. But since that's per-device we don't have a problem in
> > practice with different vm_ops, since those are also per-device. But
> > yeah we could fish out some entirely hidden per-object struct file if
> > that's required for some mm internal reasons.
>
> Hui? Ok that is just the handling in i915, isn't it?
>
> As far as I know we create an unique struct file for each DMA-buf.

Yes dma-buf, but that gets forwarded to the original drm chardev which
originally exported the buffer. It's only there where the forwarding
chain stops. The other thing is that iirc we have a singleton
anon_inode behind all the dma-buf, so they'd share all the same
address_space and so would all alias for unmap_mapping_range (I think
at least).
-Daniel

>
> Regards,
> Christian.
>
>
> > -Daniel
> >
> >>>> Hence why we'd like to be able to forward aliasing mappings and adju=
st the
> >>>> file and pgoff, while hopefully everything keeps working. I thought =
this
> >>>> would work, but Christian noticed it doesn't really.
> >>> It seems reasonable to me that the dma buf should be the owner of the
> >>> VMA, otherwise like you say, there is a big mess attaching the custom
> >>> vma ops and what not to the proper dma buf.
> >>>
> >>> I don't see anything obviously against this in mmap_region() - why di=
d
> >>> Chritian notice it doesn't really work?
> >> To clarify I think this might work.
> >>
> >> I just had the same "Is that legal?", "What about security?", etc..
> >> questions you raised as well.
> >>
> >> It seems like a source of trouble so I thought better ask somebody mor=
e
> >> familiar with that.
> >>
> >> Christian.
> >>
> >>> Jason
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
