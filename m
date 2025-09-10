Return-Path: <linux-media+bounces-42184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1D2B51486
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB3E64E1AE3
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC04309EFF;
	Wed, 10 Sep 2025 10:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3PQ22dk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2369F2367A0;
	Wed, 10 Sep 2025 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501566; cv=none; b=SkiWgROOOVwWGfNMg8IW4hXtOp6dJLmRyYSpv1gm3HEOuAdn8+0rdj3NbWa07CMrmyPK6GaoR0hmuUUHwpRZUz2hoU0hyJZ50sO1rN6cbYRF3fl0Ygp0peBgPDBttCukpgYG6I+eIJeGpDS3XNtU7FwLgLNbhx97y0JDv6VNfSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501566; c=relaxed/simple;
	bh=OzTmT5N55TNnY5rWJ90RfRXqjhMrJ7pTaYY+peQxtH8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JG4cvJxIWpqB5r5+NJP1scK5WBXBL04rKnNKBnmeQsCjKCWifHQdrRuL+zncrCdymol6h0dWV7gNThcoNQAj8h/AJ+Sb/sZiAEkNoLgEjQwk5YNzku3sJtbDJkJkHeaR29VJKOUZfOe427+t4Vnr/fDvHmG/TWi6lMNqo8efRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3PQ22dk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757501566; x=1789037566;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OzTmT5N55TNnY5rWJ90RfRXqjhMrJ7pTaYY+peQxtH8=;
  b=j3PQ22dkE0vWA3Zkyshzxp32sv5MIT2oUNqu5NXw+D0nwOWFUrHA0FN3
   SUajSNC1GJsLeb60I+VJIZUQUnB7nCr5QFlAfEWirDP93jj7/cf2+PBaN
   RggHIaJx9mlgABBkmg40uaU2nablJA+9HhBscAHVCAzpSeyf29gusPe3t
   hlFKGVGG4YHaQGo9MU2FYOS8raRDqjOLXPIq98ky8zP4e1HoXynyvxx9S
   H4V0Nj00I5wb4KkUbTvUIcNbq7GTAu/osItGXXiCdNYsjfOXgnipxU4Gi
   wLmfbbJl1BxuLax5qjfmpVNZzylbdoINbW8WEgW+L2wGoQ/BbXaq9yM3N
   g==;
X-CSE-ConnectionGUID: 7VJJCSNzQEG9HALRntCVZQ==
X-CSE-MsgGUID: ho7hstZtQsm7uJK1Igi6jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77263627"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="77263627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:52:44 -0700
X-CSE-ConnectionGUID: AHUKg8BHQ6q8XsL9mBZ4lg==
X-CSE-MsgGUID: BmhXujFtRq6yxeGmikIqpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="197027768"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:52:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Sep 2025 13:52:36 +0300 (EEST)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Andy Shevchenko <andy.shevchenko@gmail.com>, 
    Andy Shevchenko <andy@kernel.org>, 
    Aleksandrs Vinarskis <alex@vinarskis.com>, 
    platform-driver-x86@vger.kernel.org, 
    Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] v4l2-subdev/int3472: Use "privacy" as con_id for
 the LED lookup
In-Reply-To: <aMEr4Qtui91NQqkk@kekkonen.localdomain>
Message-ID: <4b8ca004-83ad-0958-a31c-7ef3e1215954@linux.intel.com>
References: <20250909144823.27540-1-hansg@kernel.org> <CAHp75VeMMKCTDNWhdZJH2F=cmUObbpoYcDUch2jpsLBBNs_EhQ@mail.gmail.com> <e3edf119-2dfe-4857-842d-fb2a52470eb9@kernel.org> <aMEr4Qtui91NQqkk@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-617673000-1757501556=:937"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-617673000-1757501556=:937
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 10 Sep 2025, Sakari Ailus wrote:

> Hi Hans, Andy, Ilpo,
>=20
> On Tue, Sep 09, 2025 at 10:40:35PM +0200, Hans de Goede wrote:
> > Hi Andy,
> >=20
> > On 9-Sep-25 7:27 PM, Andy Shevchenko wrote:
> > > On Tue, Sep 9, 2025 at 5:48=E2=80=AFPM Hans de Goede <hansg@kernel.or=
g> wrote:
> > >>
> > >> During DT-binding review for extending the V4L2 camera sensor privac=
y LED
> > >> support to systems using devicetree, it has come up that having a "-=
led"
> > >> suffix for the LED name / con_id is undesirable since it already is =
clear
> > >> that it is a LED:
> > >>
> > >> https://lore.kernel.org/linux-media/0e030e7d-0a1a-4a00-ba18-ed26107d=
07fa@oss.qualcomm.com/
> > >>
> > >> There was discussion about making an exception for "privacy-led" sin=
ce
> > >> that is already used on x86/ACPI platforms, but I'm afraid that will=
 set
> > >> a bad example which ends up being copy and pasted, so lets just drop
> > >> the "-led" prefix from the x86/ACPI side, which we can do since ther=
e
> > >> this is only an in-kernel "API".
> > >=20
> > > Since it's an in-kernel API, why can't these two be simply squashed?
> >=20
> > Good question, this is only a runtime thing when running on actual
> > hw with a privacy LED. So having this separately will not break
> > the build in the middle.
> >=20
> > As such it seems better to have this as 2 patches since it involves
> > 2 different subsystems.
>=20
> Seems good to me.
>=20
> Ilpo: are you fine with merging this via the media tree?

Yes, but please take the v2 instead which has the changes squashed=20
together.

--=20
 i.

--8323328-617673000-1757501556=:937--

