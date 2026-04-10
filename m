Return-Path: <linux-media+bounces-58491-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAfDERe42GnnhAgAu9opvQ
	(envelope-from <linux-media+bounces-58491-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:43:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D343D4442
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12451300B9CD
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4453AB273;
	Fri, 10 Apr 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZW17W/F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6813AC0C5
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810501; cv=none; b=QoF6NDqzv0luWZ+2zoTykh3sWSdsIKATwgZdctd7FePwPjIgRNpl6cY2Aivk1dGx9sJJMoM+EguvX4kIq+oBD6xaNxI+Y4JnI+tC6igdIWKDCr5XpjiqqN6NJrioiGv3SyqAG7L6tKTRSQuRN3lA91y7mfYPHFetKADemXZXZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810501; c=relaxed/simple;
	bh=Z7KgBBOUoUMLPbt+YbdLHM5E1BqIDzVMno95Kqpzs60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5JUjnXMb4C4u82jX0YQFDrn22SXrMf6xfTGg15x+mHYltMXoMcShnRe47p6wgTjMPlFSzRBCmlsCwEZlH/zAjRndwbA5o0/6CgpzZsD6TMjKMHKKg1jn9JfnXj/y9xZ/69k468u0MmRE31xkT12Y44+GneIpS1dXTLQeF6avGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZW17W/F; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775810499; x=1807346499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z7KgBBOUoUMLPbt+YbdLHM5E1BqIDzVMno95Kqpzs60=;
  b=fZW17W/F6oJNMHyt3JjN+XTB/1KxHtjzX4Cj0+DwOAiN2s6dstFmdQyJ
   domIQ4pLcAMjGUhZS9LOsAi4QkY3vgofK4TmGp5JQL9cd9DQ2fA/LwimC
   TO/fDugsnay06y9EvyW5rwpDWoKVhqkNEXk7DeOCpMGfzGVTMVTx+/so7
   CslKkUlnJ526Su5vw/uXC6xjSDo8nAw3EMGl5HTrVDyx3X4D1TWXcctgT
   hy6wA9dWTWBy+z5JxtUftLIkfYUPmVFzD0FsmYCEDa4XlgFe10VNHK7dl
   8cm9JoOX9m4pkvPohJOLzLUPFrEL5L/lP+IJcnqEm+FC8HKO4Y5IkVWC5
   Q==;
X-CSE-ConnectionGUID: K8bknsyFRnSrNvLJ6bz9Sg==
X-CSE-MsgGUID: pBEKwYvRQuGkpqJ+++ZUvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76900394"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76900394"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:41:39 -0700
X-CSE-ConnectionGUID: kFhb9wPRROiwivchJomiZQ==
X-CSE-MsgGUID: Ws9dzCwcTa+aENlTQfBwBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228193006"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:41:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 87644120F00;
	Fri, 10 Apr 2026 11:41:45 +0300 (EEST)
Date: Fri, 10 Apr 2026 11:41:45 +0300
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
Subject: Re: [PATCH v4 04/29] media: imx219: Scale the vblank limits
 according to rate_factor
Message-ID: <adi3yTLPNEfVYCI6@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-5-sakari.ailus@linux.intel.com>
 <adipBTTrT3ovgO-i@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adipBTTrT3ovgO-i@zed>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58491-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 42D343D4442
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

On Fri, Apr 10, 2026 at 10:28:27AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Apr 08, 2026 at 06:39:13PM +0300, Sakari Ailus wrote:
> > The limits for vertical blanking (and frame length in pixels) is related
> > to the properties of the hardware, it's not in half-line units the driver
> > uses. Multiply the vertical blanking limits by the rate_factor to satisty
> > hardware requirements.
> >
> > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> I'm not sure I understand this change.
> 
> I think we have clarified the imx219 has a "special" binning mode
> where the ADC consumes two lines at a time, allowing an higher
> framerate.
> 
> The driver accounts for that by doubling the PIXEL_RATE control value
> and halving the VBLANK and EXPOSURE controls values when writing them
> to registers.
> 
> Userspace is not concerned with the special binning mode and is not
> required to halve the values it writes to the VBLANK and EXPOSURE controls.
> 
> Doesn't the same apply to the limits ? Also, I presume but special
> binning mode is not well documented, the actual maximum register value
> for the frame length is still 0xfffe.
> 
> What have I missed ?

This patch indeed changes the limits of the VBLANK control. The maximum
frame length (in hardware) indeed is 0xfffe but the driver only allowed
frames up to 0x7fff lines before this patch.

> 
> > ---
> >  drivers/media/i2c/imx219.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 62a23541b1dc..6819a2fa3262 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -878,14 +878,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> >
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +		unsigned int rate_factor = imx219_get_rate_factor(state);
> >  		int exposure_max;
> >  		int exposure_def;
> >  		int llp_min;
> >  		int pixel_rate;
> >
> >  		/* Update limits and set FPS to default */
> > -		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > -					       IMX219_FLL_MAX - mode->height, 1,
> > +		ret = __v4l2_ctrl_modify_range(imx219->vblank,
> > +					       IMX219_VBLANK_MIN * rate_factor,
> > +					       (IMX219_FLL_MAX - mode->height) *
> > +					       rate_factor, rate_factor,
> >  					       mode->fll_def - mode->height);
> >  		if (ret)
> >  			return ret;
> > @@ -928,8 +931,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  			return ret;
> >
> >  		/* Scale the pixel rate based on the mode specific factor */
> > -		pixel_rate = imx219_get_pixel_rate(imx219) *
> > -			     imx219_get_rate_factor(state);
> > +		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
> >  		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> >  					       pixel_rate, 1, pixel_rate);
> >  		if (ret)

-- 
Regards,

Sakari Ailus

