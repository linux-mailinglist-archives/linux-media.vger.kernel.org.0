Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28992F1244
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 13:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbhAKMZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 07:25:46 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53536 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbhAKMZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 07:25:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 888DA1F44A81
Message-ID: <5b6d07096cbc19da68bbbfd29acb6c9ad584935b.camel@collabora.com>
Subject: Re: [PATCH] hantro: Format IOCTLs compliance fixes
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 11 Jan 2021 09:24:55 -0300
In-Reply-To: <CANiDSCuy9MPK8qpwEz4CTta54i6S=k3DsempGLYssU2NtFGM3Q@mail.gmail.com>
References: <20210111113529.45488-1-ribalda@chromium.org>
         <ef218bf2bd948961079237686b58a00ca1b125bf.camel@collabora.com>
         <CANiDSCsX3k7xeC7Sr2T2SxHqspay+i054rAuv-NYCQpFRNuGeg@mail.gmail.com>
         <CANiDSCuy9MPK8qpwEz4CTta54i6S=k3DsempGLYssU2NtFGM3Q@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-01-11 at 13:22 +0100, Ricardo Ribalda wrote:
> Hi Ezequiel
> 
> On Mon, Jan 11, 2021 at 12:55 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > 
> > Hi Ezequiel
> > 
> > On Mon, Jan 11, 2021 at 12:48 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > 
> > > Hi Ricardo,
> > > 
> > > On Mon, 2021-01-11 at 12:35 +0100, Ricardo Ribalda wrote:
> > > > Clear the reserved fields.
> > > > 
> > > > Fixes:
> > > >   fail: v4l2-test-formats.cpp(482): pix_mp.plane_fmt[0].reserved not zeroed
> > > > test VIDIOC_TRY_FMT: FAIL
> > > >   fail: v4l2-test-formats.cpp(482): pix_mp.plane_fmt[0].reserved not zeroed
> > > > test VIDIOC_S_FMT: FAIL
> > > > 
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/staging/media/hantro/hantro_v4l2.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > > > index b668a82d40ad..9b384fbffc93 100644
> > > > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > > > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > > > @@ -239,6 +239,7 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
> > > >         const struct hantro_fmt *fmt, *vpu_fmt;
> > > >         bool capture = V4L2_TYPE_IS_CAPTURE(type);
> > > >         bool coded;
> > > > +       int i;
> > > > 
> > > >         coded = capture == ctx->is_encoder;
> > > > 
> > > > @@ -293,6 +294,10 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
> > > >                         pix_mp->width * pix_mp->height * fmt->max_depth;
> > > >         }
> > > > 
> > > > +       for (i = 0; i < pix_mp->num_planes; i++)
> > > > +               memset(pix_mp->plane_fmt[i].reserved, 0,
> > > > +                      sizeof(pix_mp->plane_fmt[i].reserved));
> > > > +
> > > 
> > > This looks like something that should be handled at the core,
> > > probably in drivers/media/v4l2-core/v4l2-ioctl.c::v4l_try_fmt().
> > 
> > The core does clear the reserved field from v4l2_pix_format_mplane,
> 
> My bad, It is also clearing the per plane reserved field. I was
> testing in an old kernel.
> 

OK, cool.

> The grep it is still valid though. We can remove all the memsets in the drivers.
> 

That would be very nice indeed.

Thanks,
Ezequiel

