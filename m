Return-Path: <linux-media+bounces-59295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IQ6NxeF6GkNLQIAu9opvQ
	(envelope-from <linux-media+bounces-59295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:21:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40280443612
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6B4F3096F9F
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A9A3AE183;
	Wed, 22 Apr 2026 08:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRN1CEeN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EDD1EA65;
	Wed, 22 Apr 2026 08:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845771; cv=none; b=XOXlus6F/Ts7/ODyJyke0cf0trtgLTmXi7eFDZDD+5mp2cJ9XbJKX3Id3YTX/cKesZL/fQjhuVhuhsU+CuxSrD+qRi9Q5Ksv+Y5r1g/oP1PPITzH+ujrUxn6Dvb1Re+ebF30qqVfKRrgDiJU7hG2bwvF+T44mEpZpTpFfY7GJ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845771; c=relaxed/simple;
	bh=S3RJimmHuTYRQQQMvkSvYrxOF0apqhX4CR6cgtltNXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSbH1/Jys5IsZ2muoljO+nh6Makl/y1fMWmdCnFRjn17Qb5W5aAJLxPCs8PNh+PTsq4KFSBxKI6IublO1Jo1TKMmsGBwtLQVARFC52IALVIVdszjlu4gK++Rj5b2+YDqXf8Mf4wzsI23saFzbhb7coXSTMa0bEs3W6kj5JCCHyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRN1CEeN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776845768; x=1808381768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=S3RJimmHuTYRQQQMvkSvYrxOF0apqhX4CR6cgtltNXg=;
  b=SRN1CEeNIyU2rMi+ftEMm1alfrVEu+ZWBtvS32p0rZvWG1MjhFHw8vn6
   XSYUqIMOd0ASHZmrmV/ZsbvkyXNDO8IgbjJS1ooIq52Ytdio1qGif5iDs
   FlQlEg63bsNa4DVUk9N+1O1hzImczovOt+NK+dt6r8tOU33D2XF5xXlUU
   hy67ktAsFPb/UIk+kZ7nqo8jYBChY38SQb4RvDwuIO1K2cx9oPgVGQaid
   Ox9cAxoAIO603ky7LHG6ZQOkGhQoQBzpOZAe7jClGpBeHdPDkDry9mtmC
   wZv37ENe1qiloLlxm2WrgiNyyAxV1eY0t3+onSOquZMu5vny1v1lzjUKW
   Q==;
X-CSE-ConnectionGUID: pVj6uGxHRxCHlQEvoYQ+ig==
X-CSE-MsgGUID: /V3qNYhxQtijORxqaAgP8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77808185"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77808185"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:16:07 -0700
X-CSE-ConnectionGUID: 70nQnxXfT3++K+WtPvPXfw==
X-CSE-MsgGUID: vezEoLJLRKKtaMBPtJu5Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="229122702"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:16:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8F28C120D05;
	Wed, 22 Apr 2026 11:16:03 +0300 (EEST)
Date: Wed, 22 Apr 2026 11:16:03 +0300
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
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
Message-ID: <aeiDw0dhA4OPLo5s@kekkonen.localdomain>
References: <20260419093412.40796-1-clamor95@gmail.com>
 <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain>
 <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
 <aefXJebe2F4Z193F@kekkonen.localdomain>
 <CAPVz0n111oHa2UdJ9LO8PTYcRuAmUem6tQdPKABRq1YHH8ZDgw@mail.gmail.com>
 <aeiAq_eep_fqwewN@kekkonen.localdomain>
 <CAPVz0n13wS1TnF_z-muwtnP0BK6FKiu4-6h5k6s6hm3p4i=0_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n13wS1TnF_z-muwtnP0BK6FKiu4-6h5k6s6hm3p4i=0_w@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59295-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40280443612
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 11:13:25AM +0300, Svyatoslav Ryhel wrote:
> ср, 22 квіт. 2026 р. о 11:02 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> >
> > Hi Svyatoslav,
> >
> > On Wed, Apr 22, 2026 at 09:29:51AM +0300, Svyatoslav Ryhel wrote:
> > > Noted. Any changes required into the other patches of the patchset?
> >
> > Please see my reply to the bindings.
> >
> 
> I am closely monitoring all your replies, and I will apply everything
> we have agreed on. I assume other patches from this patchset which you
> did not leave comments need no adjustments?

Correct.

-- 
Sakari Ailus

