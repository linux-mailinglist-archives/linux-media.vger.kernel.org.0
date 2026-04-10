Return-Path: <linux-media+bounces-58494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCYHEBG52GmmhQgAu9opvQ
	(envelope-from <linux-media+bounces-58494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:47:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB873D44B3
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 494613006823
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A163A9635;
	Fri, 10 Apr 2026 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcM34xPa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B403AC0C5
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810828; cv=none; b=kTaoFG1AfFr6ZmMjj1FvTirDxQMBXwnJiqTVG8b5eHNhvMZugtfNYqMog1OJHwJWsOID6KMhWwaxWL0vxLNOrxslseAu6WyvnZFgbqH60sJtETHrDIbONnbwOrEArMrT/vD/s2szYUoG9rz+J+kUgZvwc9acD+KtVlSW7y/8gqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810828; c=relaxed/simple;
	bh=ZL1BQM0QoUWGAQ7uyZMkygG+SxRtplAtcJsWVySBzrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwNc4q9BbSFtKXfPObwBb6AGBECY+MzVvRehEY0xTlWF94uf/x0s8mYHUCmtp/3VRpqLDCEdt6UMaWNJ9Ne3Ot6FLlal9Qm32/nc5sDDiZl38tAvRABtF5syXri226pqkVM8+s5zpnU86qLgEYUDxD1fRbI394/qWYgMzGXUoZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcM34xPa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775810827; x=1807346827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZL1BQM0QoUWGAQ7uyZMkygG+SxRtplAtcJsWVySBzrA=;
  b=XcM34xPa1ysEZSq+rHT6/6xXzLZ7ekyfAnNma7lfSot3CQeUAM34aR41
   wYq6wmMwuxYHarSsINnzQussZPbnVwVkdHwzzebOVGy9F2AzsxxRNqlwf
   hNecMU2clCX4pUCX9qQ/R7oUIc2jyHd5GZJouxQxmt9OVvRd/O9NYu5GM
   qNobRc4gIX3ROAZJ2pTLCM7DLZp7R1rU9nv+/r5ikeUIN3TgXqtdBZEWg
   TTm0kF63gnUEUw9t9sgmWdvqjfdmp1IBX2nfSwSOhn358Z8bfXnKMIypE
   RYgy+Kyo8tWO54cnMjaZGa6/2vghvdKs0f/3UnosRCVA7ScxaQ66kXs30
   A==;
X-CSE-ConnectionGUID: vBf6ftyOTMaoic841AaN5w==
X-CSE-MsgGUID: rDzHgEkaTtO+aB5smHFuTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76545100"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76545100"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:46:41 -0700
X-CSE-ConnectionGUID: +jTv2EWGSGqJTjBznlJRCg==
X-CSE-MsgGUID: aZXepOlDQ1KJIlBPr1ateQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="226315731"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:46:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 34AFA120F00;
	Fri, 10 Apr 2026 11:46:49 +0300 (EEST)
Date: Fri, 10 Apr 2026 11:46:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
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
Subject: Re: [PATCH v4 05/29] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <adi4-T0TMfWIOBmk@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-6-sakari.ailus@linux.intel.com>
 <adi17tFyi5uX1GpP@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adi17tFyi5uX1GpP@zed>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58494-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: DAB873D44B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

On Fri, Apr 10, 2026 at 10:42:22AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Apr 08, 2026 at 06:39:14PM +0300, Sakari Ailus wrote:
> > When vertical analogue binning is in use, the minimum frame length in
> > lines decreases to around half of the normal. In relation to the sensor's
> > output size this means vertical blanking can be negative but that's not an
> > issue as control values are signed. Remove the workaround for this
> > non-issue that doubled the pixel rate, frame length in lines and exposure
> > time.
> 
> I don't think this was a workaround. Doubling the pixel rate and

You could also call it a bug. :-) If you look what the driver does with
PLL, you can see the PLL configuration is always the same independently of
any binning configuration.

> halving the values written to registers for EXPOSURE and VBLANK
> allowed userspace to maintain a consistent view while the driver
> accounts for the special binning mode where, at least in my latest
> understanding, the sensor averages two lines before passing them to
> the ADC.
> 
> I am missing in which case, with the current driver implementation,
> the vertical blanking can be negative.
> 
> >
> > The resulting change also fixes the minimum, the maximum and the step
> > values for the control.
> >
> > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Jai, and others including Dave and me, have spent quite some time
> testing and implementing proper support for the special analogue
> binning mode for this sensor. Of course we might have missed something
> obvious, but I'm still missing what you're trying to fix here.
> 
> > ---
> >  drivers/media/i2c/imx219.c | 29 +++++++++--------------------
> >  1 file changed, 9 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 6819a2fa3262..a72630ad1561 100644
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
> > @@ -440,12 +431,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
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
> > @@ -478,7 +467,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_EXPOSURE:
> >  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -			  ctrl->val / rate_factor, &ret);
> > +			  ctrl->val, &ret);
> >  		break;
> >  	case V4L2_CID_DIGITAL_GAIN:
> >  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -495,7 +484,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_VBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > -			  (format->height + ctrl->val) / rate_factor, &ret);
> > +			  format->height + ctrl->val, &ret);
> >  		break;
> >  	case V4L2_CID_HBLANK:
> >  		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> > @@ -878,7 +867,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> >
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > -		unsigned int rate_factor = imx219_get_rate_factor(state);
> >  		int exposure_max;
> >  		int exposure_def;
> >  		int llp_min;
> > @@ -886,15 +874,16 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >
> >  		/* Update limits and set FPS to default */
> >  		ret = __v4l2_ctrl_modify_range(imx219->vblank,
> > -					       IMX219_VBLANK_MIN * rate_factor,
> > -					       (IMX219_FLL_MAX - mode->height) *
> > -					       rate_factor, rate_factor,
> > -					       mode->fll_def - mode->height);
> > +					       (int)(mode->height / binning),
> > +					       IMX219_FLL_MAX - mode->height, 1,
> > +					       (int)(mode->fll_def / binning) -
> > +					       (int)mode->height);
> >  		if (ret)
> >  			return ret;
> >
> >  		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
> > -					 mode->fll_def - mode->height);
> > +					 (int)(mode->fll_def / binning) -
> > +					 (int)mode->height);
> >  		if (ret)
> >  			return ret;
> >
> > @@ -931,7 +920,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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

Sakari Ailus

