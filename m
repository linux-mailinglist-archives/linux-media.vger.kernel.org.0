Return-Path: <linux-media+bounces-64166-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CKwIHf+IJmpIYQIAu9opvQ
	(envelope-from <linux-media+bounces-64166-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:18:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 72128654859
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 11:18:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="ECefPa7/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64166-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64166-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 162493010F3B
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 09:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7000738C2A5;
	Mon,  8 Jun 2026 09:10:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB023B27E2
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 09:10:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909834; cv=none; b=SLdvlu/pmRtXiSI7i2frslCgNn/lur4ZdqIsFUsO7PyjkKv23nbR/tih2fM/mhWrynSBgLUOECIkrTMIxdtqArDSF6aKOweUjWHuV9F2U3c6blSUxNpyXfeHKi0BOno9Fy3zG4H3pg6O15PuKmavNbLnmM5yXZwvCHPUKm9Vxmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909834; c=relaxed/simple;
	bh=EanL5wE66/jQPKgOlqc/XO6Wlxw+Rxn7VQUXKGn0h8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5/E0N8qRyuVYfYAuv8ab0iys/HtCm6D4YcI2FwgxalMLcqbar3lOB7FVselIGBSnZhE/gWZFBUrr/gNXeaDIo8+Y3XIpBYug0eUskZJXN5jyr+SUcGxRRE1mYjHWXp5c4zrx0S2sxJRHuBNI4be2Hus2ZJa9RXRstRflhDDPUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ECefPa7/; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 753268F;
	Mon,  8 Jun 2026 11:10:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780909800;
	bh=EanL5wE66/jQPKgOlqc/XO6Wlxw+Rxn7VQUXKGn0h8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECefPa7/cMfYIxxX0JCTI1bguriHJIU8cQrYOpFqGW0cunTAgxEmMdZvK4/8AJhwy
	 m6Jg/McjS6GUdVC3dHT2Q6hQrQCSq7KVLW0JksFNmVFQ4QrWyrWwoKxqrjmqqTyZp7
	 fYDfEXnkhDZx3ukln6flhF/+iwFWPfHFJhzS6i5g=
Date: Mon, 8 Jun 2026 12:10:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <20260608091026.GB772117@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiZnQgyEBkZH7er0@zed>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64166-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:email,ideasonboard.com:from_mime,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72128654859

On Mon, Jun 08, 2026 at 08:58:46AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > When vertical analogue binning is in use, the minimum frame length in
> > lines decreases to around half of the normal. In relation to the sensor's
> > output size this means vertical blanking can be negative but that's not an
> > issue as control values are signed. Remove the workaround for this
> 
> Didn't we just discussed two weeks ago in media summit how negative
> blankings are a bad idea, and of all drivers one could decide to play
> with imx219 is probably the worse due it's large use base and the fact
> libcamera doesn't support negative blankings ?

I also think that negative blanking values are a bad idea, for this
driver or any other driver. I still haven't seen any compelling
argument.

> Have I missed something ?
> 
> > non-issue that doubled the pixel rate, frame length in lines and exposure
> > time.
> >
> > The resulting change also fixes the minimum, the maximum and the step
> > values for the control.
> >
> > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/imx219.c | 37 ++++++++++++++-----------------------
> >  1 file changed, 14 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 3aebcbaa3fcd..3cee31758b7e 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -420,15 +420,6 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
> >
> >  }
> >
> > -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
> > -{
> > -	u8 bin_h, bin_v;
> > -
> > -	imx219_get_binning(state, &bin_h, &bin_v);
> > -
> > -	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
> > -}
> > -
> >  /* -----------------------------------------------------------------------------
> >   * Controls
> >   */
> > @@ -440,19 +431,17 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >  	const struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_subdev_state *state;
> > -	u32 rate_factor;
> >  	int ret = 0;
> >
> >  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> >  	format = v4l2_subdev_state_get_format(state, 0);
> > -	rate_factor = imx219_get_rate_factor(state);
> >
> >  	if (ctrl->id == V4L2_CID_VBLANK) {
> >  		int exposure_max, exposure_def;
> >
> >  		/* Update max exposure while meeting expected vblanking */
> >  		exposure_max = format->height + ctrl->val -
> > -			IMX219_EXPOSURE_OFFSET * rate_factor;
> > +			IMX219_EXPOSURE_OFFSET;
> >  		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> >  				exposure_max : IMX219_EXPOSURE_DEFAULT;
> >  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
> > @@ -479,7 +468,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_EXPOSURE:
> >  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -			  ctrl->val / rate_factor, &ret);
> > +			  ctrl->val, &ret);
> >  		break;
> >  	case V4L2_CID_DIGITAL_GAIN:
> >  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -496,7 +485,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_VBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > -			  (format->height + ctrl->val) / rate_factor, &ret);
> > +			  format->height + ctrl->val, &ret);
> >  		break;
> >  	case V4L2_CID_HBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> > @@ -837,8 +826,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  	const struct imx219_mode *mode;
> >  	struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_rect *crop;
> > -	u8 bin_h, bin_v, bin_hv;
> > -	int ret;
> > +	u8 bin_h, bin_v;
> > +	int ret, bin_hv;
> >
> >  	format = v4l2_subdev_state_get_format(state, 0);
> >
> > @@ -879,23 +868,25 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> >
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > -		unsigned int rate_factor = imx219_get_rate_factor(state);
> >  		int exposure_max;
> >  		int exposure_def;
> >  		int llp_min;
> >  		int pixel_rate;
> >
> >  		/* Update limits and set FPS to default */
> > +		int vblank_min = ((int)mode->height * (1 - bin_hv) / bin_hv) +
> > +			IMX219_VBLANK_MIN;
> >  		ret = __v4l2_ctrl_modify_range(imx219->vblank,
> > -					       IMX219_VBLANK_MIN * rate_factor,
> > -					       (IMX219_FLL_MAX - mode->height) *
> > -					       rate_factor, rate_factor,
> > -					       mode->fll_def - mode->height);
> > +					       vblank_min,
> > +					       IMX219_FLL_MAX - mode->height, 1,
> > +					       (int)(mode->fll_def / bin_hv) -
> > +					       (int)mode->height);
> >  		if (ret)
> >  			return ret;
> >
> >  		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
> > -					 mode->fll_def - mode->height);
> > +					 (int)(mode->fll_def / bin_hv) -
> > +					 (int)mode->height);
> >  		if (ret)
> >  			return ret;
> >
> > @@ -932,7 +923,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  			return ret;
> >
> >  		/* Scale the pixel rate based on the mode specific factor */
> > -		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
> > +		pixel_rate = imx219_get_pixel_rate(imx219);
> >  		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> >  					       pixel_rate, 1, pixel_rate);
> >  		if (ret)

-- 
Regards,

Laurent Pinchart

