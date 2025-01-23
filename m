Return-Path: <linux-media+bounces-25188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBD2A19F45
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 08:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6477A3A112D
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 07:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E144420B803;
	Thu, 23 Jan 2025 07:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1EXfce1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF27200BB2
	for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737618269; cv=none; b=qxtDr9qBng8O+eXgIU2tX7c7t8YFU6Ph/PmKdppqSy5pTCBYXXzzWV4QBGf5fL1QulLe2AbGBGtOpK6VoT1iWpWolxxQEGqPeZfMy5zF+NLXOOkvs5zDp1fRGHyuK4zp5hRlzBbBDSOofhjG/QL9D68laj8uRLTIY2/ES/lIfxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737618269; c=relaxed/simple;
	bh=5fIU78SyQIAxx8AVreJS0fvIBb1LPTI2k/ATyUk2LTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/79wEWbiFNeG3sn0jl61RYf1VoUsO5L041gNh/MbbfF9B4N7ButHKZlhTgbHdReQk2CoGrsVPvZrjHXn9+qiTgIpqOptUk5LaiX8UUFAQJvN9P4yBKOQnlK8QucpXDqyjcvGws81DlLNrzD8cEAJ04AC0XF4/t5WIJmtyU+oyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1EXfce1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737618267; x=1769154267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5fIU78SyQIAxx8AVreJS0fvIBb1LPTI2k/ATyUk2LTs=;
  b=Q1EXfce1JzU6mx+RxpWp3NEN9Ve66qcmEfUfaI+EHML+x8F5Tdw4999D
   3JRp6MpVqHa1qib4BxDlFR7l4NOls713EVHnsfKi8h1RzNY5qomnyeUMk
   +wKhbekqggmXzUg87Ypjna96YrCuff94lPgguDVNgiZl9jQsugUY2/u0J
   IEJHEq3sFe1F6nfCouhRhvOC4GiGv9PlgAubWoOobzJbRncYdJlEeuIUw
   o3YM3H4ehRyXBy/Fy/5aHOw7kI88zrT4rwbEZAzQL6FgU6r86y97KQDzl
   s2+/erwkF5R9l71BjMdgWMz6igOR5pqfcJ3sTktwTM1cRZuzvlBpnKHaD
   Q==;
X-CSE-ConnectionGUID: 8zoHfWIdRzukimmPUQNs7A==
X-CSE-MsgGUID: 2QodPhVSSnKOU4vppP/UHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="63453166"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="63453166"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 23:44:26 -0800
X-CSE-ConnectionGUID: n0h5vZk7SBuVDvZLkd+LUA==
X-CSE-MsgGUID: ZRGGHzFVR2OkHHtIS3XgXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138251989"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 23:44:26 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EFB3C11F95E;
	Thu, 23 Jan 2025 09:44:22 +0200 (EET)
Date: Thu, 23 Jan 2025 07:44:22 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@kernel.org>
Subject: Re: [PATCH 0/2] Fix PM on imx214 error paths
Message-ID: <Z5HzVupCvL7LBhbC@kekkonen.localdomain>
References: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
 <2eca7df04384f81372c30f6711871a53d8063174.camel@apitzsch.eu>
 <Z5DexPyuveWLzlJm@kekkonen.localdomain>
 <19c569694ef2726172fced5a1a30ecab912553d8.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19c569694ef2726172fced5a1a30ecab912553d8.camel@apitzsch.eu>

On Wed, Jan 22, 2025 at 10:00:54PM +0100, André Apitzsch wrote:
> Hi Sakari,
> 
> Am Mittwoch, dem 22.01.2025 um 12:04 +0000 schrieb Sakari Ailus:
> > Hi André,
> > 
> > On Mon, Jan 20, 2025 at 08:57:39PM +0100, André Apitzsch wrote:
> > > Hi Sakari,
> > > 
> > > Am Donnerstag, dem 16.01.2025 um 13:46 +0200 schrieb Sakari Ailus:
> > > > Hi André,
> > > > 
> > > > I'm posting this separately as it seems to be backportable, your
> > > > set
> > > > needs to go on the top. I've pushed that to my "devel" branch in
> > > > my
> > > > git.linuxtv.org tree
> > > > <URL:https://git.linuxtv.org/sailus/media_tree.git/>,
> > > > please let me know if you see problems.
> > > 
> > > The patches look good to me. I don't see any problems, but I
> > > haven't
> > > tested the error paths. That's why no "Tested-by".
> > > 
> > > Acked-by: André Apitzsch <git@apitzsch.eu>
> > > 
> > > Shall I send a new version of my patches rebased on yours or can my
> > > patches be taken from your "devel" branch?
> > 
> > If you're fine with the result of my rebase, there's no need to.
> > 
> I'm fine with that.

Ack, thanks!

-- 
Sakari Ailus

