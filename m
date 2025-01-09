Return-Path: <linux-media+bounces-24489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3EA07099
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 10:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2A97166259
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 09:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CD72153C2;
	Thu,  9 Jan 2025 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsbaJUIk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9305215174;
	Thu,  9 Jan 2025 09:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413245; cv=none; b=b1AQp7LvDuUgECEYMH/Qvp3XFCuBLylI83DJgIWoNhSW3WK26Pv90x/fGO40ALaOg7lyae7qj8JsQc+1MYl7xesBlSbngR+R6D3FS7WeVtcq3FevHouWbDYLbn7OYoTSeVnEYVRLTS6tQifZ3fLU1LODoPlr3wprSWr3CdVFg6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413245; c=relaxed/simple;
	bh=USCkgBQ9KyquEqcMudtRMLLW99ZXwdRI7dKuUpJh4x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0i8iD0U3H09gVKF1JphD9Pnj3uYoG5jlze2q0ssOIqAfxnKRXD9nnI18P0Y44esY+clhXq0IDF2zPwdAHoyvkftIFjt8Gh+KpXnrkWA4aeeFHI8dajk91yd69NEXizgEXY1JWEClZbIsgbZA99B3YVBQdD1u0rODmLOdt4sXRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsbaJUIk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736413244; x=1767949244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USCkgBQ9KyquEqcMudtRMLLW99ZXwdRI7dKuUpJh4x0=;
  b=XsbaJUIkGJkyllEtjaY6hKzu+Dxv9pT3pJRbs24tpj6DLMyHMJF1VXkM
   N6cKk8fNDrMDS6rlFPOCPVgeZ9GCSdFWpu8fSMGCRTneZIu+vP7O3mz9E
   ouKJI3IV66J0xMIFRivUtIDA6O++70/FeAp16HpyfBlQyYH2/ta95I1cb
   hqG6k+8afKmVwYsajYarE5UqznrN9Q0SHBOGjta5ruxnapIM2sHot5oSr
   TMOVQkGHcb5HsqrAGaamaio92EMbJjxNZSpze8376k6vC/CUhSGyZz/91
   QzmmL93a21WZ/iDtUj4H3+cjul0vK2M5yD6qIQk4Yv0VrShnw60vMgBrK
   A==;
X-CSE-ConnectionGUID: dZ22xcuqT3eoBavCKDms9g==
X-CSE-MsgGUID: UzOcDm6rQCGEINh95cC0Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="24268100"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="24268100"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:00:37 -0800
X-CSE-ConnectionGUID: i2wKbr4UR/S5g4j1jmeucA==
X-CSE-MsgGUID: eM6AzgLRT626GI4zhURkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="103414554"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:00:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0297E1201CA;
	Thu,  9 Jan 2025 11:00:31 +0200 (EET)
Date: Thu, 9 Jan 2025 09:00:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v6 12/13] media: i2c: imx214: Fix clock handling on probe
 error or remove
Message-ID: <Z3-QLyxKOSizbBoi@kekkonen.localdomain>
References: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
 <20241220-imx214-v6-12-d90a185d82e5@apitzsch.eu>
 <Z35mt_ViYmrJLKZb@kekkonen.localdomain>
 <97f7de9efc16f01b29f98dc888329db33715275c.camel@apitzsch.eu>
 <Z3-P__hmxn2uCd_t@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3-P__hmxn2uCd_t@kekkonen.localdomain>

On Thu, Jan 09, 2025 at 08:59:43AM +0000, Sakari Ailus wrote:
> I tried to find a good example but the few I found are buggy. :-( Getting
> runtime PM right is just hard. I'll drop the last patch and post another to

I meant to say this patch, not the last one.

-- 
Sakari Ailus

