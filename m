Return-Path: <linux-media+bounces-42181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0304B5146C
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BE16541E10
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B5E2D5951;
	Wed, 10 Sep 2025 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXwQ0ElG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14FA311955;
	Wed, 10 Sep 2025 10:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501373; cv=none; b=l8+ayDHM3MUDnHr607ngX5ixFLLLFZaR9ViN2YvLYmptsq8BAYXReExCgjBWloFh7fHM1F8VPeskbrUApUrXTQdwcsuHMnMwR8RPDz+zLtsNV3nlB6+q7Psq7r6H1T1XP8CiojMLONFCOBt4EcRQyfYdI9WwIwbSlQcKvU+9fJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501373; c=relaxed/simple;
	bh=/2LYwDOI18N+ZMjRLoDchnmyG84ziDEmKMYQ60MhsY4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HtW2A9PGieQQmB5AlK0kyfsBjB3v5kLe7RUaLmkqkBqT+m8gZtW/GADPKC37M00YcrkHVpAZ2lvM7XNw2Ljphux/xdq54ZnEQWEtaoyQ9KU8hQzmesQKa3oQn5S/zxvP+gCMMT2JCnct8Is5u4n6mUPj2DNS21bVn+gN8w53Dmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXwQ0ElG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757501372; x=1789037372;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/2LYwDOI18N+ZMjRLoDchnmyG84ziDEmKMYQ60MhsY4=;
  b=WXwQ0ElGd7zRbb8tsxrX/uxukZSGDyl75aqjlPJ/gSP6Lat4NWdR07sY
   tJnfy6tqsBrRs94u2nXqSqeYINGfQl68csEgRMO8J708ZAEnmfkhFU+bh
   prFX/veUMn2hwaEe7SmCIdYUxLAihS3xjbi2vTuN+WeL1HvGs8qJVK5Di
   4aWiSuwmpcOWPX0VqI/D3RQXrSYqffkVTXGWn+yToA5UqNE8qEVLNace7
   roxJ2kM1CPI62rirulk0YaeJ61j0RDqGL3DYP3tVowzg8IMlb3WxgnnkR
   DNRMRBZCmXIAM7YW6bvgj4NsDFZinmU6JiFbcdyowuEQX1ol+sQOgAMFm
   A==;
X-CSE-ConnectionGUID: C42LOeGdTSO9m/yh2WLE2Q==
X-CSE-MsgGUID: SL0miMeOSDOSJco2UKi98w==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70061933"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="70061933"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:49:32 -0700
X-CSE-ConnectionGUID: 2Om7UhE6QJinhFfs3ps7Xw==
X-CSE-MsgGUID: LQKlI2iORrObhp1hlQDNeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="204346870"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:49:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Sep 2025 13:49:25 +0300 (EEST)
To: Hans de Goede <hansg@kernel.org>
cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
    Andy Shevchenko <andy@kernel.org>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, 
    Aleksandrs Vinarskis <alex@vinarskis.com>, 
    platform-driver-x86@vger.kernel.org, 
    Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] v4l2-subdev/int3472: Use "privacy" as con_id for
 the LED lookup
In-Reply-To: <4d04e9a4-03cd-459c-be0d-2dcf0c38da14@kernel.org>
Message-ID: <feebe2b1-a908-fed2-cc81-5badd26e2d1c@linux.intel.com>
References: <20250909144823.27540-1-hansg@kernel.org> <CAHp75VeMMKCTDNWhdZJH2F=cmUObbpoYcDUch2jpsLBBNs_EhQ@mail.gmail.com> <e3edf119-2dfe-4857-842d-fb2a52470eb9@kernel.org> <0706ca2e-cee8-8f3c-b652-ac0cf0f087f8@linux.intel.com>
 <4d04e9a4-03cd-459c-be0d-2dcf0c38da14@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-88687938-1757501365=:937"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-88687938-1757501365=:937
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 10 Sep 2025, Hans de Goede wrote:

> Hi Ilpo,
>=20
> On 10-Sep-25 11:09 AM, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 9 Sep 2025, Hans de Goede wrote:
> >> On 9-Sep-25 7:27 PM, Andy Shevchenko wrote:
> >>> On Tue, Sep 9, 2025 at 5:48=E2=80=AFPM Hans de Goede <hansg@kernel.or=
g> wrote:
> >>>>
> >>>> During DT-binding review for extending the V4L2 camera sensor privac=
y LED
> >>>> support to systems using devicetree, it has come up that having a "-=
led"
> >>>> suffix for the LED name / con_id is undesirable since it already is =
clear
> >>>> that it is a LED:
> >>>>
> >>>> https://lore.kernel.org/linux-media/0e030e7d-0a1a-4a00-ba18-ed26107d=
07fa@oss.qualcomm.com/
> >>>>
> >>>> There was discussion about making an exception for "privacy-led" sin=
ce
> >>>> that is already used on x86/ACPI platforms, but I'm afraid that will=
 set
> >>>> a bad example which ends up being copy and pasted, so lets just drop
> >>>> the "-led" prefix from the x86/ACPI side, which we can do since ther=
e
> >>>> this is only an in-kernel "API".
> >>>
> >>> Since it's an in-kernel API, why can't these two be simply squashed?
> >>
> >> Good question, this is only a runtime thing when running on actual
> >> hw with a privacy LED. So having this separately will not break
> >> the build in the middle.
> >>
> >> As such it seems better to have this as 2 patches since it involves
> >> 2 different subsystems.
> >=20
> > But it's still only a single logical change, and not something with=20
> > monsterous complexity which would warrant splitting it at the subsystem=
=20
> > boundary.
> >
> > Or do you immediately know about something that would conflict with eit=
her=20
> > of these changes which would warrant splitting it per subsystem to avoi=
d=20
> > merge challenges? If not, I agree with Andy this should just be squashe=
d=20
> > into a single patch.
>=20
> Ok, since both you and Andy are in favor of squashing the 2 patches
> together I'll send out a v2 with the 2 patches squashed into
> 1 patch.
>
> > Another question, is the "privacy_led" suffix added into pled.name stil=
l
> > acceptable despite the "led" suffix?
>=20
> That is just the name of the directory added under /sys/class/leds for
> the LED some others, e.g. "phy0-led" also use a led suffix, so IMHO it
> is fine to keep this as is.

Okay, I'd no strong opinion on it but it felt like a similar case so=20
asked. We can leave it as is.

--=20
 i.

--8323328-88687938-1757501365=:937--

