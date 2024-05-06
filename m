Return-Path: <linux-media+bounces-10873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E88148BCEDD
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 15:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4A6A281E57
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8DD33981;
	Mon,  6 May 2024 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dL2t7WIp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7E5FBF0;
	Mon,  6 May 2024 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715001697; cv=none; b=VJLJrE7j19G/jGnTe6/3COAnZy9Ou5axaAn6R54kMDol6OcV3poBOSy5K7H48W+5hP1vE+51Wl2Y/o4EffeV7PY81m6i5ziMFO9To5arqcypik2op7zvWgi6rrg1mjGjpegipR7NzVbWjVHCUH1IjuJK9eGiK4wVMuwO09EA/6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715001697; c=relaxed/simple;
	bh=NvXRF6I6+zv57QlmCKIyd5rDTKcg+GJ1rhcW13v8WnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7s6Z5KKswCmY+k+4Zd17zyZ4PX5/RhYygGbHA+bHRpeOzYUgO3RkKWD0rBMGmn7SeEaBYuTni6wKXWh5qxfedtvFM+uZ6DVU9vNcMQvKsG+cy9lttR7V7jbs3uz2LLzXNxG4mrZxZBmATbktzcqXdKdEW0JLgR+/KdVa9EAer0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dL2t7WIp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F983C55;
	Mon,  6 May 2024 15:21:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715001691;
	bh=NvXRF6I6+zv57QlmCKIyd5rDTKcg+GJ1rhcW13v8WnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dL2t7WIpZoXcEiJ7/BqvZAxdAOy7z2ML6npQQiDkbimTttDDjDq3AAuSb5h9uE+wZ
	 qWVqoADDgk8XO6wscm2su15/HhVaq1ELWdlWP7A2iHXJ/2WsF3Pq1Zdkoi1JrT8sJ2
	 EmMndBGvSNd8liuf3C6hnGDG1dOJZtT0aGswGbD4=
Date: Mon, 6 May 2024 15:21:30 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/11] media: adv748x-csi2: Validate the image format
Message-ID: <xcvfc2rphz52r6vyexlmjdqwmsudlu4urx2ngn3g55hmsh44yf@nw4rwfresuy7>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-8-jacopo.mondi@ideasonboard.com>
 <20240506113730.GA1017753@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506113730.GA1017753@ragnatech.se>

Hi Niklas

On Mon, May 06, 2024 at 01:37:30PM GMT, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2024-05-03 17:51:22 +0200, Jacopo Mondi wrote:
> > The adv748x-csi2 driver configures the CSI-2 transmitter to
> > automatically infer the image stream format from the connected
> > frontend (HDMI or AFE).
> >
> > Setting a new format on the subdevice hence does not actually control
> > the CSI-2 output format, but it's only there for the purpose of
> > pipeline validation.
> >
> > However, there is currently no validation that the supplied media bus
> > code is valid and supported by the device.
> >
> > With the introduction of enum_mbus_codes a list of supported format is
> > now available, use it to validate that the supplied format is correct
> > and use the default YUYV8 one if that's not the case.
>
> With the update tests for the change in patch 4 I hit multiple issues
> with this patch for CVBS capture.
>
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/adv748x/adv748x-csi2.c | 27 +++++++++++++++++++++++-
> >  1 file changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > index 219417b319a6..1aae6467ca62 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > @@ -215,6 +215,23 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >
> > +static int adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx,
> > +					 unsigned int code)
> > +{
> > +	const unsigned int *codes = is_txa(tx) ?
> > +				    adv748x_csi2_txa_fmts :
> > +				    adv748x_csi2_txb_fmts;
> > +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> > +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> > +
> > +	for (unsigned int i = 0; i < num_fmts; i++) {
> > +		if (codes[i] == code)
> > +			return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
> >  				   struct v4l2_subdev_state *sd_state,
> >  				   struct v4l2_subdev_format *sdformat)
> > @@ -222,7 +239,15 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
> >  	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> >  	struct adv748x_state *state = tx->state;
> >  	struct v4l2_mbus_framefmt *mbusformat;
> > -	int ret = 0;
> > +	int ret;
> > +
> > +	/*
> > +	 * Make sure the format is supported, if not default it to
> > +	 * YUYV8 as it's supported by both TXes.
> > +	 */
> > +	ret = adv748x_csi2_is_fmt_supported(tx, sdformat->format.code);
> > +	if (ret)
> > +		sdformat->format.code = MEDIA_BUS_FMT_YUYV8_1X16;
>
> If adv748x_csi2_is_fmt_supported() returns non-zero you default to
> MEDIA_BUS_FMT_YUYV8_1X16, which is fine. But the non-zero return code is
> propagated at the end of this function and to user-space falling the
> IOCTL.

Ouch, I think in my tests the error message got ignored

>
> Fixing that I hit another issue that kind of shows we need this format
> validation ;-)
>
> The TXB entity only supports MEDIA_BUS_FMT_YUYV8_1X16 formats, the AFE
> entity only outputs MEDIA_BUS_FMT_UYVY8_2X8... So with format validation
> in place it becomes impossible to connect AFE to TXB and breaking CBVS
> capture on Gen3. As a hack I added MEDIA_BUS_FMT_UYVY8_2X8 support to
> TXB and I can again capture CVBS with patch 1-8 applied.

Thanks for testing analog capture, I don't have a setup to easily do
so.

Should we make the AFE front-end produce 1X16 instead ? The format is
only used between the AFE and TXs after all, changing it shouldn't
have any implication on the interoperability with other devices.
>
> >
> >  	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
> >  						 sdformat->which);
> > --
> > 2.44.0
> >
>
> --
> Kind Regards,
> Niklas Söderlund

