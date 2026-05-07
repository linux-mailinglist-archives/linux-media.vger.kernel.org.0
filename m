Return-Path: <linux-media+bounces-60745-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPnuKG0+/GnfNQAAu9opvQ
	(envelope-from <linux-media+bounces-60745-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:25:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4224E4057
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFEE43041A82
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 07:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AF03537F5;
	Thu,  7 May 2026 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWltQuSP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AC135E92B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 07:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778138647; cv=none; b=d8SOV8IWSr37fiPXBc2rtprzwecmk39dcTmHZLxsV6hELrTGOCRGxBH8yl4zqJWcaeZIwqwix75jfv67CbTC4stY4PT2ip3afhbUKTPUeIi49hgX+b8Jh7/lPLtHA5pjTs3fOKPuMlzUxwPKtTpPTNfHtuUapvCzqkCSbrCULS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778138647; c=relaxed/simple;
	bh=N83tmj+WNk8Y2zQWYkmVLAtvdnOOtR3nUlymV35VjZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8Ym65IUtTZCRLx8ZGYSTHss+38pu0VO3hXbJsSt5IS5P2zgHT3seKLTM34GGSeUv7+NQn1emz08zIAjQIYmFHMPVkdQi0/HEpRVyeHMqKF9O7sLb3rneIvchNsoS6Al9YBZFX4N1ub98o5wXiheIGDPEivDsVsQ7PPNN2Ei8z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWltQuSP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778138645; x=1809674645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N83tmj+WNk8Y2zQWYkmVLAtvdnOOtR3nUlymV35VjZY=;
  b=cWltQuSPUjH4KRtJDLjOLp41Ve1Ow8vn36fRJ3QKaQ5je4hDI3PPCUZU
   iV2b9G4/I2k394fQNMTERjuB7iBjdaCVTn5lL6m27AOl6EYOs/q3SMaR2
   wTyri5zcl/Aixvs+6EteMsdoEUZLKkhMWE0QByYUURRf0n5OjfZn4D6Ln
   fnyW6JNDASTViokXPUge7ZjdGnwOdzblnNrDhfeBHd0kIrkP2TjxwwVG7
   UNrucbM4s+PffKpUoB2A0R2dRQ9WeBS3LBbkWAjUbvHTLpqmQ8HX/DPLC
   Ax87bR+1SSXao+fZKhEXMCdJ40lqE7BNqQvbtNQyGAXGnZvLzXYFNszxO
   A==;
X-CSE-ConnectionGUID: x5cuyeqLTmyVvSIWOzXP1w==
X-CSE-MsgGUID: NY9tLbbWR5yi3maxiqmZiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78978165"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="78978165"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 00:24:04 -0700
X-CSE-ConnectionGUID: b6pg2QDAS4qzBNUas70AYQ==
X-CSE-MsgGUID: B+wJAk4kSBumtizIPgyTmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241384177"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.99])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 00:24:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3C68C11F8DF;
	Thu, 07 May 2026 10:24:00 +0300 (EEST)
Date: Thu, 7 May 2026 10:24:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Miguel Vadillo <miguel.vadillo@intel.com>, linux-media@vger.kernel.org,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
Subject: Re: [PATCH 1/2] media: i2c: cvs: Add driver of Intel Computer Vision
 Sensing Controller(CVS)
Message-ID: <afw-ENbyknoFCLoE@kekkonen.localdomain>
References: <20260505223005.84162-1-miguel.vadillo@intel.com>
 <20260505223005.84162-2-miguel.vadillo@intel.com>
 <177805672969.3225262.17973373065597618604@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177805672969.3225262.17973373065597618604@ping.linuxembedded.co.uk>
X-Rspamd-Queue-Id: 0C4224E4057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60745-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Kieran,

On Wed, May 06, 2026 at 09:38:49AM +0100, Kieran Bingham wrote:
> > +       case MEDIA_BUS_FMT_SBGGR14_1X14:
> > +       case MEDIA_BUS_FMT_SGBRG14_1X14:
> > +       case MEDIA_BUS_FMT_SGRBG14_1X14:
> > +       case MEDIA_BUS_FMT_SRGGB14_1X14:
> > +       case MEDIA_BUS_FMT_SBGGR16_1X16:
> > +       case MEDIA_BUS_FMT_SGBRG16_1X16:
> > +       case MEDIA_BUS_FMT_SGRBG16_1X16:
> > +       case MEDIA_BUS_FMT_SRGGB16_1X16:
> > +               break;
> 
> I've seen this on other pass through devices, and I wonder if really
> there's nothing to filter here - it could be anything. Or perhaps if we
> did need to ensure the driver only supported a specific bus type - that
> could be factored out.

I revall v4l2-compliance will complain if you don't limit to some set of
formats -- I think it tests for a single value which isn't a valid format.

I'd keep this list here for now but I think we should have such a list in
V4L2 core. Also the mux drivers could use it.

> > +/**
> > + * cvs_csi_get_mbus_config - Provide current CSI-2 bus configuration
> > + * @sd: Sub-device
> > + * @pad: Pad index
> > + * @cfg: Returned bus config
> > + *
> > + * Fills lane ordering and number of lanes; retrieves link frequency from
> > + * remote entity.
> > + *
> > + * Return: 0 on success or negative errno.
> > + */
> > +static int cvs_csi_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
> > +                                  struct v4l2_mbus_config *cfg)
> > +{
> > +       struct icvs *ctx = sd_to_csi(sd);
> > +       s64 freq;
> > +
> > +       cfg->type = V4L2_MBUS_CSI2_DPHY;
> > +       for (unsigned int i = 0; i < V4L2_MBUS_CSI2_MAX_DATA_LANES; i++)
> > +               cfg->bus.mipi_csi2.data_lanes[i] = i + 1;
> > +       cfg->bus.mipi_csi2.num_data_lanes = ctx->nr_of_lanes;
> > +
> > +       freq = v4l2_get_link_freq(ctx->remote, 0, 0);
> > +       if (freq < 0)
> > +               return -EINVAL;
> > +
> > +       ctx->link_freq = freq;
> > +       cfg->link_freq = freq;
> > +
> > +       return 0;
> > +}
> 
> So more of a question for linux-media community, I've seen this pattern
> a couple of times - should or could we consider a way to factor out a
> passthrough device which doesn't modify the stream(s) formats and is
> simply representing almost a connector type ?

The CVS in fact does have a CSI-2 receiver and a transmitter so I think it
should have its own sub-device. I understand some implementations also need
to have this configuration in order to operate and there's the privacy
control, too.

-- 
Regards,

Sakari Ailus

