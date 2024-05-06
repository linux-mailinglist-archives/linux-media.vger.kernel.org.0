Return-Path: <linux-media+bounces-10894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173D8BD100
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 17:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 232E41C22BBC
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 15:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B6A154BF8;
	Mon,  6 May 2024 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n+lO0tuk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E375153BF9;
	Mon,  6 May 2024 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715007899; cv=none; b=dtlUA0yB+IHA+bUDCp3Rv7ZvtPIeB8hh7LIKsLP83NJyObVOKoze9mT2GSGCjo/IX8sVuu+4tDLCs5StDnYruWcwjPrBB4sQ9t8J8ydTfxjeeZEb65axd3ZuKp59Es4/mCR/FR3gYQ8R5s2/hwB7d1yKseecT5ofRdIrcaJsvhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715007899; c=relaxed/simple;
	bh=pnB0JBnPn5scnENCKUbXqlukKsdHLerUQri5fJwrVB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7qa//bLgAoOcjip5zJ1Jigof4hBmtE6EcpcyaQb1ASalqhfAc8N3ywa4S37caxZhOZmKo8j0wevSUyeGJRnOSB9k/37CMdp/+6Nf0a+o8mhlvZtItdkx0Osb+2yxq5yL/m0rAaA73vv0AlKWKn1Iqdq+0pTWhhH8uVNsP2R1e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n+lO0tuk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16A92899;
	Mon,  6 May 2024 17:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715007894;
	bh=pnB0JBnPn5scnENCKUbXqlukKsdHLerUQri5fJwrVB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n+lO0tukUxK70KFse47IyiPLKXB9bQttMi86/P6f8RsKspojOceMt0XDrfAoJUFQO
	 XZYdFHpquzx2vUmgtKqpGtQP1I1gzFiyNEeHb++wJyIEgEWpUDO1xRpeWsh0HUD560
	 3498JlG6K+N/IHYGChFXUTxoPt3W1aEjIsK/nVy0=
Date: Mon, 6 May 2024 17:04:52 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/11] media: adv748x-csi2: Validate the image format
Message-ID: <volz34u4ooq3rnw3pws4lulbvpdz2efuzgbphpf46uebdqftfg@b2ftppacqein>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-8-jacopo.mondi@ideasonboard.com>
 <20240506113730.GA1017753@ragnatech.se>
 <xcvfc2rphz52r6vyexlmjdqwmsudlu4urx2ngn3g55hmsh44yf@nw4rwfresuy7>
 <20240506141201.GE720810@ragnatech.se>
 <jh5eeatxmbqrllo5ff4bi22xsrfqibcw7j74ug6oycmvxg5sxg@rqccohyfouqa>
 <20240506145830.GF720810@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506145830.GF720810@ragnatech.se>

Hi Niklas

On Mon, May 06, 2024 at 04:58:30PM GMT, Niklas Söderlund wrote:
> Hello Jacopo,
>
> On 2024-05-06 16:36:01 +0200, Jacopo Mondi wrote:
> > Hi Niklas
> >
> > On Mon, May 06, 2024 at 04:12:01PM GMT, Niklas Söderlund wrote:
> > > Hi Jacopo,
> > >
> > > On 2024-05-06 15:21:30 +0200, Jacopo Mondi wrote:
> > > > Hi Niklas
> > > >
> > > > On Mon, May 06, 2024 at 01:37:30PM GMT, Niklas Söderlund wrote:
> > > > > Hi Jacopo,
> > > > >
> > > > > Thanks for your work.
> > > > >
> > > > > On 2024-05-03 17:51:22 +0200, Jacopo Mondi wrote:
> > > > > > The adv748x-csi2 driver configures the CSI-2 transmitter to
> > > > > > automatically infer the image stream format from the connected
> > > > > > frontend (HDMI or AFE).
> > > > > >
> > > > > > Setting a new format on the subdevice hence does not actually control
> > > > > > the CSI-2 output format, but it's only there for the purpose of
> > > > > > pipeline validation.
> > > > > >
> > > > > > However, there is currently no validation that the supplied media bus
> > > > > > code is valid and supported by the device.
> > > > > >
> > > > > > With the introduction of enum_mbus_codes a list of supported format is
> > > > > > now available, use it to validate that the supplied format is correct
> > > > > > and use the default YUYV8 one if that's not the case.
> > > > >
> > > > > With the update tests for the change in patch 4 I hit multiple issues
> > > > > with this patch for CVBS capture.
> > > > >
> > > > > >
> > > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > > ---
> > > > > >  drivers/media/i2c/adv748x/adv748x-csi2.c | 27 +++++++++++++++++++++++-
> > > > > >  1 file changed, 26 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > > > > index 219417b319a6..1aae6467ca62 100644
> > > > > > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > > > > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > > > > @@ -215,6 +215,23 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
> > > > > >  	return 0;
> > > > > >  }
> > > > > >
> > > > > > +static int adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx,
> > > > > > +					 unsigned int code)
> > > > > > +{
> > > > > > +	const unsigned int *codes = is_txa(tx) ?
> > > > > > +				    adv748x_csi2_txa_fmts :
> > > > > > +				    adv748x_csi2_txb_fmts;
> > > > > > +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> > > > > > +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> > > > > > +
> > > > > > +	for (unsigned int i = 0; i < num_fmts; i++) {
> > > > > > +		if (codes[i] == code)
> > > > > > +			return 0;
> > > > > > +	}
> > > > > > +
> > > > > > +	return -EINVAL;
> > > > > > +}
> > > > > > +
> > > > > >  static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
> > > > > >  				   struct v4l2_subdev_state *sd_state,
> > > > > >  				   struct v4l2_subdev_format *sdformat)
> > > > > > @@ -222,7 +239,15 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
> > > > > >  	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> > > > > >  	struct adv748x_state *state = tx->state;
> > > > > >  	struct v4l2_mbus_framefmt *mbusformat;
> > > > > > -	int ret = 0;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Make sure the format is supported, if not default it to
> > > > > > +	 * YUYV8 as it's supported by both TXes.
> > > > > > +	 */
> > > > > > +	ret = adv748x_csi2_is_fmt_supported(tx, sdformat->format.code);
> > > > > > +	if (ret)
> > > > > > +		sdformat->format.code = MEDIA_BUS_FMT_YUYV8_1X16;
> > > > >
> > > > > If adv748x_csi2_is_fmt_supported() returns non-zero you default to
> > > > > MEDIA_BUS_FMT_YUYV8_1X16, which is fine. But the non-zero return code is
> > > > > propagated at the end of this function and to user-space falling the
> > > > > IOCTL.
> > > >
> > > > Ouch, I think in my tests the error message got ignored
> > > >
> > > > >
> > > > > Fixing that I hit another issue that kind of shows we need this format
> > > > > validation ;-)
> > > > >
> > > > > The TXB entity only supports MEDIA_BUS_FMT_YUYV8_1X16 formats, the AFE
> > > > > entity only outputs MEDIA_BUS_FMT_UYVY8_2X8... So with format validation
> > > > > in place it becomes impossible to connect AFE to TXB and breaking CBVS
> > > > > capture on Gen3. As a hack I added MEDIA_BUS_FMT_UYVY8_2X8 support to
> > > > > TXB and I can again capture CVBS with patch 1-8 applied.
> > > >
> > > > Thanks for testing analog capture, I don't have a setup to easily do
> > > > so.
> > >
> > > You can test it with the pattern generator on any Gen3 board.
> > >
> >
> > ah well
> >
> > > >
> > > > Should we make the AFE front-end produce 1X16 instead ? The format is
> > > > only used between the AFE and TXs after all, changing it shouldn't
> > > > have any implication on the interoperability with other devices.
> > >
> > > Not sure, the list of formats supported by each entity in the ADV748x is
> > > added by patch 'media: adv748x-csi2: Implement enum_mbus_codes' in this
> > > series.
> >
> > > Where did the list come from?
> >
> > From the chip datasheet ?
> > Section 9.7 "MIPI Ouput format"
>
> Thanks I found it now, maybe add that to the commit message of that
> patch? I was hunting for register values in the register control manual
> and found nothing ;-)

ok..

> >
> > >What formats do the AFE support?
> >
> > The AFE doesn't really "support" any format in my understanding. It
> > connects to one of the two TXes with an internal processing pipeline,
> > and the TX transmits the received video stream on the serial bus.
>
> Ahh! I think we found the root of the issue we talked about the other
> day in the VIN format handling about 1X16 vs 2x8 and CSI-2 ;-) That
> likely came from this setting.
>
> Yes, with the information from the datahseet I do think we should change
> adv748x_afe_enum_mbus_code() to report MEDIA_BUS_FMT_YUYV8_1X16 instead

nit: MEDIA_BUS_FMT_UYVY8_1X16

> of MEDIA_BUS_FMT_UYVY8_2X8.
>
> >
> > > Why is the formats supported different between TXA and TXB ?
> >
> > You should ask the chip producer :)
>
> If only we could. Imagine how much time we save if we could talk to them
> and have datasheets instead of guessing half the time ;-)
>

:')

> >
> > >
> > > > >
> > > > > >
> > > > > >  	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
> > > > > >  						 sdformat->which);
> > > > > > --
> > > > > > 2.44.0
> > > > > >
> > > > >
> > > > > --
> > > > > Kind Regards,
> > > > > Niklas Söderlund
> > >
> > > --
> > > Kind Regards,
> > > Niklas Söderlund
> > >
>
> --
> Kind Regards,
> Niklas Söderlund

