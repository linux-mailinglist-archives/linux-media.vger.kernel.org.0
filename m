Return-Path: <linux-media+bounces-32139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D6AB17BA
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 16:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF63B1BA1C17
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 14:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DB4231844;
	Fri,  9 May 2025 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vuRVZ8lZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAE122A4E5
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802238; cv=none; b=mNnqqZ+mhjBy1zsmisaL8Ed+W+Ca6sqZ+SfsrUl6zD0Ro0+87qEjLcGbZU8Tuss9b5x6Fz2/HpacKmuKedoMEF4Hg2reJkOK1OmFmhWvJTlZUDeklnH35gwcSMevSwgaZyXM+VaaxWXu4nJ4/mYb4ePb3FOjnoEhbL+VyxwFH1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802238; c=relaxed/simple;
	bh=ON1XFPMX23WAr0cEFAIVo9scvciKkV+ChgoK2bf/3Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssfUt5NG3AAH0a1o7/kjRBFcHELfZ3u/bDwOrzrH4uJZ44i+cSwJLyViOkbq6N3cRy10KSJeogORlfoLb0FS0h94ZPlrGFym/GwBmuxfD2DBQai68UhFDY2WxmRuwFcl2mn5CFenpIBilXhG7ztF1m3vbQROoCGDFo5b/eA3JGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vuRVZ8lZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:861:3a80:3300:7c3b:c7bf:b733:fa1b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51D5E9CE;
	Fri,  9 May 2025 16:50:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746802220;
	bh=ON1XFPMX23WAr0cEFAIVo9scvciKkV+ChgoK2bf/3Po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vuRVZ8lZbndeYzU+jqV3J9EbKAmSNAY4TaixsZ6Q4i4jiUO4By7HrQcuh8f3lSwH/
	 er+QEDY0aMrC0KsfxwwVvJYu75Qzg8J7z1fKPGsmX0kZ7uFP3rofeZN0HKhruuhHwy
	 hAOPNPg0WcmPCACsuOR/v1EREDapADmNyN2cipGE=
Date: Fri, 9 May 2025 16:50:29 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	jacopo.mondi@ideasonboard.com, Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
Message-ID: <i4g722z6a3i4xnre6b3ne76w7acxcjy2j3ztww4ndvabungeuw@ovecz2bqewr6>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-4-dan.scally@ideasonboard.com>
 <aB4OfjTGktdu7Yos@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aB4OfjTGktdu7Yos@tom-desktop>

Hi Tommaso

On Fri, May 09, 2025 at 04:17:34PM +0200, Tommaso Merciai wrote:
> Hi Daniel,
> Thanks for your patch.
>
> On Tue, May 06, 2025 at 01:50:12PM +0100, Daniel Scally wrote:
> > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> >
> > The rzg2l_csi2_calc_mbps() function currently tries to calculate the
> > link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
> > of the remote subdevice. Switch the function to v4l2_get_link_freq()
> > which correctly targets V4L2_CID_LINK_FREQ before falling back on
> > V4L2_CID_PIXEL_RATE if the former is unavailable.
> >
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > ---
> > Changes in v4:
> >
> > 	- Used separate s64 variable as return value for v4l2_get_link_freq()
> > 	  and as the mbps variable for do_div() to avoid compilation warnings.
> >
> > Changes in v3:
> >
> > 	- Fixed mbps sign
> >
> > Changes in v2:
> >
> > 	- None
> >
> >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++----------
> >  1 file changed, 12 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index 9243306e2aa9..8870c2cb8104 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
> >  	const struct rzg2l_csi2_format *format;
> >  	const struct v4l2_mbus_framefmt *fmt;
> >  	struct v4l2_subdev_state *state;
> > -	struct v4l2_ctrl *ctrl;
> >  	u64 mbps;
> > -
> > -	/* Read the pixel rate control from remote. */
> > -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> > -	if (!ctrl) {
> > -		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
> > -			source->name);
> > -		return -EINVAL;
> > -	}
> > +	s64 ret;
> >
> >  	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
> >  	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
> >  	format = rzg2l_csi2_code_to_fmt(fmt->code);
> >  	v4l2_subdev_unlock_state(state);
> >
> > -	/*
> > -	 * Calculate hsfreq in Mbps
> > -	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> > -	 */
> > -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> > -	do_div(mbps, csi2->lanes * 1000000);
> > +	/* Read the link frequency from remote subdevice. */
> > +	ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> > +				 csi2->lanes);
> > +	if (ret < 0) {
> > +		dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
> > +			source->name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	mbps = ret;
> > +	do_div(mbps, 1000000);
> >
> >  	return mbps;
> >  }
>
> I tested this series with an imx219 image sensor connected to the CSI-2
> RX IP of RZ/G3E:
>
> Some notes:
>
>  - pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
>  - hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>
> Then hsfreq should be:

The old code seems to call 'hsfreq' the per-lane bandwidth

-	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes

And not the per-lane frequency as the variable name and the commit message
suggest

>
>  - hsfreq = link_freq * 2

if that's the intention, due to CSI-2 DDR, then you're correct I
think ?

Seeing that also Laurent has reviewed it, and Prabhakar tested it, I wonder
if we all have missed that the original code didn't have a / 2

Dan, did you ever notice issues during your testing ?

Also, with the introduction of 15f0035bfd0a ("media: v4l: Support
passing media pad argument to v4l2_get_link_freq()") it's probably now
better to pass the source's pad to v4l2_get_link_freq() ?

>
> Please correct me if I'm wrong.
>
>
> After applying this series. I'm getting the following issue testing the
> imx219 sensor with SRGGB8_1X8 and SGRBG10_1X10 color format.

Does the error go away if you multiply the link_freq by 2 ?

Thanks
  j

>
>
> [  947.305876] rzg2l-cru 16000000.video: Invalid MB address 0xe8bf8300 (out of range)
> [  947.305876] rzg2l-cru 16000000.video: Invalid MB address 0xe8bf8300 (out of range)
> [  947.339165] rzg2l-cru 16000000.video: Invalid MB address 0xe8c9e900 (out of range)
> [  947.339165] rzg2l-cru 16000000.video: Invalid MB address 0xe8c9e900 (out of range)
>
>
> I'm suspecting that this could be related to this formula.
> Let me know what do you think.
>
> Thanks in advance!
>
> Tested using:
>
> root@smarc-rzg3e:~# media-ctl -p
> Media controller API version 6.15.0
>
> Media device information
> ------------------------
> driver          rzg2l_cru
> model           renesas,r9a09g047-cru
> serial
> bus info        platform:16000000.video
> hw revision     0x0
> driver version  6.15.0
>
> Device topology
> - entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>                 <- "imx219 0-0010":0 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>                 -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]
>
> - entity 4: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev1
>         pad0: Sink
>                 [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>                 <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>                 -> "CRU output":0 [ENABLED,IMMUTABLE]
>
> - entity 7: imx219 0-0010 (1 pad, 1 link, 0 routes)
>             type V4L2 subdev subtype Sensor flags 0
>             device node name /dev/v4l-subdev2
>         pad0: Source
>                 [stream:0 fmt:SGRBG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
>                  crop.bounds:(8,8)/3280x2464
>                  crop:(1008,760)/1280x960]
>                 -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]
>
> - entity 17: CRU output (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video0
>         pad0: Sink
>                 <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]
>
> # IMX219 TESTING SGRBG10_1X10
> v4l2-ctl -c horizontal_flip=1 -d /dev/v4l-subdev2
>
> media-ctl -d /dev/media0 --set-v4l2 '"imx219 0-0010":0[fmt:SGRBG10_1X10/640x480]'
> media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:SGRBG10_1X10/640x480]'
> media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:SGRBG10_1X10/640x480]'
>
> v4l2-ctl -d0 --set-fmt-video pixelformat=CR10,width=640,height=480
> v4l2-ctl -d0 --stream-mmap --stream-count=100
>
>
> #  IMX219 TESTING SRGGB8_1X8
> media-ctl -d /dev/media0 --set-v4l2 '"imx219 0-0010":0[fmt:SRGGB8_1X8/1920x1080]'
> media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:SRGGB8_1X8/1920x1080]'
> media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:SRGGB8_1X8/1920x1080]'
>
>
> v4l2-ctl -d0 --set-fmt-video pixelformat=RGGB,width=1920,height=1080
> v4l2-ctl -d0 --stream-mmap --stream-count=32
>
> Thanks & Regards,
> Tommaso
>
> > --
> > 2.34.1
> >

