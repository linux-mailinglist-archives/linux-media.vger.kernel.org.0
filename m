Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0B3F4166
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 08:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfKHHf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 02:35:58 -0500
Received: from mail-qk1-f175.google.com ([209.85.222.175]:41216 "EHLO
        mail-qk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfKHHf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 02:35:58 -0500
Received: by mail-qk1-f175.google.com with SMTP id m125so4419727qkd.8
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 23:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6yiUt1MQOuFry119FxdUeAD8xPWm7rks6SBHzQkAB0A=;
        b=kDR7IkYjNx/mu4UGkogNa7GnejiRcP1RKwbr+68vtZos9u8d8gSCD1YvIx/f7g6tkb
         QQmIjr1lCfC3gjJW4ajzBiGGF8gdSluNMFeQ8H+PAQxgq6/9ebmgZ5/Fb+5Fd3fwBnYk
         DH8sUwYIVoDQcBud8fZvZK6aW74qz6YkY8UfOIjDgDxCnwjoYVlLef5t3fud7wafS0XV
         Dy6WugnYTSj+V5Oz4gmJejKL4ki+cRfzlrrwxeaku6lODQkRB558CivtvjuYsjJkRnJX
         y7js4NTrpOeDISrtiu0Olfmn6fApV2zU/KMz7z/d7tTlLyK7sy3r9D3YscwV3Z2t9oWx
         TDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6yiUt1MQOuFry119FxdUeAD8xPWm7rks6SBHzQkAB0A=;
        b=la4SAU4c9zn2tNkxF29jgainMN/Qt7Sodffx/9gap4Ha2Hy5RhMFlXSNQxdDFbTMcu
         g4jkHMHSfU+TzGpo5ZQ+bw/vpkSua70necFIl2Flzq+3K+ysoUJXTqoGg58VWztJhi3H
         nvEV9Wbe5rbjK9t65qXMzNHaP9wEpajbkxgaqOlg147c/LRk1ngH4q3O2lLSAc5DTJ11
         AhatqExhlK32TaCTrcqxX4NMWOM5TT+hknLmlrjQKFIxiBrwzRB0kfn/zbWeuNtBfDFF
         QEpQWAqKnNV2oz6+tch1uvEsKyDpKq0bYhat0HKyd0CdobqiC1JnppV4ybUtqHFSv07z
         +5/g==
X-Gm-Message-State: APjAAAUj8pvbMENt8u17lRQ+DJOM7++RieMUHw/44MSLFJPJTaFhNJv0
        bbt8sdJudsbjMA6If+b+m6pXd8vrCNrbAZGl9y4=
X-Google-Smtp-Source: APXvYqwXeWHDPNAEqvYe6uTrBCncL/H9iFRLbo4pyxR9xfAjjMucrF+DV1aJGvcaEeZAxB8f3i2P0sRu8Uuvy++V+7o=
X-Received: by 2002:a05:620a:14a2:: with SMTP id x2mr7566377qkj.236.1573198556068;
 Thu, 07 Nov 2019 23:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org> <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
 <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org>
In-Reply-To: <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org>
From:   Stefan Hajnoczi <stefanha@gmail.com>
Date:   Fri, 8 Nov 2019 08:35:44 +0100
Message-ID: <CAJSP0QWZc=z56CHEKa8WVe9Cw2-EhDFU+7NeGgL+g-Go5q3K5Q@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel <qemu-devel@nongnu.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 8, 2019 at 8:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > Adding a list of common properties to the spec certainly makes sense,
> > > so everybody uses the same names.  Adding struct-ed properties for
> > > common use cases might be useful too.
> >
> > Why not define VIRTIO devices for wayland and friends?
>
> There is an out-of-tree implementation of that, so yes, that surely is
> an option.
>
> Wayland needs (a) shared buffers, mostly for gfx data, and (b) a stream
> pipe as control channel.  Pretty much the same for X11, except that
> shared buffers are optional because the X protocol can also squeeze all
> display updates through the stream pipe.
>
> So, if you want allow guests talk to the host display server you can run
> the stream pipe over vsock.  But there is nothing for the shared
> buffers ...
>
> We could replicate vsock functionality elsewhere.  I think that happened
> in the out-of-tree virtio-wayland implementation.  There also was some
> discussion about adding streams to virtio-gpu, slightly pimped up so you
> can easily pass around virtio-gpu resource references for buffer
> sharing.  But given that getting vsock right isn't exactly trivial
> (consider all the fairness issues when multiplexing multiple streams
> over a virtqueue for example) I don't think this is a good plan.

I also think vsock isn't the right fit.

Defining a virtio-wayland device makes sense to me: you get the guest
RAM access via virtqueues, plus the VIRTIO infrastructure (device IDs,
configuration space, feature bits, and existing reusable
kernel/userspace/QEMU code).

Stefan
