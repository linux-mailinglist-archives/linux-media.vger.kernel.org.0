Return-Path: <linux-media+bounces-22661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B6A9E4DD6
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 07:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18626167F72
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 06:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3C119A2B0;
	Thu,  5 Dec 2024 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fq9ngkAR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B2817C208
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733381775; cv=none; b=FpvRYlE1mF0Hi9sMRTm9Y/i0eNnkdZQC/M0kvJ44ypHaqHnBTfaeX3qMr9b9WmJvB7Z88UBN1UfN1AA3NNk9Gr9rcRYfggsGNxirwdnJrjUI/rFs0FzuYf00XjCH2SUYQ0oEJ5Plj8/My+KcdNV/j75qcbBvcQav/5gCLenoW3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733381775; c=relaxed/simple;
	bh=186n5Uj/C9HXCMIA9B/zJ3Uctx5ss9wa6dPnj1s6NOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlbYu4d65q07wmOz9pxRQhJMItxYSDDJtRirG1pXG6RAicSu9BnfUhXlgVrc4AqTef6aF9+vZ2JDC9qZf+EH3WkopSurZzbQDilNs7rn2ed2CLe6dV0g/RKzemux9/jcqFiNkgw91XeDEdNQLcgcQZqzHOO6ZhauKZatVNzMGP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fq9ngkAR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733381773; x=1764917773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=186n5Uj/C9HXCMIA9B/zJ3Uctx5ss9wa6dPnj1s6NOg=;
  b=Fq9ngkARZ/e/YmEEy5MTU93/P/qMjBasNn+xwXnDzKAVSNqeLQdoxLlS
   rmocKMfZqsbgQOTZc/1gQTj33fi0Gc8QfNZx8BsHysfEekQeUlhub7ULM
   BaP+DIu2H0uICBcNKOMuYXLTBst4IMtfmMp4VMd7n42zr599MIlmSoIRc
   fOpkpibssutuyEcYhMGTlUcic8EERg1e6L3CPKSDfDhfCT9YlACOCyU5i
   U+ERzfjPmyXSG0SV+f2fnozzfmg5nCNuEj1IhxiXfESXnfFBNYYmoffG9
   FoKgflQ+/gQgYrKMHv0H9tSzvhx9fzEv91Gc/i8CygP9h5toh784hyoMC
   g==;
X-CSE-ConnectionGUID: YKTA11mhSPCrtbltMqmoAQ==
X-CSE-MsgGUID: WS98CzDaSzir6y6RJthKdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51092299"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="51092299"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 22:56:13 -0800
X-CSE-ConnectionGUID: y2jMKDyZSe+5jIpOWC0NWQ==
X-CSE-MsgGUID: 4R1Yydc7ScCa3PLMqKxF6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="99078735"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 22:56:07 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 26AEE11F775;
	Thu,  5 Dec 2024 08:56:04 +0200 (EET)
Date: Thu, 5 Dec 2024 06:56:04 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 5/9] media: Documentation: Add scaling and post-scaler
 crop for common raw
Message-ID: <Z1FOhLhhLirSdaBh@kekkonen.localdomain>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-6-sakari.ailus@linux.intel.com>
 <ioomhmdxhr2wmunibh456umrczv5p2grqdvqyvq2gt5gb2wirn@m4nep4s6pbnu>
 <Z1Bj62TU-hK3nJof@kekkonen.localdomain>
 <3v7hkvmaqzwao3blyr4cngnypls7ebnsfpezxtefrfx3qpz5tr@zrzqikrooenl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3v7hkvmaqzwao3blyr4cngnypls7ebnsfpezxtefrfx3qpz5tr@zrzqikrooenl>

Hi Jacopo,

On Wed, Dec 04, 2024 at 04:33:22PM +0100, Jacopo Mondi wrote:
> > > > @@ -179,12 +183,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> > > >        - X
> > > >        - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
> > > >          rectangle on (pad, stream) pair 1/0.
> > > > +    * - 0/0
> > > > +      - ``V4L2_SEL_TGT_COMPOSE``
> > > > +      - \-
> > > > +      - X
> > > > +      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
> > >
> > > "Digital scaling" ? or is not necessary ?
> >
> > We don't mention it in the context of sub-sampling either. Digital and
> > analogue variants are separately documented where they exist, I think this
> > should be fine. What do you think?
> >
> 
> I'm fine, after all there's no "analogue scaling" this can be confused
> with, right ?

Correct.

-- 
Sakari Ailus

