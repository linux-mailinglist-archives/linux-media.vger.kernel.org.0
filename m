Return-Path: <linux-media+bounces-25125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 692CEA19128
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 13:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A4247A0544
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 12:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B70D212B0F;
	Wed, 22 Jan 2025 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAVOt8iK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A92D5A79B
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737547716; cv=none; b=XzkhZFmVuTzoKalCcoKBbETMstmbGavSN7S9uLx63d5HCs9Adcz/eU2ht9GsqDY05yBE6weXlCEzFdLdSdthlN4rzIYZWepdIM6jZImx/dLcTXH8UNqRiZZ8LmAlKBNMbbz4dWi23wipN4tal2bUBPAxLOoMYkDc4tZvcT2VdAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737547716; c=relaxed/simple;
	bh=vJpmJh4FjfrhwKns3AnMw8hhUKoPS55h+SpE6qbm6/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3IGvCe9g8+y4y6kp9PSloh7uwER4lSBl0T0/xR0VFP67EXjqf0NKeED8Cyj8SL9imnA44cy31Ab8KHyElsUrgsAOH50qnIQbSvzklfgcM4657/b6Awxa2GXN6FqEsc4Kya86BYDDL8QiqKhRkYVssRaDG0ooJtE6ivi3JPQYHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAVOt8iK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737547715; x=1769083715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vJpmJh4FjfrhwKns3AnMw8hhUKoPS55h+SpE6qbm6/k=;
  b=RAVOt8iKacDtgx0TfgJD59tuO1QTEnl+ou4sk1rKl2prOW0uqP7Out+H
   WLJUbWY3frjtktovaOUZVIbVyOMC29suYCj6LxdrXfnVJ7ROiLGNvYyj+
   LQrCgWhlnsO8g50RlcG3KTDMAutaJe4cgbCnoC3rLOq2XDjkiI1CdMb5F
   +OBhcKZj3cbw7BxiUAXICE6hboWlT50XMPI9WtfNobePbVFX4wWfcWYu/
   6W2oOq0m/4tl3Q82SwRHTMZMP6m0rzc3wSEhha4+y0cjtS6nkl27Dk9ZH
   PT1VejLzIaVQEhX2tuMo0ONaIfSmrlDggeCH407/DU/usut/io3Gt3xIE
   A==;
X-CSE-ConnectionGUID: Smn3D6f5SyypuiTHxNwSWw==
X-CSE-MsgGUID: MIHvNW8TQfWsvyqUpyL1KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37917606"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="37917606"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 04:08:34 -0800
X-CSE-ConnectionGUID: MN7RfT8qSryUYgpsOXVGuA==
X-CSE-MsgGUID: sYBjK6ZIRjS5JS4zKYipEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112099718"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 04:04:23 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 838BB11F944;
	Wed, 22 Jan 2025 14:04:20 +0200 (EET)
Date: Wed, 22 Jan 2025 12:04:20 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@kernel.org>
Subject: Re: [PATCH 0/2] Fix PM on imx214 error paths
Message-ID: <Z5DexPyuveWLzlJm@kekkonen.localdomain>
References: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
 <2eca7df04384f81372c30f6711871a53d8063174.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2eca7df04384f81372c30f6711871a53d8063174.camel@apitzsch.eu>

Hi André,

On Mon, Jan 20, 2025 at 08:57:39PM +0100, André Apitzsch wrote:
> Hi Sakari,
> 
> Am Donnerstag, dem 16.01.2025 um 13:46 +0200 schrieb Sakari Ailus:
> > Hi André,
> > 
> > I'm posting this separately as it seems to be backportable, your set
> > needs to go on the top. I've pushed that to my "devel" branch in my
> > git.linuxtv.org tree
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/>,
> > please let me know if you see problems.
> 
> The patches look good to me. I don't see any problems, but I haven't
> tested the error paths. That's why no "Tested-by".
> 
> Acked-by: André Apitzsch <git@apitzsch.eu>
> 
> Shall I send a new version of my patches rebased on yours or can my
> patches be taken from your "devel" branch?

If you're fine with the result of my rebase, there's no need to.

-- 
Kind regards,

Sakari Ailus

