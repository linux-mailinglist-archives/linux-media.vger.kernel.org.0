Return-Path: <linux-media+bounces-52286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPA6C6imhWljEgQAu9opvQ
	(envelope-from <linux-media+bounces-52286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 09:30:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E11AFB835
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 09:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F435300E736
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 08:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DC432B9A7;
	Fri,  6 Feb 2026 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TzRXYkF2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19EA3B28D
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770366626; cv=none; b=Z/w4Uy3/nXCLQyFUIpAIbeJ6VZ2WAYE/WKgsa1e2xmBMrzdpReaE5/r8AMrOoi+T0lKxL+jgmqLaQuiqjFaL4eu9fBhpK3Y1IFZ+n9E7WElOk8t6VXNuB7Iujf0OdZCuuzymPV6WRcmLboayCzclfZjPpjq5gAkm7TLtCdh7ZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770366626; c=relaxed/simple;
	bh=8MfsGkZnIwVxEFoU+rW4cttCkAnjseMsvF4L8NYGMI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdm8FthIwU8bWWXyiqzY2yfD7SviyI2W3KOzB04QjdXRx1feGN3liQrrKMzcNIXwx2GPg2jNbT8o7mr2tEtmf4utoAgVXikfdRl+tsQplx/LAaWnjTNHVkiOhI/Dn361MOKy94oTCAVph57VpzPjgr7VuOQxcZ3h1mRRzLl3N2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TzRXYkF2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:153:f9b8:5024:faa2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2317063B;
	Fri,  6 Feb 2026 09:29:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770366580;
	bh=8MfsGkZnIwVxEFoU+rW4cttCkAnjseMsvF4L8NYGMI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzRXYkF2cJ7f676Y8YFx/C+zHNBeSosnxWCbm27D8SThZPeMjrVHhNUhmTZ/IY9Rn
	 MI1YFQzKi98tQj9L8w+P85UUwbyMmco/8DgCgfr4Kc90I+1myEGMw6O22rB8e9+03C
	 P9VaGmRH9OjvHpA2mpwmTHpK7tmWvozVjVxE+aL4=
Date: Fri, 6 Feb 2026 09:30:19 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sean Young <sean@mess.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCHv7 2/3] docs: media: document Media Maintainers
Message-ID: <aYWljU7ziHZ86lar@zed>
References: <cover.1769511207.git.hverkuil+cisco@kernel.org>
 <74976e732f6be2964e0371c73407c9dccf755424.1769511207.git.hverkuil+cisco@kernel.org>
 <444435bf1e67841c49b22cb9b4a41c8c17c710e4.camel@collabora.com>
 <20260205165912.GO156228@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205165912.GO156228@killaraus>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52286-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7E11AFB835
X-Rspamd-Action: no action

Hi Laurent

On Thu, Feb 05, 2026 at 06:59:12PM +0200, Laurent Pinchart wrote:
> On Thu, Feb 05, 2026 at 09:24:26AM -0500, Nicolas Dufresne wrote:
> > Le mardi 27 janvier 2026 à 11:53 +0100, Hans Verkuil a écrit :
> > > Document who the Media Maintainers are and what their
> > > responsibilities are.
> > >
> > > Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> > > ---
> > >  .../media/maintainer-entry-profile.rst        | 47 +++++++++++++++++--
> > >  1 file changed, 44 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > index be4728b97759..4f73ee073860 100644
> > > --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > @@ -346,13 +346,54 @@ With the pull request workflow, pull requests shall use PGP-signed tags.
> > >  For more details about PGP signing, please read
> > >  Documentation/process/maintainer-pgp-guide.rst.
> > >  
> > > -Subsystem Media Maintainers
> > > ----------------------------
> > > +List of Media Maintainers
> > > +-------------------------
> > >  
> > > -The subsystem maintainers are:
> > > +The Media Maintainers listed here all have patchwork access and can
> > > +make Pull Requests or have commit rights.
> > > +
> > > +The Media Subsystem Maintainers are:
> > >    - Mauro Carvalho Chehab <mchehab@kernel.org>
> > >    - Hans Verkuil <hverkuil@kernel.org>
> > >  
> > > +The Media Core Maintainers are:
> > > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > > +
> > > +    - ISP
> > > +    - sensor drivers
> > > +    - v4l2-async and v4l2-fwnode core frameworks
> > > +    - v4l2-flash-led-class core framework
> > > +
> > > +  - Mauro Carvalho Chehab <mchehab@kernel.org>
> > > +
> > > +    - DVB
> > > +
> > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > +
> > > +    - Media controller drivers
> > > +    - Core media controller framework
>
> You could list me for ISPs as well, Sakari and I handle the together.
>
> I'm not alone there of course, it's a team effort and Dan and Jacopo are
> also active in developing and reviewing multiple ISP drivers. Not that
> we necessarily want to list them in this document (and I don't know if
> they would be interested), but I want publicly credit them in this mail
> for the work they do.
>

Thanks for pointing it out.

I have sent some pull request in the past and when it makes sense I
intend to do so for the drivers (or framework components) I take care
of.

As long as I can continue doing it, there's no need to list my name
here until we don't get to a model where more people can have commit
rights, which is still something I hope we can get to in a reasonable
time.

In any case, I'm certainly interested in partecipating in any effort
that could make the subsystem a little more agile.

Thanks
  j

> > > +
> > > +  - Hans Verkuil <hverkuil@kernel.org>
> > > +
> > > +    - V4L2 drivers
> > > +    - V4L2 and videobuf2 core frameworks
> > > +    - HDMI CEC drivers
> > > +    - HDMI CEC core framework
> > > +
> > > +  - Sean Young <sean@mess.org>
> > > +
> > > +    - Remote Controller (infrared) drivers
> > > +    - Remote Controller (infrared) core framework
> > > +
> > > +The Media Driver Maintainers responsible for specific areas are:
> > > +  - Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > +
> > > +    - Codec drivers
> >
> > I also took care of M2M color converters lately, while trying to delegate when
> > it makes sense (such as DWL100 delegated to Laurent). So we may (or may not)
> > add:
> >
> >        - M2M driver not otherwise delegated
> >
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >
> > > +
> > > +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > +
> > > +    - Qualcomm drivers
> > > +
> > >  Submit Checklist Addendum
> > >  -------------------------
> > >  
>
> --
> Regards,
>
> Laurent Pinchart
>

