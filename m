Return-Path: <linux-media+bounces-41687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB7B4217D
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F212C7C27FD
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F33F302CA2;
	Wed,  3 Sep 2025 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SA1zweRo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400522F5485
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906039; cv=none; b=CQ11vs8KT4ZaMxSFnNvAuujWhOgE3Ir40TdB+ZTgI958xX38Zw42xKH3euyBt4MNg8s6B7Wwmqsx6k/giLkPndzPfA9QQcG0Nw/8yJwjnwIYl1uHVzc+MAjI6gUU99PK8FbkaDTffx4TANsyR9UtHOfXC0O5VKPhBe2YrUAt6Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906039; c=relaxed/simple;
	bh=jF9ZVexO2dBl+3IeuspfMbC1P0yc/Krbp1ba2XGXRFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5azol1mjaFbfpbmZrelZwj5EvXWd69iLVcIXJr4jMtGBjWqMLgVYl29tKrhzIUWnbiBSajoQe89WKEbBCmDDsibwipdYrJa70EJ0KdhiMmMScOpcHd5rX+w9IGU3ykGMHGva5Y5i3YGzlp6Oels5F6ocqn6FGebhuVgkm4gBzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SA1zweRo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756906038; x=1788442038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jF9ZVexO2dBl+3IeuspfMbC1P0yc/Krbp1ba2XGXRFM=;
  b=SA1zweRovbvVzSr2I1nqo1jQwDFqlIj6Jlmx7iMSBB8hOyJAUyH9J/fI
   vBjxiEIQXFZnP+KDIEFRpHYI9qz1mXvlXUI8ybWcuNH4aSMsl1T9qW664
   H5YWa16+3cLHpi7Vq5ImQaX8BaQ568WOk3kgFy/jkVil9Ua0kvOqrRVBH
   Q+wWd+HZ90hMvTH7XwH5LAKvfaQTZuLrqkmOmKzclGv2IkMW37/KsS8/8
   3fweZoEITZFHKSHCG5TNP4wzU8Ok1nrNPPCQZa/bE00MzpljAMeNUUKWf
   +OX2Ps/o8hgFyE1aINJfCGd2SWX6UCwlAjeWj0JH29/cru51f1J6URvuD
   w==;
X-CSE-ConnectionGUID: 83Y8AJSISH2FpsXMjZostA==
X-CSE-MsgGUID: cCh+JkfzTRSEFurBCF1yww==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59287003"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="59287003"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:27:18 -0700
X-CSE-ConnectionGUID: YwaNkLaLQDKLQ57PRuKSeA==
X-CSE-MsgGUID: jYaGOPxSRwWqSTZclfMkww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="202543766"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:27:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9423011F99F;
	Wed, 03 Sep 2025 16:27:08 +0300 (EEST)
Date: Wed, 3 Sep 2025 16:27:08 +0300
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
Subject: Re: [PATCH v11 25/66] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <aLhCLCvwXJTvhWui@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-26-sakari.ailus@linux.intel.com>
 <6z6xfkco4aiwolh6by4srcu7ec2zwzy3c4psptmm5hxlaqnc3e@wlo6k35pcsys>
 <aLgx2XqEtd7Uh2w3@kekkonen.localdomain>
 <by4ftedqmvek3mqxv7zqizhyreotdyd2yoakcf2td5y52t5tzd@acibdthu3adr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <by4ftedqmvek3mqxv7zqizhyreotdyd2yoakcf2td5y52t5tzd@acibdthu3adr>

Hi Jacopo,

On Wed, Sep 03, 2025 at 02:29:09PM +0200, Jacopo Mondi wrote:
> > > > +  internal sink pad (1) as the source of the image data and an internal sink
> > > > +  pad (2) as the source of the embedded data. There are two routes, one from the
> > >
> > > I would provide a rational for the reason why the external source pad
> > > is preferably assigned to id 0.
> > >
> > >    - A RAW camera sensor driver modeled as a single sub-device with
> > >      three pads. The external source pas is assigned id #0 for
> > >      compatibility reasons with existing user-space applications
> > >      developed to work on drivers that pre-dates the introduction of
> > >      internal pads, where the only available pad was the external
> > >      source one. The sub-device also has two internal sink pads, pad
> > >      #1 that represents the pixel array and produces image data and
> > >      pad #2 that produces embedded data.
> >
> > I'd put this to driver documentation as it's not part of the UAPI.
> >
> 
> mmmm, it's true we don't mandate for new drivers to have
> the source pad at index #0, and it's done only for existing drivers..

I'd still say that's what we tend to do, for source sub-devices, but it's
not part of the UAPI. :-)

> Adn userspace should not make assumptions about pad numbers but rather
> inspect the per-pad flags to know which one is the external source pad.
> 
> So yes, it's no uAPI you're right.

I agree.

-- 
Kind regards,

Sakari Ailus

