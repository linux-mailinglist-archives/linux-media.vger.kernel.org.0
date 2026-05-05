Return-Path: <linux-media+bounces-60477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHIOD9hF+mmOLwMAu9opvQ
	(envelope-from <linux-media+bounces-60477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 21:32:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D44D321E
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 21:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FFE53020C39
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 19:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2BC3DA5DE;
	Tue,  5 May 2026 19:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIwT/NOc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87B135A938
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 19:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009554; cv=none; b=fG+IjQ7JybmxjIfV/3oZxW7XW/MZLuxrMSvZvi09C2LyqDimYJdSTdH2BE4OMLuLqtsRtOi46VUEbBrs/GzpvEuGhwJadIUDZ7pBWNUDAAXHiTU82Pu+b93qpAdxRNu3u8TX2bEUwMF1GQ5JCVe28LaMjsTLiSvu+5BDoeZl8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009554; c=relaxed/simple;
	bh=CEPlUu+7x/hM2Zk9RMhA9sgHO/U4XWS5WqcLf61m/xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlYGtjKqyyhCSEvprJR3F4DcfHIpZMvvh50G9+WLvSJrd97MydA+6xfGzEZt35BVjssB1NGau1SLN46rZxyc7WGdFmsPPw3EZHWc9XMMHin2vWiPmvoa9cwV/Lcwf5xVnJAFYzxddxvB+spHWC2T+bhcPYVS2EveqYccM6eDJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIwT/NOc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778009553; x=1809545553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CEPlUu+7x/hM2Zk9RMhA9sgHO/U4XWS5WqcLf61m/xg=;
  b=aIwT/NOcmIXse7Qhvtqt7v3ZB7uitLrFWDHsWquMVPtDeg09GqD0fYO7
   EEcgD3wEhGU++h0SVg42R//GQie31X/nh7+sBtqVQTVF6L1WraTg3jSFe
   m+vZF7ecPwXWdeYtdeSwQ33oFutEua/5EW3GXB58V7OsKFZ18HUAMY/PA
   /RB13VyS35L4lxuRo6hzlm62Rik6gT4GlF6djGnZTTDCncglzGjA8uNTO
   FTL3PqOnjywS0w7pinbFzvCK2hFN+0eFQXBKhOK8N4o7YlG7hEMSLVeio
   2qf4OEVqGnt2A1SUNNCKamfVIKOHRk4fUwvoVhhwhKW8BdY3peHIHDUJO
   Q==;
X-CSE-ConnectionGUID: BG/mDt12SWqD7iipzpS55Q==
X-CSE-MsgGUID: i8M4JUUOQBikqwZtSYnmLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96460207"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="96460207"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 12:32:32 -0700
X-CSE-ConnectionGUID: 77hJEF7SQWGz/k3zSugq9w==
X-CSE-MsgGUID: ELgwtNplT5ypqoV+accH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="229417832"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.139])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 12:32:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7675A120B10;
	Tue, 05 May 2026 22:32:31 +0300 (EEST)
Date: Tue, 5 May 2026 22:32:31 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: Documentation: Use right function to test
 device power state
Message-ID: <afpFz3oVebanwBao@kekkonen.localdomain>
References: <20260326104611.1586131-1-sakari.ailus@linux.intel.com>
 <20260505130258.GA1601351@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505130258.GA1601351@killaraus.ideasonboard.com>
X-Rspamd-Queue-Id: 9C9D44D321E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-60477-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,kekkonen.localdomain:mid]

Hi Laurent,

On Tue, May 05, 2026 at 04:02:58PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Mar 26, 2026 at 12:46:11PM +0200, Sakari Ailus wrote:
> > Tell driver authors to use pm_runtime_get_if_active() instead of
> > pm_runtime_get_if_in_use() to check the device's power state in the s_ctrl
> > callback. pm_runtime_get_if_active() is the right function to use here
> > since it returns non-zero if the device is powered on rather than its
> > PM runtime usage_count is non-zero.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/camera-sensor.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index 94bd1dae82d5..c8552f70f496 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -114,7 +114,7 @@ of the device. This is because the power state of the device is only changed
> >  after the power state transition has taken place. The ``s_ctrl`` callback can be
> >  used to obtain device's power state after the power state transition:
> >  
> > -.. c:function:: int pm_runtime_get_if_in_use(struct device *dev);
> > +.. c:function:: int pm_runtime_get_if_active(struct device *dev);
> 
> This looks fine, but I think we should also mass-convert drivers. There
> are more drivers using pm_runtime_get_if_in_use() than
> pm_runtime_get_if_active(), so we'll keep seeing new code using the
> former due to cargo cult.
> 
> For this patch,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thank you.

> 
> Should I submit a series to mass-convert drivers, or will you do it ?

I was planning to, yes.

It seems what happened was that the APIs and the usage of the APIs in
sensor drivers changed but we forgot to update the documentation. Oh well.

I'm a bit surprised there have been no complaints but I guess in practice
you'd need quite a bit of bad luck to hit this. Relatively few drivers use
autosuspend, too.

-- 
Regards,

Sakari Ailus

