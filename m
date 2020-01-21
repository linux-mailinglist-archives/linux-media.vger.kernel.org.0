Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19A971435C3
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 03:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729047AbgAUCre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 21:47:34 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39204 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgAUCre (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 21:47:34 -0500
Received: by mail-lf1-f67.google.com with SMTP id y1so911811lfb.6
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2020 18:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u+pn4ui6Ng1mXgrGseSlzDVL23QH8gYAt0SNyPFDv94=;
        b=k5Y/zRI6Wpse+DVtUn6DWcc3oHOaKMJi8rO8oUf0yr3k7vwSfyqGe3o17AVJwHwnWc
         /13egervIl3dHHvuRG6d+X08x0TUflRFlekOxVyke/Br5rQ4bBkqp4ZCHo+urJE2JNKn
         R4QzmJpL8X4FcVQRfuGv/BTc/ZGf9b2JJwzhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u+pn4ui6Ng1mXgrGseSlzDVL23QH8gYAt0SNyPFDv94=;
        b=QRs4XxBIez4FylqOYCDMLURUKfwliJ8ReDjQKKZiD6LQMFuo43EJYgm9Ze5MXJ9uC8
         E4pICEG+uLdhNf+g6mAtDBXpFUR8HVYbN3ZepjAOcfxlhhWyG01+TdYna7y8A4befip6
         nCcT/j/uv1p7Q5EheJkHcEmuTM83nwJS5VZi4Dt1hA32M64tiVofG6XU8+dGJFttRYGk
         a69bgjJ0xXyIsPVV2N6Ps7/0/mWUsmAEZVCqigkurnecBWzQyLKgapf4kfrTZMDv/Zp3
         D8sbVXO6ABPwmtY47PGcPfDvS+aI9wbyysw/YmhraMwYnYBVOntKHfXu9tXE/CQfbVzl
         50kQ==
X-Gm-Message-State: APjAAAX/fD9COHN4etvnp6Q0N9yDPCoTwwHrFBTsxib5icfoqg+vH2w3
        gDHdHGLMkO20/3Gx5S64MgvuEZRuqcVmmV2Js/0cCQ==
X-Google-Smtp-Source: APXvYqz+Ie2Hk3Qp7MF/iN7GrivJEAQgQCuAnCKG3YCbPWbBc0x+hWlAEllhS5hJQfgoBPtmRrFzQSC78RwYWttwHk4=
X-Received: by 2002:ac2:5a43:: with SMTP id r3mr1297798lfn.150.1579574852798;
 Mon, 20 Jan 2020 18:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <7740094.NyiUUSuA9g@os-lin-dmo> <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo> <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
 <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
 <20200113132654.r4lhspfx2z7zse2v@sirius.home.kraxel.org> <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
 <20200115112640.52kemwg4lncuvvir@sirius.home.kraxel.org> <CAD90VcaAaomTnwVESp9RaBwhjx+cKjXAJv4T7wSkFiCEhOUo5Q@mail.gmail.com>
 <20200120104755.3hhxlx6x6o32bagf@sirius.home.kraxel.org>
In-Reply-To: <20200120104755.3hhxlx6x6o32bagf@sirius.home.kraxel.org>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Tue, 21 Jan 2020 11:47:20 +0900
Message-ID: <CAD90Vcak0iohLny9UjkqtBmM0px7Rz1mqQE6jw1wdu66QB4U3Q@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v2 0/1] VirtIO video device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        spice-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Jan 20, 2020 at 7:48 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > Hmm, using (ii) the API, then check whenever your three plane buffers
> > > happen to have the correct layout for (1) hardware looks somewhat
> > > backwards to me.
> >
> > Can't this problem be solved by adding "offset" field in virtio_video_mem_entry?
> >
> > struct virtio_video_mem_entry {
> >   le64 addr;
> >   le32 length;
> >   le32 offset;
> >   u8 padding[4];
> > };
> >
> > Here, "addr" must be the same in every mem_entry for (1) hardware.
>
> No.  virtio_video_mem_entry is basically a scatter list entry, you use
> an *array* of these entries to describe your buffer (unless you are
> using CMA due to hardware requirements, in this special case you have
> only one entry in your array).

I see. I forgot about scatter list.
However, I'm still not sure about the usage for CMA.
if we're using CMA for a multiplanar format, how can the device know
where the second plane start from?
In my understanding, the number of entries in this case should be the
same with the number of planes and
"entries[0].addr + entries[0].length == entries[1].addr" should hold.

>
> > > I'd suggest to use (i) API and allow the device specify alignment
> > > requirements.  So (1) hardware would say "need_align=0", whereas (3)
> > > hardware would probably say "need_align=PAGE_SIZE" so it can easily
> > > split the single buffer into three per-plane buffers.
> >
> > Just to confirm, is "need_align" a field added in virtio_video_format_desc?
>
> Given that different formats might have different alignment
> requirements this looks like a good place to me.  Maybe rename to
> plane_align to make clear what kind of alignment this is.

"plane_align" sounds better. Thanks.

Best regards,
Keiichi

>
> cheers,
>   Gerd
>
