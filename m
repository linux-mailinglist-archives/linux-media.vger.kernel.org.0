Return-Path: <linux-media+bounces-32039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F23C6AAFC6B
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 16:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F35216B3E0
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 14:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08711253926;
	Thu,  8 May 2025 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0xYoc8x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88E4B1E60;
	Thu,  8 May 2025 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713374; cv=none; b=hm4sODJ9K3KCctuc1lMbR52gt/kCNP2AOY0v0vEYoTu+8WkTfKnevlN6yVXXhknDz42JzKw1spDYs40K8k66+8aCfvGCKscsxQokEu02QlJHbZPEHSfXoz/AnvPSJ8dhHpi8Omb8KxqssU/0PiCsMh2Cz1AH0R6q+2ZZPz3sSu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713374; c=relaxed/simple;
	bh=3xZml5JCPA+yw9UzDMrBJSBvuGfLK+53itMT3L0Fjnk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ky4IoFe73e2b4ZP9gMwK7ZajcDffhAvKWJdIFqJoBhhHDm3hkB1aY14ZDax8zjAr2+3SgtO1Mn/4NCCUyaRnaNYqd+RWCcMDb9oYRlDL5wasr5r7niOD3uDbL6JY5iHVaM0jD03RrBXkk/66/B8v/ZyHkXEzwNdSyZIntAweZKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0xYoc8x; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746713374; x=1778249374;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3xZml5JCPA+yw9UzDMrBJSBvuGfLK+53itMT3L0Fjnk=;
  b=V0xYoc8xGC12uNFyou5sTMUpW4hYDAJZZiH2x2f4VIlgVXC8EHIfyiFy
   elB1bZpPjviCVEpIJ78ONMQuQnh4F2XakZfOhNkGKHqg1/5JvXMrV7p1e
   UG1u2Dg0aMjZXOpx1yNd0Za7UY8zidPQO4JeBoUEMlhRFyjV3wT/nBUXt
   DC50yxKwe/NX/ckkaaYageJahm1fjB32Xb8LqlVM8KkGa7NpMZSut7UgL
   1ubAgpMHkadP44utKHSCzScsJH4uscE/NJtm4gqn96XU2uaSOtlXjvO7U
   F5ClgPuo1F8qGpBmr6A+L0IpD3tvmXVVSHWWoKt63Z6Sr7Y/42XcdWsN4
   w==;
X-CSE-ConnectionGUID: R8v2Jt15STSYYXkbBhpWuQ==
X-CSE-MsgGUID: dfptrNyxQ4qWoEufaHdckg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48584756"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48584756"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:09:33 -0700
X-CSE-ConnectionGUID: cHpQa95mTYOU3L15wx5o1g==
X-CSE-MsgGUID: TDc2L68qRZylY2IIuLYR2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="173493564"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:09:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 May 2025 17:09:26 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
    Andy Shevchenko <andy@kernel.org>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, 
    Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
    linux-staging@lists.linux.dev
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
In-Reply-To: <1a5cca5a-4bb1-4ac5-aefc-b1ef0e693914@redhat.com>
Message-ID: <d0ed8b99-1663-5fef-baf4-d094b618a919@linux.intel.com>
References: <20250507184737.154747-1-hdegoede@redhat.com> <20250507184737.154747-7-hdegoede@redhat.com> <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com> <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com> <a8a6257d-854f-62c2-dd63-c3d2cbab31a5@linux.intel.com>
 <f8a321cc-2545-4048-a257-56c3c5dd03b3@redhat.com> <1a5cca5a-4bb1-4ac5-aefc-b1ef0e693914@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1511333336-1746713366=:922"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1511333336-1746713366=:922
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 8 May 2025, Hans de Goede wrote:

> Hi,
>=20
> On 8-May-25 3:56 PM, Hans de Goede wrote:
> > Hi,
> >=20
> > On 8-May-25 3:48 PM, Ilpo J=C3=A4rvinen wrote:
> >> On Thu, 8 May 2025, Hans de Goede wrote:
> >>> On 8-May-25 10:34 AM, Andy Shevchenko wrote:
> >>>> On Wed, May 7, 2025 at 9:48=E2=80=AFPM Hans de Goede <hdegoede@redha=
t.com> wrote:
> >>>>>
> >>>>> Replace the duplicate code for calling the special Intel camera sen=
sor GPIO
> >>>>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs =
to
> >>>>> the sensor with a call to int3472_discrete_parse_crs() from the int=
3472
> >>>>> driver.
> >>>>>
> >>>>> Besides avoiding code duplication the int3472 version of the code a=
lso
> >>>>> supports more features, like mapping the powerdown GPIO to a regula=
tor on
> >>>>> the mt9m114 which is necessary to make the camera on the Asus T100T=
A work.
> >>>>
> >>>> ...
> >>>>
> >>>> Don't you need the Kconfig(s) update to have proper dependencies all
> >>>> over these cases?
> >>>
> >>> Yes I do, I thought about doing this already but forgot to actually
> >>> do it, thank you for catching this.
> >>>
> >>> When I've some time for it I'll prepare a v2 of just this patch
> >>> addressing this and your s/then/than/ remark.
> >>>
> >>> Since you and Sakari are happy with them patches 1-5 can be picked up
> >>> and merged by Ilpo as is, so I do not plan to send a v2 of those.
> >>
> >> Thanks for the quick reviews.
> >>
> >> I took patch 1-5 into the review-ilpo-next branch with one typo in=20
> >> change log fixed (reser -> reset).
> >=20
> > Great, thank you!
>=20
> Ilpo, I just noticed that Sakari typod his Reviewed-by, it reads:
>=20
> Reviwed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> and this is also how the tag looks in review-ilpo-next now.
> so missing an 'e' you probably will want to fix this.
>=20
> Also Sakari gave an Acked-by for patch 6/6, but since he did so
> in a reply to the cover letter all 5 (1-5) patches now have:
>=20
> Reviwed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> so besides adding the missing 'e' you probably will also want
> to drop the entire Acked-by.

Yeah, a perfect example of tunnel vision. I was looking specifically=20
whether those reviewed-bys got added by b4 into all patches but failed to=
=20
notice any of those errors despite staring at the very lines. Thanks for=20
letting me know, I'll fix them.

--=20
 i.

--8323328-1511333336-1746713366=:922--

