Return-Path: <linux-media+bounces-42166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE0CB51229
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43823166562
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B703126A6;
	Wed, 10 Sep 2025 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Srk1nfSE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9F93112D6;
	Wed, 10 Sep 2025 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757495379; cv=none; b=O94+ybQARROSCVttwCdqZp0W5W/6IwALFOCrOTU3TJwTe2PbAKi7HXyp3Bs2zGYP5ddVxaXg/yzEi7CjO/LZskbeTOmIUXkXjI5wOMOakpxWP5qZFDuZ3Svf/lg5feUHBby3cbb+PX6QqCoWwTFgesgEgoqfU4dCwUrntTNZcPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757495379; c=relaxed/simple;
	bh=vzHBUoEGBOvofKP8vbq3Vmp2N5vrx4eWL5JDuvkjsZo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=D4LXnq9nnHK0UhvONuXgy0pz49k5wUH7Bwic5aYgSnJL+36scKW4rMs0m6lAGIP/GEqPRdrIAe2u4TgtPEn3T6CwAao1hSNfLrO9rRn8YdbkxuskkKayS9p+RszC9J4HDCWwpjhx3RBNJV/OXJxWAMRgP1NeASDtgwXZjCHMayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Srk1nfSE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757495378; x=1789031378;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=vzHBUoEGBOvofKP8vbq3Vmp2N5vrx4eWL5JDuvkjsZo=;
  b=Srk1nfSEQBZR1u/ktoWqJxHjW/tDukCOu9BMGlq1Wbfv1tj++rvpijd1
   q2WzCfn2b5+sKTUu9hBcWGbG07dsqdxIHCdwbkL6QCLa47smT5JTXEmcj
   2nw6DA13SmDuztq32pLTW4RJCZH7RVCVV6qroqmGWs0Ue/ZI77Yf/wd1X
   6ABqCa9JKcwApHpuXedoebY2K3Aj3aZkayjAYBjr7QlP+oocJtoV1H+hd
   UOK0nH6xDNGwzHnVjO3XYD/JRgd5oso2OXKpzOkoOgoqhE2+w4+iXSdNQ
   QwoNSWBlu8CaMlz/LkjZ57Cr1bz+dz3PA6RCDmudALCekAfVl4Ub2uFVE
   w==;
X-CSE-ConnectionGUID: zLjh1S5TTe27OZPuvwefVw==
X-CSE-MsgGUID: H1orJlqfSdCWm+Hun55E6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63428718"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="63428718"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 02:09:38 -0700
X-CSE-ConnectionGUID: OSEEgtn+SkGHlX2hxgoFWw==
X-CSE-MsgGUID: xoNWjnI4QYydX0OEaza6rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="177663643"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 02:09:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Sep 2025 12:09:30 +0300 (EEST)
To: Hans de Goede <hansg@kernel.org>
cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
    Andy Shevchenko <andy@kernel.org>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, 
    Aleksandrs Vinarskis <alex@vinarskis.com>, 
    platform-driver-x86@vger.kernel.org, 
    Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] v4l2-subdev/int3472: Use "privacy" as con_id for
 the LED lookup
In-Reply-To: <e3edf119-2dfe-4857-842d-fb2a52470eb9@kernel.org>
Message-ID: <0706ca2e-cee8-8f3c-b652-ac0cf0f087f8@linux.intel.com>
References: <20250909144823.27540-1-hansg@kernel.org> <CAHp75VeMMKCTDNWhdZJH2F=cmUObbpoYcDUch2jpsLBBNs_EhQ@mail.gmail.com> <e3edf119-2dfe-4857-842d-fb2a52470eb9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-904436684-1757494513=:937"
Content-ID: <72606396-7cf1-9d82-bccb-50a45a8c5bac@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-904436684-1757494513=:937
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <38679c28-ef95-e083-61a6-3304ffe1b171@linux.intel.com>

On Tue, 9 Sep 2025, Hans de Goede wrote:
> On 9-Sep-25 7:27 PM, Andy Shevchenko wrote:
> > On Tue, Sep 9, 2025 at 5:48=E2=80=AFPM Hans de Goede <hansg@kernel.org>=
 wrote:
> >>
> >> During DT-binding review for extending the V4L2 camera sensor privacy =
LED
> >> support to systems using devicetree, it has come up that having a "-le=
d"
> >> suffix for the LED name / con_id is undesirable since it already is cl=
ear
> >> that it is a LED:
> >>
> >> https://lore.kernel.org/linux-media/0e030e7d-0a1a-4a00-ba18-ed26107d07=
fa@oss.qualcomm.com/
> >>
> >> There was discussion about making an exception for "privacy-led" since
> >> that is already used on x86/ACPI platforms, but I'm afraid that will s=
et
> >> a bad example which ends up being copy and pasted, so lets just drop
> >> the "-led" prefix from the x86/ACPI side, which we can do since there
> >> this is only an in-kernel "API".
> >=20
> > Since it's an in-kernel API, why can't these two be simply squashed?
>=20
> Good question, this is only a runtime thing when running on actual
> hw with a privacy LED. So having this separately will not break
> the build in the middle.
>=20
> As such it seems better to have this as 2 patches since it involves
> 2 different subsystems.

But it's still only a single logical change, and not something with=20
monsterous complexity which would warrant splitting it at the subsystem=20
boundary.

Or do you immediately know about something that would conflict with either=
=20
of these changes which would warrant splitting it per subsystem to avoid=20
merge challenges? If not, I agree with Andy this should just be squashed=20
into a single patch.

Another question, is the "privacy_led" suffix added into pled.name still
acceptable despite the "led" suffix?

--=20
 i.
--8323328-904436684-1757494513=:937--

