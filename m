Return-Path: <linux-media+bounces-58499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EVGDF+82GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:01:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AD33D472A
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCFE8300C7D1
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB06A3A1D14;
	Fri, 10 Apr 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ihMQGgMs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EB82E282B
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811669; cv=none; b=d+avTtpMsQ5eqWU+KVTqgAi/sbWr3TAYUEw0yrj0kRGTffmw3v/j1PWQmYzVP72wC6Nv/TloutUKnWyBjCCJMzUvktBcLKl0EEXrPt4ib7R3MWShYj4kwAykI/FPYpzk4zJlN9AJ1ZpqYaK8wG0MAkQMnNMx6MnpaYvXJl90z3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811669; c=relaxed/simple;
	bh=F5LXoCpMOKGOBBoyyy2RVh7J3g0LiktEtuj7O/GE9hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuFyyS1oZBW8YKwE9uXdOQD8Q2CEBXgQfrdAzTx3wJVcWuIW1hdExA8Tvo5D3wvqyN6WkDcSAK5//WlD2Z5D0QzxFcwfT5ZZzGRt8cwmZb0YKby+ZL3oKBY1XUDjzlZuDisubfatzG72vZ2YkzkvqN5KHvd8iwX9eHHPpNs6THE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ihMQGgMs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D1121BA;
	Fri, 10 Apr 2026 10:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811575;
	bh=F5LXoCpMOKGOBBoyyy2RVh7J3g0LiktEtuj7O/GE9hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihMQGgMsSbBOn50YmspCWn/ak38et8YKlkQ6vpG86+xw6j7NijzcHkbnNcUnNLOR2
	 tYPcz8bLvoIOwqtQSBD4mqvmfE7WAErRXRe0NxXXF2iUUtFxsommYDrlOV23/bZapK
	 ydYw/8orDRKf0iJf5933NnTCHH08QjgwCln6gVXg=
Date: Fri, 10 Apr 2026 11:01:02 +0200
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
Subject: Re: [PATCH v4 04/29] media: imx219: Scale the vblank limits
 according to rate_factor
Message-ID: <adi7ngYVxwBARBm1@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-5-sakari.ailus@linux.intel.com>
 <adipBTTrT3ovgO-i@zed>
 <adi3yTLPNEfVYCI6@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adi3yTLPNEfVYCI6@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58499-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[intel.com:server fail,sin.lore.kernel.org:server fail,ideasonboard.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 45AD33D472A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 11:41:45AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, Apr 10, 2026 at 10:28:27AM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Wed, Apr 08, 2026 at 06:39:13PM +0300, Sakari Ailus wrote:
> > > The limits for vertical blanking (and frame length in pixels) is related
> > > to the properties of the hardware, it's not in half-line units the driver
> > > uses. Multiply the vertical blanking limits by the rate_factor to satisty
> > > hardware requirements.
> > >
> > > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > I'm not sure I understand this change.
> >
> > I think we have clarified the imx219 has a "special" binning mode
> > where the ADC consumes two lines at a time, allowing an higher
> > framerate.
> >
> > The driver accounts for that by doubling the PIXEL_RATE control value
> > and halving the VBLANK and EXPOSURE controls values when writing them
> > to registers.
> >
> > Userspace is not concerned with the special binning mode and is not
> > required to halve the values it writes to the VBLANK and EXPOSURE controls.
> >
> > Doesn't the same apply to the limits ? Also, I presume but special
> > binning mode is not well documented, the actual maximum register value
> > for the frame length is still 0xfffe.
> >
> > What have I missed ?
>
> This patch indeed changes the limits of the VBLANK control. The maximum
> frame length (in hardware) indeed is 0xfffe but the driver only allowed
> frames up to 0x7fff lines before this patch.
>

Isn't userspace still allowed to write values up to 0xfffe ?

What ends up in registers is halved because, again in my speculative
understanding of the special binning mode, when using this special
mode two lines at the time are sampled.

Anyway, provided you've tested all the use cases we tested when
implementing support for the special binning mode, and that Dave is
fine being him the maintainer of this driver, I'll be happy to shut up.

> >
> > > ---
> > >  drivers/media/i2c/imx219.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 62a23541b1dc..6819a2fa3262 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -878,14 +878,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> > >
> > >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > +		unsigned int rate_factor = imx219_get_rate_factor(state);
> > >  		int exposure_max;
> > >  		int exposure_def;
> > >  		int llp_min;
> > >  		int pixel_rate;
> > >
> > >  		/* Update limits and set FPS to default */
> > > -		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > > -					       IMX219_FLL_MAX - mode->height, 1,
> > > +		ret = __v4l2_ctrl_modify_range(imx219->vblank,
> > > +					       IMX219_VBLANK_MIN * rate_factor,
> > > +					       (IMX219_FLL_MAX - mode->height) *
> > > +					       rate_factor, rate_factor,
> > >  					       mode->fll_def - mode->height);
> > >  		if (ret)
> > >  			return ret;
> > > @@ -928,8 +931,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >  			return ret;
> > >
> > >  		/* Scale the pixel rate based on the mode specific factor */
> > > -		pixel_rate = imx219_get_pixel_rate(imx219) *
> > > -			     imx219_get_rate_factor(state);
> > > +		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
> > >  		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> > >  					       pixel_rate, 1, pixel_rate);
> > >  		if (ret)
>
> --
> Regards,
>
> Sakari Ailus

