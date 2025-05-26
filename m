Return-Path: <linux-media+bounces-33407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2D3AC41EE
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 16:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAEC4177400
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188C7210F5A;
	Mon, 26 May 2025 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eu4focz5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBFC433AC;
	Mon, 26 May 2025 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748271543; cv=none; b=TOXPzYJjxBVFnpw8QK62JZIRNmkVIzBEdlTZanghdh18uG7/Air7IkgjMqxZlfNKDHVo4u1Ig/IFaFPZ88v7PmN5k9l4bEpiiS0Mx60Xdr52/56SyOZe77R1pvhg6yV1boJ1ZSJUvMLBFT676Wrz19yqLGHce/gkAN4HOhmHdHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748271543; c=relaxed/simple;
	bh=RumzaM0klkHQE8TXvMe/0vZr0hQL2k/NHErDf7O7lak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLD1FJudo8mYKzokPD7jiLYHUlxbvEF84AvIER3oIXSfBIP+GjP1K60MHDpwc0+shfxfbzmmEp4kFJOmUq1xPI0cYMsAVXdCocr3J2KPRmlVWJrr2YanlKQPErkBG3Zf0jNHTdzci85/ZZgf0d+59fN/OWmKRtcWfpa34zR733o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eu4focz5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748271542; x=1779807542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RumzaM0klkHQE8TXvMe/0vZr0hQL2k/NHErDf7O7lak=;
  b=eu4focz5gnXmKoZbdN6Hy42hJRqLlx65KF4x6EaIPHMowbmM6nheVyAy
   XFk5FvhtANvBwgyrFfNm3LrtGasyPVmFkKVsa1CAqtCjo/XGpTZDYILWf
   mK8SQg3ATb54SPvR8Qyjy+nGWcU/Kjzts8VndsEnyd+s1cCpQFJA/oQ22
   UOOMaZXinYoaxWR11VnQZtmBlSbMtTMsqRE3e1Tg8Yrn5gpe893t0uZsP
   anGa8DchADJTaial7/2ZdZGOvXzDu/U+Gjj/1Xa5WkF73ChwArDcsybPa
   XWrSjLmKuoidWP+JmXOt8jm+bl/L+AYjvFkxSmz/hsENLo8psdPMxJQAE
   A==;
X-CSE-ConnectionGUID: xEaBG7v3TYCc1dp+fBiqSw==
X-CSE-MsgGUID: wkL6cIVlQ7y94Ykai/Rz1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50409226"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="50409226"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 07:59:01 -0700
X-CSE-ConnectionGUID: jYmmrDTuRBuT7QHjz05nEA==
X-CSE-MsgGUID: FS5ysAsKTHu0ghnRd8ICXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="142991891"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.125])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 07:58:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7324C11F739;
	Mon, 26 May 2025 17:58:55 +0300 (EEST)
Date: Mon, 26 May 2025 14:58:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, tomm.merciai@gmail.com,
	martin.hecht@avnet.eu, michael.roeder@avnet.eu
Subject: Re: [PATCH v3] MAINTAINERS: Update my email address to gmail.com
Message-ID: <aDSBr9h33kp_XQZK@kekkonen.localdomain>
References: <20250515145150.1419247-2-mhecht73@gmail.com>
 <aDQfcnIzJDLcK-U-@kekkonen.localdomain>
 <4e97af0e-0cc1-4b92-9876-927624a981f7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e97af0e-0cc1-4b92-9876-927624a981f7@gmail.com>

On Mon, May 26, 2025 at 04:16:03PM +0200, Martin Hecht wrote:
> Hi Sakari,
> 
> On 5/26/25 09:59, Sakari Ailus wrote:
> > Hi Martin,
> > 
> > On Thu, May 15, 2025 at 04:51:50PM +0200, Martin Hecht wrote:
> > > Replace my corporate email address by @gmail.com.
> > > 
> > > Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> > 
> > I've picked this patch but do the other instances also need updating?
> > 
> 
> Thank you. If it is okay I will update this later. Both email addresses are
> valid.

Ack, this is fine then. Thanks.

-- 
Sakari Ailus

