Return-Path: <linux-media+bounces-45106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56EBF4F62
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 09:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 308084E4556
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 07:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BD927CCF0;
	Tue, 21 Oct 2025 07:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZoyUurd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FCE279DB7;
	Tue, 21 Oct 2025 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761031750; cv=none; b=NxieQ1BLa+WIVpeRbw9VZCDb5O8leev9pmEOsSlJPn1LT+gGP5KQ8TSYMyTONxUn0cZPxqhmPrffmQQaouUNp+VUJrXehsIHh8ViO4d/ga8QUgNN01p787lnpBh6QHpewhrfGW35sukD7rP0j1dVY2qgJVu/vsHzCPm3YpCZ1KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761031750; c=relaxed/simple;
	bh=e6fMCWbmpUtZcRxSl3ZBtobW+DNa+kzWyu7xbqW/VkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/V/oYknOBqvkG3yZxv4ky+BWCiznghjeCpmP1ccYuqHBoMTYoB8jZeQKn2NP1Pl63sNQZRczrcLIlRmEB7rGfij9e8hFR9d3bD6ZMdr0CvAtueK7SsYlbX5ZgDuw0Nd5O7FOzH0aakCOPn1JM6S5SOR46dOsJWYpcvjXdA1YlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZoyUurd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761031749; x=1792567749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=e6fMCWbmpUtZcRxSl3ZBtobW+DNa+kzWyu7xbqW/VkA=;
  b=jZoyUurdA7tnproH/XeGG8hdp7Wz0/MjAVUorx7FpgVAH3LH/hL2FduW
   +6C4YicTQ9ApgUCOCrXi9keNArqRHZd5p2Jip2dFzjyuHI2v7b1CpQUg4
   uzYhe4M0T2OC2tbXrpS31PwvI2VvGADhI7fT3N5wt3Od2DUVv0BwiDmMR
   PNvAlCld8Lkr4R4mlSoCYkE1cDHoAGY4nQsx5TQRHaQ/oxyzrujA+PP9w
   Xc4Wy5FIMnSvB50p9yZTZZWPM1s/t4cIBJjp1UJz/fhEbQLX6/NrVSdBt
   ICk0/3w83Uk1TYbT95OzGcKMGbL/XtKhU1BmwVylH2FWylOR6z1KOBT5l
   Q==;
X-CSE-ConnectionGUID: +8JgjcyjQYmdKk8dOkXk5w==
X-CSE-MsgGUID: LKbYOEz4ShaALpyEXvPLnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73757856"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="73757856"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 00:29:08 -0700
X-CSE-ConnectionGUID: KGKmE5TbTEqXl2dTs5rO4g==
X-CSE-MsgGUID: EP3ix8R9TT2ZXkgvOoMQbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183469149"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.134])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 00:29:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CB76211FCC3;
	Tue, 21 Oct 2025 10:29:02 +0300 (EEST)
Date: Tue, 21 Oct 2025 10:29:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 0/8] media: i2c: dw9719: add DT compatible and DW9718S
 support
Message-ID: <aPc2PoGa8mTx7KT1@kekkonen.localdomain>
References: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
 <790fd7d05fa03f788f0a628a99b2e127db824207.camel@apitzsch.eu>
 <750398e8-1781-47be-bccd-e2679a58d449@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <750398e8-1781-47be-bccd-e2679a58d449@kernel.org>

Hi Krzysztof, André,

On Mon, Oct 20, 2025 at 10:45:51PM +0200, Krzysztof Kozlowski wrote:
> On 20/10/2025 22:40, André Apitzsch wrote:
> >>  .../bindings/media/i2c/dongwoon,dw9719.yaml        |  88
> >> +++++++++++++++++
> >>  drivers/media/i2c/dw9719.c                         | 110
> >> +++++++++++++++++----
> >>  2 files changed, 178 insertions(+), 20 deletions(-)
> >> ---
> >> base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> >> change-id: 20250709-dw9719-8a8822efc1b1
> >>
> > 
> > Gentle ping.
> 
> Please apply the patch and run checkpatch. Probably you received
> checkpatch warnings from media patchwork, no?

I've fixed it this time while applying it.

-- 
Regards,

Sakari Ailus

