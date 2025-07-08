Return-Path: <linux-media+bounces-37166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8D6AFDBEB
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 01:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF981179412
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 23:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3353E239561;
	Tue,  8 Jul 2025 23:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNEwkhfO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A86221287;
	Tue,  8 Jul 2025 23:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752018202; cv=none; b=DMeMCSW5APUYKzK31YQk5zU9ftP81lX20JHi2nm5r1QLvmoaaNg2i8OHx697/XMERvuRiXIajTj5CWNjaa2L+y9T7tiDVsNbNuCCc/RZJV6oH54Niho+7a94bqLTecKMihLmP6geluyeThUaJT6rgyA6IQrPY4Xj2Si6VuMIjPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752018202; c=relaxed/simple;
	bh=Kq5ijTYz747uA6zYNY77sRKx7BtVxap2T4sA5mPV2qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFfIqlUdtU1/bsjJBHjejRtFPUvpe/2Lv/wsDA4eV3Ew5bTtEdmzcptbTfBruyYRGr3YLB5927p2nKUGDxoO1SMQw/F9tkhrYPAbbywFAOzR8qtavdwCNp61yywB1e3e0JNkobugeAWWkbz9suv4sLpTLWRFe9a5VX6LkfZm0jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNEwkhfO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752018202; x=1783554202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Kq5ijTYz747uA6zYNY77sRKx7BtVxap2T4sA5mPV2qQ=;
  b=hNEwkhfOUkgP4GBvQ5uDdNP1snKmZiwfKClU47xzwnnl/NZ+qzy02wX+
   8+qBPbCzSy85SpaceAbNCvkpejs6x1tuRLb0bYkU0Nq5LelLQ/SP66eHJ
   V+cXC27ix4Gd4XYOv6oDKnR4rdi5M6hKAU/4bXKQwNgGMMny9B5B7Ya8r
   UcUEfneZG7Nrlh7+p63U31be8gJdEIMeiz6ecz6eRgnZuD3ldTtGcTM3m
   ZNdr6qfI6c0ND++gdugPkgNVRbTDYnKo4BVcZTFKnNL84waJ9PPDA7BNU
   lRM9TipPp4Q0YgtIM27vFe//3BAf5+LVyUEkZDJPXDYAia3tVfl/aHoGD
   w==;
X-CSE-ConnectionGUID: KyWt2BgZSyywYVcR0lFe7w==
X-CSE-MsgGUID: 1H7yiry+TFSBfymZkZ+SSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54242152"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54242152"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 16:43:21 -0700
X-CSE-ConnectionGUID: gy+0sCqNSRWvODfH+QWvHg==
X-CSE-MsgGUID: DHQVWidmQaC9j4fXcFDnew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156202497"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.102])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 16:43:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 26E4F11F8A6;
	Wed,  9 Jul 2025 02:43:12 +0300 (EEST)
Date: Tue, 8 Jul 2025 23:43:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com, robh@kernel.org,
	krzk+dt@kernel.org, bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
	alain.volmat@foss.st.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com, festevam@denx.de,
	julien.vuillaumier@nxp.com
Subject: Re: [EXT] Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S
 raw sensor driver
Message-ID: <aG2tECZaT3IsOV0z@kekkonen.localdomain>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-3-mirela.rabulea@nxp.com>
 <7c4379dd-e004-4e0d-85db-139c3f671edc@linux.intel.com>
 <3df6d174-ce7d-40ff-a7e0-fb9e8a9ab435@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3df6d174-ce7d-40ff-a7e0-fb9e8a9ab435@nxp.com>

Hi Mirela,

On Tue, Jul 08, 2025 at 08:09:25PM +0300, Mirela Rabulea wrote:
> Hi Sakari & all,
> 
> On 6/29/25 11:30, Sakari Ailus wrote:
> > Caution: This is an external email. Please take care when clicking links
> > or opening attachments. When in doubt, report the message using the
> > 'Report this email' button
> > 
> > 
> > Hi Mirela,
> > 
> > On 3/5/25 11:43, Mirela Rabulea wrote:
> > > +struct ox05b1s_reg {
> > > +     u32 addr;
> > > +     u32 data;
> > > +};
> > 
> > Could you use struct reg_sequence instead, please?
> 
> Yes, sure, thanks for the hint.
> 
> Any other suggestions, anyone, before I send the next version?

Do you intend to align this with the common raw sensor model? It may still
take a while until we get those patches merged though, but the upside would
be there's on concern of backwards compatibility. We should discuss how to
implement HDR with that actually (Laurent is cc'd).

-- 
Regards,

Sakari Ailus

