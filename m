Return-Path: <linux-media+bounces-32035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A10AAFBFC
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 15:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3E993A6444
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 13:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A47722C34A;
	Thu,  8 May 2025 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ol+9KkbW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40291E5215;
	Thu,  8 May 2025 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712121; cv=none; b=tYd0XbAon6YYBr3thUFY2aUOL/823sVeVaSTaaOn322Nszs1WQXK6kKgIyt2G1ZtR8LFdC/LUWohdgNXXh4EnwiQ/AMUl8/H2H5wgRNCtOpBzSnbc4Zdy3tObgvqOy8cl1PMtgLLHGuJt7NVF9QtZbNlcm6WPc3Fn891zU+8hIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712121; c=relaxed/simple;
	bh=gw2zPlLac5sBf5f8EpTbuMbjUdDqEwgXD5tWTAbTEu8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=j7CaAd/j1l5Vgx5rVmsm4kk1X0kN+vXKhdricofwQp7Dd1wSTBxMpphCu/J8zaythXoC6EA+/cmMcVjnIiNGWaRVlmm8tHhHpi6TL3ISVyKnbXXJidDSi9Ah8oLM8lKpMd6N1bpSfaS7MTz3h9tGzphUPw8BW0YtoY9ghbV0Rv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ol+9KkbW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746712119; x=1778248119;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=gw2zPlLac5sBf5f8EpTbuMbjUdDqEwgXD5tWTAbTEu8=;
  b=Ol+9KkbWRnAxp8alqZq/me2iFyXRHyMovvlO+0vaF6ixOBz7S+oLq543
   Mc8xm/4kL0pYFCubbjOpgRrlJDeoUC+/d2bDKiHvWHKaZ1OiKNftcOJt3
   XuGdH4u8jimAgYM9EYLOBl9v4kVSWLB1fJE5dM316SpIlKs1oY5J5PB/+
   u8ISa4zzjF4hVR2vUkVUBUkHsI1jitVNOXJoWM64BA5F4wJCeqFOySJwW
   COoDpU+9xC9sld3fb3MrafBXZczG9DRIuGnsLenebpvSLtGogM22O5aYE
   GUT2I3EEWfe0sYlAfwhw1FMBjYShfUDWIltcG5tUaRlpPNm93jk0soFNn
   g==;
X-CSE-ConnectionGUID: dxFG3BCMTwei8Vope6bpsQ==
X-CSE-MsgGUID: v/Li0r2jS6eNv27BSugfeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58702505"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="58702505"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 06:48:38 -0700
X-CSE-ConnectionGUID: rwJWjqnOSMaEENfSLQPxLQ==
X-CSE-MsgGUID: SOMKx/hYTyyAGbgXFiQg3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="137229373"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 06:48:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 May 2025 16:48:31 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
    Andy Shevchenko <andy@kernel.org>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, 
    Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
    linux-staging@lists.linux.dev
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
In-Reply-To: <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com>
Message-ID: <a8a6257d-854f-62c2-dd63-c3d2cbab31a5@linux.intel.com>
References: <20250507184737.154747-1-hdegoede@redhat.com> <20250507184737.154747-7-hdegoede@redhat.com> <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com> <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-330200422-1746712030=:922"
Content-ID: <e673d6a0-b57e-46da-fbcb-2a5e8e07c151@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-330200422-1746712030=:922
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <d98cfc0b-3181-5c97-6af9-3d348da61c73@linux.intel.com>

On Thu, 8 May 2025, Hans de Goede wrote:
> On 8-May-25 10:34 AM, Andy Shevchenko wrote:
> > On Wed, May 7, 2025 at 9:48=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:
> >>
> >> Replace the duplicate code for calling the special Intel camera sensor=
 GPIO
> >> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
> >> the sensor with a call to int3472_discrete_parse_crs() from the int347=
2
> >> driver.
> >>
> >> Besides avoiding code duplication the int3472 version of the code also
> >> supports more features, like mapping the powerdown GPIO to a regulator=
 on
> >> the mt9m114 which is necessary to make the camera on the Asus T100TA w=
ork.
> >=20
> > ...
> >=20
> > Don't you need the Kconfig(s) update to have proper dependencies all
> > over these cases?
>=20
> Yes I do, I thought about doing this already but forgot to actually
> do it, thank you for catching this.
>=20
> When I've some time for it I'll prepare a v2 of just this patch
> addressing this and your s/then/than/ remark.
>=20
> Since you and Sakari are happy with them patches 1-5 can be picked up
> and merged by Ilpo as is, so I do not plan to send a v2 of those.

Thanks for the quick reviews.

I took patch 1-5 into the review-ilpo-next branch with one typo in=20
change log fixed (reser -> reset).

> > Otherwise I am fully in favour of this change and the series as a whole=
, thanks!
> >=20
> > ...
> >=20
> >> +       /*
> >> +        * On atomisp the _DSM to get the GPIO type must be made on th=
e sensor
> >> +        * adev, rather then on a separate INT3472 adev.
> >=20
> > rather than
> >=20
> > (FWIW, it's your typical mistake, it's something like the 10th time I
> > noticed it :-)
>=20
> Yeah, I'll try to remember to double check for this spelling mistake
> myself, but I'm afraid I'll probably never learn. We have something
> somewhat similar to than vs then in Dutch and I even do it wrong there :)

I know the feeling, muscle memory is extremely hard to override. :-)

--=20
 i.
--8323328-330200422-1746712030=:922--

