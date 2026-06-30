Return-Path: <linux-media+bounces-66037-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5SsbBORqQ2qLYAoAu9opvQ
	(envelope-from <linux-media+bounces-66037-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:06:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F66E0F69
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:06:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=TewtscDh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66037-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66037-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DED530180B1
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 07:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C438C26E6F2;
	Tue, 30 Jun 2026 07:06:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A400A78F2F
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 07:05:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803162; cv=none; b=U303YWSW+Y7yobdKy8GId65uRANgPa1rWOcxi1jw0jPQwBIgXIfiX8fECIhdKbrLRDbZaop5PdoixrL+2cohaWbJM71pnuJrCT9jrFiz29E+NHq/oqMiounoUfkkZTNrBGp1DKSOBxkFV7LchYo4Sn6e3lO/qvzyU4iH7wKW/2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803162; c=relaxed/simple;
	bh=qOlg/yMWFhJK8piLhn8dL6uqfLyCtfIVq3/yo9yxglI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIHy2Dg6wV84hUjKSD9N9p6J+rFMN4DzkHuDnFh7OM0AUHV/anwyRUd9EfPc3pCL84BQCe2ONdHA1h9LDFtX2FyVq94s3Mdy8ivJFIdBneR/Df0hdnJl2OzLQC3A+ZhzaUFt/EJm6KpIgtWkTCkCRfNwt2sHIiTbEmC2I2aTHaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TewtscDh; arc=none smtp.client-ip=192.198.163.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782803160; x=1814339160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qOlg/yMWFhJK8piLhn8dL6uqfLyCtfIVq3/yo9yxglI=;
  b=TewtscDh5pccZ+/eSiGi0t0rmTNd1m0750qW4TMGR+WunrEU8z7EyfB9
   NLGtoQk567GHLJUv1fhvbruld+mtxp+M3W3BO8jrIMUy+cYovBLTovcrL
   p3Df0A+5+61KZtKD/pkeWXietY1vverFZwq5HT9dIsIICkhGm4qMmL7Mo
   ORZzM/R8tJmVmkMbB3pPh8aOENG2zlfuiDuPyyym7cYJhxCA4aaVZP1vm
   UAhcCR7tG7eMz7TokN6+oAkfBFYQg8x63bGS6QEyLfqlZGXFkxvIVB4a9
   ISGROgtlvzJPevswyXz00rAGEnSXpnVV3fvwcU9jMyOhKZKqWs9jVmRv3
   Q==;
X-CSE-ConnectionGUID: bDNpyH9vTIeluLJnPtDdqA==
X-CSE-MsgGUID: Rm233WDCQhmwwKhTinzyYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83566233"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83566233"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 00:05:59 -0700
X-CSE-ConnectionGUID: YyYra+u2TTqY/gwdar3GgQ==
X-CSE-MsgGUID: tYgq2uDIQUaFmo+cYjFRhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="248201900"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.116])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 00:05:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A79CB11FAA5;
	Tue, 30 Jun 2026 10:05:58 +0300 (EEST)
Date: Tue, 30 Jun 2026 10:05:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: Re: [PATCHv2 1/6] media: core: v4l2-async.c: unreg subdev if
 asc_list is empty
Message-ID: <akNq1n29VVey3iFw@kekkonen.localdomain>
References: <cover.1781615432.git.hverkuil+cisco@kernel.org>
 <efb6cfeb1053399ebd51b83fcc4daee632281558.1781615432.git.hverkuil+cisco@kernel.org>
 <ajFogY-MkxTmiSN6@kekkonen.localdomain>
 <390a4281-8f18-4090-bc04-c9dcedbff809@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <390a4281-8f18-4090-bc04-c9dcedbff809@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66037-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,async_list.next:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA7F66E0F69

Hi Hans,

On Mon, Jun 29, 2026 at 08:55:04AM +0200, Hans Verkuil wrote:
> On 16/06/2026 17:15, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, Jun 16, 2026 at 03:10:27PM +0200, Hans Verkuil wrote:
> >> In v4l2_device_unregister_subdev(), if sd->asc_list is empty,
> >> then v4l2_device_unregister_subdev() is never called, but that
> >> should still happen.
> >>
> >> This causes crashes with em28xx that uses tvp5150: that i2c
> >> module uses v4l2_async, but em28xx does not as it predates
> >> v4l2_async.
> >>
> >> So if sd->asc_list is empty, then just call
> >> v4l2_device_unregister_subdev().
> >>
> >> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> >> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >> ---
> >>  drivers/media/v4l2-core/v4l2-async.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> >> index 888a2e213b08..fd0404ce9247 100644
> >> --- a/drivers/media/v4l2-core/v4l2-async.c
> >> +++ b/drivers/media/v4l2-core/v4l2-async.c
> >> @@ -897,7 +897,9 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> >>  	kfree(sd->subdev_notifier);
> >>  	sd->subdev_notifier = NULL;
> >>  
> >> -	if (sd->asc_list.next) {
> >> +	if (list_empty(&sd->asc_list)) {
> > 
> > If v4l2_async_unregister_subdev() without calling
> > v4l2_async_register_subdev() first, sd->asc_list.next will be NULL. That
> > case needs to be handled here, too.
> 
> Ah, good point. I'll do that.
> 
> BTW, I think setting the next field of a list header to NULL is really
> fragile. I would prefer to see a bool to indicate that the asc_list should

The conclusion during the review was to rely on the list next pointer being
NULL instead of adding a specific field. There are other similar tests
being done, for async_list and waiting_list. I'd keep these as-is.

> not be used (and asc_list should be an empty list in that case).

Before the async sub-device is registered and thus initialised (to
other than zero), the list pointers will be NULL. The intent is to avoid
driver bugs by making v4l2_async_unregister_subdev() a nop in case the
async sub-device hasn't been registered.

> 
> async_list.next does the same.
> 
> Also, asc_list is a poor name, way too similar to async_list. I think
> async_conn_list would be much better.

"asc" is used throughout the code to refer to async sub-device
connections and asc_list is aligned with that. I'd also keep it as-is.

> 
> Anyway, that's unrelated to this patch.

-- 
Regards,

Sakari Ailus

