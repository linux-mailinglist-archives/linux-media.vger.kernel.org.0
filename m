Return-Path: <linux-media+bounces-57032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCEpC5TZw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:48:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 275CF325232
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3BAC730D8817
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE2A3D0901;
	Wed, 25 Mar 2026 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AC0T9XWd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA113033E3
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441264; cv=none; b=oVxF3uGv+vMcYmHv9agsfd41uRdspNV+UjZcnTWHXV+uT4sGmZRScfcWtcyff5MxI/eKrtH73R/uIlkl3i99tmfSpp8tkfFGXh8OwBzUJss4IuRjvxJz9vsfp3HKFGKlVhEqQeBB6APhsalUwf8BuqnkUvLJY/x0khjiA1ryU7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441264; c=relaxed/simple;
	bh=m7wNcvXrY2HTA+b2BQ1oS1dJWpDM66eUZX6SlxkJ91s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFYr0nv0koiYby8/RzqTZ9YxhNmbXKSUfGwR6DavEtu7CtDX56NSLTDtz6c57lG9v3ZKTsXo2U23YEd0BinIsAEdflpHL4ZJRVWhrndNwfwz/zBjqhaaOLEpPUt37o723WAjeP5mAjBgFQC9F82ckMd9PsEB8YuBEPcXvfguz7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AC0T9XWd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774441263; x=1805977263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m7wNcvXrY2HTA+b2BQ1oS1dJWpDM66eUZX6SlxkJ91s=;
  b=AC0T9XWd/le7zCTHG5GeOQV0A+mwpLvYcDKp5vVRgWMVRECtdCKZannf
   Aw5liHMN/5iCGPqNCsua191c/98NYuGVsukJhL0u76rYNLRgkN+ssBwUQ
   kDvzLbDvCvrGlsrH8osbmfIMBHDfYW8jrvEhnfQAwavC+slKgiw3PX1IC
   34av8SXV5oFZctCeYEs9JEZtO/elxIwWGxC75urN7q15OEoZwUmkDsyuV
   0HaPUCIZClopJEIb48+YtAwjfCUTIm1NK9dhT34pFYoXF1qIt8pfcPy4R
   9a1qBK24e8fwcRitGb2dVSS3FaqXeF0RiqpJGpJE015LMRkEXra2bZMnl
   w==;
X-CSE-ConnectionGUID: OaUp5rhvQJSjz39BO7YrnQ==
X-CSE-MsgGUID: Ch7LoenrRN+4jdmLFx/few==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79331415"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79331415"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:21:02 -0700
X-CSE-ConnectionGUID: kexaQFgfQkCxIV+Ej6kvOQ==
X-CSE-MsgGUID: QwzlEpMBS1K+est2QdROqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224927884"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:20:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0FF4B121CF9;
	Wed, 25 Mar 2026 14:20:59 +0200 (EET)
Date: Wed, 25 Mar 2026 14:20:59 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
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
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v3 03/22] media: imx219: Set horizontal blanking on mode
 change
Message-ID: <acPTK315ZABIo5Dh@kekkonen.localdomain>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
 <20260325105818.1176816-4-sakari.ailus@linux.intel.com>
 <CAPY8ntBdZvsxxmeH42vVif0Dn8LmUxb7mezWk57sg=YtdQmMyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntBdZvsxxmeH42vVif0Dn8LmUxb7mezWk57sg=YtdQmMyA@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-57032-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linuxtv.org:url]
X-Rspamd-Queue-Id: 275CF325232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dave,

Thanks for the review.

On Wed, Mar 25, 2026 at 11:48:26AM +0000, Dave Stevenson wrote:
> Hi Sakari
> 
> On Wed, 25 Mar 2026 at 10:58, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > The driver UAPI is mode-based, allowing the user to choose a mode from a
> > small list based on the output size. The vertical blanking is set based on
> > the mode, do the same for horizontal blanking so the frame rate obtained
> > is constant.
> >
> > Additinally, it's best to use a known-good horizontal blanking value as
> 
> s/Additinally/Additionally

Yes.

> 
> > choosing the value freely may affect image quality. While the minimum
> > value may not be the best value for horizontal blanking, at least it is
> > constant rather than a minimum value of a different configuration.
> 
> I've never known what the preferred behaviour is here. Ranges
> typically change on mode change, and v4l2_ctrl_modify_range will reset
> to the default if the current value is out of range, but otherwise
> leave things alone.
> 
> Seeing as you would be the one defining the preferred behaviour, I'll
> take this desire as gospel.

I wouldn't do this for freely configurable drivers but this driver has a
list of modes that obviously have hand-picked cropping, binning and frame
rate configuration. The further patches (metadata branch in my linuxtv.org
tree) adding support to the Common Raw Sensor Model implement a different
behaviour actually. I guess in practice the difference will be minor as
libcamera presumably sets the control values in any case to its liking.

Maybe adding a few words of documentation on this could make sense?

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> With the typo corrected:
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks!

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
> >         struct v4l2_mbus_framefmt *format;
> >         struct v4l2_rect *crop;
> >         u8 bin_h, bin_v, binning;
> > -       u32 prev_line_len;
> >         int ret;
> >
> >         format = v4l2_subdev_state_get_format(state, 0);
> > -       prev_line_len = format->width + imx219->hblank->val;
> >
> >         /*
> >          * Adjust the requested format to match the closest mode. The Bayer
> > @@ -882,7 +880,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> >                 int exposure_max;
> >                 int exposure_def;
> > -               int hblank, llp_min;
> > +               int llp_min;
> >                 int pixel_rate;
> >
> >                 /* Update limits and set FPS to default */
> > @@ -924,15 +922,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >                                                llp_min - mode->width);
> >                 if (ret)
> >                         return ret;
> > -               /*
> > -                * Retain PPL setting from previous mode so that the
> > -                * line time does not change on a mode change.
> > -                * Limits have to be recomputed as the controls define
> > -                * the blanking only, so PPL values need to have the
> > -                * mode width subtracted.
> > -                */
> > -               hblank = prev_line_len - mode->width;
> > -               ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > +
> > +               ret = __v4l2_ctrl_s_ctrl(imx219->hblank, llp_min - mode->width);
> >                 if (ret)
> >                         return ret;
> >

-- 
Kind regards,

Sakari Ailus

