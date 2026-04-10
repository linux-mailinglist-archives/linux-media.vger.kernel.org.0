Return-Path: <linux-media+bounces-58554-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HHdG1/92GkVkwgAu9opvQ
	(envelope-from <linux-media+bounces-58554-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 15:38:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5990F3D82D4
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 15:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1ED333019FCA
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561F13C454E;
	Fri, 10 Apr 2026 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R7AK7cIP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8431E1E04
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828311; cv=none; b=h/G0RV8vZC7PLSkxtYuqNZn+MRa+qldtfg+49nAlBSVH79duH4wrD+AQFSRSFT6AJWK1Q4GbqYrOvlIkhSHPhaULqRFWQKG3EuVwl5T6NI2EDBm3l2cnFjMeBG/A7KdMJEfOj/ECVik9dadkSzrXLRUT/rthRg71bQelYOELnB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828311; c=relaxed/simple;
	bh=8DAruWYk+7ZER/ZWa7DWIENc5RE6W/mYgVDa2d7a+EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ywn/al+IqxHmeIhxYWClY9n7zWOcK5t0apg/2cP+bObe0qezfU1HnSrFTLVlypT1oV8CBrLuqNJ0MiQ8DiEczeFX01NrZzBkVfcCfW7Z0AZ7cUIOvoPvq8jhrX6rogAtWedc/tHf/lJTRS4dIT5Hd4YnbsBq4BKc+AtkBtz1RP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R7AK7cIP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02A56225;
	Fri, 10 Apr 2026 15:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775828217;
	bh=8DAruWYk+7ZER/ZWa7DWIENc5RE6W/mYgVDa2d7a+EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7AK7cIPO3Spbg1m3M69RetTIKoQ+ERORQQmDNsLJ1/L7ieYoIKNoCTyAvkpCV7XQ
	 1B3JSbLi2R2MQMDD6OK6Re0cSh3KyDLat9WVD3G5tLGUxvT0t2ABLCQ6ZVLMcY0H+f
	 cFLl7j8rc/Ae2CVAC78nm9nSopDizSsqisai3KhE=
Date: Fri, 10 Apr 2026 15:38:23 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 05/29] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <adj8Ox1ZlG_9uT81@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-6-sakari.ailus@linux.intel.com>
 <adi17tFyi5uX1GpP@zed>
 <adi4-T0TMfWIOBmk@kekkonen.localdomain>
 <adi6Jvys5KxvCmOA@zed>
 <adi9CgXFC1RQxNij@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adi9CgXFC1RQxNij@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58554-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5990F3D82D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Fri, Apr 10, 2026 at 12:04:10PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, Apr 10, 2026 at 10:56:46AM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Fri, Apr 10, 2026 at 11:46:49AM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Fri, Apr 10, 2026 at 10:42:22AM +0200, Jacopo Mondi wrote:
> > > > Hi Sakari
> > > >
> > > > On Wed, Apr 08, 2026 at 06:39:14PM +0300, Sakari Ailus wrote:
> > > > > When vertical analogue binning is in use, the minimum frame length in
> > > > > lines decreases to around half of the normal. In relation to the sensor's
> > > > > output size this means vertical blanking can be negative but that's not an
> > > > > issue as control values are signed. Remove the workaround for this
> > > > > non-issue that doubled the pixel rate, frame length in lines and exposure
> > > > > time.
> > > >
> > > > I don't think this was a workaround. Doubling the pixel rate and
> > >
> > > You could also call it a bug. :-) If you look what the driver does with
> > > PLL, you can see the PLL configuration is always the same independently of
> > > any binning configuration.
> >
> > Are you suggesting doubling the PIXEL_RATE is not accurate as the PLL
> > config doesn't change ? I might be very wrong, but in my understanding
> > this is partially why the "special" binning mode is special. We don't
> > have documentation for it and I'm maybe speculating here.
>
> I guess this comes down to the definition of PIXEL_RATE. I checked the
> control's documentation and I think it's indeed possible to understand it
> the way you suggest above.
>
> The control's value indeed was meant to reflect the actual frequency the
> pixels are read in the sensor's pixel array. The fact that the sensor uses
> analogue binning to sample two (or in some cases more) pixels into one
> output pixel in a single cycle doesn't change the frequency.
>

Not sure, I feel like we're talking details :) To be honest I
value consistency towards userspace more than exposing the exact
details of the sensor's configuration. It might be argued that the
sole purpose of PIXEL_RATE is to allow userspace to calculate the
frame duration instead of reporting the exact PLL configuration.

I'll defer the call to you and Dave, but I suggst to test this
carefully because getting it right hasn't been easy as Jai can confirm

> >
> > Is doubling the VBLANK limit to a number larger of the register
> > maximum value more accurate ?
> >
> > >
> > > > halving the values written to registers for EXPOSURE and VBLANK
> > > > allowed userspace to maintain a consistent view while the driver
> > > > accounts for the special binning mode where, at least in my latest
> > > > understanding, the sensor averages two lines before passing them to
> > > > the ADC.
> > > >
> > > > I am missing in which case, with the current driver implementation,
> > > > the vertical blanking can be negative.
> > > >
> > > > >
> > > > > The resulting change also fixes the minimum, the maximum and the step
> > > > > values for the control.
> > > > >
> > > > > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > >
> > > > Jai, and others including Dave and me, have spent quite some time
> > > > testing and implementing proper support for the special analogue
> > > > binning mode for this sensor. Of course we might have missed something
> > > > obvious, but I'm still missing what you're trying to fix here.
> > > >
> >
> > still not sure what you're trying to fix here
> >
> > > > > ---
> > > > >  drivers/media/i2c/imx219.c | 29 +++++++++--------------------
> > > > >  1 file changed, 9 insertions(+), 20 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > > index 6819a2fa3262..a72630ad1561 100644
> > > > > --- a/drivers/media/i2c/imx219.c
> > > > > +++ b/drivers/media/i2c/imx219.c
> > > > > @@ -420,15 +420,6 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
> > > > >
> > > > >  }
> > > > >
> > > > > -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
> > > > > -{
> > > > > -	u8 bin_h, bin_v;
> > > > > -
> > > > > -	imx219_get_binning(state, &bin_h, &bin_v);
> > > > > -
> > > > > -	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
> > > > > -}
> > > > > -
> > > > >  /* -----------------------------------------------------------------------------
> > > > >   * Controls
> > > > >   */
> > > > > @@ -440,12 +431,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > >  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > > > >  	const struct v4l2_mbus_framefmt *format;
> > > > >  	struct v4l2_subdev_state *state;
> > > > > -	u32 rate_factor;
> > > > >  	int ret = 0;
> > > > >
> > > > >  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> > > > >  	format = v4l2_subdev_state_get_format(state, 0);
> > > > > -	rate_factor = imx219_get_rate_factor(state);
> > > > >
> > > > >  	if (ctrl->id == V4L2_CID_VBLANK) {
> > > > >  		int exposure_max, exposure_def;
> > > > > @@ -478,7 +467,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > >  		break;
> > > > >  	case V4L2_CID_EXPOSURE:
> > > > >  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > > > > -			  ctrl->val / rate_factor, &ret);
> > > > > +			  ctrl->val, &ret);
> > > > >  		break;
> > > > >  	case V4L2_CID_DIGITAL_GAIN:
> > > > >  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > > > > @@ -495,7 +484,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > >  		break;
> > > > >  	case V4L2_CID_VBLANK:
> > > > >  		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > > > > -			  (format->height + ctrl->val) / rate_factor, &ret);
> > > > > +			  format->height + ctrl->val, &ret);
> > > > >  		break;
> > > > >  	case V4L2_CID_HBLANK:
> > > > >  		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> > > > > @@ -878,7 +867,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > > > >  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> > > > >
> > > > >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > > > -		unsigned int rate_factor = imx219_get_rate_factor(state);
> > > > >  		int exposure_max;
> > > > >  		int exposure_def;
> > > > >  		int llp_min;
> > > > > @@ -886,15 +874,16 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > > > >
> > > > >  		/* Update limits and set FPS to default */
> > > > >  		ret = __v4l2_ctrl_modify_range(imx219->vblank,
> > > > > -					       IMX219_VBLANK_MIN * rate_factor,
> > > > > -					       (IMX219_FLL_MAX - mode->height) *
> > > > > -					       rate_factor, rate_factor,
> > > > > -					       mode->fll_def - mode->height);
> > > > > +					       (int)(mode->height / binning),
> > > > > +					       IMX219_FLL_MAX - mode->height, 1,
> > > > > +					       (int)(mode->fll_def / binning) -
> > > > > +					       (int)mode->height);
> > > > >  		if (ret)
> > > > >  			return ret;
> > > > >
> > > > >  		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
> > > > > -					 mode->fll_def - mode->height);
> > > > > +					 (int)(mode->fll_def / binning) -
> > > > > +					 (int)mode->height);
> > > > >  		if (ret)
> > > > >  			return ret;
> > > > >
> > > > > @@ -931,7 +920,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > > > >  			return ret;
> > > > >
> > > > >  		/* Scale the pixel rate based on the mode specific factor */
> > > > > -		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
> > > > > +		pixel_rate = imx219_get_pixel_rate(imx219);
> > > > >  		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> > > > >  					       pixel_rate, 1, pixel_rate);
> > > > >  		if (ret)
> > >
> > > --
> > > Regards,
> > >
> > > Sakari Ailus
> > >
>
> --
> Regards,
>
> Sakari Ailus
>

