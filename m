Return-Path: <linux-media+bounces-56137-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sXXbFirXuWkbOgIAu9opvQ
	(envelope-from <linux-media+bounces-56137-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 23:35:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC732B31FD
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 23:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 918573069663
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 22:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1C33E556F;
	Tue, 17 Mar 2026 22:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+N5jFWR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8233F378;
	Tue, 17 Mar 2026 22:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786911; cv=none; b=Jf79r15nd4TqCqO8DI8giOGLu0bmWJtshQNVbQWhoIeO8jQ9GysI2/DG4KM6oUiSrC3ydWmx/KYAyoteehRa6ZCrRIlZY4t8O5ZiW8LoTYAkACTLZs+1Hh4UDqvepUMW/53ClGSGmguLOpoBdUfLSbtSRiKZxO0/iVUNyGEbuho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786911; c=relaxed/simple;
	bh=m1cahY3Ooo/SxzO5vRCUJQl8Jc9eJMwqFX5KG5mGS6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWXoYMCkNNOD0ZAYRo23ZVRcJhMPCQg9HPJSTcMq+9zud0QKSb5/GxaEyTtXcY2BgchO4qYQ7o2AIYrCBhvQOtSYlRBJ6hp7IUXzBM7IIcjaH2HM5LzNzDNOD0RQETH6vzze5EWpf3CgbakUXTn2dbb4dBh04EGmRVSxWRLomno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+N5jFWR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773786910; x=1805322910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m1cahY3Ooo/SxzO5vRCUJQl8Jc9eJMwqFX5KG5mGS6Q=;
  b=k+N5jFWRwpdivBAa1R6TWvaTexjywY+ISzmWwJnapdqqJpXa3Cu/pUg/
   rw/8/WFSv6nVV+32a8c+DbhZvzZQHTYz7EpTtSAmFvPWYGiZXLDVBQJZt
   qila4SnaIH+l3pofjrJDsp3Om/8vwX7Q5+AzUYk1Bp5ksM+nJJf/xjFM+
   mIIpiS1o/XbgX+nBgYeAf29qt5L6JXkd5+sDpmt7PLrWr6BaSgChB/AzQ
   GLag+yiJs/cW5lf2RHSHDfclqk/xYV+8TCE3ThbYGBG50/klZIDzYdw5H
   Lz/rJBxAzQOBTuwRHT2K3oIs3UomTt8Dlqmfitx5gjmf9LkTXM86zxS79
   Q==;
X-CSE-ConnectionGUID: rSJVdJ33QCq1339jdW4gzQ==
X-CSE-MsgGUID: 8A8KUMRJS/O5O1i2Sp+Q9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74954835"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74954835"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:35:09 -0700
X-CSE-ConnectionGUID: ZHDsFIJqRk+z8pFD4ioR7g==
X-CSE-MsgGUID: nIbrT9OESs+pBQZOjZmZLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="221640021"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.193])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:35:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F0B2D121D18;
	Wed, 18 Mar 2026 00:35:04 +0200 (EET)
Date: Wed, 18 Mar 2026 00:35:04 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v11] media: Add t4ka3 camera sensor driver
Message-ID: <abnXGIi_eYZtJhy-@kekkonen.localdomain>
References: <20260316085704.352669-1-hpa@redhat.com>
 <abh9evUPzozh40k-@kekkonen.localdomain>
 <a3f89715-b937-4858-9a44-8d8d634cf97a@oss.qualcomm.com>
 <abmWUIIxCq1xcZ5m@kekkonen.localdomain>
 <590df779-96a2-4dc2-97b0-0f8753bd7eda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <590df779-96a2-4dc2-97b0-0f8753bd7eda@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56137-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: AFC732B31FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On Tue, Mar 17, 2026 at 08:56:47PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 17-Mar-26 18:58, Sakari Ailus wrote:
> 
> ...
> 
> >>>> +
> >>>> +	/* Only apply changes to the controls if the device is powered up */
> >>>> +	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
> >>>> +		t4ka3_set_bayer_order(sensor, fmt);
> >>>
> >>> Does this call belong here?
> >>
> >> Yes, if the hflip/vflip controls change then fmt->code needs to be
> >> updated to the now changed bayer-order. t4ka3_set_bayer_order()
> >> uses the cached ctrl->val values so it is cheap enough to
> >> always do this instead of checking if the changed ctrl is
> >> vflip or hflip.
> >>
> >> In case the sensor is actually streaming and we don't hit this path,
> >> the t4ka3_t_vflip()helper will return -EBUSY since changing
> >> the active fmt while streaming is not a good idea.
> > 
> > This should also apply to non-active state (albeit implementation requires
> > implementing get_fmt locally). This will get "fixed" with the metadata
> > series eventually with generic raw formats.
> 
> Ok, so what you are saying is that given the special need to
> set fmt->code based on the flip ctrl values, this driver should
> not use v4l2_subdev_get_fmt directly, but instead it should
> provide its own subdev_get_fmt() which wraps v4l2_subdev_get_fmt()
> overriding fmt->code based on the flip settings before returning it ?
> 
> Do I have that right ?

I'd like to say "no", but yes, that's right. :-)

-- 
Sakari Ailus

