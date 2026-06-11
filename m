Return-Path: <linux-media+bounces-64588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nHM6EU6tKmpMuwMAu9opvQ
	(envelope-from <linux-media+bounces-64588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:42:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F9B671F46
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:42:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=com8xICG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64588-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64588-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35AA1337335B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 12:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57583F822A;
	Thu, 11 Jun 2026 12:37:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511F53F788A
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 12:37:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181459; cv=none; b=cYHsxkzmqu5jGGbz7Iha18Rjm/Rga+5vDUNaQvqK06iO1Fe7Q/wsyPPJEZq/nkRZ9vdpP///Uiatb3DDhQG9GYi1haPnnRDvm51qWswNXpxsxMmJQr05DTADdVAkXKD1oBTwmQGD+4VzRoxuevI9przBTDYC+Bz43nU9B0jTyhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181459; c=relaxed/simple;
	bh=4HbTYaaqY8QdsGlcTd6udAT/ROxObnw61mM+ITXuNCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ty+73o6XiS1yyFDtoIS/QKVO2PBPikef6fD/u0XQyjLIlVF6zJEP+bfmPIdHwIruzJRcKVXCDIHbv3DwW3iAPh51F+nywPbA2406vYvj9kRWUfTQlBUdnaIswdjQx/ekCSM9znGLrjleWpEoLb4hWgoRpggcBqIjRddiCvGdiOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=com8xICG; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781181457; x=1812717457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4HbTYaaqY8QdsGlcTd6udAT/ROxObnw61mM+ITXuNCE=;
  b=com8xICGSSmoeoOGadt7vAqWSWPk/1wOCx+QDdfcrz9r9DckSC6PpUgW
   hAsdl2KnrGTjkwOvIs0q08tkuq/zQQs1lGJOjjs/olZIevmW3lBqRW8F+
   tDTL2+7DH8GJvJTlzcKjJAaTN9fhNnltsriddDJvgdXsKfFUiGS8M7E8h
   WPzfxTVrgGzsnd30Kvxs4CtYiv7hUWbTXPox/XCXr0PqyKm1kKqGfr8Ry
   GnA+VqK1VbkfhcwfeYIbbxYvBsG9PHPvyUXiXj6v+9B5cOjRGLjM++ty9
   OPzzil53U84+L1M6O9eyaCRiMOMqMsY+CNgswX1AaY8E/UZOdHJow0q3W
   A==;
X-CSE-ConnectionGUID: joSRldA7Rpar68WKKNlVaw==
X-CSE-MsgGUID: eCUb/qrpRmCSFkP25o9xAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99415632"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="99415632"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:37:36 -0700
X-CSE-ConnectionGUID: yE9aCu0gSKWHGx/p0Iyvbw==
X-CSE-MsgGUID: 5K7usirlRtanzh3jRbu+GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="248350758"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:37:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DECDC121C39;
	Thu, 11 Jun 2026 15:37:26 +0300 (EEST)
Date: Thu, 11 Jun 2026 15:37:26 +0300
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
	" Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v12 24/86] media: Documentation: Add scaling and
 post-scaler crop for common raw
Message-ID: <aiqsBu8G2HRDV89e@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-25-sakari.ailus@linux.intel.com>
 <177929421045.2341049.3815318982292932607@selene>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177929421045.2341049.3815318982292932607@selene>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64588-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
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
	RCPT_COUNT_TWELVE(0.00)[27];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18F9B671F46

Hi Jai,

On Wed, May 20, 2026 at 06:23:30PM +0200, Jai Luthra wrote:
> Quoting Sakari Ailus (2026-04-09 22:13:59)
> > Document scaling and post-scaler digital crop operations for the common
> > raw sensor model.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../media/v4l/subdev-config-model.rst         | 26 ++++++++++++++-----
> >  1 file changed, 20 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > index b450f698a608..1525119cbeb9 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > @@ -146,12 +146,19 @@ binning and sub-sampling to achieve the desired size.
> >  
> >  The digital crop operation takes place after binning and sub-sampling. It is
> >  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> > -0/0. The resulting image size is further output by the sensor on the sensor's
> > -data interface.
> > +0/0.
> > +
> > +The scaling operation is performed after the digital crop. It is configured by
> > +setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
> > +relative to the digital crop. The resulting image size is further output by the
> > +sensor on the sensor's data interface.
> >  
> >  The sensor's output mbus code is configured by setting the format on the (pad,
> > -stream) pair 0/0. When setting the format, always use the same width and height
> > -as for the digital crop setting.
> > +stream) pair 0/0. The width and height fields are used to configure post-scaler
> > +digital crop if supported by the driver, affecting the right and bottom edges of
> > +the frame. If post-scaler digital crop is not supported, the width and height
> > +fields of the format will match the compose rectangle sizes applied on the same
> > +0/0 (pad, stream) pair.
> >  
> 
> Given most raw sensors don't support a scaler, or a post-scaler crop, IMO

Many sensors do support it, but few drivers implement it, also due to
non-CCS UAPI not allowing it right now. Probably CCS is the only one right
now. But this isn't to say this wouldn't be more widely supported in the
future: I'd expect to see more freely configurable drivers as well as new
drivers that could control classes of sensors programmatically rather than
a single one based on register lists. In those cases supporting a feature
such as that is more meaningful.

> this section would be easier to read if we say:
> 
>     The sensor's output mbus code is configured by setting the format on
>     the (pad, stream) pair 0/0. The format's width and height should
>     usually match the compose rectangle sizes applied on the same 0/0 (pad,
>     stream) pair. If the sensor supports a post-scaler digital crop, the
>     width and height may be lesser, affecting the right and bottom edges of
>     the frame.

I'd prefer keep it as-is -- the second sentence above is rather vague.

-- 
Kind regards,

Sakari Ailus

