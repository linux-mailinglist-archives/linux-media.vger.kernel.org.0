Return-Path: <linux-media+bounces-45186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3099CBFA472
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 08:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D1849347392
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 06:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80062EFDB2;
	Wed, 22 Oct 2025 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eplp/Jif"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CF224AEF;
	Wed, 22 Oct 2025 06:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115429; cv=none; b=rjh7IgTRqM/nlEYMzpfL2IhncQ0JR7SLHoe/iVFLHYHmfOMrCjqMQMdRFjj0CNyJdLAQOqkXLl4dtobrTjHaX0l4nld2rojIkVenHM/jToBBkpVV54XQeGDZnuxbg4Tr2ZCf1/b7i1rCJfCUT0vpL2nByP/oLG1KO+PVy7D2WDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115429; c=relaxed/simple;
	bh=MhzvnFVmPRiQtq/rW0RZfyHbgqu43fsyooR80W/iQqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luwqT1ztIQJsNsyTeYghKYGsVNAHI8hjOeMESNWRrKyS3IQGoAPayAfUqHwUL/I3K63rE9A2ZDVI2Ay0z94TE9/WRHvAcwYoXjzsoirpS2Q8cUJ0pPfpjoJvGO1yVqj5HLMIS9GMXI2glsBtMuh6rJViKls5HyGVs+E1c3bzAuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eplp/Jif; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761115427; x=1792651427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MhzvnFVmPRiQtq/rW0RZfyHbgqu43fsyooR80W/iQqA=;
  b=eplp/JifYgcY0SRmC8toAML55CQ01ipU3FhIh0kcsWJoYZhp5WNqQYdN
   mk20iMA2+B2/sWcL6DaaPEOvJjPNmt/jMxSna5tW5XIy9rgU8/babHzTK
   0Cil7ZyXeJM8h8SaLoCFoLnjSZ9BOdOE2EUD3MC911AGwTuvNxNJk7FGz
   SWC5+C1n2EI/0/V09jSL4XvjalVBOndf0auZYJVVBxp3ewu6NJJ9fMh+n
   Km2Epotk4SCpfdIokx4oZ5/xIS/W8WFjn7VBJeBAPhywdgROBAW4YfJzK
   XrY8Y2JfMS+CxjGd0AiAoeUiuNwWAm5vFSzo8N1FGw9lv2phEQZ5d7OJc
   w==;
X-CSE-ConnectionGUID: txFWC6gnTLqda7i/dThukg==
X-CSE-MsgGUID: q649Jod2TSeQhyWeD5ORmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80877816"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="80877816"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 23:43:46 -0700
X-CSE-ConnectionGUID: UJ+WENF2QCWznUc8A/NHoQ==
X-CSE-MsgGUID: aSUB8PRTQgGdyezSV5jx3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="182957991"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 23:43:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8222311F87B;
	Wed, 22 Oct 2025 09:43:40 +0300 (EEST)
Date: Wed, 22 Oct 2025 09:43:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <aPh9HDN-z4VsNz5_@kekkonen.localdomain>
References: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
 <790fd7d05fa03f788f0a628a99b2e127db824207.camel@apitzsch.eu>
 <750398e8-1781-47be-bccd-e2679a58d449@kernel.org>
 <aPc2PoGa8mTx7KT1@kekkonen.localdomain>
 <2232bf5e29f04b3af7ceb5f5d2a9edda295691f9.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2232bf5e29f04b3af7ceb5f5d2a9edda295691f9.camel@apitzsch.eu>

On Tue, Oct 21, 2025 at 10:08:06PM +0200, André Apitzsch wrote:
> Hi Sakari,
> 
> Am Dienstag, dem 21.10.2025 um 10:29 +0300 schrieb Sakari Ailus:
> > Hi Krzysztof, André,
> > 
> > On Mon, Oct 20, 2025 at 10:45:51PM +0200, Krzysztof Kozlowski wrote:
> > > On 20/10/2025 22:40, André Apitzsch wrote:
> > > > >  .../bindings/media/i2c/dongwoon,dw9719.yaml        |  88
> > > > > +++++++++++++++++
> > > > >  drivers/media/i2c/dw9719.c                         | 110
> > > > > +++++++++++++++++----
> > > > >  2 files changed, 178 insertions(+), 20 deletions(-)
> > > > > ---
> > > > > base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> > > > > change-id: 20250709-dw9719-8a8822efc1b1
> > > > > 
> > > > 
> > > > Gentle ping.
> > > 
> > > Please apply the patch and run checkpatch. Probably you received
> > > checkpatch warnings from media patchwork, no?
> > 
> > I've fixed it this time while applying it.
> 
> Thanks.
> 
> It seems you forgot to add the R-b tag from Rob [1] while applying the
> patch [2].

Thanks, I've fixed that now. I guess I accidentally while removing the
extra lines.

-- 
Sakari Ailus

