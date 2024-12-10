Return-Path: <linux-media+bounces-23056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6F9EB0E6
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 13:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CB48281D09
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0221A1A3BAD;
	Tue, 10 Dec 2024 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDXlb1FB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02071CD15;
	Tue, 10 Dec 2024 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834097; cv=none; b=PXxJtjIEjmZM9j6mZcQUN7EOdxiI7L2K/JOpUciOrqW3AjdOtcDh9V7gKCWgJoAflXyXzr3L7CnGFFOpYZpZ+zvUw37aRZxaKviXgAaJOBGRk2xMyERR0KGttQAVqYJaDPxdaIEXFZiyfzTekpdXvQbJLDU+2S9We0uDHqP0qeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834097; c=relaxed/simple;
	bh=QDxIbe/7ztNYW4wJmfh7sjGNiUwud0sWdh3hf47L5x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bX+hx77m+TffEZHjkgc/W7TzcavTtMDUfLey0fTztYPpCs7oxvl3HkzA+6jikRugus41Rtt5LzaDwlVMB95yrxWtHviZNMsjBkW+4+22uzn2dqf9R2yx13mx0n/2VI4UNOneTScLPUPY/Tg4LTxr5s3KEkFuJeBU5kiUP3vniQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDXlb1FB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733834096; x=1765370096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QDxIbe/7ztNYW4wJmfh7sjGNiUwud0sWdh3hf47L5x8=;
  b=gDXlb1FBhLJYjq9bRhImAlClclV/MkqZobM/JHfvfV8nqd2YR6drsONX
   biNgsDDXXSkb30fhA3qFUR8yW8f5521Q5ZEgdGilOuxeGKMBX3Wh1Mhgg
   WUJhIqKcgD9BpotHqfHnH0fFo0Bbz/wDgNSWH0+YsutdLIbGwZyMiNxag
   sN5lZmW0+BWQlBiBBbWJA2nh0IewAQUrvqU+IBwnMWPRjG4vjHWFMfmMw
   vliNzbs0d4sVn8HhU2ip27mc6SHDvKuRn+PbDqIQeNCc2IIywmLB0mZAB
   V84RvM2I1L7h5sFWc8KRnr2yx9jQIsnwhyVrtRyXfCfsfC0At23h4fpFp
   Q==;
X-CSE-ConnectionGUID: rJh4tWy4Tpixr4Ux/P3udA==
X-CSE-MsgGUID: /v8z0mqfTOmUAbsClr2Ssw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45572575"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="45572575"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:34:55 -0800
X-CSE-ConnectionGUID: SK8sVVKmTLan1LEA+PqOWA==
X-CSE-MsgGUID: NdcWuoKYQg+LrgbQ+so+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="132785209"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:34:53 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C3BCD11F81D;
	Tue, 10 Dec 2024 14:34:49 +0200 (EET)
Date: Tue, 10 Dec 2024 12:34:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc: git@apitzsch.eu, Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v3 07/12] media: i2c: imx214: Add vblank and hblank
 controls
Message-ID: <Z1g1afPM1RRwD_EH@kekkonen.localdomain>
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
 <20241207-imx214-v3-7-ab60af7ee915@apitzsch.eu>
 <CAPybu_0Bdc03UrJNO42S1fBTvpuHUUExvkR1ont7VKdw2XBuKg@mail.gmail.com>
 <CAPybu_0Nk+p1rikH_t_zpEHx=KGnXfG+npr-XEnwtA4EnfJjuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_0Nk+p1rikH_t_zpEHx=KGnXfG+npr-XEnwtA4EnfJjuQ@mail.gmail.com>

On Sun, Dec 08, 2024 at 10:19:51PM +0100, Ricardo Ribalda Delgado wrote:
> > > +               state = v4l2_subdev_get_locked_active_state(&imx214->sd);
> >
> > Sakari, I see that other drivers assume that the active is locked in
> > set_ctrl. Is this correct?
> 
> imx214->sd.state_lock = imx214->ctrls.lock;
> 
> So I guess it is fine :)

Yes, it is.

Please also run this on the set:

$ ./scripts/checkpatch.pl --strict --max-line-length=80

-- 
Sakari Ailus

