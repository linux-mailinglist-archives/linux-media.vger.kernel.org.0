Return-Path: <linux-media+bounces-52774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOTuM2Bej2mtQgEAu9opvQ
	(envelope-from <linux-media+bounces-52774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 18:24:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E61389B9
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 18:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 030473037E52
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 17:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499AD364EBA;
	Fri, 13 Feb 2026 17:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ke0qRaP9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFE935D5FE
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 17:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771003482; cv=none; b=pUE5AmXxiueVaw33UT2Ih3E4Ta2kJXDtuR1n8kC1LRP0N1paAxDgk3yhjH60JB1fHkvWsjMZpxFRtl8W+DX6Orqj+VbO/pn4XgVuYkXEtLcwsEiX4fT19yi7uXwZlKsvc9ehQCCqnbzJfaGH4bC3FKyCzHnrB685k49zyTRcA3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771003482; c=relaxed/simple;
	bh=wbAnJF1+Q4RIBwH1waKaytT+sfsvWzcc4+tG/VBOMLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3fNZKQX8Pm0B8mtBaJvlp4bkDQ2IIT59RYMw/cN97yBfaj+pQLPOBjwWiv9FADhO9ZRBvz6l5fViW6I7uZh800bs7+4vrd5kZ0kcc+HYxsIChX6edvOuKcgJ0m+ZX4vHkFcnNGLcV37DGMqYXKNtFMO2BlbGUN03tp/vq0dq3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ke0qRaP9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771003482; x=1802539482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wbAnJF1+Q4RIBwH1waKaytT+sfsvWzcc4+tG/VBOMLU=;
  b=Ke0qRaP97SGBiap3Q5BuP3h1zLya2IOY8WlryXdRJtn/ZpQoYIub6Iwj
   53p8QvJb0M99tjNPfuPeQtdnNZ9nwYYxNifFTgGTOCg9SRsV/83mSey4l
   QoyJT00IwErQWv3sBkM47X1QNXgvi7owQK3GVo37clyCmomzaOmhap19l
   7joZFOGgIMXZ4uEcXz6qWTsAERqU9lMYJSRL69GV2cfgfxDw0BZYJ1rIF
   xrOUGPuhIxWZ7Yxo5s3pmnO8azZ1b0oX3vfLn0ZiWeZ17XIK7i9zfkqJR
   nsUmMwdwniqsZ1q64qCq4L/gKM14KWvhb4UZ3MAjxNNTvKXbgIrjcMvpW
   w==;
X-CSE-ConnectionGUID: f413PDRfTcCJDUkAMhi81Q==
X-CSE-MsgGUID: GMecpurUSh610xmg6v5uVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71388802"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="71388802"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 09:24:41 -0800
X-CSE-ConnectionGUID: MrQd5EB9SLWyzncFEdYSQg==
X-CSE-MsgGUID: wIbJyK/yQR+hBfa5A+WIJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211679299"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.102])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 09:24:35 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 33C431205A4;
	Fri, 13 Feb 2026 19:24:53 +0200 (EET)
Date: Fri, 13 Feb 2026 19:24:53 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 01/14] media: imx219: Rename "PIXEL_ARRAY" as "CROP"
Message-ID: <aY9eZbnsRlifSdOX@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-2-sakari.ailus@linux.intel.com>
 <aY83fFX7wi5gzDfV@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY83fFX7wi5gzDfV@zed>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52774-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 1C9E61389B9
X-Rspamd-Action: no action

Hi Jacopo,

On Fri, Feb 13, 2026 at 03:42:41PM +0100, Jacopo Mondi wrote:
> Hi Sakari
>   How is this related to the metadata seris ? :)

It's related as I'm working on the imx219 driver to add support for the
common raw sensor model to it.

> 
> Shouldn't we aim to fast track that series instead of adding more
> things as requisites ?

The intent here is to merge early what can be merged early, to avoid making
the series unnecessarily large.

> 
> On Wed, Feb 11, 2026 at 11:09:07AM +0200, Sakari Ailus wrote:
> > The imx219 driver uses macros for denoting different aspects of the pixel
> > array. The values used for IMX219_PIXEL_ARRAY_* macros imply a crop
> > configuration however, not the size of the pixel array. Reflect this in
> > the naming, too.
> 
> 3280x2464 is the active pixel array area, according to the datasheet.
> I guess one can claim is the default crop (it is in facts used as
> DEFAULT_CROP and CROP_BOUNDS rectangle), so:

It's a good question what should be done with this. I took another glance
to the datasheet and inded the borders are said to be "InValid" pixels
without further explaining what it actually means. Probably nothing apart
from the vendor making no guarantees of the quality, even if in practice
there might be no difference.

To me this border area looks like extra rows and columns of pixels to
counter the ISPs effectively dropping a few rows and columns while still
keeping the resulting image slightly larger than 8 Mp.

Have you tried capturing these pixels?

> 
> Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you.

> 
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/imx219.c | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index fee63bc106d9..54622c406a03 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -142,10 +142,10 @@
> >  /* IMX219 native and active pixel array size. */
> >  #define IMX219_NATIVE_WIDTH		3296U
> >  #define IMX219_NATIVE_HEIGHT		2480U
> > -#define IMX219_PIXEL_ARRAY_LEFT		8U
> > -#define IMX219_PIXEL_ARRAY_TOP		8U
> > -#define IMX219_PIXEL_ARRAY_WIDTH	3280U
> > -#define IMX219_PIXEL_ARRAY_HEIGHT	2464U
> > +#define IMX219_CROP_LEFT		8U
> > +#define IMX219_CROP_TOP			8U
> > +#define IMX219_CROP_WIDTH		3280U
> > +#define IMX219_CROP_HEIGHT		2464U
> >
> >  /* Mode : resolution and related config&values */
> >  struct imx219_mode {
> > @@ -675,13 +675,13 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >  	bpp = imx219_get_format_bpp(format);
> >
> >  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> > -		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> > +		  crop->left - IMX219_CROP_LEFT, &ret);
> >  	cci_write(imx219->regmap, IMX219_REG_X_ADD_END_A,
> > -		  crop->left - IMX219_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
> > +		  crop->left - IMX219_CROP_LEFT + crop->width - 1, &ret);
> >  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_STA_A,
> > -		  crop->top - IMX219_PIXEL_ARRAY_TOP, &ret);
> > +		  crop->top - IMX219_CROP_TOP, &ret);
> >  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> > -		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> > +		  crop->top - IMX219_CROP_TOP + crop->height - 1, &ret);
> >
> >  	imx219_get_binning(state, &bin_h, &bin_v);
> >  	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> > @@ -867,8 +867,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  	 * Use binning to maximize the crop rectangle size, and centre it in the
> >  	 * sensor.
> >  	 */
> > -	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
> > -	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
> > +	bin_h = min(IMX219_CROP_WIDTH / format->width, 2U);
> > +	bin_v = min(IMX219_CROP_HEIGHT / format->height, 2U);
> >
> >  	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
> >  	binning = min(bin_h, bin_v);
> > @@ -967,10 +967,10 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> >
> >  	case V4L2_SEL_TGT_CROP_DEFAULT:
> >  	case V4L2_SEL_TGT_CROP_BOUNDS:
> > -		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> > -		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> > -		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> > -		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> > +		sel->r.top = IMX219_CROP_TOP;
> > +		sel->r.left = IMX219_CROP_LEFT;
> > +		sel->r.width = IMX219_CROP_WIDTH;
> > +		sel->r.height = IMX219_CROP_HEIGHT;
> >
> >  		return 0;
> >  	}

-- 
Kind regards,

Sakari Ailus

