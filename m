Return-Path: <linux-media+bounces-15418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B010B93EF06
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E09BB1C219FB
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 07:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBC812CD96;
	Mon, 29 Jul 2024 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wo1dGVmA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7248C84A2F;
	Mon, 29 Jul 2024 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239464; cv=none; b=BSlGSnsrCsDex9VVfzGhaiC0tWja9luM/7Km1k1yvFQOzE6GjAC/qtlfNRVhONDdZ9KYQ2+QAmpDBBV9tPbqXb+tTha7VWlUHHqEy3CsoCi9/FjcmbWA4RG1gNMzqCJp62AXdNrFHObZJiam0jfAm6kUBRFUxYpg3WmklmNLm84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239464; c=relaxed/simple;
	bh=0YD5qebvvvHTdKYH4uTspAUHYUhUPXH0+THdAkSMD10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/pGU0otSAJ0Prr4l1GSDUQr40obZKTThe6SQtxP096mtZ34Sb3Clzk1LVw7gvUNIMQiWmiublEkVVkgOipHm+XezbVbb1QazLJtBP8WBNSBQhGmHt144/FFNruCf3heWB+Ge1/tWBkgPKcyGdN3+m7r9DRwF+29wGRPXbOINsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wo1dGVmA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722239464; x=1753775464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0YD5qebvvvHTdKYH4uTspAUHYUhUPXH0+THdAkSMD10=;
  b=Wo1dGVmAqKIfY0QCOusUd3ZwdlTzJ2FTVoFyyd3dO19RurOrxBGJ+AiA
   GfH6QAIuP8i1k6DG/uRtpi9svNgR6SFDF0V5e7eVA6kehwIqEbSA1+VEZ
   AnutB2SwdI4j+bpn7KdqgYnkNHCCAgqaognCY/mP6Tu6PlJXBfVpMWxTa
   tluW/7H9/+iTCCNnGxmMlDeyTYDDioiqcasDIk4SbSdbuH3GpDlX0xE6l
   Wigcwl5ChMCUMgAL58V9gQbpvbOfTI15sSWtQoEgCAM0neL5We0ugHS9F
   NXZmkvlKJ5zl6tB8YqIb6/Kei/LGZFaKE1mDFTxQZQ+oeLoNMOZuEl3M0
   A==;
X-CSE-ConnectionGUID: X5rNtRMtRAawMk3vprKd6g==
X-CSE-MsgGUID: ED9l6VOhTG2PT4Isg7cQsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="23773186"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="23773186"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:51:03 -0700
X-CSE-ConnectionGUID: jPK51ZwOT3mXCLTYHRfEFw==
X-CSE-MsgGUID: LsJMygX5RFWqJq4o2bT1cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="84536935"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:51:01 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4B1E811F8A8;
	Mon, 29 Jul 2024 10:50:57 +0300 (EEST)
Date: Mon, 29 Jul 2024 07:50:57 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>
Subject: Re: [PATCH 1/1] media: ipu6: Depend on AUXILIARY_BUS
Message-ID: <ZqdJ4c5NICbLZIQF@kekkonen.localdomain>
References: <202407161833.7BEFXejx-lkp@intel.com>
 <20240729071026.3775341-1-sakari.ailus@linux.intel.com>
 <2da2103f-1f54-c70e-d8c4-ddcf3e4037d1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2da2103f-1f54-c70e-d8c4-ddcf3e4037d1@linux.intel.com>

On Mon, Jul 29, 2024 at 03:37:03PM +0800, Bingbu Cao wrote:
> Sakari,
> 
> I also submitted one before :).
> https://patchwork.kernel.org/project/linux-media/patch/20240717074050.4067898-1-bingbu.cao@intel.com/

Oh well... I seem to have even read it earlier. I blame the holidays. ;)

I'll pick yours as it was there first.

-- 
Sakari Ailus

