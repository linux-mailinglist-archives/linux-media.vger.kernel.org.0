Return-Path: <linux-media+bounces-65184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ET3IHDrcM2qGHQYAu9opvQ
	(envelope-from <linux-media+bounces-65184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:53:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF77369FD68
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:53:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=JJ4wqDW9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65184-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65184-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 421373055891
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF11033893D;
	Thu, 18 Jun 2026 11:53:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1FB3909BF;
	Thu, 18 Jun 2026 11:53:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783598; cv=none; b=P6JoXcHJyRYLKJLbhe0QG6lbd/xILnrwjVX9q14MoxHFT+EM8jTp+8BavDn712V84+08Z7rrzhWmkte+AI1V56/x2itYUldPQ1fYPd5DJ7wJ+VNSGSr1N6cqI3Scjm+sSAdn6aCuHVRVtDdbckUKHf6avHwRSSjkiluw6UoPIqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783598; c=relaxed/simple;
	bh=TTGKxlEH4k6Iz/XH79izOYS2k7Sh5F8kwl4iFg7yhxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/uDbLW+IA2DaQK0me1I0HbpDJA4T6MUAKKUYOue/28KOajcaIa2IVySyPsU/GKLPlkCbr/3iiuRwfgNYHnVh9w5q1z32Cl16PbruKkgVQ8YVGteq0XVQLNIsPEi0jvTkRyJREhmcAttq156aqeOCAXu5mOyW2twu9t4faZC08g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJ4wqDW9; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781783597; x=1813319597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TTGKxlEH4k6Iz/XH79izOYS2k7Sh5F8kwl4iFg7yhxw=;
  b=JJ4wqDW9UkkdPsJVOz4Qpbb6YucF0RpBV4H+bdmK72rjLOWo+6Ky2UK6
   7pteH7urny3v9DyNS43BzhEMjGBLFniqKkMLmj80A1LrUtDukKYxtJqe7
   82ZybQ1u5H76DRXQxVigfxr+OGgDYbGaevGDZUA5iHa9rds2pY0rnJJuf
   DY4jEvYRv6ztVXaoPxadGdAjlkQdzZSiZr5CQZJHe0PrmfT1RBykeV31e
   hKKLZTB9ZZ2gaPIOmp9cea8N2z3xjZhYc6V4+qQ1IwEtzwU6VdBtAtJnf
   WmiSkgk+MrvDP4H/wVBD+WsVjREfSwVGaz9kNBHGXpXBO40CcEFVuF8BR
   w==;
X-CSE-ConnectionGUID: tiFRLf2lRc6dlFj6us3mlg==
X-CSE-MsgGUID: GtGyZiIIRaaFi27Eq9wl8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81724115"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="81724115"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:53:16 -0700
X-CSE-ConnectionGUID: weUvlHunQDeCMKvggxUFdA==
X-CSE-MsgGUID: gW53k6qSRL+HSccgwwubQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="241971105"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.24])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:53:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E2E36121C36;
	Thu, 18 Jun 2026 14:53:13 +0300 (EEST)
Date: Thu, 18 Jun 2026 14:53:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: vd56g3: clean up subdev state on probe
 failure
Message-ID: <ajPcKcJfbIdPKI8-@kekkonen.localdomain>
References: <20260424165238.31333-1-mhun512@gmail.com>
 <c9c20bce-a1bb-4932-bfa0-c87f7156ff82@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9c20bce-a1bb-4932-bfa0-c87f7156ff82@foss.st.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65184-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:benjamin.mugnier@foss.st.com,m:mhun512@gmail.com,m:sylvain.petinot@foss.st.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid,linux.intel.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF77369FD68

Hi Benjamin,

On Tue, Jun 16, 2026 at 02:49:54PM +0200, Benjamin Mugnier wrote:
> Hi,
> 
> Thank you for your patch, and apologies for the delay.
> 
> Le 24/04/2026 à 18:52, Myeonghun Pak a écrit :
> > vd56g3_subdev_init() calls v4l2_subdev_init_finalize(), which allocates
> > the subdev active state and requires v4l2_subdev_cleanup() to release it.
> > 
> > If vd56g3_update_controls() fails after finalize succeeds, the probe error
> > path currently skips v4l2_subdev_cleanup() and returns an error. The driver
> > .remove() callback is not called after a failed probe, so the active state
> > is leaked.
> > 
> > Route this error through a subdev cleanup label before freeing the control
> > handler and media entity.
> > 
> > Fixes: 87aa97fc3157 ("media: i2c: Add driver for ST VD56G3 camera sensor")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> > Changes in v2:
> > - Use a lowercase subject summary.
> 
> Please keep the first character uppercase, just like other commits on
> this module.
> 
> > 
> >  drivers/media/i2c/vd56g3.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
> > index 157acea9e2..43f792288a 100644
> > --- a/drivers/media/i2c/vd56g3.c
> > +++ b/drivers/media/i2c/vd56g3.c
> > @@ -1427,11 +1427,14 @@ static int vd56g3_subdev_init(struct vd56g3 *sensor)
> >  	v4l2_subdev_unlock_state(state);
> >  	if (ret) {
> >  		dev_err(sensor->dev, "Controls update failed: %d\n", ret);
> > -		goto err_ctrls;
> > +		goto err_subdev;
> >  	}
> >  
> >  	return 0;
> >  
> > +err_subdev:
> > +	v4l2_subdev_cleanup(&sensor->sd);
> 
> v4l2_subdev_cleanup() is already performed in the caller (i.e.
> vd56g3_probe()), but as you noticed it is not called from this path. I'd
> rather have the return value route correctly through
> v4l2_subdev_cleanup() in  vd56g3_probe(), allowing to keep a unique call
> to v4l2_subdev_cleanup() instead.

Is it?

If vd56g3_update_controls() in vd56g3_subdev_init() fails, it'll jump to
err_power_off in vd56g3_probe() which does PM related cleanup only.

> 
> This patch looks like is LLM generated and sparks my curiosity. If so
> you must disclaim it using an Assisted-by tag [1]. Sorry if I’m mistaken.
> 
> [1] https://docs.kernel.org/process/coding-assistants.html
> 
> > +
> >  err_ctrls:
> >  	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> >  
> 
> -- 
> Regards,
> Benjamin
> 

-- 
Kind regards,

Sakari Ailus

