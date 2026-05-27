Return-Path: <linux-media+bounces-62860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFFjM6S0FmokogcAu9opvQ
	(envelope-from <linux-media+bounces-62860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:08:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 326AF5E18AD
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B54DD300D16A
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 09:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A85C3E1208;
	Wed, 27 May 2026 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXmsFGhy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B1A39479E
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872513; cv=none; b=NnkfZ7aNKSNK2AEicXs9gj2TeW7z/8Xa5oGCW1t/MQPeTR+yTeQD34MQE5tIgdeqk7v871ELL0GPzIVS/SPh/ORVerVvmC+OMkOpXRauxdueoihDuzhKYoXrtBcHW6JydcL46Qp8L/Ed4xfQrxiaWuu8PxIlNUIKzeiduzArYuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872513; c=relaxed/simple;
	bh=QNcej0T5mLHT51hptzwJsYWMaSPM+275COLzzec1UeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikkLCVR5cNaxLHGSrBVU5QwdradW6t2FHnVcghHw8LLpnhtaua2EQn6uGka+371t2IhJrGWpFJIILZ2jGusrZkpCsRbK6LoNg4oQ9LFxlQqWhyk+xR/XdpzY1devBSRJK3c9TATPOI21ZUBWdFkExkHxRlduQrQT8AcGnG/PMeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXmsFGhy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779872511; x=1811408511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QNcej0T5mLHT51hptzwJsYWMaSPM+275COLzzec1UeE=;
  b=CXmsFGhyxI8pUgX3QDxXTh+TuM0tvtnPmbn3tRLfAqhy7L6lWMZgHtAs
   SfJrFXmzlX7CDQm0d4ieizg2n0nqzE7sxBJcFSH7qrXCHE/h2Dw9DMHK7
   GkR5ZAazJfUmqdiS/zDMn1jYN80UG3vFDNFXWaM3Z0+14Lv7hqiMvTLbF
   PR7NRXIHVVTFBQb5pqY0uX0EoHfVovt2mneqhF/y7kErWBQAXQ5FzP1U8
   1Xlwo692qbXU/QkRNZgliRS91DiDcdVu/tnimJMs4I+a+fgQr4Ssjl7aJ
   +FJjUF9kyCDxyjO1Un9DiLxAPJvGup72PygrwNgCBDW5/Fm2fAsZSTJZe
   A==;
X-CSE-ConnectionGUID: dv9wUtQQTt2ReDC/1BWC9g==
X-CSE-MsgGUID: wrDfrhUBQQS3JsPYgsm7Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91269420"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="91269420"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 02:01:50 -0700
X-CSE-ConnectionGUID: tjmXBLcrSBesG8OlPlhzWQ==
X-CSE-MsgGUID: GGB7snNwSCWLIDWHtmgjLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="266053337"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 02:01:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 06685120EBD;
	Wed, 27 May 2026 12:01:45 +0300 (EEST)
Date: Wed, 27 May 2026 12:01:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Vadillo, Miguel" <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, wei.a.xu@intel.com, atul.raut@intel.com,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com,
	kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 0/3] media: i2c: cvs: Add Intel CVS driver
Message-ID: <ahay-Ej_RrrGzIrX@kekkonen.localdomain>
References: <20260526022509.162908-1-miguel.vadillo@intel.com>
 <ahXB-Eg1O2-PlFvU@kekkonen.localdomain>
 <16f5874d-0d22-4c8a-9bad-63a9b383dcf1@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16f5874d-0d22-4c8a-9bad-63a9b383dcf1@intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62860-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,gitlab.freedesktop.org:url,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 326AF5E18AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

On Tue, May 26, 2026 at 09:29:30AM -0700, Vadillo, Miguel wrote:
> Hi Sakari,
> 
> Thanks for checking this.
> 
> On 5/26/26 8:53 AM, Sakari Ailus wrote:
> > Hi Miguel,
> > 
> > On Mon, May 25, 2026 at 07:25:05PM -0700, Miguel Vadillo wrote:
> > > Cover Letter
> > > ------------
> > > 
> > > This patch series introduces support for Intel Computer Vision Sensing
> > > (CVS) devices found on Intel Luna Lake (LNL), Panther Lake (PTL), and
> > > Arrow Lake (ARL) platforms.
> > 
> > Thanks for the update. I got from Media CI:
> > 
> > drivers/media/i2c/cvs/core.c:909:12: warning: ‘cvs_resume’ defined but not used [-Wunused-function]
> >    909 | static int cvs_resume(struct device *dev)
> >        |            ^~~~~~~~~~
> > drivers/media/i2c/cvs/core.c:892:12: warning: ‘cvs_suspend’ defined but not used [-Wunused-function]
> >    892 | static int cvs_suspend(struct device *dev)
> >        |            ^~~~~~~~~~~
> > 
> > I suppose this happens when CONFIG_PM isn't defined
> > <URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/100763316/artifacts/file/artifacts/no-PM.config>?
> 
> My bad, that seems to be the case with CONFIG_PM disabled:
> this fix will be needed, I will prepare this and send an update, waiting in
> case there are more comments..

I think cvs_pm_ops also needs __maybe_unused.

-- 
Regards,

Sakari Ailus

