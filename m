Return-Path: <linux-media+bounces-4339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3357B8403B3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 12:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656761C22A1B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 11:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F975BAC4;
	Mon, 29 Jan 2024 11:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEwW/BDT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9925B5C5
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706527299; cv=none; b=iuy2KYsR200cvCdOSeP4UWhLJLmFk34fyJyNLFEELomJmyMaEQ4/FEBiCwstFH1wiPj0JuDAfac0gN3fVsuNH15ZBN3GtVIEEiygc93Gn/XyX2eZDRajxfgvOGuItnZhhaXizBfQu8sYy7NGOc6CO7lIwmb9DmKg7b2ui2Ee25g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706527299; c=relaxed/simple;
	bh=OkmFWCXfkswgKeEkNmgKaQvelzaCc0LaWu2O468wZLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrzOx9LPSwCgdNOW68qOGcbaL8cCp68FvPNfEmZZpGaCe2PCljIypd+0k7gnet/5JNXKR/fusp4GfJWeRUPLqicsa4HGWlQMkUe8HbzDeosCTV+NLn1VrvuM6Fe13zCtNNuTrARTrJtEdiQ6Ot6BDGqfIgv9IniMfeAj4H3rnWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEwW/BDT; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706527297; x=1738063297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OkmFWCXfkswgKeEkNmgKaQvelzaCc0LaWu2O468wZLw=;
  b=eEwW/BDT8Re2HJ/+yzLZ2I2MgTQRcMcwyZ9l/X1xl1jGxb0Z+X9z+TPE
   Rf2PMnziMXdElqRggoQnTaAEgMVCp/3bLjvyN4WRYvE7qOPfM8mFNY3TQ
   +2mr8mhiotFrCKQZ6iOkwJ5hH4mrGrjbb58Omj++0BTm1VoZK5o+k3Fok
   1GFbzyvUu61CFDvfi7SLIxq1cXbC8rj9gJYFF4peNpqM6orxrmMd7lKc4
   1S7U6QVzmMgFyLkwlMMPjIKDfNM0qFg2D7Bxpj/bZxEmYp/9xN5Kx3hg2
   QDzzA3GbXAiXP3Q4k/5bfxoaAziExPEsmzdsUvBNwKpQ1xi8Eks795TN8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="401788327"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="401788327"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 03:21:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="22073403"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 03:21:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4749C11F8D2;
	Mon, 29 Jan 2024 13:12:04 +0200 (EET)
Date: Mon, 29 Jan 2024 11:12:04 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Chen, Jason Z" <jason.z.chen@intel.com>
Cc: andy.yeh@intel.com, linux-media@vger.kernel.org,
	bingbu.cao@linux.intel.com, qingwu.zhang@intel.com
Subject: Re: [PATCH v8] media: ov08x40: Modify the tline calculation in
 different modes
Message-ID: <ZbeIBAwqRkDvjgQP@kekkonen.localdomain>
References: <20231018055841.1983430-1-jason.z.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018055841.1983430-1-jason.z.chen@intel.com>

Hi Jason,

On Wed, Oct 18, 2023 at 01:58:41PM +0800, Chen, Jason Z wrote:
> From: Jason Chen <jason.z.chen@intel.com>
> 
> ov08x40 quad bayer sensor ISP has the following work modes:
> - normal mode: full size
> - 2x2 binned mode: binning size
> 
> In normal and binned modes, different tline calculations are
> applied.
> 
> - normal mode: Tline value needs to be doubled as per the
> vendor's update.
> 
> Tline time = 2 * HTS / SCLK
> Exposure unit : 1 * HTS = 0.5 Tline
> 
> - 2x2 binned mode:
> 
> Tline time = 1 * HTS / SCLK
> Exposure unit : 1 * HTS = 1 Tline
> 
> Signed-off-by: Jason Chen <jason.z.chen@intel.com>

I think this is good, apologies for missing the patch earlier (and feel
free to ping me).

-- 
Regards,

Sakari Ailus

