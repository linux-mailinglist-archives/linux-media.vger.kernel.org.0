Return-Path: <linux-media+bounces-15036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339D932236
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 10:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC87628132A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 08:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6750417D37B;
	Tue, 16 Jul 2024 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l5nCvzC0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F634206A
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119714; cv=none; b=Bm9UdB7TL8Gq03FFLLdgYBONpJ9EY0OHl8fXkZz5llS620+EOtLysE/xnDdc6BWK5W4ufMPfA7gi663wMJL0kcOF9nbkIQ6SDRjFpG+9PrbGA44uFrhpqeSJ1FIGwb6m2wKKRUUKC/Gs42l8uybVhysgfjHuM6sihNqrmYujJsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119714; c=relaxed/simple;
	bh=TGl0l55YKO8ZxHxU7VmnhdGzWbAzp5wqVTIP4QoLdRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1GuiuMrE/CC4Utt8FQu0ruIxfrRUXPqwsejjnW8/Zck1iYTQrPwB7Rh4BIzIdKcmSeQJ8pcYBuGws2EU/HarznBWMh6umw25wnA8mbv9XjwolRZ6V7Kit7HseYI4741NTup7tpZPRQEcWlqw7u9BvnjC0e41fNtOveKpfRaYWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l5nCvzC0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF2D966F;
	Tue, 16 Jul 2024 10:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721119667;
	bh=TGl0l55YKO8ZxHxU7VmnhdGzWbAzp5wqVTIP4QoLdRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5nCvzC0TE15mj1jXzEvlRACX0eansdiDKAt3yFyjVNvloStUZkgTBbDfHl4Lh/qg
	 X3m5LZbDWle8+17yefxyYhWHOJYxQJOA+tj+oEj/I3VLaV4HSAYELsTS3A7D97VHSl
	 WVLctgtfXFy5dBo1xqXi2lev83Qy90MmTSTC7InE=
Date: Tue, 16 Jul 2024 10:48:20 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] media: pispbe: Protect against left-shift wrap in
 V4L2_COLORSPACE_MASK()
Message-ID: <74hch6w64p7yzn4wustd3btn7dglxxbuge3r6bapb6chbbddeu@vljc2qopn5kj>
References: <20240715102425.1244918-1-naush@raspberrypi.com>
 <t4zv56rnrprztgyjyjx3k3lzaitddky3c22bqslykq3qvxi7gi@jaafmm5uw6rs>
 <CAEmqJPrUbK-gpHfJG84iBeA_9WOJYLDoa4JaGjLvZYoq-nUgdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEmqJPrUbK-gpHfJG84iBeA_9WOJYLDoa4JaGjLvZYoq-nUgdg@mail.gmail.com>

Hi Naush

On Tue, Jul 16, 2024 at 08:57:56AM GMT, Naushir Patuck wrote:
> Hi Jacopo,
>
> On Mon, 15 Jul 2024 at 15:30, Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Hi Naush
> >
> > On Mon, Jul 15, 2024 at 11:24:25AM GMT, Naushir Patuck wrote:
> > > Ensure that the user requested colorspace value does not wrap when
> > > using the V4L2_COLORSPACE_MASK() macro. If the requested colorspace
> > > value >= BIT_PER_LONG, revert to the default colorspace for the given
> > > format.
> > >
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> >
> > Thanks for handling this
> >
> > > ---
> > >  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > index e74df5b116dc..bd5d77c691d3 100644
> > > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > @@ -1124,8 +1124,9 @@ static void pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
> > >        * not supported. This also catches the case when the "default"
> > >        * colour space was requested (as that's never in the mask).
> > >        */
> > > -     if (!(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
> > > -         fmt->colorspace_mask))
> > > +     if (f->fmt.pix_mp.colorspace >= BITS_PER_LONG ||
> > > +         !(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
> > > +           fmt->colorspace_mask))
> > >               f->fmt.pix_mp.colorspace = fmt->colorspace_default;
> >
> > Isn't it better handled in the macro definition itself so that future
> > usages of the V4L2_COLORSPACE_MASK() macro won't need to be protected
> > like this one ?
> >
> > Would this silence the smatch warning ?
> >
> > -#define V4L2_COLORSPACE_MASK(colorspace) BIT(colorspace)
> > +#define V4L2_COLORSPACE_MASK(c)        BIT((c) < V4L2_COLORSPACE_LAST ? \
> > +                                           (c) : V4L2_COLORSPACE_LAST)
> >
>
> I did consider this, but did not like the undesired behavior it would
> introduce.  With your suggested change above, we now switch the color
> space to an unsupported value (V4L2_COLORSPACE_DCI_P3, assuming we
> shift by V4L2_COLORSPACE_LAST - 1) if the user passed an invalid
> value.  Of course, this does subsequently get fixed when used in
> pispbe_try_format(), but not for the usage in pisp_be_formats.h.  In
> my original change, we revert to the default for the requested format
> instead.  Although, perhaps my test should be if
> (!v4l2_is_colorspace_valid(f->fmt.pix_mp.colorspace) ... instead.

Keep in mind the core 'sanitizes' the colorspace for you (see the
usage of v4l_sanitize_colorspace() in
drivers/media/v4l2-core/v4l2-ioctl.c) so a fix is need only to silence
smatch not to actually address any run-time issue.

>
> I'm ok with changing the macro considering the UAPI is unlikely to
> change, and usage in pisp_be_formats.h will likely not hit the problem
> any time.  Thoughts?

We could re-use v4l_sanitize_colorspace() but again, this change only
serve to please smatch.

Thanks
  j

>
> Naush
>
> >
> >
> > >
> > >       /* In all cases, we only support the defaults for these: */
> > > --
> > > 2.34.1
> > >

