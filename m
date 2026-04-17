Return-Path: <linux-media+bounces-59018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMJMEIss4ml22gAAu9opvQ
	(envelope-from <linux-media+bounces-59018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:50:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE80441B515
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B68D230A541D
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FA339D6F2;
	Fri, 17 Apr 2026 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hshn8yJJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97273D544;
	Fri, 17 Apr 2026 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429953; cv=none; b=bMhlq+0k+s6Kz9uczWbFJ3bbLSa+ZQSgypRFwz/rCeq8jP8HnP1NYzJg2C4rZTALO2szi9WEknpOgrYVrJKLXRT0Ig1keW4HINhXKVX4FFm55PZ3zE5YmOja/uInPHkbaP9IYmK1jHdKJY8fUcEui40IXxH98mK+dU9dlWYM66w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429953; c=relaxed/simple;
	bh=rF3rpSM7RHMxdco1W+JCMi42YYvIOMNLW61zAMaiyZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsnNXxDLZwLc3dQ0KOYyNZhv1C808bdLSJUFE7H35BCCFM5lDCBWw1ub9b6+/jQyuYFaG9HzjrXqftFlZ6IduN42msjtG4wwil2BStL4spn1WSV4jj5QnHZ53UQo7OkXOU5Ql5Pn464CufSjEYJj9x8O5N+MIhmFZnEID65FXF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hshn8yJJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776429952; x=1807965952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rF3rpSM7RHMxdco1W+JCMi42YYvIOMNLW61zAMaiyZM=;
  b=hshn8yJJuHwF6zXVdPtk8GRgCuChnmGn+zHVHisuN50jg1wOGUDQdu5k
   6Xs59nAxNa8mZBA8u7xPt57Ar1XvoSZRiYaCKPN8lzFCb/vli586jnErO
   J5YpRKabpJPndGZcSbzAUWCU+rWrpNdu3qIsWbAkRfIJ4R6M6wVSSWuaZ
   DpjH63L5OmxJ+0i3XOWOPZy593EyYNg6p0yYfkbTcBQGjRDUelrgWsfKi
   jRcwToB+JDI02nMeMH5zxqy3R1aUuSVJfgAsyTPq76/04Ni1r9awCfZVW
   gio+xIDBq9jh69K+SgSxtiw3m7v2HBXaGqDvKPg0r2MGP0Wm3OWmTBwxz
   g==;
X-CSE-ConnectionGUID: qa9nLtMYRzanVpVghhywrg==
X-CSE-MsgGUID: RSJCcvutSJSqSeGGS8EwEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="100092138"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="100092138"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:45:52 -0700
X-CSE-ConnectionGUID: GXBhfEOqSLuC3JflYpW20g==
X-CSE-MsgGUID: vFbG2zjaTnuIwOTbNrBD1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230018453"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.170])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:45:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 30666120E0E;
	Fri, 17 Apr 2026 15:46:08 +0300 (EEST)
Date: Fri, 17 Apr 2026 15:46:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 2/5] media: lm3560: Add IN supply support
Message-ID: <aeIrkNz2Um4EFYM2@kekkonen.localdomain>
References: <20260417114226.100033-1-clamor95@gmail.com>
 <20260417114226.100033-3-clamor95@gmail.com>
 <aeIk3z8f4dvjEXBQ@kekkonen.localdomain>
 <CAPVz0n0vf_Re-4s4ygOP8aAMA+b=o7yM+UYVZiRUfkrJ931J2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0vf_Re-4s4ygOP8aAMA+b=o7yM+UYVZiRUfkrJ931J2A@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59018-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE80441B515
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 03:37:37PM +0300, Svyatoslav Ryhel wrote:
> пт, 17 квіт. 2026 р. о 15:17 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> >
> > Hi Svyatoslav,
> >
> > On Fri, Apr 17, 2026 at 02:42:23PM +0300, Svyatoslav Ryhel wrote:
> > > Add IN supply (2.5V - 5.5V) found in LM3560 to ensure its proper work.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/media/i2c/lm3560.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > > index e6af61415821..a2674af6c9fb 100644
> > > --- a/drivers/media/i2c/lm3560.c
> > > +++ b/drivers/media/i2c/lm3560.c
> > > @@ -16,6 +16,7 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/mutex.h>
> > >  #include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > >  #include <linux/videodev2.h>
> > >  #include <media/i2c/lm3560.h>
> > >  #include <media/v4l2-ctrls.h>
> > > @@ -434,6 +435,11 @@ static int lm3560_probe(struct i2c_client *client)
> > >               return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gpio),
> > >                                    "failed to get hwen gpio\n");
> > >
> > > +     rval = devm_regulator_get_enable(&client->dev, "vin");
> >
> > I'd also enable this via runtime PM.
> >
> > Sensor drivers such as imx219 serve as a good example here.
> >
> 
> Would you mind if I squash adding hwen, vin and pm into single commit?
> It would be tricky to separate them from PM addition. I will add
> descriptions of what was changed.

Sounds good to me.

-- 
Sakari Ailus

