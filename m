Return-Path: <linux-media+bounces-26019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEEDA31319
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 18:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CED857A3CAB
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 17:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC30261577;
	Tue, 11 Feb 2025 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwtlwCFa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F9C26156C;
	Tue, 11 Feb 2025 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294940; cv=none; b=RzsidNFsjDfITC5mnBg9bEzfkrVzWbwKW7MHo+6DtKiuOPoBx5Z3TpFfgQu72HckRUQmtDbm+nF/2uoikgVCd9waIOeWRNt4cU2UATHqPTXaYek5URqW/GBElSSooKC3pPiPL9djqM7ZhWfvcoMpzBHeEIv58fxSNgLA9XbstMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294940; c=relaxed/simple;
	bh=yqTd5VxPM2HALcKrWqePO/E2bPmibZM6ZDbK9f/qdQc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CGwhr8U4iANfrgpjdcd0YpgkI3oXSkJ0CHOfQiFYloqsCMTR57+dLiZxWClY6jj1zqc3HBWI9gTD6Ubg+m16C2XlZSmHjyi4bLhk9EOZiXgOfpzLS1qIHr0NQNXDytZ6OeTtcMm56wwG4yIQrroahwXilK6pauyab8Vqlk6zPYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwtlwCFa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739294938; x=1770830938;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yqTd5VxPM2HALcKrWqePO/E2bPmibZM6ZDbK9f/qdQc=;
  b=DwtlwCFaXus/Okc0xf0LVwFqcUNVsSsbjiDayzxFKUI2xo/JwVe8Ehuo
   6VYrzjliXZHy5kK9NP4iJ+rnkVqZedSdkntX9qeVCuTe3YdOfQpLcN1+t
   qswew9EThw72j4Vxrw7qrW3sePIY4okUk8QfseoHwoRLgixpEy6EQVnoR
   HlQSLMGAWKflfMgb9HvOthME0bX1QE5cBrk4dNszQEBqUogoCj94yxZBz
   oDYgqkErKviFNZOOJ4R+vSsHelQaGoHezmaR4EsdvFAaNGon7M/wYXuS0
   wDzo6LFMvN4An/jBjWzf8DfqShSIVBdcJVgYeKhf/jEXbH3DJ0XQaraYw
   g==;
X-CSE-ConnectionGUID: rGDpJV8pQymNKzI5g2WqJw==
X-CSE-MsgGUID: sKg5wRGVQ6KV4jpwNcfnJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27527306"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="27527306"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 09:28:58 -0800
X-CSE-ConnectionGUID: mdu/PIm+THiW+FRCIQCgMQ==
X-CSE-MsgGUID: uqkq9O78RnW3Yg7KPTWRTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112431618"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.14])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 09:28:55 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 11 Feb 2025 19:28:51 +0200 (EET)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Daniel Scally <djrscally@gmail.com>, platform-driver-x86@vger.kernel.org, 
    laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl, 
    linux-media@vger.kernel.org
Subject: Re: [PATCH v7 0/3] int3472: Support GPIO con_id based on _HID
In-Reply-To: <Z6uFGYcUXbbRMERY@kekkonen.localdomain>
Message-ID: <6c05f3ad-fc2e-19d1-d583-8026afc1363f@linux.intel.com>
References: <20250211072841.7713-1-sakari.ailus@linux.intel.com> <Z6shGGy2FPVc5mEK@smile.fi.intel.com> <64b617e1-bf52-442e-be56-71c76d973edd@redhat.com> <1938d858-6d66-69f8-5952-9cecf133f254@linux.intel.com> <Z6uFGYcUXbbRMERY@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1284692048-1739294931=:4237"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1284692048-1739294931=:4237
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Feb 2025, Sakari Ailus wrote:
> On Tue, Feb 11, 2025 at 04:32:12PM +0200, Ilpo J=E4rvinen wrote:
> > On Tue, 11 Feb 2025, Hans de Goede wrote:
> > > On 11-Feb-25 11:06 AM, Andy Shevchenko wrote:
> > > > On Tue, Feb 11, 2025 at 09:28:38AM +0200, Sakari Ailus wrote:
> > > >> One patch turned into a set, the second patch being the original o=
ne.
> > > >>
> > > >> since v6:
> > > >>
> > > >> - Reword the comment regarding GPIO map processing.
> > > >=20
> > > > Hans, Ilpo, I think this is in good enough shape
> > > > (the order of the checks I'm still not happy about
> > > >  we can amend later on if required). Can it be taken?
> > >=20
> > > Yes this looks good to me. Ilpo can you merge these 3 as fixes
> > > for the 6.14 cycle ?
> >=20
> > Currently, these don't appear in lore for some reason (not in=20
> > patchwork)...
> >=20
> > Sakari, could you please resend the series v7 so that it hopefully gets=
=20
> > picked up by lore and is easier for me to apply them using the normal=
=20
> > tools I've.
>=20
> Lore is up again, getting the patches from there should therefore work (I
> tried it).
>=20
> >=20
> > The last patch IMO falls outside of even borderline for fixes. I think=
=20
> > I'll put it into for-next after merging the two first ones from fixes=
=20
> > branch into for-next.
>=20
> Sounds reasonable.

Patches 1 & 2 are now in the review-ilpo-fixes branch.

--=20
 i.

--8323328-1284692048-1739294931=:4237--

