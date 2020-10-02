Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75999281DEC
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 23:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgJBV61 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 17:58:27 -0400
Received: from mga06.intel.com ([134.134.136.31]:13725 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgJBV61 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 17:58:27 -0400
IronPort-SDR: Yi6D8GjMoC7sTJUlAKx0r3BC/V2b6YRihdaldQMyBMw4+hSlUBJoMcYbf4FdFQTOAxzKSfoM2C
 1PCdLYpqvNag==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="224704898"
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="224704898"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 14:58:26 -0700
IronPort-SDR: tx148VFM842kG7SSXEdAPUW0dSndg1y91OuwbNeTKyFUR/VrgNBVWqqi90ugE68TuHramjNamT
 17axtRbNXxXg==
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="458761596"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 14:58:24 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 975FE205EA; Sat,  3 Oct 2020 00:58:21 +0300 (EEST)
Date:   Sat, 3 Oct 2020 00:58:21 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v7 3/3] media: i2c: ov772x: Add test pattern control
Message-ID: <20201002215820.GZ26842@paasikivi.fi.intel.com>
References: <20201002165656.16744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201002165656.16744-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201002211311.GX26842@paasikivi.fi.intel.com>
 <CA+V-a8v3cLOe=vRSdPd91VGRxEwbrgmRrvYdfBPRNVPMvsQ0gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8v3cLOe=vRSdPd91VGRxEwbrgmRrvYdfBPRNVPMvsQ0gw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 02, 2020 at 10:32:05PM +0100, Lad, Prabhakar wrote:
> Hi Sakari,
> 
> Thank you for the review.
> 
> On Fri, Oct 2, 2020 at 10:13 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > On Fri, Oct 02, 2020 at 05:56:56PM +0100, Lad Prabhakar wrote:
> > > Add support for test pattern control supported by the sensor.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ov772x.c | 17 ++++++++++++++++-
> > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> > > index 6b46ad493bf7..b7e10c34ef59 100644
> > > --- a/drivers/media/i2c/ov772x.c
> > > +++ b/drivers/media/i2c/ov772x.c
> > > @@ -227,7 +227,7 @@
> > >
> > >  /* COM3 */
> > >  #define SWAP_MASK       (SWAP_RGB | SWAP_YUV | SWAP_ML)
> > > -#define IMG_MASK        (VFLIP_IMG | HFLIP_IMG)
> > > +#define IMG_MASK        (VFLIP_IMG | HFLIP_IMG | SCOLOR_TEST)
> > >
> > >  #define VFLIP_IMG       0x80 /* Vertical flip image ON/OFF selection */
> > >  #define HFLIP_IMG       0x40 /* Horizontal mirror image ON/OFF selection */
> > > @@ -425,6 +425,7 @@ struct ov772x_priv {
> > >       const struct ov772x_win_size     *win;
> > >       struct v4l2_ctrl                 *vflip_ctrl;
> > >       struct v4l2_ctrl                 *hflip_ctrl;
> > > +     unsigned int                      test_pattern;
> >
> > Alignment.
> >
> > You can get away with one or possibly two but three is too many in such a
> > small number of lines. :-)
> >
> It's aligned as per structure members (non pointers)

What a weird practice. Oh well. Keep as-is then.

checkpatch.pl no longer seems to complain about lines over 80. That keeps
the number of warnings lower but may lead to unintentional long lines when
you don't need them.

-- 
Sakari Ailus
