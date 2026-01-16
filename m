Return-Path: <linux-media+bounces-50879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AADD31122
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 693593008746
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EBA1A704B;
	Fri, 16 Jan 2026 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPqp3Q9g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4DF1B87C9;
	Fri, 16 Jan 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566453; cv=none; b=oC7VlnRKUeyOMtRL+TbC3gBlaaQ1sl1y4KpcZZ4OoHC5+hlYMZQRnEJVMY0Slu7LADjdb14xtp+ry1FzymjRgoyaJhwa2VE7KWTOEmyrmPNiPpnjFQyao03X1woGQe76E1LkGDqS5BcVJ9V/RvPQKTlcWoTaQ7EDDffCkckLTWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566453; c=relaxed/simple;
	bh=fUyicW8yPg13/k6ImHlRqjaCn34VaGqV9sxEATsIzKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q49r+4VXvlYaJW3iGuZXBv84khQqnqqGyMZuM/PA8CIcIabkm5ROO/AJOxaDtRyQOSRJjwwtqvx2grKY+/8TofKsUJwun/x+OSZOgvFpkEYvhSGHG8LYl2lk0sEjRBwyke8RelSzcZrHhY+ISrSOlZ9YrhlNJGV2Dwk0o/O16gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPqp3Q9g; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566451; x=1800102451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fUyicW8yPg13/k6ImHlRqjaCn34VaGqV9sxEATsIzKc=;
  b=IPqp3Q9g+osAzGkEH9Qe6PVvfz0Gh3iMmhrfJ7EJgxNSOuUG+xNbyWME
   k/dpcaBoo0yaqI4PgZQoRKV2nmRrVhBoQ+lz6LF10VrAqXASPLQ5AYhDS
   3KasuTziLPf9qAZRjux0DzoZzFr5jd42oUmzHUpaNOoG7S1bcVv47T9HM
   LciO8+KLuKK95Igda1xwKZYCxk4s1Lk7WzqvFSwsSGnZvl2iQNandXjEP
   9E9RIWja0N991CqOmqlQi1c5LkyeRAmEYMWDXMWi2aLd34GJueui5iwZO
   7WvVXXljohFIWO7O49yV2i+QPiUNVF+CCZwpylbdh2IGL81LPDawtZJ68
   w==;
X-CSE-ConnectionGUID: 03RysDBBRpKv7m6wy/BzDw==
X-CSE-MsgGUID: bP+CcHWJT0KtByDbHw9Xng==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80522514"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="80522514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:27:30 -0800
X-CSE-ConnectionGUID: 9DkVj0ZwR2C95YkKHjATaA==
X-CSE-MsgGUID: RkcKBuzRTh+pXdT7TEcwwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="242776871"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:27:26 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6517A11F726;
	Fri, 16 Jan 2026 14:27:25 +0200 (EET)
Date: Fri, 16 Jan 2026 14:27:25 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: benjamin.mugnier@foss.st.com, clamor95@gmail.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dongcheng.yan@intel.com,
	elgin.perumbilly@siliconsignals.io, git@apitzsch.eu,
	hansg@kernel.org, hardevsinh.palaniya@siliconsignals.io,
	heimir.sverrisson@gmail.com, hverkuil@kernel.org,
	krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	mchehab@kernel.org, mehdi.djait@linux.intel.com, robh@kernel.org,
	sylvain.petinot@foss.st.com, vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH] media: i2c: os05b10: Few minor improvements
Message-ID: <aWourd9Efg7yRNoH@kekkonen.localdomain>
References: <20260105093420.110973-3-himanshu.bhavani@siliconsignals.io>
 <20260108055454.71358-1-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108055454.71358-1-himanshu.bhavani@siliconsignals.io>

Hi Himanshu,

Please add a commit message to the patch on the next time, please. I've
done it this time.

-- 
Regards,

Sakari Ailus

