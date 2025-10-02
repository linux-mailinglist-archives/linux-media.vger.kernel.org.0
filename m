Return-Path: <linux-media+bounces-43536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DFBBB2BEF
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 09:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A38611C4E5D
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 07:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B51E2D0275;
	Thu,  2 Oct 2025 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUIebdwf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5292D248A
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759391689; cv=none; b=jgU0Wtl70E+O3+xPzvdytvNuBj6I1OPh4e1a2jmBUKgOh9Dsgsw4bC4RmmWG8pTH6lwsOj/C8T2+v9RdrJkBUSrAR+yBIhm8wXEhwg472btiCu/YSIJv5SqsYKEO49+0tCT/M1dZxmM1sQSHxnPQTHVBfngkGVottG5AKxjvO3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759391689; c=relaxed/simple;
	bh=PESRqT1ZL5WB/T5vTu/3POikFgHWElD5aFisjoQnshs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfCyvGBv5Z0XVvEfSyEJ4U6bMlwVTDTxgcjrp/d5fiG2pXF89arxoz+eBHhS/6VxGcioWZNX1HjiTlWNpsMLJRb150Jc8oqHqNqco+iBtG87GXOGQL6AgvLvB74Sbs2krGzB+INP4/V8Kho7V/Qk+upFEa9osdefkFFdTErDLSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUIebdwf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759391687; x=1790927687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PESRqT1ZL5WB/T5vTu/3POikFgHWElD5aFisjoQnshs=;
  b=NUIebdwfc4BCA+EG+2olCyVQ16NekvY8A/8SDR+crzdPjNrMuG4jMLYa
   OLgJqCTny2x+zzFMBb7RLRUCORnhJOapR5qP7GOU4lQvavmpdYdct09LW
   meMoXxeizfTCsYTZI8STRF4Elols7TChT7+wkpRBZq1YqTfQDURj/zx+S
   2+AUbjRa2Lc9Y16UiSO9Pw1g00c2HzZpnbrtQFwTot8L46Ick56w0kncZ
   q58rh/jlowNxAyOhPtSSzpLjIS4O94kfzSB+Ban5QjX+n3m77LNnMBaVO
   ngmlwx/B0MH2oHJ3EdKZZC+KFBXDR1JjZeMsTXDdW3JI8Cp/pUR7ALcFT
   Q==;
X-CSE-ConnectionGUID: LB9OFEVeSUukQydcv6Wrkg==
X-CSE-MsgGUID: f8te//lRQcKYvZV0rljj5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="87118210"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="87118210"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 00:54:46 -0700
X-CSE-ConnectionGUID: ASIC8DJlTci22RTZ18sibw==
X-CSE-MsgGUID: 5w6Py9yCSeO6w7cm8AgOzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="178939328"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.175])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 00:54:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7C55D121EC3;
	Thu, 02 Oct 2025 10:54:37 +0300 (EEST)
Date: Thu, 2 Oct 2025 10:54:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 39/66] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <aN4vvf2dRk9mCY_q@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-40-sakari.ailus@linux.intel.com>
 <osdr2eavm23pzxrd73v4xscdtaafon3vllhzcg5r6eoqwclsfk@xgfnicn6iboj>
 <aM1J9LsbpueEr30x@kekkonen.localdomain>
 <5fwlztz2q2fewyml774my3sdw3wv5wdhnl6p4mfbubm4erm5ft@sthie2bobklf>
 <aN4lQPK5Mqve2bUI@kekkonen.localdomain>
 <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76>

Hi Jacopo,

On Thu, Oct 02, 2025 at 09:22:32AM +0200, Jacopo Mondi wrote:
> > > > optical black pixels, dummy pixels and other non-image pixels. The full size of
> > > > the pixel array that may be captured is conveyed by the format on (pad, stream)
> > > > pair 1/0.
> > > >
> > > > A rectangle within the pixel array contains the visible pixels. Capturing the
> > > > non-visible pixels outside the visible pixel area may be supported by the
> > > > sensor. The visible pixel area corresponds to the ``V4L2_SEL_TGT_CROP_DEFAULT``
> > > > selection target on (pad, stream) pair 1/0.
> > > >
> > >
> > > Just for sake of discussion: in libcamera we support multiple,
> > > possible overlapping, active pixel areas:
> > > https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/property_ids_core.yaml#n594
> > >
> > > tbh I don't know how common this is, but as far as I can tell we won't
> > > be able to describe them here
> >
> > Do you have a sensor that would support this?
> >
> 
> Not really. Do you think it is a valid use case ?
> 
> I'm just mentioning it because in libcamera we prepared for that but
> I personally never had to deal with anything like this

I think this might originate from Nokia N9 where the sensor's pixel area
was documented to be cross-shaped. :-) In reality, though, the visible
pixel area was rectangular but the vendor made no claim on the quality of
the pixel data in the corners. In practice these areas were just fine (but
naturally lens shading was worst there).

In other words, I'd keep such information in the user space.

-- 
Regards,

Sakari Ailus

