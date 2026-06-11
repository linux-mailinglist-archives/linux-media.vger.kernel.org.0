Return-Path: <linux-media+bounces-64536-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8kPLNN9XKmoInwMAu9opvQ
	(envelope-from <linux-media+bounces-64536-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:38:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1822566F147
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:38:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=IOP1Efo1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64536-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64536-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AC4D3028F60
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 06:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8375935F191;
	Thu, 11 Jun 2026 06:38:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7567A22A80D;
	Thu, 11 Jun 2026 06:38:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781159896; cv=none; b=LtmGLGeC0xqUOzWowvrog0Xgroh5pS8JsaCBAx69s5kxv3KNa67BUxyrSf6gtq2P1t5yQ07wx+sI+bL3Pn33RJ4BxhObfVjxyd+C1F/UgJUPbHOlLFMtKFuXPGHyfMrZ4iniXr4lf5LjOjEtYwQLRMltlj4M16UGL5dbrKE9xRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781159896; c=relaxed/simple;
	bh=k3XAFz/IStTJ0DH75E9TAovbheQQiYU+2mKiR3TafN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IK9ID2y7GTnOsdxQsm20hw6Icx86ibzHOSOKtT0Q/E8hALqbGWa7/vMsKuqzLpouirhlG0YfmXTKEr7bHMC7+JI9VW8n8u9UckCnjGnF1IoGMIJ/SK1YQzfcuTZI4v0hrb/maMVfGHVrbNzqm6eH3wasgQUt8rjm/UMi5LXLYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOP1Efo1; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781159894; x=1812695894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=k3XAFz/IStTJ0DH75E9TAovbheQQiYU+2mKiR3TafN0=;
  b=IOP1Efo1Dk8crWjiYPHCTW5e6OF+gWlfmVP7Vvg+4efIH6gzB/k0X06W
   9NPGHDlL5/4GXS/oqMlmAd3AL9VUHUxPcUyeVJvlml79MyPQZ3d7XqEHF
   i1fta08pzp09tqkxTrZpDO/TDhCnEaXsWiN1mEb+QatOsZ+KBkr2T8CG6
   r6kDEIQaDPpoIMBK92clbpNamEf+P4MimyC10kBSTKgeqv/V6rYbHmkWn
   9doDi3gurw9F7Le639HZJomeYiq0Y1qWHxYJYhv5xAUpYOtItzfKcqpTg
   QGOf/V+U8syMv8jPhy7pOI/vzfgGZXyI0U8stBQcxacdh0+fKMUsO5KNt
   g==;
X-CSE-ConnectionGUID: bB4wkTMNT8+A3Ci0PJVjdQ==
X-CSE-MsgGUID: Ry34irdtSj6Zr+5FA+WnUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85807176"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="85807176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 23:38:13 -0700
X-CSE-ConnectionGUID: gwE1DvyaR8eEoLZ/6A83OA==
X-CSE-MsgGUID: pzavm+jjQGui+db0dFXO1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="284478092"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 23:38:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D759811FC8C;
	Thu, 11 Jun 2026 09:38:07 +0300 (EEST)
Date: Thu, 11 Jun 2026 09:38:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>,
	Damjan Georgievski <gdamjan@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <aipXzweeqf5cOD7h@kekkonen.localdomain>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-4-hpa@redhat.com>
 <PN3P287MB1829693B81531B6333461AAE8B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <ainh3vUs_FWj4bLR@kekkonen.localdomain>
 <PN3P287MB182990C9DDF3BFF5CB356EFF8B1B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB182990C9DDF3BFF5CB356EFF8B1B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64536-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:hpa@redhat.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,oss.qualcomm.com,intel.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,linux.intel.com:from_mime,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1822566F147

Hi Tarang,

On Thu, Jun 11, 2026 at 05:35:29AM +0000, Tarang Raval wrote:
> Hi Sakari,
> 
> > On Wed, Jun 10, 2026 at 07:11:39AM +0000, Tarang Raval wrote:
> > > > +       /* V4L2 controls values will be applied only when power is already up */
> > > > +       if (!pm_runtime_get_if_in_use(sensor->dev))
> > >
> > > Use pm_runtime_get_if_active() or update the comment. With pm_runtime_get_if_in_use(),
> > > the comment should say "applied only when the device is in use".
> >
> > Using pm_runtime_get_if_active() would allow more sparing I²C writes, which
> > I understand the driver always does in enable_streams(). It's not a bug
> > though.
> 
> Yes, you are right. My concern is only about the comment, as it does not accurately 
> describe the behavior when using pm_runtime_get_if_in_use(). That's why I said either
> approach is fine, but if pm_runtime_get_if_in_use() is used, the comment should be 
> updated accordingly.

I'd just drop the comment.

Please also don't use more than ~ 75 characters per line in e-mails.

-- 
Regards,

Sakari Ailus

