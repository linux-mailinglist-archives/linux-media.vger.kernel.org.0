Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E20567D636
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 09:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730735AbfHAHUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 03:20:13 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36655 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729459AbfHAHUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 03:20:12 -0400
Received: by mail-ed1-f66.google.com with SMTP id k21so68170450edq.3
        for <linux-media@vger.kernel.org>; Thu, 01 Aug 2019 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k3HgBG8dgms5aeg3KKVbilyEzZjF4gJI3+pzI6ZqB7c=;
        b=DgDNW/rwQ9RQMEgFi3r3eO0bKXwgH3+xgNXhRN9nikI0MID4Y8Q+aITx64bwslu/R6
         CUVtBW5HMK2/yH4JfolC0xoP4qpayTQPDitAKqzlki4L5sdd+3Id9L9a0ytS0LUbJNbf
         c64BC68THi/AmMpHoomg8lsILIyEMdueFVxVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k3HgBG8dgms5aeg3KKVbilyEzZjF4gJI3+pzI6ZqB7c=;
        b=RlrWRztMSuIjYkbM3niNOAUuBNxNFuT2SvMuOWYe3LiuOBXzmXb7YHZWRXH2UQLzY9
         y+F/mejbB9/dUPM6Kjb0AWGApP4Zn/k0triVI7xNFBN3fw4e6R4QAeIpGfQo/MJI9oQz
         hXhYubnFcM7yxxXO+jBWKTJod4onyS/9Llyssh+5du3HQHJdnvVd0NeDF3iwrXZDqVrG
         gvMBI4KyCK3RbX4WXsqX1OZFtCX2wGIfOOq2+47w+j2UwCbkEHM4aBmwNG5Aq0piEpj6
         h6/znywmMdQDSX6luiDndusXAB0U1BNBtoAxpymHT+zIEgGulihX2iS5e4CTVx12pS11
         6wRA==
X-Gm-Message-State: APjAAAWYLNNinup8+73fvQ07z9lnHwID0/dqyRJyNU5AwNGZ2hUwtOk4
        gV/D86Ea4r9UWMKnz7ZyZv3y8gY1wbZzcw==
X-Google-Smtp-Source: APXvYqyzVlXM9JWEQEeHY+qMl+4pOnVUl6GhFKakhvM7HVMXvB1ctre3M53f9RvfOXgkFrYoWKMVpw==
X-Received: by 2002:a17:906:ccc3:: with SMTP id ot3mr99532119ejb.113.1564644010007;
        Thu, 01 Aug 2019 00:20:10 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id q50sm17795223edd.91.2019.08.01.00.20.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 00:20:09 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id r1so72346491wrl.7
        for <linux-media@vger.kernel.org>; Thu, 01 Aug 2019 00:20:09 -0700 (PDT)
X-Received: by 2002:a5d:5012:: with SMTP id e18mr18039721wrt.166.1564643575835;
 Thu, 01 Aug 2019 00:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190619121540.29320-1-boris.brezillon@collabora.com>
 <20190619121540.29320-8-boris.brezillon@collabora.com> <CAHD77HksotqFBTE84rRM=DuNFX=YJPs=YnsuFkaN-pWUNCtoxA@mail.gmail.com>
 <20190801070410.GA22382@aptenodytes>
In-Reply-To: <20190801070410.GA22382@aptenodytes>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 1 Aug 2019 16:12:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BPFLqu0JvyxTfS9UAfWanFcXzFtuJ9jcPmHV+XSq6cvQ@mail.gmail.com>
Message-ID: <CAAFQd5BPFLqu0JvyxTfS9UAfWanFcXzFtuJ9jcPmHV+XSq6cvQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] media: hantro: Add core bits to support H264 decoding
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hertz Wong <hertz.wong@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 1, 2019 at 4:04 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Thu 01 Aug 19, 13:06, Tomasz Figa wrote:
> > Hi Boris,
> >
> > On Wed, Jun 19, 2019 at 9:15 PM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > [snip]
> > > @@ -533,10 +535,21 @@ hantro_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
> > >                 return -EINVAL;
> > >         }
> > >
> > > +       /* The H264 decoder needs extra size on the output buffer. */
> > > +       if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE_RAW)
> > > +               extra_size0 = 128 * DIV_ROUND_UP(pixfmt->width, 16) *
> > > +                             DIV_ROUND_UP(pixfmt->height, 16);
> > > +
> >
> > I wonder if this shouldn't be accounted for already in the sizeimage
> > returned by TRY_/S_FMT, so that the application can know the required
> > buffer size if it uses some external allocator and DMABUF memory type.
> > I know we had it like this in our downstream code, but it wasn't the
> > problem because we use minigbm, where we explicitly add the same
> > padding in the rockchip backend. Any thoughts?
>
> Does the extra size have to be allocated along with the buffer?
>
> On cedrus, we have a need for a similar side-buffer but give it a dedicated CMA
> allocation, which should allow dma-buf-imported buffers.

Yes, the decoder stores motion vectors (IIRC) after the image data.

Best regards,
Tomasz
