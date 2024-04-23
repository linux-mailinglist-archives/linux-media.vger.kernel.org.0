Return-Path: <linux-media+bounces-9947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E3C8AF374
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 18:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0942B21AD4
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 16:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E3C13CA97;
	Tue, 23 Apr 2024 16:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avjAXTuC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0761E890
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 16:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713888379; cv=none; b=pMeK875aQkmUAnloedALF6UBe6Wp/JImKmqsp+WSI6xBgGhPs58IAzmSW92oACDMrmaDOPAtJGYPK9Ht1GacGGAPm+B1R+Xn2DAi+A2zbYqkKsppfbLJbr70hzRv7dgJgzKP/Ub4Gi8JWm6oG2FXDB9ZhUCCSBGC72i9IVRfots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713888379; c=relaxed/simple;
	bh=uVLQ11JLSpfiKogmkAY3F7XPryiPfHYI0jJ95AaAxh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLcEwjlrAQWS+UjRvNIDi13CpJkLWkmIjaXQCPhud7WbSRXeiSJ56CSBoVoQZz1wrK3tlnv2feWT+pur49//qlBIWT9uwsK+gyaDIEUOb9KVwIV/5mHmDCQEDQAUyush0N9QmUUNruH0gDmajt1jqUCp8qDkOixcr/ivTBtTK6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avjAXTuC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713888378; x=1745424378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uVLQ11JLSpfiKogmkAY3F7XPryiPfHYI0jJ95AaAxh0=;
  b=avjAXTuCtVE/5Z3tqw1HKQAQENX4XYni7hlxEbmVd3scYL5A6uL2b1Ov
   +wMAB9N8BbeLoFnt82K+jy33ABXkoKJ7MBa2ZPv6l+Rq70SI7XaFK7o3M
   frIEEBn8c8Y0IE7wpvMccV4ZijvyTE+JNARhfAyPV0kca8/Dj7QNnCWDd
   48Gl9iHsBNGxaLrnp5RHaTeSn4CJPeE0FYi8HCmxCrzcYZd9cUdWYmyz/
   UnVT5og9SA9HLuLXQgfitpMVgfaiIoriOxWt9+MyFmH0+alr+hL5OWirg
   /7CJqc2WkKo8EBHnzw6P6AeRS04EGA2oT5X2IL+xiMOHppQJw0p828LO5
   A==;
X-CSE-ConnectionGUID: jhSaiYnhQXarO1hPGO4KVA==
X-CSE-MsgGUID: IARZSa48RiGfQaajRj9X8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="26939937"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="26939937"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:06:17 -0700
X-CSE-ConnectionGUID: D4WrIMSYTN6ad22aTC68sg==
X-CSE-MsgGUID: Heexd77SSkaeeqgsbauogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24932539"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:06:15 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C33AC1203E8;
	Tue, 23 Apr 2024 19:06:11 +0300 (EEST)
Date: Tue, 23 Apr 2024 16:06:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 10/46] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <Zifcc6JMTcnzU3vs@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-11-sakari.ailus@linux.intel.com>
 <20240419184926.GI6414@pendragon.ideasonboard.com>
 <ZieM_xjmWxdcBx5r@kekkonen.localdomain>
 <20240423125618.GE20623@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423125618.GE20623@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Apr 23, 2024 at 03:56:18PM +0300, Laurent Pinchart wrote:
> > > > +      - MEDIA_BUS_FMT_IMX219_EMBEDDED
> > > 
> > > We need a patch in this series to define this format.
> > 
> > I'm waiting for your imx290 patches. :-)
> 
> I assume you mean imx219 :-) They will come, but we need to discuss
> usage of internal pads for raw sensors first. That won't make it in time
> for v6.10, I hope we'll be in time for v6.11.

Sure. This patch should actually be located later in the set, after the
INTERNAL pad flag patch. I'll move it there for v10.

-- 
Regards,

Sakari Ailus

