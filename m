Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 164A21A0D6E
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 14:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgDGMSb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 08:18:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41218 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgDGMSb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 08:18:31 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACABD59E;
        Tue,  7 Apr 2020 14:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586261909;
        bh=fPdYE8A3jszFhj8Ia41Q61eXHMMvA97zhV0Z1oSNhpo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ki3AHBrZ4A1pHq9QyVUJmBRoyYy6r5XgnCvPLxfUMdFWAd+t6vap0lPuXVl4Exjrn
         QGGFNT4zOWrpzji+6HaLIZro4VSBmpIW0R27U01g31cKRxQ33UG9t2g5bFRqwJzII4
         BTM6sXy8JiOEaVdicsbrqxvEd0mfTiJATCkYEotA=
Date:   Tue, 7 Apr 2020 15:18:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 2/5] media: i2c: ov5645: Drop reading clock-frequency
 dt-property
Message-ID: <20200407121818.GC4751@pendragon.ideasonboard.com>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWiVLt23a0JBDX6ZiKDiru9-ecgt3XF4Y5qzVOWXhLcCw@mail.gmail.com>
 <CA+V-a8tHb1OomhfdsWV5duyuypTKC_EWT4o=mMjWVsxu+aOnBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8tHb1OomhfdsWV5duyuypTKC_EWT4o=mMjWVsxu+aOnBQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Tue, Apr 07, 2020 at 08:40:06AM +0100, Lad, Prabhakar wrote:
> On Tue, Apr 7, 2020 at 8:17 AM Geert Uytterhoeven wrote:
> > On Mon, Apr 6, 2020 at 6:43 PM Lad Prabhakar wrote:
> > > Modes in the driver are based on xvclk frequency fixed to 24MHz, but where
> > > as the OV5645 sensor can support the xvclk frequency ranging from 6MHz to
> > > 24MHz. So instead making clock-frequency as dt-property just let the
> > > driver enforce the required clock frequency.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > However, still wondering about the "xvclk" name above and in the definition
> > below.  Is this the naming from the datasheet?
> > The DT bindings nor the driver use the "xvclk" naming.
> >
> xvclk naming is from the datasheet, although the 0v5645 datasheet on
> publicly available I have referred [1]/[2].
> If I am not wrong all the ov sensors have the same naming convention as xvclk.
> 
> [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
> [2] https://www.ovt.com/download/sensorpdf/126/OmniVision_OV5645.pdf

The clock in DT should really have been named xvclk, but it's too late
to change that. We can follow one of two approaches, either naming
everything xclk, and naming everything but the DT property xvclk. Both
have pros and cons, feel free to pick your preferred option, but in any
case a comment to explain the issue would be useful.

> > > --- a/drivers/media/i2c/ov5645.c
> > > +++ b/drivers/media/i2c/ov5645.c
> > > @@ -61,6 +61,8 @@
> > >  #define OV5645_SDE_SAT_U               0x5583
> > >  #define OV5645_SDE_SAT_V               0x5584
> > >
> > > +#define OV5645_XVCLK_FREQ              24000000
> > > +

-- 
Regards,

Laurent Pinchart
