Return-Path: <linux-media+bounces-31147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A9A9EA48
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 10:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676E2188E12F
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 08:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E66252288;
	Mon, 28 Apr 2025 08:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POnJMSNh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE181FECB4
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827546; cv=none; b=Q+GCW6T7SE94YYA9I+VXiOq/CDzxYO54Almg5pRINoDUxRm+dLni2FdxgNoU74hI1GCrJLpBtDsHunu01BohMF6zCjOgHDYB7Pj5uGtott/3zR4N9z7O6/y3ZxGW3kN/UkW6lG+odn0fbJd+iKWZdpK73D912gqP+3PvOaCVoSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827546; c=relaxed/simple;
	bh=GEoqocKmYmhOQpiBr5JMwknQRajqYykPjNuYPDitFK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=qV8XEz2ajs5yh8oLd0c9+cpHpo7rBTGeOtBVTy4IN+OE6ZPcBHfbPweEGzTEqkYEDzH9lRBb9lIJvNMiwF0gSna6QhTXLrVtUktZB/ZKsXFA3efi65KgAgp/HZC0ctmaRJ5XRelKaxtND5O+sIh41cJDpIduNVAwmIg5dzMkFls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POnJMSNh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745827543; x=1777363543;
  h=message-id:date:mime-version:subject:to:references:from:
   cc:in-reply-to:content-transfer-encoding;
  bh=GEoqocKmYmhOQpiBr5JMwknQRajqYykPjNuYPDitFK8=;
  b=POnJMSNhKtdYdqnk2wmdRYOA6k7LB1qWZSNKIakucZDMVlTWTz+6gv1d
   j0opMSaFaShD8FzInxJhbDwLANwIAntxkgzqVlOsKgCLtbEeGPxbLYcQe
   eKA5839OcljRbjnCj2PCVlhLn75j0jdhuRNxERS3TBiB4VytBLJAL23Gj
   /qLEo2F7y6N+jIkHiXhsn6b5qa2awSfXroraXeX45lt7Upj18YgYbzEeM
   NWk84jjdycrM3WeqKUNQUBGO1wJBqeEuLAxsr8y/b7/pOWV/q1bfpewZP
   5zb15UCOXUo9S2Xn1Yi9c2woAqtPrLe9TPcOKDNn2Gt/QmflMczxIOh2r
   g==;
X-CSE-ConnectionGUID: OWvA2rd6Rgmf/fM5FeOsqQ==
X-CSE-MsgGUID: 5NWQLLIeSy+Ke+IQpwD9Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47421109"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="47421109"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 01:05:42 -0700
X-CSE-ConnectionGUID: E41fOLm8RiKWkVqU6/5n4Q==
X-CSE-MsgGUID: 5tJ+Q85vTkOESLrbFrDKZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="133936790"
Received: from yandongc-mobl1.ccr.corp.intel.com (HELO [10.124.160.172]) ([10.124.160.172])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 01:05:40 -0700
Message-ID: <c47c775b-ec57-4190-92e6-8f60283dcdc9@intel.com>
Date: Mon, 28 Apr 2025 16:05:37 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] media: i2c: Add ar0234 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250410161249.3455729-1-dongcheng.yan@intel.com>
 <aAClUxNhOhcPl9zX@kekkonen.localdomain>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "Yao, Hao" <hao.yao@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Bingbu Cao <bingbu.cao@linux.intel.com>, "Yu, Ong Hock"
 <ong.hock.yu@intel.com>
In-Reply-To: <aAClUxNhOhcPl9zX@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 4/17/2025 2:53 PM, Sakari Ailus wrote:
> Hi Dongcheng,
> 
> On Fri, Apr 11, 2025 at 12:12:49AM +0800, Dongcheng Yan wrote:
>> The driver is implemented with V4L2 framework,
>> and supports following features:
>>
>>     - manual exposure and analog/digital gain control
>>     - vblank/hblank control
>>     - vflip/hflip control
>>     - runtime PM support
>>     - 1280x960@30fps and 1920x1200@60fps support
>>     - dynamical pll_params set
>>
>> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> 
> I reviewed Laurent's ar0144 driver and it turns out that the ar0144 and
> ar0234 sensors are nearly identical in their register interface. Thus they
> could be controlled using the same driver, with relatively small changes.
> Laurent's driver programmatically sets the register values in general and
> does not rely on register lists, which is why I prefer that driver.
> 
> Would you be able to add ar0234 support to the ar0144 driver, please?
> Sensor configuration independent MSRs are totally fine, I presume there are
> some the ar0234 benefits from.
> 
> My apologies for telling you this now, after 5 versions of this driver, but
> I only learned of this very recently.
> 
> I expect Laurent to send v3 of his driver by early next week.
> 

This is the first time I have come across such a suggestion to merge one
sensor driver into another sensor driver.
Why should ar0234 be merged into the ar0144? If it is because of "nearly
identical in their register interface", then most sensor drivers can be
merged into one driver according to vendor, such as AR/OV/IMX. So I
don't quite understand the meaning of doing this.

And AR0234 is the first patch, why should it be merged into the later patch?
Considering that ar0144 is fully implemented using ccs-pll, do you want
me to use the parameter constraints on pll in AR0144? The lack of
information in the AR0234 spec makes it impossible to implement dynamic
calculations in ccs-pll. This can also be seen from Dave's comments. The
pll parameters we use are very different. The parameter value
constraints found only from the existing spec cannot meet a
multi-platform compatible ccs-pll implementation.

Thanks,
Dongcheng


