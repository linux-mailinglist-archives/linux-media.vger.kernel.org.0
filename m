Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA3061845B5
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgCMLMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:12:08 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42106 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgCMLMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:12:08 -0400
Received: by mail-ed1-f67.google.com with SMTP id b21so1011810edy.9
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2020 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ghIpRGiQVwJbhKxwoqlN1gAo19Cr4ajPPSiWPX3Momc=;
        b=M5rpR3t9vw3aAFdk8Rj95LtJ5sdgab5t7hG3QQY1cQx8F6TpGcySH69iNNDmyOFJwn
         bjAjxQP4Jb4pmlP2X6mySwbIFdvBHNLEavP/vaUjs8YuL5NkNiaY/p6l1oCma3UFzgr6
         LAWZAn3XL4+z1UW4dkwxcHsNmUphcTi0sQa9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ghIpRGiQVwJbhKxwoqlN1gAo19Cr4ajPPSiWPX3Momc=;
        b=azMO1ovqguf9hn2q8AmOBISIs/hhX3GkvgXktEvZyGL+XbjTHmLyBrg/3hjNj4MrYi
         VPjN4e9F7gzj/hYyqsdTJIjQ4mYGaE5d07v1xBI3sOZw4gDGjC9XIZQh93ZGgdz/26D0
         KWdGdvVrfNnrD8dEQyAxP+iAoCBSLPoWmtEQa0rlMTIczjZidbQQsQbEjnXo3rdPQBPe
         nqrfADTmpzr/CM3XzpEg/KVSPmtm/xU6yzxOibwhmdv1r6Kc/RbeBt2nRgPwFc83Iu04
         hzf37eoKBUpqgxweiK0Y9ECoZuydRBtZ0D6YwxtCemYQLgHTRKYWz6eT/rRv7V5zjOnp
         doCQ==
X-Gm-Message-State: ANhLgQ041xsATc/skJe8EcjM0noJUCebyEN1RREr2XMwJBCcgM9F9ZLt
        rQcA5Avp3chxcYMp27U7MjbZNHvfUqzvnw==
X-Google-Smtp-Source: ADFU+vvCzBvJsycFJ5GN0uTmM7t9OJuYXqZQxhNXFQry+16peJHfuRWZqZ7p5K3VN3sjFhjJo9kOhw==
X-Received: by 2002:a50:d901:: with SMTP id t1mr7914197edj.34.1584097925241;
        Fri, 13 Mar 2020 04:12:05 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id y4sm3189481ejm.77.2020.03.13.04.12.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 04:12:04 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id v11so11561201wrm.9
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2020 04:12:03 -0700 (PDT)
X-Received: by 2002:adf:f545:: with SMTP id j5mr17149866wrp.295.1584097923138;
 Fri, 13 Mar 2020 04:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
 <12620787.dW097sEU6C@os-lin-dmo> <CAAFQd5BdS2oT+vgM3Qg64wPqWdPRi1uE6ZmOPwXwudv==3JQVA@mail.gmail.com>
 <6194402.K2JlShyGXD@os-lin-dmo>
In-Reply-To: <6194402.K2JlShyGXD@os-lin-dmo>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 13 Mar 2020 12:11:51 +0100
X-Gmail-Original-Message-ID: <CAAFQd5A-ZaTkx8YEdq=Q_KpbmzZ4kGxJ1ju8shXMot9WMytd=w@mail.gmail.com>
Message-ID: <CAAFQd5A-ZaTkx8YEdq=Q_KpbmzZ4kGxJ1ju8shXMot9WMytd=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] video_video: Add the Virtio Video V4L2 driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>, dstaessens@chromium.org,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com,
        Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 13, 2020 at 11:27 AM Dmitry Sepp
<dmitry.sepp@opensynergy.com> wrote:
>
> Hi Tomasz,
>
> On Freitag, 13. M=C3=A4rz 2020 11:05:35 CET Tomasz Figa wrote:
> > On Thu, Mar 12, 2020 at 12:48 PM Dmitry Sepp
> >
> > <dmitry.sepp@opensynergy.com> wrote:
> > > Hi Hans,
> > >
> > > One more thing:
> > > > GFP_DMA? That's unusual. I'd expect GFP_DMA32. All V4L2 drivers use
> > > > that.
> > >
> > > GFP_DMA32 had no effect for me on arm64. Probably I need to recheck.
> >
> > What's the reason to use any specific GFP flags at all? GFP_DMA(32)
> > memory in the guest would typically correspond to host pages without
> > any specific location guarantee.
> >
>
> Typically, but not always, especially for non x86. Say, some platforms do=
n't
> have IOMMUs for codec devices and those devices require physically contig=
 low
> memory. We had to find a way to handle that.

So basically your hypervisor guarantees that the guest pages inside
the GFP_DMA zone are contiguous and DMA-able on the host as well?
Given the Linux-specific aspect of GFP flags and differences in the
implementation across architectures, perhaps it would be a better idea
to use the DMA mask instead? That wouldn't currently affect vb2_dma_sg
allocations, but in that case the host decoder would have some IOMMU
anyway, right?

>
> Best regards,
> Dmitry.
>
> > Best regards,
> > Tomasz
> >
> > > Best regards,
> > > Dmitry.
> > >
> > > On Donnerstag, 12. M=C3=A4rz 2020 11:18:26 CET Hans Verkuil wrote:
> > > > On 3/12/20 11:15 AM, Dmitry Sepp wrote:
> > > > > Hi Hans,
> > > > >
> > > > > Thank you for your great detailed review!
> > > > >
> > > > > I won't provide inline answers as your comments totally make sens=
e.
> > > > > There
> > > > > is>
> > > > >
> > > > > only one thing I want to mention:
> > > > >>> + struct video_plane_format plane_format[VIRTIO_VIDEO_MAX_PLANE=
S];
> > > > >>
> > > > >> Why is this virtio specific? Any reason for not using
> > > > >> VIDEO_MAX_PLANES?
> > > > >
> > > > > I'd say this is because VIDEO_MAX_PLANES does not exist outside o=
f the
> > > > > Linux OS, so for whatever other system we need a virtio specific
> > > > > definition.
> > > >
> > > > OK, good reason :-)
> > > >
> > > > It's probably a good thing to add a comment where
> > > > VIRTIO_VIDEO_MAX_PLANES is defined that explains this.
> > > >
> > > > Regards,
> > > >
> > > >       Hans
>
>
