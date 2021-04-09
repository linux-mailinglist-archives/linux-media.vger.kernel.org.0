Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B04335A49B
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 19:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbhDIR1B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 13:27:01 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:32679
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233713AbhDIR1A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 13:27:00 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Abr03kKnDZVW9L84g4ina0hwZcsnpDfNNimdD?=
 =?us-ascii?q?5ilNYBxZY6Wkvuqpm+kW0gKxtSYJVBgb6Kq9EYSjYVeZz5565oENIayvNTOMhE?=
 =?us-ascii?q?KEJJxvhLGM/xTOFyHy/eZW1+NBXsFFebvNJHdgi8KS2mOFOvMh2sTC0I3Av5am?=
 =?us-ascii?q?815JTRt2L51m9RtzEAyBEkZ7LTM2Z6YRMZqH+456oCC9cm4cdcSxCj09WfLfzu?=
 =?us-ascii?q?e78a7ORT4jK1oZ5BKVjTWugYSKaCSw+hsFSTtAzfMD3AH+8jDR3amov/GlxhK0?=
 =?us-ascii?q?7Qa6071slMLl2p9/AqW35PQ9ECnmiQqjee1aN4GqgTZdmoySwWdvvuLtjlMZH+?=
 =?us-ascii?q?kb0QKzQkiF5TXX+ySl6xoAgkWD9XaoxV/K5ez/Xi8zDMBM7LgpFSfx2g4FlJVG?=
 =?us-ascii?q?3K1GxG6fvZY/N2KloA3No/zBVxRrkUSVjBMZ4JYus0A=3D?=
X-IronPort-AV: E=Sophos;i="5.82,210,1613430000"; 
   d="scan'208";a="378242890"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 19:26:45 +0200
Date:   Fri, 9 Apr 2021 19:26:45 +0200 (CEST)
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
In-Reply-To: <YHCFsNZVGfjjyHDi@kali>
Message-ID: <alpine.DEB.2.22.394.2104091926280.17316@hadrien>
References: <cover.1617912177.git.mitaliborkar810@gmail.com> <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com> <f196d8ff-e8bf-360e-ee7b-cd2dcafd9742@xs4all.nl> <YHCFsNZVGfjjyHDi@kali>
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
> > The second patch can replace the (0<<3) etc. to BIT(0).
> >
> Then I guess only one new patch would be needed for proper alignment, am
> i right? I have to rename it as v2 or should send as a completely new
> patch?

v2 might reduce confusion.

julia

> > That would be a nice cleanup of this rather messy header.
> >
> > Thanks!
> >
> > 	Hans
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHCFsNZVGfjjyHDi%40kali.
>
