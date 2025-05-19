Return-Path: <linux-media+bounces-32827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F60ABC1DE
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 17:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ECB216A64F
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5E62853F1;
	Mon, 19 May 2025 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ien3eT3b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8E61DF273
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 15:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667621; cv=none; b=upv6Y+DUg/y0iJ7psfR8HR8dMD0lEsQTubcss727E0EHCnI8K9CzsuOIgJUFfPIp53hgfZVWfrrz+oRGLGycu2elDck5LcurpAcf8Rs1/xjwW02c/XwZX+U/Lgv34HuAr/Uguhz5mCqS0SSEhhTTgNK2RaAJYobZ2DrXwpktbxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667621; c=relaxed/simple;
	bh=tgAKCWDNjh/l/itCxOLkLqaJOBvm0hiKo6rKL2M3Ah8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jn7zdvP7dllHFAJtL9PbriiExw1tj3TrlMqsJ2edNZaa1sWIl3I3iBVPktJ4XaeX545WPajfnmwIQ6rdnrCbtNP6EV+i66JBiMhMaa9EBzX5pj4thLp2M6F5FZw4TLfOKmRQWV0r6zhWHSIfhtG+pOMdd72lTXQP2iJ3heT7b6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ien3eT3b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F017446;
	Mon, 19 May 2025 17:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747667597;
	bh=tgAKCWDNjh/l/itCxOLkLqaJOBvm0hiKo6rKL2M3Ah8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ien3eT3b4AGN/3b4EPZAHMrYOCUSNF+IpUgyX3ee4+dLACXEPvZ3yrLAxjaRUyruA
	 coas3zgNaMYZusW4pOu1+kUYqYTNOiujkGgStWVFVg9HXJw1/7dCzZaVWHlwT6VTFo
	 DU+o89UtqkZRjXVuwEOLNWtOe8fDQIQTtkQMPb8I=
Date: Mon, 19 May 2025 17:13:34 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
Message-ID: <kfnemrwbws2o3vurj3mkwfvzsrruamefp67emdpr7vr3n6dfl6@j62unwtgapak>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-4-dan.scally@ideasonboard.com>
 <aB4OfjTGktdu7Yos@tom-desktop>
 <i4g722z6a3i4xnre6b3ne76w7acxcjy2j3ztww4ndvabungeuw@ovecz2bqewr6>
 <3eb69cea-b511-412e-a126-ce246c2491df@bp.renesas.com>
 <CA+V-a8v4rw9dD04obCT+gs1Npas3nopeC+xjU0bcBYCNwrqzhA@mail.gmail.com>
 <dad4c6dd-b3d6-4a2e-a418-fe311cf871c4@ideasonboard.com>
 <ol3hnn5e4srxx37cdxc4lutnwpu2u3i6bjzczz6zyinxwaq7o7@7rlp7dfhys3i>
 <0fa552e9-36b0-4a6b-a2aa-e786d4540f1a@bp.renesas.com>
 <434764d4-1572-48e1-9be0-6a32f8c8a96c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <434764d4-1572-48e1-9be0-6a32f8c8a96c@ideasonboard.com>

Hi Dan

On Mon, May 19, 2025 at 03:53:44PM +0100, Dan Scally wrote:
>
> On 19/05/2025 15:32, Tommaso Merciai wrote:
> > Hi Jacopo, Dan,
> > Thanks for your comments! :)
> >
> > On 19/05/25 16:09, Jacopo Mondi wrote:
> > > Hi Dan
> > >
> > > On Mon, May 19, 2025 at 02:07:04PM +0100, Dan Scally wrote:
> > > > Hi again
> > > >
> > > > On 15/05/2025 12:59, Lad, Prabhakar wrote:
> > > > > Hi Tommaso,
> > > > >
> > > > > On Fri, May 9, 2025 at 4:41 PM Tommaso Merciai
> > > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > > Hi Jacopo,
> > > > > > Thanks for your comment.
> > > > > >
> > > > > > On 09/05/25 16:50, Jacopo Mondi wrote:
> > > > > > > Hi Tommaso
> > > > > > >
> > > > > > > On Fri, May 09, 2025 at 04:17:34PM +0200, Tommaso Merciai wrote:
> > > > > > > > Hi Daniel,
> > > > > > > > Thanks for your patch.
> > > > > > > >
> > > > > > > > On Tue, May 06, 2025 at 01:50:12PM +0100, Daniel Scally wrote:
> > > > > > > > > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > > > > > > > >
> > > > > > > > > The rzg2l_csi2_calc_mbps() function currently tries to calculate the
> > > > > > > > > link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
> > > > > > > > > of the remote subdevice. Switch the function to v4l2_get_link_freq()
> > > > > > > > > which correctly targets V4L2_CID_LINK_FREQ before falling back on
> > > > > > > > > V4L2_CID_PIXEL_RATE if the former is unavailable.
> > > > > > > > >
> > > > > > > > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > > > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > > Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > > > > > > > > ---
> > > > > > > > > Changes in v4:
> > > > > > > > >
> > > > > > > > >       - Used separate s64 variable as return value for v4l2_get_link_freq()
> > > > > > > > >         and as the mbps variable for do_div() to avoid compilation warnings.
> > > > > > > > >
> > > > > > > > > Changes in v3:
> > > > > > > > >
> > > > > > > > >       - Fixed mbps sign
> > > > > > > > >
> > > > > > > > > Changes in v2:
> > > > > > > > >
> > > > > > > > >       - None
> > > > > > > > >
> > > > > > > > >     .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++----------
> > > > > > > > >     1 file changed, 12 insertions(+), 15 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git
> > > > > > > > > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > > > > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > > > > > > > index 9243306e2aa9..8870c2cb8104 100644
> > > > > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > > > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > > > > > > > @@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
> > > > > > > > >       const struct rzg2l_csi2_format *format;
> > > > > > > > >       const struct v4l2_mbus_framefmt *fmt;
> > > > > > > > >       struct v4l2_subdev_state *state;
> > > > > > > > > -   struct v4l2_ctrl *ctrl;
> > > > > > > > >       u64 mbps;
> > > > > > > > > -
> > > > > > > > > -   /* Read the pixel rate control from remote. */
> > > > > > > > > -   ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> > > > > > > > > -   if (!ctrl) {
> > > > > > > > > -           dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
> > > > > > > > > -                   source->name);
> > > > > > > > > -           return -EINVAL;
> > > > > > > > > -   }
> > > > > > > > > +   s64 ret;
> > > > > > > > >
> > > > > > > > >       state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
> > > > > > > > >       fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
> > > > > > > > >       format = rzg2l_csi2_code_to_fmt(fmt->code);
> > > > > > > > >       v4l2_subdev_unlock_state(state);
> > > > > > > > >
> > > > > > > > > -   /*
> > > > > > > > > -    * Calculate hsfreq in Mbps
> > > > > > > > > -    * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> > > > > > > > > -    */
> > > > > > > > > -   mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> > > > > > > > > -   do_div(mbps, csi2->lanes * 1000000);
> > > > > > > > > +   /* Read the link frequency from remote subdevice. */
> > > > > > > > > +   ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> > > > > > > > > +                            csi2->lanes);
> > > > > div needs to be updated in v4l2_get_link_freq() as below so that when
> > > > > subdev has only V4L2_CID_PIXEL_RATE we get the correct value.
> > > > >
> > > > >           ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> > > > > -                                csi2->lanes);
> > > > > +                                csi2->lanes * 2);
> > > > >
> > > > > > > > > +   if (ret < 0) {
> > > > > > > > > +           dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
> > > > > > > > > +                   source->name);
> > > > > > > > > +           return -EINVAL;
> > > > > > > > > +   }
> > > > > > > > > +
> > > > > > > > > +   mbps = ret;
> > > > > > > > > +   do_div(mbps, 1000000);
> > > > > > > > >
> > > > > > > > >       return mbps;
> > > > > > > > >     }
> > > > > > > > I tested this series with an imx219 image sensor connected to the CSI-2
> > > > > > > > RX IP of RZ/G3E:
> > > > > > > >
> > > > > > > > Some notes:
> > > > > > > >
> > > > > > > >     - pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
> > > > > > > >     - hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> > > > > > > >
> > > > > > > > Then hsfreq should be:
> > > > > > > The old code seems to call 'hsfreq' the per-lane bandwidth
> > > > > > >
> > > > > > > -      * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> > > > > > >
> > > > > > > And not the per-lane frequency as the variable name and the commit message
> > > > > > > suggest
> > > > > > >
> > > > > > > >     - hsfreq = link_freq * 2
> > > > > > > if that's the intention, due to CSI-2 DDR, then you're correct I
> > > > > > > think ?
> > > > > > >
> > > > > > > Seeing that also Laurent has reviewed it, and Prabhakar tested it, I wonder
> > > > > > > if we all have missed that the original code didn't have a / 2
> > > > > I agree the orignal code missed a / 2. I think we need a fixup patch
> > > > > (so that this can be backported) and then this change to use
> > > > > v4l2_get_link_freq().
> > > > >
> > > > > > > Dan, did you ever notice issues during your testing ?
> > > > > > >
> > > > > > > Also, with the introduction of 15f0035bfd0a ("media: v4l: Support
> > > > > > > passing media pad argument to v4l2_get_link_freq()") it's probably now
> > > > > > > better to pass the source's pad to v4l2_get_link_freq() ?
> > > > > > >
> > > > > > > > Please correct me if I'm wrong.
> > > > > > > >
> > > > > > > >
> > > > > > > > After applying this series. I'm getting the following issue testing the
> > > > > > > > imx219 sensor with SRGGB8_1X8 and SGRBG10_1X10 color format.
> > > > > > > Does the error go away if you multiply the link_freq by 2 ?
> > > > > > Yes the error goes away on my side using:
> > > > > >
> > > > > > mbps = ret * 2;
> > > > > >
> > > > > I tested the above with an OV5645 sensor and see no issues.
> > > >
> > > >
> > > > Actually, I'm missing something here. Tommaso, you're using an imx219? So
> >
> > Yes, tested with an imx219 image sensor.
> >
> > > > V4L2_CID_LINK_FREQ should be 456000000 and V4L2_CID_PIXEL_RATE should be
> > > > 182400000. The original calculation (assuming a 10-bit format and 2 lanes)
> > > > is 182400000 * 10 / (2 * 1000000) = 912. That's double the link frequency in
> > > > Mbps (456) so I understand that the / 2 was missing...but the function with
> > > > this patch applied should return 456 already...so if that's the correct
> > > > value then I'm confused as to why you'd be seeing errors and why multiplying
> > > > the return by 2 would fix them. What am I missing?
> > >
> > > It's the other way around actually.
> > >
> > > The function needs to calculate the lane bandwidth not the linke frequency (*),
> > > and as you confirmed the original code returned 912 Mbps.
> > >
> > > -    /*
> > > -     * Calculate hsfreq in Mbps
> > > -     * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> > > -     */
> > > -    mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> > > -    do_div(mbps, csi2->lanes * 1000000);
> > >
> > >
> > > The new code returns the link frequency instead
> > >
> > > +    /* Read the link frequency from remote subdevice. */
> > > +    ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> > > +                 csi2->lanes);
> > > +
> > > +    mbps = ret;
> > > +    do_div(mbps, 1000000);
> > >
> > > Maybe I confused you when I've said "the original code didn't have a
> > > / 2" but what I meant is that the original code should have had a / 2
> > > to behave like the new version (but what we actually want is the new
> > > code to behave like the old one, not the other way around :)
> > >
> > > so the new code should do
> > >
> > >          mbps = ret * 2;
> > >
> > > if it uses
> > >
> > >     ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> > >                  csi2->lanes * 2);
> > >
> > > Does it make sense ?
> >
> > Thanks Jacopo. Agree.
> >
> > Some formulas:
> > (please correct me if I'm wrong :) )
> >
> >
> > We have the following formula:
> >
> >    vclk * bpp = hsclk * 8 * lanes
> >    hsclk(bit) = hsclk(byte) * 8 = hsfreq
> >
> > Then:
> >
> >  - hsfreq = (vclk * bpp) / lanes
> >  - hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> >
> > Formula for link_freq:
> >
> >     hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> >     pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
> >
> > Rewriting the pixel_rate formula as:
> >
> >     (pixel_rate * bits_per_sample) / nr_of_lanes = link_freq * 2
> >
> > Then:
> >     hsfreq = link_freq * 2
> > ---
> >
> > Old code:
> >
> > -    /*
> > -     * Calculate hsfreq in Mbps
> > -     * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> > -     */
> > -    mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> > -    do_div(mbps, csi2->lanes * 1000000);
> >
> > ⁠mbps =   (182400000 * 10) / 2 = 912000000 --> 912000000 / 1000000 = 912
> > ---
> >
> > New code:
> >
> > +    /* Read the link frequency from remote subdevice. */
> > +    ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> > +                 csi2->lanes);
> > +
> > +    mbps = ret;
> > +    do_div(mbps, 1000000);
> >
> > ⁠mbps =   (456000000 / 1000000) = 456 (I think is wrong missing *2 based on the formula)
> >
> > Please let me know if I'm missing somenthing.
>
>
> That all makes sense to me yes. Perhaps I'm misunderstanding, but I thought
> one conclusion of the discussion was that we wanted a separate patch adding
> the missing / 2 so that it could be backported as a fix...is that not the
> case? If we just need to make sure the new behaviour matches the old then
> adding the * 2 to a v5 is fine.
>

I don't think we need to fix the existing code which seems correct to
me the way it is.

I've now found in the thread the following from Prabhakar

-------------------------------------------------------------------------------
> > Seeing that also Laurent has reviewed it, and Prabhakar tested it, I wonder
> > if we all have missed that the original code didn't have a / 2
I agree the orignal code missed a / 2. I think we need a fixup patch
(so that this can be backported) and then this change to use
v4l2_get_link_freq().
-------------------------------------------------------------------------------

I think I've confused everyone with "original code didn't have a / 2",
but as explained what I meant is that the original code should have
had a "/ 2" for the new code to match it.

I don't think we need to do anything, if not use

     ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
                              csi2->lanes * 2);
     mbps = ret * 2;
     do_div(mbps, 1000000);

in v5.

Feel free to make the above look nicer, I think we could spare a few
variables, what matters to me is that:

1) Use csi2->lane * 2 as suggested by Prabhakar so that the behaviour
   is the same for remotes that use LINK_FREQ and remotes that use PIXEL_RATE
2) Use mbps = v4l2_get_link_freq() * 2
3) Use the pad version of v4l2_get_link_freq() if possible


>
> Thanks
>
> Dan
>
>
> > Thanks in advance.
> >
> > Thanks & Regards,
> > Tommaso
> >
> > >
> > >
> > >
> > > (*) Table 35.7 of the RZ/G2LC datasheet doesn't actually specify that,
> > > but given that all values are in Mbps and not in MHz, and the old code
> > > calculaates the bandwidth and not link frequency, it's fair to assume this
> > > I guess...
> > >
> > > >
> > > >
> > > > Thanks
> > > >
> > > > Dan
> > > >
> > > > > Cheers,
> > > > > Prabhakar
> >

