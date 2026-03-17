Return-Path: <linux-media+bounces-56000-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB1ZH20QuWkaoQEAu9opvQ
	(envelope-from <linux-media+bounces-56000-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:27:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F222A5A2A
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A07433021447
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 08:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C83637FF5B;
	Tue, 17 Mar 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6B/WsSv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3370B37F8A3;
	Tue, 17 Mar 2026 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735700; cv=none; b=aSP+pllCrKhy/ixuk/EO2T0bFsRYRyze2mUSjRS0XEUj1k2z7kByPo1oPoBjozeimRqpflztIprws8yTvespMpL5jvsXsV/LPWBCWqRe05uwYLE1lgl5vBe43H6+bt95TSKtwFkGtoFV+VbOXrdzGlHckgFbotW5UXbojQy+xjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735700; c=relaxed/simple;
	bh=7eiObjII+jEYSs+jjkXSUlVJoZd9VTS/OObKnSIL8Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrMGlWNGHUiB6odjNu1haXlSgDyR3rnpk8EdC4xGyHF7iAr6i9fj7bAWEWxcfIGWIgSjhpvWGH3ECdHEEpaVpzSIInl6yIJJMMEqgLSptxfMJvALxoHHdzfj78zCJKMR0iluLVJgAv5qHjRUfoQ50ftVSDPgxHvPK6v2zAQZZ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6B/WsSv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773735700; x=1805271700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7eiObjII+jEYSs+jjkXSUlVJoZd9VTS/OObKnSIL8Qc=;
  b=G6B/WsSvj0vLCMsRrXxKqNvT/2bNKVT2dI4yDu3cNRVfQ2/OkkJ5rMcN
   mSj84Du+Eu5oKesFvaIrkjnnD8pxq+czLYheOY2phpxq/FXUhxb82BtEZ
   jrH56hk9kAXj6C1HH8qBkRIe8M0GhCdfeQwEUVF6HBhLAKPgxcgfjtUCi
   39bIjTbEmPX8sgtrcRlJwQknmaZlnuKBTpglspE9+DVVQZFnktpBdg/l1
   QT8f9KBus930bfQ8oCLOzgSR5Fev3ls9PZHStT7tuimtmhWjXCVJzpQ4g
   lnAfDrhh5eMOS8y3LibzdRGXg+ADeSjObdbv+eiD6XDvFKiL/9LhaG8c2
   A==;
X-CSE-ConnectionGUID: EkTSF0RkRCCDubKTthTxDA==
X-CSE-MsgGUID: OrhACr3KSxqpWKdU+3XjZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74944402"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74944402"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:21:35 -0700
X-CSE-ConnectionGUID: NFy8CPvsRyejQzFDbQXXgQ==
X-CSE-MsgGUID: LyfsetxsRVKOkftwypqx3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="227163763"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:21:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4FB86121D04;
	Tue, 17 Mar 2026 10:21:31 +0200 (EET)
Date: Tue, 17 Mar 2026 10:21:31 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "luo.liu.linux" <luo.liu.linux@163.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: Re: [PATCH] media:v4l2-async:debugfs for registered
 subdevices
Message-ID: <abkPC3sHVUdGuww1@kekkonen.localdomain>
References: <20260313075824.2818713-1-luo.liu.linux@163.com>
 <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
 <5e63e8aa.943f.19ce6ee4ad5.Coremail.luo.liu.linux@163.com>
 <abP4Mr_s8JRpQH0B@kekkonen.localdomain>
 <384d2274.9b3e.19ce776ec2c.Coremail.luo.liu.linux@163.com>
 <abg0R5zerwCM_1mK@kekkonen.localdomain>
 <186862ed.3836.19cf9df139c.Coremail.luo.liu.linux@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <186862ed.3836.19cf9df139c.Coremail.luo.liu.linux@163.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56000-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88F222A5A2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luo,

On Tue, Mar 17, 2026 at 11:37:52AM +0800, luo.liu.linux wrote:
> 
> 
> Hi Sakari,
> 
> 	You are absolutely right. For an experienced kernel developer like
>  yourself, tools like KASAN and CONFIG_DEBUG_LIST are second nature and
>  incredibly effective for pinpointing such issues. I truly admire your
>  expertise in leveraging these advanced debugging mechanisms.
> 
> 	However, I think it is important to consider the reality for many
> junior driver developers (myself included). We often lack the deep
> intuition and extensive experience required to wield these powerful tools
> effectively in every scenario. More often than not, we still rely on
> primitive methods: struggling to reproduce intermittent crashes,
> scattering printk logs everywhere, and manually tracing execution paths.
> This process is extremely time-consuming and often yields no clear
> conclusions for "silent" resource leaks.
> 
> 	While I am actively working to improve my skills and learn to use
> these advanced tools more proficiently. I remain convinced that providing
> such a simple, intuitive interface offers a necessary supplement by
> serving as a low-barrier entry point for developers.
> 
> 	I hope this perspective clarifies why I believe this small change
> can bring a bit of convenience to a broader range of driver developers.

Just enable KASAN and list debugging in the future. New interfaces like
this won't improve things at large.

-- 
Kind regards,

Sakari Ailus

