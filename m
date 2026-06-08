Return-Path: <linux-media+bounces-64183-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Te4cEcXHJmrjkQIAu9opvQ
	(envelope-from <linux-media+bounces-64183-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 15:46:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8243A656C6E
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 15:46:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=CpDXPjVP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64183-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64183-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 348AA30442B3
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 13:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BBA3B0AE7;
	Mon,  8 Jun 2026 13:44:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C543B47F3
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 13:44:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926296; cv=none; b=BQQrV2swo6zvdH/4RhxqhEHOB7PEA5v0I1gvRi20uc7Hv0ehP8irjYUg+RxWhpJ46V414JOWSMdM/BW1s/T19WX9Dmrsd1LejsB3i+MT9cqewDYku8buVT7TDBjYFKCIH1y6gBUBAdPvqzXAFHh105XmuCzp6qY/mVx3DgOS45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926296; c=relaxed/simple;
	bh=w5+gjpol14uAbICR7Csqc8uwTr6tw023T0gYtJ3ZOJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j47aJ9V8tpV1YKx5EAynCKKIKuqwJuX/Ht4lCyHhheKOne4W1IyqE+NhZJ3Mp/wCpRsHjFnsu73chkOSZOQTs4/it+wlJeCwhHMXrOxG+XT62h8vUkUtS+abxuhmlTbkp8hWotDnk9o6bJybyrzDAgIXQSTmN9pVrsLsMIh/3zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpDXPjVP; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780926295; x=1812462295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w5+gjpol14uAbICR7Csqc8uwTr6tw023T0gYtJ3ZOJU=;
  b=CpDXPjVPNCyxHrb0xXBWUVCr86hXIL4k7GcavQ2l+QlENMPAeMKnhpkm
   243dZ/i8YgM/9cgMRXSmCQO3JRt71XTwFIArLIdJXI5KXFn+LEWkKta1U
   R8opi1CK26yYrTwXIrumtvLPsQljPbCl32z4tqy6/q7p87i98G2lm/APc
   7UiJP4bwat4CxsmKLjq5wqNhUveY+OV4oCt14wziLZoEJnPWK6ZnXcjdO
   LfsySvun9uf/v2xI1HcVd4bfjX5lfthdr6UuXBUhPgrSE/azWUCK6lx6U
   Q+4k3knxbhaXql9LQolf9MZY9w2m+N2mf8seWRYAX7xsc2x9mXQGssMRm
   A==;
X-CSE-ConnectionGUID: qU7MISEoSZ+SSkGYviLHQQ==
X-CSE-MsgGUID: Mhnxbm1wS7O9zbveeYeu3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="84232836"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="84232836"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 06:44:54 -0700
X-CSE-ConnectionGUID: FcQypJBPQcC0AXg1FZMPHA==
X-CSE-MsgGUID: fOTviHrbRcamdUq/yztsBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="243111325"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 06:44:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E96D4121C67;
	Mon, 08 Jun 2026 16:44:44 +0300 (EEST)
Date: Mon, 8 Jun 2026 16:44:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 03/10] media: imx219: Account rate_factor in setting
 upper exposure limit
Message-ID: <aibHTAmSmCbbXAUZ@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-4-sakari.ailus@linux.intel.com>
 <20260608090625.GA772117@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608090625.GA772117@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64183-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,vger.kernel.org:from_smtp,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8243A656C6E

Hi Laurent,

On Mon, Jun 08, 2026 at 12:06:25PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Jun 08, 2026 at 12:53:49AM +0300, Sakari Ailus wrote:
> > The rate_factor multiplier is used to multiply a few values in the
> > sensor's timing configuration and the exposure time is one of them. This
> > also needs to be taken into account in exposure time margin: multiply it
> > by rate_factor so that sensor's exposure time margin is respected.
> > 
> > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/imx219.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index d8fe7db18b6c..e681f80f9e3e 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -451,7 +451,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		int exposure_max, exposure_def;
> >  
> >  		/* Update max exposure while meeting expected vblanking */
> > -		exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
> > +		exposure_max = format->height + ctrl->val -
> > +			IMX219_EXPOSURE_OFFSET * rate_factor;
> 
> I'm not sure if this is quite right, I need some more time to research.
> Regardless of that, isn't the same change also needed in
> imx219_set_pad_format() ?

Indeed. I'll take that into account in v6.

Controls are initialised for non-binned default mode so that part is ok.

> 
> >  		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> >  				exposure_max : IMX219_EXPOSURE_DEFAULT;
> >  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
> 

-- 
Regards,

Sakari Ailus

