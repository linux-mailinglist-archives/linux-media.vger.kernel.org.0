Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C0635A1FE
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 17:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhDIP3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 11:29:52 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:59896
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229665AbhDIP3w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 11:29:52 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AvN0Vi643PBWk+UYPHQPXwHbXdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/20lPMA2hPuzBoXUncsmdePUZPgfVr385lp7Y4NeYqzRQWOgg?=
 =?us-ascii?q?WVBaxr8IeK+UyFJwTQ7ehYvJ0NT4FbKPndSWd3ltz75g7QKbYd6f2K6rqhi+ub?=
 =?us-ascii?q?71oFd3AJV4ha4w10ChmWHyRNLWEsb6YRL5aA+tFB4wOpZHV/VLXZOlA+Q+PBq9?=
 =?us-ascii?q?fX/aiKXTc6AXcchzWmvHeHzPrBHxKFxRcCQ1p0sNEf2FmAtRf46KWlu/SS0QTd?=
 =?us-ascii?q?yGfX0pRTlLLau75+Lf3Jt+xQEBLQsEKTQLlZMofy2wwInA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,209,1613430000"; 
   d="scan'208";a="378232684"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 17:29:37 +0200
Date:   Fri, 9 Apr 2021 17:29:37 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Mitali Borkar <mitaliborkar810@gmail.com>
cc:     Hans Verkuil <hverkuil@xs4all.nl>, clabbe@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] Re: [PATCH 1/2] media: zoran: add spaces
 around '<<'
In-Reply-To: <YHBukmdxSiRc+K6I@kali>
Message-ID: <alpine.DEB.2.22.394.2104091729080.13602@hadrien>
References: <cover.1617912177.git.mitaliborkar810@gmail.com> <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com> <f196d8ff-e8bf-360e-ee7b-cd2dcafd9742@xs4all.nl> <YHBukmdxSiRc+K6I@kali>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Fri, 9 Apr 2021, Mitali Borkar wrote:

> On Fri, Apr 09, 2021 at 09:23:22AM +0200, Hans Verkuil wrote:
> > Hi Mitali,
> >
> > On 08/04/2021 22:38, Mitali Borkar wrote:
> > > Added spaces around '<<' operator to improve readability and meet linux
> > > kernel coding style.
> > > Reported by checkpatch
> > >
> > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > ---
> > >  drivers/staging/media/zoran/zr36057.h | 14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
> > > index 71b651add35a..a2a75fd9f535 100644
> > > --- a/drivers/staging/media/zoran/zr36057.h
> > > +++ b/drivers/staging/media/zoran/zr36057.h
> > > @@ -30,13 +30,13 @@
> > >  #define ZR36057_VFESPFR_HOR_DCM          14
> > >  #define ZR36057_VFESPFR_VER_DCM          8
> > >  #define ZR36057_VFESPFR_DISP_MODE        6
> > > -#define ZR36057_VFESPFR_YUV422          (0<<3)
> > > -#define ZR36057_VFESPFR_RGB888          (1<<3)
> > > -#define ZR36057_VFESPFR_RGB565          (2<<3)
> > > -#define ZR36057_VFESPFR_RGB555          (3<<3)
> > > -#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
> > > -#define ZR36057_VFESPFR_PACK24          (1<<1)
> > > -#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
> > > +#define ZR36057_VFESPFR_YUV422          (0 << 3)
> > > +#define ZR36057_VFESPFR_RGB888          (1 << 3)
> > > +#define ZR36057_VFESPFR_RGB565          (2 << 3)
> > > +#define ZR36057_VFESPFR_RGB555          (3 << 3)
> > > +#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
> > > +#define ZR36057_VFESPFR_PACK24          (1 << 1)
> > > +#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
> > >
> > >  #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
> > >
> > >
> >
> > I looked at that header and it is very messy.
> >
> > Can you make two new patches? The first aligns every nicely, e.g. this:
> >
> > #define ZR36057_VFEHCR          0x000   /* Video Front End, Horizontal Configuration Register */
> > #define ZR36057_VFEHCR_HS_POL             BIT(30)
> > #define ZR36057_VFEHCR_H_START           10
> > #define ZR36057_VFEHCR_H_END            0
> > #define ZR36057_VFEHCR_HMASK            0x3ff
> >
> > should become:
> >
> > /* Video Front End, Horizontal Configuration Register */
> > #define ZR36057_VFEHCR			0x000
> > #define ZR36057_VFEHCR_HS_POL		BIT(30)
> > #define ZR36057_VFEHCR_H_START		10
> > #define ZR36057_VFEHCR_H_END		0
> > #define ZR36057_VFEHCR_HMASK		0x3ff
> >
> > Same for all the other register blocks. Use tabs to do the alignment
> > instead of spaces, as is currently the case.
> >
> Okay Sir, will do this.
>
> > The second patch can replace the (0<<3) etc. to BIT(0).
> >
> Sir may I know how to write (2<<3) in BIT() form? Like I am still
> learning and not sure how to convert this. Should it be BIT(2)? But this
> is only possible for (1<<nr), PLease help me out.

I think that you are correct.  BIT is not usable her.

julia

>
> Thanks.
>
> > That would be a nice cleanup of this rather messy header.
> >
> > Thanks!
> >
> > 	Hans
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHBukmdxSiRc%2BK6I%40kali.
>
