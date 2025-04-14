Return-Path: <linux-media+bounces-30125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8295FA87BA8
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 696D03AFC12
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3033F261580;
	Mon, 14 Apr 2025 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8yrmAww"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8151A2632;
	Mon, 14 Apr 2025 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622143; cv=none; b=pc7CI2WJjOyHEzNY6JmAJl1ptvPnV91gJKo/Zgs1Lx5V3vosDrl5pWhWfsNUc0vcxHtHS2iUzR2od3Aa0wiB1Fick/w4ggytOLbJpBzGdgGscKW5h+mxtMFjSTuhGPjUEvNlzcGbazIDl5xysqgJRcwYfKV0eCgt4XEjpnLe950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622143; c=relaxed/simple;
	bh=yhNoOiFhKMqhM55XCGcnS3Kn7NPth90G1vtMJxHWXno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouMtZDYIt0V5AA5hD6UAKK/bF1p+jvmTkKe4KKzo973kucW0UZZhgXdQmgZrCL35mfl8o4TijO1lAixwiorK+LmqdP39tAWqMsLbBrc8pbLZxixKIrGCB4Wg7F2ZzU4oQuw6lbso1Epb7xUgHlCdNpwRak+j4GREGGSlVFgMI9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8yrmAww; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744622143; x=1776158143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yhNoOiFhKMqhM55XCGcnS3Kn7NPth90G1vtMJxHWXno=;
  b=S8yrmAwwOrp9T+zQ6WEdoK5+sj0IsjapgfyMfbbypajPQszZBjVNlruI
   XVt1XRGlM0hhFWELwZj/I6n5Y6GrAzPJSe+PXz8zye0JWmjIeZp3AcsSz
   uuXLOtCe4y+pkJszq8eNJfP/OqpMN5+moLMGp3x8+PHEWfieeu7mPljk0
   e47GnFHgtF5blKTQBRQG2eFHSJQUfIS8uJnYtIuSaWeb2FelpFHGIDd7O
   Kg2NjU6JpN96l3t1tYdzOra4ZXyf2Zt6NdAW9hzGs5I5KjEj23yGpq7/F
   hUschkESbgWJ+vFeWKBHaGrbbKmjxFdW5XHLGVspo+y9n1cCW0EYw0aKW
   w==;
X-CSE-ConnectionGUID: 3yPUzMBwTkWJ01j5zExmOQ==
X-CSE-MsgGUID: uPbBzMxMQTKRtPfjT2QRfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56263406"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="56263406"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:15:41 -0700
X-CSE-ConnectionGUID: ZZyy/ybuQY2r81ih0hCPhQ==
X-CSE-MsgGUID: or6s5L7/RIq6BeoHSXOC1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="129522705"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:15:37 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5B7FC11F871;
	Mon, 14 Apr 2025 12:15:34 +0300 (EEST)
Date: Mon, 14 Apr 2025 09:15:34 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: phasta@kernel.org
Cc: Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Ismael Luceno <ismael@iodev.co.uk>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] media: Replace deprecated PCI functions
Message-ID: <Z_zSNuLl_dTSsQOw@kekkonen.localdomain>
References: <20250404135344.93241-2-phasta@kernel.org>
 <edf236654c39fbd3afb6db20e3ef42501a8628b0.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edf236654c39fbd3afb6db20e3ef42501a8628b0.camel@mailbox.org>

Hi Philipp,

On Mon, Apr 14, 2025 at 11:06:54AM +0200, Philipp Stanner wrote:
> On Fri, 2025-04-04 at 15:53 +0200, Philipp Stanner wrote:
> > Replaces pcim_iomap_regions() and pcim_iomap_table(), which have been
> > deprecated.
> > 
> > The successor pcim_iomap_region() is already used in many places and
> > shouldn't cause trouble.
> > 
> > I test-built it, but have no hardware for testing.
> > 
> > P.
> > 
> > Philipp Stanner (5):
> >   media: ipu3-cio2: Replace deprecated PCI functions
> >   media: pt3: Replace deprecated PCI functions
> >   media: intel/ipu6: Replace deprecated PCI functions
> >   media: solo6x10: Replace deprecated PCI functions
> >   media: tw5864: Replace deprecated PCI functions
> 
> Hello,
> 
> is there someone who's in charge of all of media: who could take this,
> or would it be more feasible to aim for the subcomponents?

I'll check the ipu patches soonish.

-- 
Kind regards,

Sakari Ailus

