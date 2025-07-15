Return-Path: <linux-media+bounces-37745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E8B053BE
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11CFB1C21684
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56E7272E44;
	Tue, 15 Jul 2025 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iK9kHK/B"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4C126FDA3;
	Tue, 15 Jul 2025 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752565966; cv=none; b=NKVFhLuoMG4KZE2geYXhftGlCJXaNG8FVjPzCEfGg16/SRLrZ+Jbx7JxAqIDFIP3TkZutpfB5VguzDi5/geDt96IGjLyF1sK+Z7Var0h4io1PuhJcHHzwllgZtC3AczrhpqiMCzrxHDoiC1ZGmwTVaaagPMQgq0iw2ltTf5w5no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752565966; c=relaxed/simple;
	bh=TDDmRdjT84u48yD4RSWxbbFtdti9g6GpucndxJB4rQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMmaBH4jC9VVUEWCyDllobN/C48LmFs3lojCOpATlr1ImHIKoRk6jl5r37FNii6Vv1Qu9SY8zRFkhIpd0FktUpnZnb0y7c0zDefX9LKQ1RvabSYKb+rbMe0ahKRVK+dqLUEmCNN+5kQeYZcQBADr8aePsvTqIAafUZTCN40pZkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iK9kHK/B; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752565965; x=1784101965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TDDmRdjT84u48yD4RSWxbbFtdti9g6GpucndxJB4rQw=;
  b=iK9kHK/B9cyvqO3bBMW0pzptZiDHuLY1O4pb1yvyEPt5LtZYV+lxsMC/
   MNCjkrtfvpBh0Hh6dpIkFUcg1EvvMpbn/IYBJPvr9bGtn8v4jp+QM0wfl
   Vv8VGsUsxzeWIfT8NunK3d7M4CwV8lepAFJ7/tJghJNIM3UWXwqsUKvlI
   KctyQKLU8kiT+unKAxgJlL+vkJ+a+BYc9tpLrTLlpZGUcNFVSDEYVs0sX
   p9ZCgzdqGdR9gtb2jWK4UOFKAtMOMVFWsn8uHTEFJ5x4smqGTAYEnfnKM
   Zf+eKTg+Lh9yV5oAhRokCoUleJEh7tuAphJJta6b1b/If7IS2g4MEPO1H
   Q==;
X-CSE-ConnectionGUID: on/+zNjtTBK54rjfnbke1A==
X-CSE-MsgGUID: SsU+Oi0UQO6qXm/EeV8XIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66133013"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="66133013"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:52:44 -0700
X-CSE-ConnectionGUID: n7iCKhdFS2ORoc6wGg+oVw==
X-CSE-MsgGUID: wkN6zqMBQEmIJOyBufLmCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="156567416"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:52:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubaSr-0000000FaYU-10uB;
	Tue, 15 Jul 2025 10:52:37 +0300
Date: Tue, 15 Jul 2025 10:52:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Timo =?iso-8859-1?Q?R=F6hling?= <roehling@debian.org>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] media: atomisp: style fix for trailing statements
Message-ID: <aHYIxHdNmIkdP0Jm@smile.fi.intel.com>
References: <20250714133701.48174-1-roehling@debian.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250714133701.48174-1-roehling@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 14, 2025 at 03:36:54PM +0200, Timo Röhling wrote:
> Fix checkpatch errors "ERROR: trailing statements should be on next line"
> in drivers/staging/media/atomisp/pci/sh_css_params.c

With period added to the end of the above

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



