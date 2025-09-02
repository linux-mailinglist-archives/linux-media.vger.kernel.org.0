Return-Path: <linux-media+bounces-41568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C116AB400A0
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 985AC5E3815
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54052C11DC;
	Tue,  2 Sep 2025 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlSqCxgW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B227A124
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815989; cv=none; b=NSt+eEiC9qN+xAherIW2aqn0b0LDKhH/92yavad+nwWyyxrGIyhYYPryyo5xgbuHnybAsKhLOxY/50Dk+Xt5RLLtIUOtOmmrG75VvSVANmN1/Flw7VJqGNuE4qOdp1GRORWHA5cB/PZJzcfyfWRZM4FiGiiuhHa9pEJf1pt+XqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815989; c=relaxed/simple;
	bh=xHxk+SgXb23LL01kuxyNCkYIr/HvMe3cF1GfmnMIAOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoSCl0b391DpyL+fklxp3IWsn/eTQ4naNsay86/PfMJmZ41LJFiNJ2bl9hy+2ckRjk5SnCG4wJb4S//wXupf62mqJEaLj3E+qpGHrVmYV/y7SZv0NfgvZU5xbqlEE9sg+b0jr7X9LFvPymKgLSWHUqFNx+Go6Ea/lhxYxMhIx3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlSqCxgW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756815987; x=1788351987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xHxk+SgXb23LL01kuxyNCkYIr/HvMe3cF1GfmnMIAOY=;
  b=BlSqCxgWd3HAaFnvv7zpTY54B9/SIKZOlGXHonrfECaCcPTm27ryVJN6
   s3fLRTFur+xwsOfPTnrm905omr0GYEUdtIlOS1spU7GD6Se0zv81zg/zm
   ydefvgB2Yw+cCVF3q+GBnNK0mCxqOAiQ3uXU2h9t+8ZeSuHfHCXCRdJvC
   odilRudomaz/gnq87KBgojFOBdjY/t/hdvCPwwGYQXl8sVIsDU9jPIIpW
   ahOEKwEtrYKOf/oFgQMoto9VpyYS9oR5/OUihcb5SJ/dD53YZf7PmibU+
   pzteRe7Nxo6HLYLiH7NGRShZhMAb2BWgFY8ArI29dpcYmmZekvW89dO7H
   g==;
X-CSE-ConnectionGUID: ZxN73uo6Ty+99/gjTOnHMw==
X-CSE-MsgGUID: 7i/n+z+kTnuyr/U0Y2Z/KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70467606"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="70467606"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:26:24 -0700
X-CSE-ConnectionGUID: vJF5HWYFS8egsFM7fnTXCQ==
X-CSE-MsgGUID: 6Oh2+speSsqTNncxNFGjyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="176541684"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:26:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0D45511F739;
	Tue, 02 Sep 2025 15:26:15 +0300 (EEST)
Date: Tue, 2 Sep 2025 15:26:14 +0300
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
Subject: Re: [PATCH v11 12/66] media: ccs: Support frame descriptors
Message-ID: <aLbiZtkyrswRSulh@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-13-sakari.ailus@linux.intel.com>
 <7gvah5dvlh3tapzqwr3cbfd5dt3zidlnmasq6b3umudcebex7r@4wehf5whc3kz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7gvah5dvlh3tapzqwr3cbfd5dt3zidlnmasq6b3umudcebex7r@4wehf5whc3kz>

Hi Jacopo,

On Mon, Sep 01, 2025 at 02:06:40PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:13PM +0300, Sakari Ailus wrote:
> > Provide information on the frame layout using frame descriptors.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Are there dependencies on previous patches from this series for these
> CCS-only changes ? They look reviewed to me, can they be fast-tracked ?

I'll try to do further testing on these so they could be merged.

-- 
Kind regards,

Sakari Ailus

