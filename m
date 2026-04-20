Return-Path: <linux-media+bounces-59178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id t87KLbeS5mnGyQEAu9opvQ
	(envelope-from <linux-media+bounces-59178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 22:55:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DD6433D58
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 22:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 460EE30182AA
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 20:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C7D38C401;
	Mon, 20 Apr 2026 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2Dugi4a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B10383C74
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 20:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776718507; cv=none; b=N4SCb8I0LqRA/r7e9FxYpl7CGveUkmScFQsbrZeJx13GWQs/hkey559aAnR429StrLwyzDpExsBlqiiYxOCqIbXezPzxYfWOC5YFiwAAATeRpCR0iE5O6ejJXO22916FHmjeCxA7S7z9aGp8EfFd4rAOLFN6hdvWNebqx4U9AFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776718507; c=relaxed/simple;
	bh=sgu4wzlsxhk96Avl+sBopr9nCniJU2tM5Sw9wtHx/9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYxgKapbxwdzrTF415tlHP71sXcFNJv1hMHL5tPS/1k+uH9d8O35M/EUtSzEItDmpAAFZS664AjUDhMGX5CqMUt3yvWHFb0UossWXVVmSEG0Febu+5dYqEw2Pw7pOp/9mkOPe8j60+RYh1v5jjXclNNKTmPxJLN7PWsLBEB4XnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2Dugi4a; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776718504; x=1808254504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sgu4wzlsxhk96Avl+sBopr9nCniJU2tM5Sw9wtHx/9c=;
  b=d2Dugi4aIbq0XwiFfnH4Qj1zLHKGeVEVnRAx76m3NNNKEcDJCWmdvg83
   FBIH6tDLzJ8DR6G0O7qTuNmVUyreVfW+ORQRQk2xFvDUrLorCllhr/pfh
   6+kqY2/AqTYcgr97ouWzSz9rGQ8F4DgfvWP228ToyaQGBPBM2FyQSCAAE
   nVfJXMoKTJeSBV3/iXqGLJGcNzzIn9F6b8hnzBivnzWUMzp/JyBteRiTW
   C7HL4Wy6TzINgxUPm92zTeC7ddkfiRD7oVHrU9P8ZY7QN93KDyWvMa8Iw
   ufHHXAklRMJEbYLEbWSg1XkpBqyG/uW5ef/rAiTtFj7IhZeqTBT5aeRhS
   w==;
X-CSE-ConnectionGUID: 3CjI/v2tSfWNcoMo3c1+jg==
X-CSE-MsgGUID: 6dyHswM/QDaTh40YGHkb7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88343616"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="88343616"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 13:55:03 -0700
X-CSE-ConnectionGUID: b0dVwJMbRyeMO8ygAM2nJQ==
X-CSE-MsgGUID: 8tOUKjwXS92je8h10dsdaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="235836829"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.228])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 13:54:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4331311F910;
	Mon, 20 Apr 2026 23:54:54 +0300 (EEST)
Date: Mon, 20 Apr 2026 23:54:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
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
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 05/29] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <aeaSntdTicLwg0tr@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-6-sakari.ailus@linux.intel.com>
 <177627333160.489396.4707310040596157667@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177627333160.489396.4707310040596157667@freya>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-59178-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linuxtv.org:url,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: E5DD6433D58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jai,

On Wed, Apr 15, 2026 at 10:45:31PM +0530, Jai Luthra wrote:
> Quoting Sakari Ailus (2026-04-08 21:09:14)
> > When vertical analogue binning is in use, the minimum frame length in
> > lines decreases to around half of the normal. In relation to the sensor's
> > output size this means vertical blanking can be negative but that's not an
> > issue as control values are signed. Remove the workaround for this
> > non-issue that doubled the pixel rate, frame length in lines and exposure
> > time.
> > 
> > The resulting change also fixes the minimum, the maximum and the step
> > values for the control.
> > 
> > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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
> > -       u8 bin_h, bin_v;
> > -
> > -       imx219_get_binning(state, &bin_h, &bin_v);
> > -
> > -       return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
> > -}
> > -
> >  /* -----------------------------------------------------------------------------
> >   * Controls
> >   */
> > @@ -440,12 +431,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >         const struct v4l2_mbus_framefmt *format;
> >         struct v4l2_subdev_state *state;
> > -       u32 rate_factor;
> >         int ret = 0;
> >  
> >         state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> >         format = v4l2_subdev_state_get_format(state, 0);
> > -       rate_factor = imx219_get_rate_factor(state);
> >  
> >         if (ctrl->id == V4L2_CID_VBLANK) {
> >                 int exposure_max, exposure_def;
> > @@ -478,7 +467,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 break;
> >         case V4L2_CID_EXPOSURE:
> >                 cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -                         ctrl->val / rate_factor, &ret);
> > +                         ctrl->val, &ret);
> >                 break;
> >         case V4L2_CID_DIGITAL_GAIN:
> >                 cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -495,7 +484,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 break;
> >         case V4L2_CID_VBLANK:
> >                 cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > -                         (format->height + ctrl->val) / rate_factor, &ret);
> > +                         format->height + ctrl->val, &ret);
> >                 break;
> >         case V4L2_CID_HBLANK:
> >                 cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> > @@ -878,7 +867,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >         crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> >  
> >         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > -               unsigned int rate_factor = imx219_get_rate_factor(state);
> >                 int exposure_max;
> >                 int exposure_def;
> >                 int llp_min;
> > @@ -886,15 +874,16 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  
> >                 /* Update limits and set FPS to default */
> >                 ret = __v4l2_ctrl_modify_range(imx219->vblank,
> > -                                              IMX219_VBLANK_MIN * rate_factor,
> > -                                              (IMX219_FLL_MAX - mode->height) *
> > -                                              rate_factor, rate_factor,
> > -                                              mode->fll_def - mode->height);
> > +                                              (int)(mode->height / binning),
> 
> This line seems to be the crux of the issue causing modes other than VGA to
> not work, and also restricting the FPS.
> 
> Vertical blanking control is defined relative to the output height. While
> the minimum value for FLL for analogue binning mode is:
> 
>     min_FLL = (mode->height / binning) + IMX219_VBLANK_MIN
> 
> So the minimum control value for vblank should be:
> 
>     vblank_min = min_FLL - mode->height

I had done most testing on top of the metadata series and it seems some
bugs were still hidden in the earlier patches. I took another look at the
patches and indeed there were issues in calculating the lower limit of
vertical blanking.

I've pushed the changes to metadata-pre (and metadata) branches to my
linuxtv.org tree while this series can be found in metadata-pre-v4 tag and
the recently posted metadata series in metadata-v12 tag.

The changes also resulted in a new patch, namely one that fixes the maximum
exposure limit before removing the rate_factor.

The table below contains the list of modes and their minimum vertical
blankings and the fps at that vertical blanking value. The patches between
references 1 and 2 make subtle changes to the frame rate due to changes
that ensure that the sensor is operated within its limits. The default mode
frame rate is 15, 30, 60 and 60 fps, respectively, beginning from reference
2.

\ ref		1		2		3		4
m		vb	fps	vb	fps	vb	fps	vb	fps
3280x2464	32	20.526	32	21.194	32	21.194	32	21.194
1920x1080	32	46.079	32	47.574	32	47.571	32	47.569
1640x1232	32	81.162	64	79.070	-584	79.064	-584	79.070
640x480		32	198.610	64	188.359	-208	188.359	-208	188.359

[1] current upstream state; default fps varies
[2] up to "media: imx219: Account rate_factor in setting upper exposure limit"
[3] up to "media: imx219: Fix vertical blanking and exposure for analogue binning"
[4] on top of the metadata branch

I can post the updates to the list after addressing the rest of the
comments.

> 
> Making that change I get the correct range for VBLANK control that leads to
> high FPS capture.
> 
> So we finally have something working. Now the debate is between these two
> models:
> 
> 1. PIXEL_RATE means the output rate of the PLL for the sensor's internal
> pixel clock. That would mean this special binning mode leads to negative
> blanking values, which breaks intuition for what blanking means, but lines
> up well with exposing sensor FLL/LLP registers directly for the new raw
> sensor model.

On the other hand, without removing the rate_factor we'd still need to
multiply the FLL (likely?) value, plus many others, by the same factor, as
the sensor only has a single PIXEL_RATE control value. Getting it right is
hard and I didn't even try address bugs in control step configuration, only
those that affected sensor timing.

> 
> 2. H/V_BLANK are always positive and defined w.r.t source pad width/height.
> Thus special binning mode would need to have "double" the PIXEL_RATE, even
> though the sensor PLL is configured the same way. This aligns with what
> applications expect today.

Even in this case the blanking values do not express blanking correctly as
they are bound to the output size, not the analogue crop rectangle. Thus
they are no more useful in determining actual blanking.

> 
> Even "normal" binning mode on IMX219 and many other sensors does binning in
> the Analogue domain for one dimension. As we discussed before in [1].
> 
> Which makes the former a cleaner model to adopt for future. Now what we
> should do for existing sensors is a question that needs more discussion.
> 
> I am fine with both approaches, but this does mean fixing libcamera to work
> with negative blanking values (which it doesn't currently at least in my
> short test today) and breaks intuition for what blanking means (which is
> annoying).

Ouch.

> 
> Jacopo & Laurent, what do you think?

-- 
Kind regards,

Sakari Ailus

