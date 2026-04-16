Return-Path: <linux-media+bounces-58910-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLdeH7Dw4Gl4ngAAu9opvQ
	(envelope-from <linux-media+bounces-58910-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:22:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34C40F87B
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57683302CA52
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 14:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8336C3DF004;
	Thu, 16 Apr 2026 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="plw1pfwb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A53DF000
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349343; cv=none; b=SIls6coIwJjW1w/A0xLL2lJ5UNRKzmFswvg7BWh8pQNRykcZX9SM178VyR4htxBalaypRGH8ZhZVkxyeiTHl/nHK9bL3cBhuk/NCL8gNhfZxMNqdmufUuDaGVz7Taavto/0y/U0tAE2o46dx2tO9lVhG/m670tzvSp8ITv8680g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349343; c=relaxed/simple;
	bh=OHTujtMYuv1Q5fTFjfBaCoLi/MEwRqst6ee3dREnrQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thq1tg9+nO7jFz2QPqQO6SNQyqNF4wHtNhx4cIS/9f0RlOmZgmffQ2w46qMo4Whf3NtHJvFwnT+LyQT3qKzp2EZIMAd9k58TerC7nwMlRFDDO1RfP8AR1ukCWRiZIfKHEsq0/Y8vfwdQBUEy8g1xtF7ZQ5UEdyr9KHQG1ZAZSO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=plw1pfwb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 368BE161;
	Thu, 16 Apr 2026 16:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776349243;
	bh=OHTujtMYuv1Q5fTFjfBaCoLi/MEwRqst6ee3dREnrQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=plw1pfwbqjIEbvS6rUO11m4jvHP2hfs8uzR065wrRzfh1YD0LXXsKlJGDiwsjx8jP
	 7Ex2NqC3oiRXfojjXEiBbIMriIqL/l+c3geOocV3zmCi6qduWq8FkZH4WqfhkhqA6F
	 ZVa0AsHc/DjDDuGz3Zt1s/LztdmAe8iabl+zBnBk=
Date: Thu, 16 Apr 2026 17:22:15 +0300
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
Subject: Re: [PATCH v4 03/29] media: imx219: Set horizontal blanking on mode
 change
Message-ID: <20260416142215.GD1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-4-sakari.ailus@linux.intel.com>
 <adilL-DvNsZfELLe@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adilL-DvNsZfELLe@zed>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58910-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 1E34C40F87B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 09:27:34AM +0200, Jacopo Mondi wrote:
> On Wed, Apr 08, 2026 at 06:39:12PM +0300, Sakari Ailus wrote:
> > The driver UAPI is mode-based, allowing the user to choose a mode from a
> > small list based on the output size. The vertical blanking is set based on
> > the mode, do the same for horizontal blanking so the frame rate obtained
> > is constant.
> >
> > Additionally, it's best to use a known-good horizontal blanking value as
> > choosing the value freely may affect image quality. While the minimum
> > value may not be the best value for horizontal blanking, at least it is
> > constant rather than a minimum value of a different configuration.
> 
> As Dave suggested, we should probably better define the desired behaviour.
> 
> As far as I can see the driver doesn't specify a line lenght in the
> supported_modes array, and I guess we're always running with the min
> valid blanking. From a libcamera perspective only RPi changes the
> HBLANK control value, all other pipelines use the default, so if
> Dave's fine with this, I'm fine as well.

Interactions between formats and controls are notoriously badly
specified, so I'm all for improving that. That being said, this patch
simplifies the behaviour of the driver and leads to more predictable
results, so, until we have a formal spec,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> > ---
> >  drivers/media/i2c/imx219.c | 15 +++------------
> >  1 file changed, 3 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 89061dc1842d..62a23541b1dc 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -837,11 +837,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  	struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_rect *crop;
> >  	u8 bin_h, bin_v, binning;
> > -	u32 prev_line_len;
> >  	int ret;
> >
> >  	format = v4l2_subdev_state_get_format(state, 0);
> > -	prev_line_len = format->width + imx219->hblank->val;
> >
> >  	/*
> >  	 * Adjust the requested format to match the closest mode. The Bayer
> > @@ -882,7 +880,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> >  		int exposure_max;
> >  		int exposure_def;
> > -		int hblank, llp_min;
> > +		int llp_min;
> >  		int pixel_rate;
> >
> >  		/* Update limits and set FPS to default */
> > @@ -924,15 +922,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  					       llp_min - mode->width);
> >  		if (ret)
> >  			return ret;
> > -		/*
> > -		 * Retain PPL setting from previous mode so that the
> > -		 * line time does not change on a mode change.
> > -		 * Limits have to be recomputed as the controls define
> > -		 * the blanking only, so PPL values need to have the
> > -		 * mode width subtracted.
> > -		 */
> > -		hblank = prev_line_len - mode->width;
> > -		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > +
> > +		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, llp_min - mode->width);
> >  		if (ret)
> >  			return ret;
> >

-- 
Regards,

Laurent Pinchart

