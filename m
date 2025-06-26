Return-Path: <linux-media+bounces-35951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B25FAAE9CCB
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F4184A77DB
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 11:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15144A0C;
	Thu, 26 Jun 2025 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMW5CrLM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4C110E0
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 11:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938569; cv=none; b=YwWWHdrafotJjW+SSojOLYfT8DLr17aLtC1k8OAHNZk41686efi/Gf8VNX60A8a4eU+ZKInhxXInD40Nha4KG/NNn1+7LpN/BYUVmCF7dny+yBO9ICQgQc16wh3S4tPF+m6rrY+bb0kgfk4OiGKgA7WvzDP0mOgKzxCzoxN0vEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938569; c=relaxed/simple;
	bh=EiYKDgxZDcM1WtOfKlU87TosJ9mBX9cjDqRMCAMLDvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rC4OCHKW4/VSHZmfWvFQ0ZI+BJzEERJG01SKDxuDoiNWtAoF4Tg3Gg3C1tIpR9Z7RMkG4pS6slOhkhUb1tmjuNViy8cgtGpNFCliVs4c7LI9YPEBR/8ijKYltJg63G2puBhyxfvlBupQwNfziF+vqGuTaA3Alk9PE9bj9vtJlQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMW5CrLM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750938567; x=1782474567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EiYKDgxZDcM1WtOfKlU87TosJ9mBX9cjDqRMCAMLDvM=;
  b=iMW5CrLM/GxlA6d5CB0EfVnL9pjUkVUgN7L8GurPqI2X8hKw43ItbK2k
   NRMj6d3Jh6jvcupk4MQKZOiypVrN7jfS6rQU0MG82ubybUUwwQm9pRFmS
   K4+E8OsWzDQ2GcS9drmfuMupCjUKV2G/rj75DnVgrKLBkfFPh4iYvphdl
   eqEMdmvM1fugpE8ROHIFKOHgTwe672CqiP4rih3BE0JjDM+WOKbVkL5K1
   rewE2/U8Dt8zmKTBm7pGs8Cx7kpJWWlfHCV4k/AUmmthbxXOOHVd8V5bR
   LXFuQEvz3jOyu72NrqUJEV/gyQjXxPucsF1U+I97PDDEq7+FkBOr8nSSI
   w==;
X-CSE-ConnectionGUID: BsN/8eKqQj2d6oQpH6Rn7w==
X-CSE-MsgGUID: yP+XCnxhRnGY2tm3lnDb5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304017"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304017"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:49:08 -0700
X-CSE-ConnectionGUID: CmCFFaQfRc2c1YVxmDuteg==
X-CSE-MsgGUID: CF4wcg8BRAWZ5RynFcnE7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="157999271"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.198])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:49:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2110F11FB5F;
	Thu, 26 Jun 2025 14:49:04 +0300 (EEST)
Date: Thu, 26 Jun 2025 11:49:04 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] media: hi556: Fixes for x86 support
Message-ID: <aF0zsMaQfoZEYM59@kekkonen.localdomain>
References: <20250531190534.94684-1-hansg@kernel.org>
 <75b2787e-1a07-4878-b101-8bc8cd9f0363@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75b2787e-1a07-4878-b101-8bc8cd9f0363@kernel.org>

Hi Hans,

On Thu, Jun 26, 2025 at 01:42:30PM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 31-May-25 21:05, Hans de Goede wrote:
> > Hi All,
> > 
> > Here are 2 hi556 fixes which together fix hi556 camera sensors not working
> > on various x86 laptop models. This has been tested and confirmed to fix
> > the camera not working on a Dell Latitude 7450:
> > https://bugzilla.redhat.com/show_bug.cgi?id=2368506
> > 
> > It would be nice if these can be queued up as fixes for 6.16-rc#.
> 
> What is the status if this series, you had one review-remark
> on patch 2/2 which I've answered, so from my pov this is still
> ready and it would be good to get this upstream since it fixes
> the cameras on some HP laptops.

Thanks for the ping.

I've picked these, to be included in the next PR for 6.17.

-- 
Regards,

Sakari Ailus

