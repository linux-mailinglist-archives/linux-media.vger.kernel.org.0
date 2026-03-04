Return-Path: <linux-media+bounces-54425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN2NJNjup2mWlwAAu9opvQ
	(envelope-from <linux-media+bounces-54425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 09:35:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD881FCAF2
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 09:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB48A30DB64C
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 08:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ECC391827;
	Wed,  4 Mar 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l87MYpGc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767073859DD;
	Wed,  4 Mar 2026 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613158; cv=none; b=KID0fUuKEBlevHSg8yoTkJ994E7Z9v8Ml80TBetCM8vjeNsr9gknhztTJsjUoziIcRP9bh6MSPFkQPnToGve3dVNY1lhsiixz2zy8RvJB83YZjYMCXHcncyMTwnxmBAbdRDEbjOUHCT7tFU0v8Y0UpnzS4xZzCldPSypk23JBnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613158; c=relaxed/simple;
	bh=JOFqsfIFKzMp86naS24kyx9X4Y06gJQKPBkCaG/pUdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0SpfhobP+p7FOl1zEjQqd395CpGlXt1dU7VU0cPiVb2DYXrIJh4wJ1rsDUcDKAyYtiFWGR6kTOBvQFFGalIPo9Qi56Do0UlNpKg4ydEoBUm13xxCFl6nlApNfaUIN2ShdX1mSv6i+6AisVT5AmdV1iyi9dozD5ycPcm4Kw/Z6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l87MYpGc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772613156; x=1804149156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JOFqsfIFKzMp86naS24kyx9X4Y06gJQKPBkCaG/pUdc=;
  b=l87MYpGc5F4SU8FGn01MPG0sxwtPi63Te9OBLF93oLmA5kQ4uNptJEmK
   pCFr9BRy7FpW+ruu1WbQ9ocCgP8KeDL42ThkEBx4GbsFMEPZlfIY4MGAw
   q1Dk1OLYj7ldMzDgy0g1kSU4My0qBkF//LvhX3kWQTrWAKEIkIp3HFx82
   F1jO7msAbz1QoS3JBBk35xyd2qkxfVvgRHMJNRvxY24eEJcL3fQOZ4jga
   tnK5uZ0wWjBYl16huwnUkRehAq3zFnMl7qUT8bt+5uyo8Q++gNxyRPPNW
   EjrYC+bNBfDdtyWNRjKccVnvAQm6c0ztxzr3RrRoxvbzsy+yuv7W7+6FX
   Q==;
X-CSE-ConnectionGUID: nBzTxde4Sq+Ktas/I9h+kQ==
X-CSE-MsgGUID: 4MCkHtB5SASEFhXV616s6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73735791"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73735791"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 00:32:36 -0800
X-CSE-ConnectionGUID: 2jXHWGvESHOI7DyyyLHZEA==
X-CSE-MsgGUID: /3d76aMJRbOyEibBVMTByA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="223268489"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.163])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 00:32:33 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0246D121D1E;
	Wed, 04 Mar 2026 10:33:01 +0200 (EET)
Date: Wed, 4 Mar 2026 10:33:01 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: johannes.goede@oss.qualcomm.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: mt9m114: add support for Aptina MI1040
Message-ID: <aafuPQ171Jwo12D-@kekkonen.localdomain>
References: <20260212122302.29211-1-clamor95@gmail.com>
 <20260212122302.29211-3-clamor95@gmail.com>
 <1cb955d5-c813-4b52-8f0a-51e4635d7b27@oss.qualcomm.com>
 <CAPVz0n0CSFhYKnzLWsSo_7kE_nDsBKJ1cS+A5ZQ6gt9DWLtxAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0CSFhYKnzLWsSo_7kE_nDsBKJ1cS+A5ZQ6gt9DWLtxAg@mail.gmail.com>
X-Rspamd-Queue-Id: EBD881FCAF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54425-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Hi Svyatoslav, Hans,

On Thu, Feb 12, 2026 at 06:44:06PM +0200, Svyatoslav Ryhel wrote:
> чт, 12 лют. 2026 р. о 17:53 <johannes.goede@oss.qualcomm.com> пише:
> >
> > Hi,
> >
> > On 12-Feb-26 13:23, Svyatoslav Ryhel wrote:
> > > Slightly different version of MT9M114 camera module is used in a several
> > > devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
> > > called Aptina MI1040. The only difference found so far is lacking ability
> > > to poll STATE register during power on sequence, which causes driver to
> > > fail with time out error. Add state_polling flag to diverge models and
> > > address quirk found in MI1040.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/media/i2c/mt9m114.c | 29 ++++++++++++++++++++++++-----
> > >  1 file changed, 24 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > > index d5b142fe68a9..a4b021702a1f 100644
> > > --- a/drivers/media/i2c/mt9m114.c
> > > +++ b/drivers/media/i2c/mt9m114.c
> > > @@ -373,6 +373,10 @@ enum {
> > >   * Data Structures
> > >   */
> > >
> > > +struct mt9m114_model_info {
> > > +     bool state_polling;
> > > +};
> > > +
> > >  enum mt9m114_format_flag {
> > >       MT9M114_FMT_FLAG_PARALLEL = BIT(0),
> > >       MT9M114_FMT_FLAG_CSI2 = BIT(1),
> > > @@ -422,6 +426,8 @@ struct mt9m114 {
> > >
> > >               struct v4l2_ctrl *tpg[4];
> > >       } ifp;
> > > +
> > > +     const struct mt9m114_model_info *info;
> > >  };
> > >
> > >  /* -----------------------------------------------------------------------------
> > > @@ -2279,9 +2285,11 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
> > >        * reaches the standby mode (either initiated manually above in
> > >        * parallel mode, or automatically after reset in MIPI mode).
> > >        */
> > > -     ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> > > -     if (ret < 0)
> > > -             goto error_clock;
> > > +     if (sensor->info->state_polling) {
> > > +             ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> > > +             if (ret < 0)
> > > +                     goto error_clock;
> > > +     }
> >
> > So I would expect a flag called state_polling to be checked
> > in mt9m114_poll_state(). It looks like you are only disabling
> > one specific case of state polling, not all of them.

There's a single user for mt9m114_poll_state()... I think the current name
is fine.

> >
> > Please rename the flag to reflect this.
> >
> 
> And which name you see fitting? There is only one instance of using
> mt9m114_poll_state in this driver, I see no controversy in naming.
> 
> > >
> > >       return 0;
> > >
> > > @@ -2527,6 +2535,8 @@ static int mt9m114_probe(struct i2c_client *client)
> > >       if (ret < 0)
> > >               return ret;
> > >
> > > +     sensor->info = device_get_match_data(dev);
> > > +
> >
> > This can return NULL when the driver is manually bound through
> > sysfs, which will result in a crash later on when checked in
> > mt9m114_power_on()

Svyatoslav, can you add a check for this?

I guess a few other drivers also suffer from this...

-- 
Regards,

Sakari Ailus

