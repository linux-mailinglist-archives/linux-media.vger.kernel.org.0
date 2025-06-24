Return-Path: <linux-media+bounces-35765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4C6AE63BE
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3CB74C1793
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5878028D83E;
	Tue, 24 Jun 2025 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIE9HlWi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A64E1F3B9E;
	Tue, 24 Jun 2025 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765299; cv=none; b=eTcG4E3lxGEIUNm2j/Kx+GSjZDqcmYLZx6Rb9OB+oWyx6wzeRlB+dw7536FW+ssxtoo/7ctsO+5OJ2wTAeJ7cA6qTrw53rp9x+XlJ06QbJyKupPBTMc0F7nM+r1mtUi4xHHkDBo2BYMQGQOfPWRJ22ZpCgq4sH/W56bxpdSvfrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765299; c=relaxed/simple;
	bh=NyT19WJz3csCD+zRyZdYmeDeFltXBvUQbAN/8+hmzIs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=m6/wdfGtgsUrvdxXwS2TnJG6tkD4PWMKoN96eg0aOTf6D5TXU3A7F7DvzniUdWqkj2TW6ce1fSISF5DFMbC4H6liODM0hDytzIq1WBFbLOOKgAFMQbdFNq4an6D3GGpVKP71MjASF/VdaglJq6X/FJVLk+5SyvD82SgQly8dMjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIE9HlWi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750765298; x=1782301298;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NyT19WJz3csCD+zRyZdYmeDeFltXBvUQbAN/8+hmzIs=;
  b=AIE9HlWigfdjNMpvORnBWYOikSnc6/WYDnRH73EZPzlPi5Bx9RETavcU
   ZV47n6aWrNh0OZPh1WA1ORW8Gsp+S61FiKcN4EybpSRmq02enMPad1xwv
   /NUsu3vVoEgktorsbu+OxS30cm/cNRhokUI1CiEKZ6ijVTDNSJhEw/9Zb
   Wd74gsrbSogBw62G8r2D/7kaxgCMCa2Al+VEkV+VyZRV1NzbuiXK/q7wv
   msxUHAzk3B/0lLmIpdHGeeWrGwZMmGx+4RCp+28eEwhBKNzEMpmrrR53c
   JEjcQ/OanHI3bMznJCjIMT+wVcNXPqOu/Zg+i3cJdW/sJ9CnVoSwekzCT
   Q==;
X-CSE-ConnectionGUID: SK2qQLyCRzeYmrfqClRrDg==
X-CSE-MsgGUID: 4+umT142RMOH7lVt1md9Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56784860"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="56784860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:41:37 -0700
X-CSE-ConnectionGUID: UZIvjacZSsakFowSsv5+DA==
X-CSE-MsgGUID: dIYqNFaFQ0eVtzNL3n/Pjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="182773755"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:41:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Jun 2025 14:41:33 +0300 (EEST)
To: Hans de Goede <hansg@kernel.org>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>
cc: Daniel Scally <dan.scally@ideasonboard.com>, 
    Hans de Goede <hdegoede@redhat.com>, Daniel Scally <djrscally@gmail.com>, 
    linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/3] platform/x86: int3472: Add board data for Dell
 7212
In-Reply-To: <c5ec1707-5007-4417-bc54-303924598a1e@kernel.org>
Message-ID: <a26ae32c-e5b2-08b7-bc47-6a84881502f4@linux.intel.com>
References: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com> <20250520-djrscally-ov5670-v2-2-104ae895aecf@ideasonboard.com> <aFlXSrZH1f4BbB3M@kekkonen.localdomain> <c5ec1707-5007-4417-bc54-303924598a1e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1235260601-1750765293=:943"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1235260601-1750765293=:943
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 23 Jun 2025, Hans de Goede wrote:

> Hi,
>=20
> On 23-Jun-25 15:31, Sakari Ailus wrote:
> > On Tue, May 20, 2025 at 02:17:45PM +0100, Daniel Scally wrote:
> >> The Dell 7212 Rugged Extreme Tablet pairs an OV5670 sensor with the
> >> Intel IPU3 ISP. The sensor is powered by a TPS68470 PMIC, and so we
> >> need some board data to describe how to configure the GPIOs and
> >> regulators to run the sensor.
> >>
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >=20
> > I earlier missed this wasn't for the media tree...
> >=20
> > Hans: can I pick this (with your ack) or can you?
>=20
> pdx86 is maintained by Ilpo now (with me as backup), so that is
> more of a question for Ilpo. FWIW I'm fine with routing this
> through either git tree.
>=20
> > I the latter case, you can add:
> >=20
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I'm fine with taking it in through the media tree.

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

I was wondering last week what to do with it as it looked independent and=
=20
the submitter didn't specify any preference in the coverletter. I'd have=20
soon asked myself.

--=20
 i.

--8323328-1235260601-1750765293=:943--

