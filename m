Return-Path: <linux-media+bounces-34570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279DDAD67F0
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 995F73ADAE4
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 06:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CCB1F0991;
	Thu, 12 Jun 2025 06:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lP3bdkh9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C84B211F;
	Thu, 12 Jun 2025 06:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749709448; cv=none; b=lY8edwg5NnpUISsA9R+pAt3uFtgedpzZ1DuyOF9LdZ0Js1/JNiM49qI155XypNamXTAZOzU+hC47uK9GSy2+KfrvWW05vjczMN6NbJ+/qtzfIPrvH5ut7MV/RB49fdw2aqV1H4Nj8dlesJwhREcoUOFEXcThu1PdOz6QCttj1hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749709448; c=relaxed/simple;
	bh=l4fALJRoTns2aEPUjjOn5HmuW8Ca1bpn5dd/esrfWyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITBVz355wrKNvq36x24tIpJ/1oI8AeLPIj6aYMIyD3ksFEiCMNW+81gUuXKQhQlPYinrsRDqJFWbMzIKDHoKeXR15BIlO7k19cQF+IFY7qEKQ2SVfdHD2Ib/1c/Md6n2F61QXOrsNAEU8hHAFXN0BiQ2iDZGs3OPKaw+frUWdMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lP3bdkh9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749709446; x=1781245446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l4fALJRoTns2aEPUjjOn5HmuW8Ca1bpn5dd/esrfWyU=;
  b=lP3bdkh920Fgq5Pb4u1TSqyW6pRpp+9Vi6gyWJLquuHYKlG20P7i3YDA
   8fF38xeT593KRmnyLVOSd2Hgb4NYGz5WMnrURK10mEbKpIT7gAiSzteS6
   FHoPR12oGTTKkR4CgsIBNcz48Ea3yJzAqw818qRUFhIm53KJRyJ4F5vd1
   HkJaNhvEtHb1cTRJw1ZCz/N6usZz9LY/higOrC4xTfb2Lfk4T49FMcDMI
   w2r9GJnGkmDpx3Wd4sIITgdZGzeo1JKnHT4pNcjmm7BrKhwXR3oyjQ4GH
   GPK/RmdvpiW1Gqx7UBfJ0nPS2lfvGKN38o8auKs+tWzsjlkqvGE5xkV7e
   w==;
X-CSE-ConnectionGUID: ILVmev/9QkWORV4z8oA35w==
X-CSE-MsgGUID: fRT4tWdzReKjD//U2lig6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63282518"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="63282518"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:24:06 -0700
X-CSE-ConnectionGUID: e31vFwp7QWmDgDkYQ868JA==
X-CSE-MsgGUID: cPErx8xeRkC8aqI4BN4Ntw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152189969"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:24:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7AE9611FBC0;
	Thu, 12 Jun 2025 09:24:01 +0300 (EEST)
Date: Thu, 12 Jun 2025 06:24:01 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: i2c: vd55g1: Fix return code in
 vd55g1_enable_streams error path
Message-ID: <aEpygaTstAGV5EuE@kekkonen.localdomain>
References: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
 <20250611-fix_vd55g1-v3-2-ef4ecf15ddbc@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-fix_vd55g1-v3-2-ef4ecf15ddbc@foss.st.com>

Hi Benjamin,

On Wed, Jun 11, 2025 at 10:48:31AM +0200, Benjamin Mugnier wrote:
> Enable stream was returning success even if an error occurred, fix it by
> modifying the err_rpm_put return value to -EINVAL.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

This looks like something that should be backported btw. What's the Fixes:
header? I can add that while applying.

-- 
Regards,

Sakari Ailus

