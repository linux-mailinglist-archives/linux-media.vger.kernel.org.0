Return-Path: <linux-media+bounces-41685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47123B42155
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A51961BA63F4
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9BB302774;
	Wed,  3 Sep 2025 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EX1GvPM4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E301FAC34
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905924; cv=none; b=qNLLazfUAaxvSxpmXFJthujs8pgyuuk65bdmw5LkanHcGylmmN0g/UT5BcbOyqlE36RgPno/ULmG/Tr4DBQruhsIopHYmzvpH5XgY1dPk6yrzNY7T3zBZQjXNqRxUTmZwqW5xllfde4r6OyH0mTRte10JAb/ExowiEGpjGIxFss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905924; c=relaxed/simple;
	bh=qjNPM8bkizCS98NpkFewLMooVV5pY/pUO0ht/7nzro8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqQc94rUrjwuu6G4d2DFuYEjc/fK7nOElV75cAaWhfxM+7STEOUvAGmqzFwWBmZpxsn3KUpU5bIXZjjQcBtkzZc+mKkTOJ3W7Q4g//rE95ZzFupElUb/kOnPM1nsELbkn6VrYJT3RgaCPSKzZiA07QeZjGk/WxLtPP5hUrnAuVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EX1GvPM4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756905924; x=1788441924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qjNPM8bkizCS98NpkFewLMooVV5pY/pUO0ht/7nzro8=;
  b=EX1GvPM4/93jL6TuFoiGN05WZIJOOfdOJF0tY6P6l30C5CzosMT1fALV
   0jVcAoyFDpTs4TNFMIatkwDKYlHhRmA7ZZzHjCeznoaAqnCVpuvAEBHvp
   fpjWCGhoAFbsiVjp8p67trHssMk33hu+eSCcg4hgQn86EBJgT5Ll6r23c
   yUWavwIOoFv56rpVQJmJQKK/5+srOUxIZ5IZ9bLnTdncM14mKcQ8uGlMz
   /sEDz24CiKzJbKYja9gp9Rf/aawCbTzqiLbhM7lAkrVYJo30zHGOc+63l
   EDc+fdsNMdGdSmBHZfV8BCe28mH8kxcWMut1HpO3Z5ADX18YvEErojIyt
   g==;
X-CSE-ConnectionGUID: C9rsFWUCSy+5EBZFTe7Msw==
X-CSE-MsgGUID: C8OWYxZzQxWU6EFUL47FdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63052522"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63052522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:25:21 -0700
X-CSE-ConnectionGUID: Umypc/aMT1uES/ws5G3J4A==
X-CSE-MsgGUID: GgQZLZIATMeAbTN+xdNO+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="175946642"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:25:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ED92711F99F;
	Wed, 03 Sep 2025 16:25:11 +0300 (EEST)
Date: Wed, 3 Sep 2025 16:25:11 +0300
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
Subject: Re: [PATCH v11 21/66] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <aLhBt68vrp-bQuZJ@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-22-sakari.ailus@linux.intel.com>
 <b2yrfklofl6qpoekmy3r745gk4fvgdlpcdppatwwr3y34kn5zv@xusoi3rasdrc>
 <aLgXmb-ANkC5JNYD@kekkonen.localdomain>
 <mrrcx44sr3x4lodb7ffxxsxmcyjcwwqasel4jbpm7bt7zkjv7m@xtwlnpf7y53l>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mrrcx44sr3x4lodb7ffxxsxmcyjcwwqasel4jbpm7bt7zkjv7m@xtwlnpf7y53l>

Hi Jacopo,

On Wed, Sep 03, 2025 at 02:37:56PM +0200, Jacopo Mondi wrote:
> I'm not sure how many non-Bayer CFA cameras we do support, indeed we
> should account for them, but am I wrong assuming the majority, if not
> all, are Bayer, so having a quick reference might be useful.

Well, one important reason for not having non-Bayer pattern cameras is that
we effectively only support Bayer patterns. :-) There are lots of different
patterns, including different filters, but most devices can be configured
to generate Bayer output. Also the size of the pattern may be larger than
2x2.

> 
> Anyway, not feeling strong about this, up to you.

Thanks!

-- 
Regards,

Sakari Ailus

