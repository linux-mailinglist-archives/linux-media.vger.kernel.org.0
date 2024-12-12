Return-Path: <linux-media+bounces-23283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F009EE4E8
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 349CC1886DA9
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403072116E9;
	Thu, 12 Dec 2024 11:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXSkSqhW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B261C5497;
	Thu, 12 Dec 2024 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734002497; cv=none; b=ddzbhnaT4BTFYe7BKQEqCwNuz2e3Bcsg2MjpYg1BVca9F+C3h0eohRGHK+j5Pn4XC5508gPBogHuHwoTPnzmC6is/wJ7D/+OJtlzvtVYeaQqe+S3WS8s/ZWWPZsKXJ22xG238LLy3EwCiSxmE5+3OSDvYRsVzFPGloGF75SDdAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734002497; c=relaxed/simple;
	bh=Cxs5wlwHaqxXBJ+0aCGz0QuRMvUaYmRrKMIx/Ep776M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5uClSU81b1jDgjqTqjU4G2KYUqH+cI0JU+A0BbClMs5X8IT7SyF7ZJ3DSVgNHuUUcDKPWECZuwy/WGEqB2nI0WpOw2gBsOb3zhDzJlV+lCl/N3Aic8SZ2etWr4Wkp7b+S7ZMMKe8P4Wh4dH/ruUp6kzDVZl46zLffXzRAeAHro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXSkSqhW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734002496; x=1765538496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Cxs5wlwHaqxXBJ+0aCGz0QuRMvUaYmRrKMIx/Ep776M=;
  b=hXSkSqhW3yacONlyq0swkVA+cWT97MKw16f9Z2tRU0kZeKCFWYxzL794
   0B2iS9uJWElydrzT1SiK2eL2ew+M4Q2AGP5oml59nceS1zKsu3TVCgFwa
   XulL+6FVogwN2W9lFBIZZoKqHKgaMyJ7UMYqUTXL9lrnVdeaMOuQYgF3l
   4WFo/I8F+xL2k4hcgklzY1/97BY3P3CJ012D3EhvP7SyM8fMCObI4H9AU
   KPyTIP7aoF1f7tZIYaxWxzJ6MH3Klp273zUcSvKN/ePtP9hyB+n/+IHk+
   l2/p9HJFjvP/8MiTGX/EK6DyBTXOOlxF2p1Bo7WU24tzYb05iyhg0J54/
   A==;
X-CSE-ConnectionGUID: E4pFywY9RnGup9wyXigVLA==
X-CSE-MsgGUID: kT8t5g8gSwOAJBEgiVQcWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="56887284"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="56887284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 03:21:35 -0800
X-CSE-ConnectionGUID: eRjoKKPNTLKHVjKXFQhXGQ==
X-CSE-MsgGUID: zo0xpUmRRFuuINHO1BmT6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101150848"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 03:21:29 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3E17D11F81D;
	Thu, 12 Dec 2024 13:21:26 +0200 (EET)
Date: Thu, 12 Dec 2024 11:21:26 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-csi2: Update D-PHY startup on V4M
Message-ID: <Z1rHNrPI6oyA-Bwx@kekkonen.localdomain>
References: <20241210155400.3137792-1-niklas.soderlund+renesas@ragnatech.se>
 <Z1qOr7oSdIr3R3ee@kekkonen.localdomain>
 <20241212100445.GB878403@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212100445.GB878403@ragnatech.se>

Hejssan,

On Thu, Dec 12, 2024 at 11:04:45AM +0100, Niklas Söderlund wrote:
> Hej Sakari,
> 
> On 2024-12-12 07:20:15 +0000, Sakari Ailus wrote:
> > Hej Niklas,
> > 
> > On Tue, Dec 10, 2024 at 04:54:00PM +0100, Niklas Söderlund wrote:
> > > The latest datasheet (Rev.0.70) updates the D-PHY start-up sequence for
> > > D-PHY operation. Unfortunately the datasheet do not add any additional
> > > documentation on the magic values.
> > > 
> > > This have been tested together with the MAX96724 available on the single
> > > board test platform and it works as expected.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > This looks like a fix. Is there a need to backport it?
> 
> It's an update to the start-up sequence. Both the old and new sequence 
> works in testing. As the datasheet don't document the magic values it's 
> hard to tell if this is a real fix or not.
> 
> On the other hand, the DTS changes needed to use this device on R-Car 
> V4M are still pending upstream merge so we have no in-tree users of this 
> device. I don't think we need to backport this change.

Ack. Thanks for confirming this.

-- 
Sakari Ailus

