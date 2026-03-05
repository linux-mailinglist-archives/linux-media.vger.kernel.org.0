Return-Path: <linux-media+bounces-54604-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ah1JWpVqWli5gAAu9opvQ
	(envelope-from <linux-media+bounces-54604-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:05:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A4520F537
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29B36307E888
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 10:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6173537B413;
	Thu,  5 Mar 2026 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnOIzXBB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3637BE62;
	Thu,  5 Mar 2026 10:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704822; cv=none; b=YNrsaCA7f78scYNTtAVgghWpAOqDkd0kC6EWTYD2/Ozb4B79gn57OirMTISl33BAoFdq+KMJg8HtLzxJw2HIYt+NEBgm6l1FojtrMySB2d5f5rN7w+7R+wbSWMiD/uTFdmCL78oSAYi3zgYYPnPQN6a7QwIREdaxR7zSR7WbLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704822; c=relaxed/simple;
	bh=muWXstEZMbN15XeFJxSS5x5tVzgZ4DuCk2XfgcGs3Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DITr0B1ZclkqVTurVV+8KZgAp9+c4S1iqaUpgJYbnmIhMb/rrIZw2YQiA+EimQ/97qHvXeW/a8oKyTFii3GrUBvAH3339iCy5lZgjAVdvUdVsLr0lStyUXGGxa7F4p10V7dxANW3x65WLU25pjdQyW1Br3CT1Klz0FAVyjFCfzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnOIzXBB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772704821; x=1804240821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=muWXstEZMbN15XeFJxSS5x5tVzgZ4DuCk2XfgcGs3Vs=;
  b=BnOIzXBBjqMJzcAl5Jl5GMXeEJ4eOxBt8P/di06C8TTQYtv8/aWg95lT
   AXkLII6XZr59N5HM7BQm6iFRDjgu/DZeqz3kJh+ANrPGErEqTwRurZknV
   baO7bP9aYif01ZiJNaf4KXGbWpCOTj6LkNGB9pHkdBqmVmEZDeRdmoMvA
   mMQmJC9IYApZhN1QP6uWBJZwgTGyP4sfiHBLAUYE7YgcvQefiYJ2hhzHl
   olmX1fyUr6Wvs6a/jfuAT7RpEppH+uvhgcFO+GgH4GB0/09//N+yEFMht
   5GZodv+fbp/KlswkVUOQI3JJzk4W3k60vpV9b/Kbxyy7JbX9Lf2qZon6/
   w==;
X-CSE-ConnectionGUID: prNdTJMxSVmeSP+Tv1PcCg==
X-CSE-MsgGUID: v0i89a1kQrCqAcym5RHoHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77632653"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="77632653"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 02:00:21 -0800
X-CSE-ConnectionGUID: 03LJrpzXQySu3FvLOVrAMQ==
X-CSE-MsgGUID: zjhrG/lQQMSdy6XVQvxq2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="218637267"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.65])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 02:00:18 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CBE2D121D19;
	Thu, 05 Mar 2026 12:00:46 +0200 (EET)
Date: Thu, 5 Mar 2026 12:00:46 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: mt9m114: add support for Aptina MI1040
Message-ID: <aalUTnqTFAWR6nPo@kekkonen.localdomain>
References: <20260304185001.82988-1-clamor95@gmail.com>
 <20260304185001.82988-3-clamor95@gmail.com>
 <aainoYv6RXkXFcHv@kekkonen.localdomain>
 <CAPVz0n2e3HCJRo0_Q5zbYp4w_-=ZCypoaw9vaN0NTfFr7qgorw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2e3HCJRo0_Q5zbYp4w_-=ZCypoaw9vaN0NTfFr7qgorw@mail.gmail.com>
X-Rspamd-Queue-Id: D9A4520F537
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54604-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.963];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Svyatoslav,

On Thu, Mar 05, 2026 at 10:36:25AM +0200, Svyatoslav Ryhel wrote:
> ср, 4 бер. 2026 р. о 23:43 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> >
> > Hi Svyatoslav,
> >
> > One more thing...
> >
> > On Wed, Mar 04, 2026 at 08:50:01PM +0200, Svyatoslav Ryhel wrote:
> > > @@ -2646,9 +2658,18 @@ static void mt9m114_remove(struct i2c_client *client)
> > >       pm_runtime_set_suspended(dev);
> > >  }
> > >
> > > +static const struct mt9m114_model_info mt9m114_models_default = {
> > > +     .state_standby_polling = true,
> > > +};
> > > +
> > > +static const struct mt9m114_model_info mt9m114_models_aptina = {
> > > +     .state_standby_polling = false,
> > > +};
> > > +
> > >  static const struct of_device_id mt9m114_of_ids[] = {
> > > -     { .compatible = "onnn,mt9m114" },
> > > -     { /* sentinel */ },
> > > +     { .compatible = "onnn,mt9m114", .data = &mt9m114_models_default },
> > > +     { .compatible = "aptina,mi1040", .data = &mt9m114_models_aptina },
> > > +     { /* sentinel */ }
> >
> > The driver also supports ACPI. mt9m114_models_default needs to be added to
> > the ACPI data, too; otherwise ACPI support breaks.
> >
> 
> So turn into
> 
> static const struct acpi_device_id mt9m114_acpi_ids[] = {
>     { "INT33F0" },
>     { /* sentinel */ },
> };
> 
> into
> 
> static const struct acpi_device_id mt9m114_acpi_ids[] = {
>     { "INT33F0", (kernel_ulong_t)&mt9m114_models_default },
>     { /* sentinel */ }
> };

Looks good to me.

> 
> I want to be as specific as possible to avoid any misunderstandings.
> Additionally, please ensure these are all the required changes to
> avoid unwanted reiterations, as I may not be as familiar with the
> media framework as you are. Thank you!

That's what I noticed after going through this once more.

Review won't make patches perfect (mostly) but the more issues can be found
during review, the better.

> 
> > >  };
> > >  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
> > >
> >

-- 
Kind regards,

Sakari Ailus

