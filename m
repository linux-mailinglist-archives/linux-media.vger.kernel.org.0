Return-Path: <linux-media+bounces-41551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F695B3FBD7
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C3331B21E8B
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2CA2E0418;
	Tue,  2 Sep 2025 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krqLumUa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC542E9731;
	Tue,  2 Sep 2025 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807656; cv=none; b=qLhcxitzVG5L9P3tBxz9T53OGD+vkh1eOXRp2qU0ftV0t1nC92MOC4J6NBktVowGOlK5w46gqU2DHBg9OuMD3sL8KsEJghlmUDGStcBxVwtm5frItfC4Or2XsUU6VFe89gmOn5c3TF8MbfOdmUPhDG08QE2cPKpY7Qy1Xj+8duc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807656; c=relaxed/simple;
	bh=7PC2Q//+WuzgF+LeTKFF2hZ7/yTMKlCXrmpgeUqMlYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPUV437pgH6zH4X9K7w59D0K+IMSmgXdm7+azOVZHGwpeMr2CJpcNvaDLwc0FDTncj1Yw4nAxFVDcPhq1sci7jeRtA2Dz78BZ45FODYjSwjK9Wkm6b8DfHg0hltY60FamyuyKCFL0Td0fzyZYLuz/u5uiGguBZA29FSTs+C0MBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krqLumUa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756807655; x=1788343655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7PC2Q//+WuzgF+LeTKFF2hZ7/yTMKlCXrmpgeUqMlYI=;
  b=krqLumUahmUm7NIe2e6gwk23RCVD70g4upvkeRr1E6tynGFmTzD9UEy8
   Bl6ltZ4oqc0e9PwB79//Fca7hPr7r4GoFSK6xeotZqQzWNDfx618P/5M9
   2OTXkyrW3b3rt6IKyzgpb3MbSsTc5zDppdas2zpLCyRigiXfRoFBvE1fU
   ohYrdfDFYt+MRAaOkZIIaA4qNYR4ZXZv7FQ0FxZ4qZVa9rAdttkSC3GVA
   fXHJV5TF6TW9N2qYfH/esYXqqG6oxyLuS2Yr5gyIYNBq/guHuV3UBP1HF
   E3TAPXB7pUXObdZDP/TtpZ4ur8gr52wb//STQwJso7u9oJCshK4ehjDZW
   Q==;
X-CSE-ConnectionGUID: W0am2F34S+GMlBY+x7a4pw==
X-CSE-MsgGUID: MY2fRQoiSNOkpQb8V1IvlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="62717846"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="62717846"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:07:35 -0700
X-CSE-ConnectionGUID: YTmtS4U3RkOrcWZsfHTwug==
X-CSE-MsgGUID: ob8IV5UUTzemb5NDEqdxTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="176552503"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:07:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4DD8211F739;
	Tue, 02 Sep 2025 13:07:29 +0300 (EEST)
Date: Tue, 2 Sep 2025 13:07:29 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Subject: Re: [PATCH v2 0/2] media: i2c: Add OmniVision OG0VE1B image sensor
 driver
Message-ID: <aLbB4SlFMUJkXLzY@kekkonen.localdomain>
References: <20250829144242.236732-1-vladimir.zapolskiy@linaro.org>
 <da59038d-edd6-4444-861f-adb65b040d0e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da59038d-edd6-4444-861f-adb65b040d0e@linaro.org>

Hi Vladimir,

On Tue, Sep 02, 2025 at 12:33:40PM +0300, Vladimir Zapolskiy wrote:
> Hi Sakari.
> 
> On 8/29/25 17:42, Vladimir Zapolskiy wrote:
> > OmniVision OG0VE1B is a monochrome image sensor, which produces frames
> > in 8/10-bit raw output format and supports 640x480, 400x400, 200x200
> > and 100x100 output image resolution modes.
> > 
> > At the moment the only supported resolution in the device driver is
> > 640x480@120fps (Y8).
> > 
> > The driver version is based on top of media/master, which contains
> > a new devm_v4l2_sensor_clk_get() helper function.
> 
> I'm not very well familiar with the linux-media processes, let me ask
> you about an expected interpretation of a "Superseded" patch status,
> which is assigned to this driver and another OV6211 one.
> 
> Is there anything else expected to be done on my side?
> 
> Thank you in advance.

I intended to mark the two latest series as "under review" but I'll have to
recheck (and of course Patchwork is down). These are nonetheless in my tree
now.

-- 
Kind regrds,

Sakari Ailus

