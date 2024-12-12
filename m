Return-Path: <linux-media+bounces-23247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB53A9EE02A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 08:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 253E6283316
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 07:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3223F20ADD2;
	Thu, 12 Dec 2024 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1wbn/64"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC84209F33;
	Thu, 12 Dec 2024 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733988023; cv=none; b=tv2OTSyD9DGzWDn2lmPBKVYGjPVDsTBCKRY2Q7kXbuiqARG6SEAYbA0+uVodTB5GKSsSdzECrrx2OD5y90aYirMrTV3tcMe96Q5yZaC6uyHTOx+Jwf20SQKDOKmGdzyynycgkXh+MWKXJmSyMAVVB4huphGaLP6REBe95kyEphs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733988023; c=relaxed/simple;
	bh=CjKft8uHPWZSvHFBpS9Dh9uzJ+5zMnLCLMtHyyRIGSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWDWy9J1YOk7s63vh6ZIrJWxXx4xt5VI5R1E6T1LPQjkEydhRqqpyV1yFaj5DnJpGBd8UghIkYfrszh3vH0JSDXO2+lXH+25youd2S2sYIsYgFCunG4hR+K1lNX0NO8fx+ptOh/E3YXbEYkQ1Rw7PMJ2Sa8qln6bNnd7OtHpW0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1wbn/64; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733988022; x=1765524022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CjKft8uHPWZSvHFBpS9Dh9uzJ+5zMnLCLMtHyyRIGSg=;
  b=K1wbn/64cZXD71LNGgOGzv3fqzKNi5LoSrAOkv8MMh1GtrLmcNp5ox4G
   OmuvetD+w7GVgcUD7LFIlWcxN6dV9xp1K1YMjsETzz2mdyLaFLWCFoEOn
   wdziaujIhm81k5Qz91teP35RVhnk9sAXXjMPVZUJ5eAwdb9JfotMAR5q7
   nWrsR+DGwEQWXweSxE2NXa9WYSlSceeFb5JRAAYtVycBWoSFhIZNTTFhy
   TVIephL32PDW62luCF1F5QUF2dJot0e/jNC1bNGOKaAzC114q6Unc7YrH
   wYFftdWpj4kZlJg8QUw3UF93zp2K742sh3Y11hFQ0RS3rxCHviH6ZnfIC
   w==;
X-CSE-ConnectionGUID: ZH4U9zgwTpyL2aTDAxSUrQ==
X-CSE-MsgGUID: Xo9xn4jDSMWqLtuvfvwy5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34519505"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34519505"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:20:19 -0800
X-CSE-ConnectionGUID: ydqyCWpNQgi3Vuu9fMjnlA==
X-CSE-MsgGUID: /ptvoKw/T0qwVs2LVLtslQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100294347"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:20:18 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0294811F81D;
	Thu, 12 Dec 2024 09:20:16 +0200 (EET)
Date: Thu, 12 Dec 2024 07:20:15 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-csi2: Update D-PHY startup on V4M
Message-ID: <Z1qOr7oSdIr3R3ee@kekkonen.localdomain>
References: <20241210155400.3137792-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210155400.3137792-1-niklas.soderlund+renesas@ragnatech.se>

Hej Niklas,

On Tue, Dec 10, 2024 at 04:54:00PM +0100, Niklas Söderlund wrote:
> The latest datasheet (Rev.0.70) updates the D-PHY start-up sequence for
> D-PHY operation. Unfortunately the datasheet do not add any additional
> documentation on the magic values.
> 
> This have been tested together with the MAX96724 available on the single
> board test platform and it works as expected.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

This looks like a fix. Is there a need to backport it?

-- 
Regards,

Sakari Ailus

