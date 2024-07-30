Return-Path: <linux-media+bounces-15542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72569940BC1
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E2FA28C806
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24111922F3;
	Tue, 30 Jul 2024 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwgDIBQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56C339AB;
	Tue, 30 Jul 2024 08:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722328544; cv=none; b=FqFV2lwdw75nTVuqiUXtCdDomyGpySK1adcM6seqmBNO8EKzPtT2EoNkSwEOXC4LEW3y04Mu5YyxbzSDp8m+ET5122ZEFc8VdnvEk/gV6zO/OGA6k50Uwb9STBR9Z33n0jFYmQ9QA47iFRCPCz9A4ew/NbMx2OvJOSj3ZUvDN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722328544; c=relaxed/simple;
	bh=EYtZkFHcs/90GsLYzy3BWrx+r5xpNxdxKIXWeyP/NZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjePerzCyIMLMbVtzFovw3F+Sfe44dhAGsLZXzBfBIDAOYHbaDBcX9Kl4kBzWze7F5M680Fej0RrOxC6SpRM6mX/IYjvMdUaYpm9ZtUDeQ84ySLIqQezzgmjx4X6fs44HrS1ydh/dM9VRZ9pllC4C98Sf9PrYQTK5xdNGgF7EdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwgDIBQ2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722328542; x=1753864542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EYtZkFHcs/90GsLYzy3BWrx+r5xpNxdxKIXWeyP/NZM=;
  b=LwgDIBQ29lTe+K9BNKXj7lpoGmcumbDzvKWXl0d1ce2wZT5M0kuDFMzC
   zoORpUcZQ2GGzbKEJ+HT+NdokrI2h7uP9UaIyvUQjI71lnvAF1BdcGU22
   C3qyUOcUUpJyTMe54yqA+HBHLXcgNA1IWfJql6qhPtGcq01S22/9a/mFQ
   XWxLDGr/QdBQIB+SniERTHtSo8u/CL6MaOr2bo7o8jsae138v9+q/bKcY
   VSBGEuOmdIdBN9GOgH4VuPXWcSVw3zm0QnVNHwlJy2CjiE+oiqJKEzxwk
   i3tNJf7Dkavt7yjzur5Pul6zk1EGXOuTmLJ6lM7XGDioKh2+3ATTEPF6P
   g==;
X-CSE-ConnectionGUID: nCpW/eRSRqCysAVxs8REvw==
X-CSE-MsgGUID: Dj8PsZV0QUOF85KjoNjqHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19971724"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="19971724"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 01:35:36 -0700
X-CSE-ConnectionGUID: 0dEppVcvT4O3e4jHQh0q6w==
X-CSE-MsgGUID: Quhk8FgzRqCwFUtiOlyUhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54516365"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 01:35:35 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8BFD011F811;
	Tue, 30 Jul 2024 11:35:31 +0300 (EEST)
Date: Tue, 30 Jul 2024 08:35:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	20240627151806.3999400-2-tomm.merciai@gmail.com
Subject: Re: [PATCH v2 0/2] MAX96714/7 style fixup
Message-ID: <Zqil0ykVdWAj47-J@kekkonen.localdomain>
References: <20240701-gmsl2-drivers-style-fixup-v2-0-6b02bd6c1e41@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701-gmsl2-drivers-style-fixup-v2-0-6b02bd6c1e41@collabora.com>

Hi Julien,

On Mon, Jul 01, 2024 at 11:31:41AM +0200, Julien Massot wrote:
> There was still some open comments from Sakari that haven't been
> addressed.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

This no longer applies to the current media stage tree. Could you rebase
it, please?

-- 
Kind regards,

Sakari Ailus

