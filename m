Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17257B0877
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 07:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbfILFw1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 01:52:27 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:32899 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfILFw0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 01:52:26 -0400
Received: by mail-ed1-f66.google.com with SMTP id o9so22853613edq.0
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 22:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zYhiCckqOXI05h66pSc49yJ2M97KJomA6zTeLvJqATU=;
        b=N/6X6JFb465MDW4UOH0bJ7UVlCMn+fKiILQz+XlhCgqXqKZ9Gln8gkjQO7D8f43Vzm
         8eX6U8FbQTFyGpMJuEIR5MnYhp7cSge0yKbrEn6SoCMmpJy8xajyWMuzdHAK1sFYI/j3
         L28pcq5cBcvI3laZEDztFQ9iIzw4pxAhg3YSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zYhiCckqOXI05h66pSc49yJ2M97KJomA6zTeLvJqATU=;
        b=tcQHZ/1eR1ggQm/Erwtse/vsO1i1mG9qW2N96CgRoS/GRD3y+SaEVU3DHkiGNxMVRF
         58l6k8SD5xshwzYCw/e1hxFhpeyHZccBKbq+LhEa5zOKGDBXQ/JPfDHx5paH1YSGA3FI
         Ppj4xQL806Mce2d+ml6fVo5G16a6Ql3W1eBAbVegKwZkRsW4PXFS+S591rtNYmkgCSNI
         H4CUHdyLqrxW2ih/oJAi8F2pw/IStI/Kl8t05YbfywiraazDLLaOwTogTfBNuH1ErhUD
         7edZvu2dhTupopL0WBTfMdmBzCi+hkBUqb0k0FGT7874yJhd+naAjeUtyh7ejfHA51U0
         LcPg==
X-Gm-Message-State: APjAAAXEEhDH+LK9/VuWuG0sDq2qgyEa5nuYEa5vfPtE2M6OGCERxwH1
        e4w5DTllX31utYLSv/5Hc4vPZ3vqT72cWQ==
X-Google-Smtp-Source: APXvYqzIvy+Jnnm3AvkJ9a9KT6YDYZ4UoiiF1lZKjRiql0uRf45z3e1wkCwttWi2AsyEG0qJr/bmQg==
X-Received: by 2002:a50:f152:: with SMTP id z18mr39332630edl.141.1568267544968;
        Wed, 11 Sep 2019 22:52:24 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id bt11sm4530191edb.65.2019.09.11.22.52.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2019 22:52:22 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id t3so1925498wmj.1
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 22:52:21 -0700 (PDT)
X-Received: by 2002:a1c:c104:: with SMTP id r4mr7245357wmf.64.1568267541410;
 Wed, 11 Sep 2019 22:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190903181711.7559-1-ezequiel@collabora.com> <CAAFQd5AdikoN+7TG=0ZGFkSzaK2UFHM4VG7SYtfUtmjQgD61zA@mail.gmail.com>
 <6e493142690d48ee7e65c1cb2a4d6aec1e3b671b.camel@collabora.com> <c7b62640ae0e57a9da0c6c5245b5454af08ad2a0.camel@ndufresne.ca>
In-Reply-To: <c7b62640ae0e57a9da0c6c5245b5454af08ad2a0.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 12 Sep 2019 14:52:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CKkdN0byeAonPvvzmHQ5CRXLRVidAG8FGmxExHzgvaqA@mail.gmail.com>
Message-ID: <CAAFQd5CKkdN0byeAonPvvzmHQ5CRXLRVidAG8FGmxExHzgvaqA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Enable Hantro G1 post-processor
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 12, 2019 at 4:49 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le mercredi 11 septembre 2019 =C3=A0 09:27 +0100, Ezequiel Garcia a =C3=
=A9crit :
> > On Mon, 2019-09-09 at 16:07 +0900, Tomasz Figa wrote:
> > > Hi Ezequiel,
> > >
> > > On Wed, Sep 4, 2019 at 3:17 AM Ezequiel Garcia <ezequiel@collabora.co=
m> wrote:
> > > > Hi all,
> > > >
> > > > This series enables the post-processor support available
> > > > on the Hantro G1 VPU. The post-processor block can be
> > > > pipelined with the decoder hardware, allowing to perform
> > > > operations such as color conversion, scaling, rotation,
> > > > cropping, among others.
> > > >
> > > > The decoder hardware needs its own set of NV12 buffers
> > > > (the native decoder format), and the post-processor is the
> > > > owner of the CAPTURE buffers. This allows the application
> > > > get processed (scaled, converted, etc) buffers, completely
> > > > transparently.
> > > >
> > > > This feature is implemented by exposing other CAPTURE pixel
> > > > formats to the application (ENUM_FMT). When the application
> > > > sets a pixel format other than NV12, the driver will enable
> > > > and use the post-processor transparently.
> > >
> > > I'll try to review the series a bit later, but a general comment here
> > > is that the userspace wouldn't have a way to distinguish between the
> > > native and post-processed formats. I'm pretty much sure that
> > > post-processing at least imposes some power penalty, so it would be
> > > good if the userspace could avoid it if unnecessary.
> > >
> >
> > Hm, that's true, good catch.
> >
> > So, it would be desirable to retain the current behavior of allowing
> > the application to just set a different pixel format and get
> > a post-processed frame, transparently.
> >
> > But at the same time, it would be nice if the application is somehow
> > aware of the post-processing happening. Maybe we can expose a more
> > accurate media controller topology, have applications enable
> > the post-processing pipeline explicitly.
>
> How it works on the stateful side is that userspace set the encoding
> type (the codec), then passes a header (in our case, there will be
> parsed structures replacing this) first. The driver then configure
> capture format, giving a hint of the "default" or "native" format. This
> may or may not be sufficient, but it does work in giving userspace a
> hint.

The bad side of that is that we can't handle more than 1 native format.

For the most backwards-compatible behavior, sorting the results of
ENUM_FMT according to format preference would allow the applications
that choose the first format returned that works for them to choose
the best one.

For a further improvement, an ENUM_FMT flag that tells the userspace
that a format is preferred could work.

That said, modelling the pipeline appropriately using the media
controller is the idea I like the most, because it's the most
comprehensive solution. That would have to be well specified and
documented, though, and sounds like a long term effort.

Best regards,
Tomasz
