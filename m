Return-Path: <linux-media+bounces-30429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A4EA914DE
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 463113BF5C2
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 07:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7AA21ADAB;
	Thu, 17 Apr 2025 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NE8DOnyf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291CE17332C
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874182; cv=none; b=MM5byVKbbmv1RQ/9Bm96NvYjIk+3P4y/RoZ96hIh5LXGGnXKQ6I4DcM7hQz2Un2EMpH2EHz/t8iBd3daDxKneReFUczj5d8nMrIMf2jdg+So6ghGdAFxogtGj+x8hDZSxi2UqbDm1tL4OZBiZQhip6EguOPK/fKU8jaE202ibBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874182; c=relaxed/simple;
	bh=4LQ+5uIkwZ/0dhrwM5SqGmbM0y8HoqSMxTX0RaAnijA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBrSbGMs3l7ckc/WBlGkB54Smxza6TRHBfQ585XcVQXXq2ueO8BtncOo0UKoWBLGKJYp9kyxxHqpuyUuu7uWiFLr4js0I8qdotMt5Q+uMuDtrBuT/mM1wQoE0m85qluOxd9zU5Go0jozoVbJLnTM5tUWRsCWzvZ3iYINSJa8QOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NE8DOnyf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744874180; x=1776410180;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4LQ+5uIkwZ/0dhrwM5SqGmbM0y8HoqSMxTX0RaAnijA=;
  b=NE8DOnyf5TYKxpH7DIt0RC+qgX75j27T45RexwHiZDM/XmiWqfK8yo6v
   5lx32WFEe7k9rTtUWmGJ4zbUcMQX1Lk6WV1ZKege/ZnNsURF7ZsK+AijB
   Bf3EOmH7yA7eD79GDvqAWlI5NV4sYwC2yVG65kLojUxebLXSjParL7CDR
   /7HAW9uKDsyApRJSH0sTcU+Bk5DgclAevu592aZgAN0SGvCjz/LNTp0Tk
   DcfVidMv351rnYJdSLD7Zp7eCJOfxzhw2ATZvb3chGP/vxz59DI0CVqcJ
   L/amT0+j5iOVAF0YTfa90vbejUyPPCUfbDcWUZwrFyHZoBhwTFBm/lbP2
   w==;
X-CSE-ConnectionGUID: MvSiWdfMT7qgLOjSiug3tA==
X-CSE-MsgGUID: bZaTNrxMRTGkEz0SiPbd3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71834087"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71834087"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:16:19 -0700
X-CSE-ConnectionGUID: 6wAQoyHGTGexpXBMwg49rA==
X-CSE-MsgGUID: JSk5AJuAQAa1E7kV3OMDtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131267009"
Received: from reyongqi-mobl.ccr.corp.intel.com (HELO [10.238.225.6]) ([10.238.225.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:16:16 -0700
Message-ID: <4a432eb3-79ba-4e8e-a7f6-c0bb0db749a9@intel.com>
Date: Thu, 17 Apr 2025 15:16:13 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] media: i2c: Add ar0234 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 dave.stevenson@raspberrypi.com, hverkuil@xs4all.nl,
 ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
 tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 dongcheng.yan@linux.intel.com
References: <20250410161249.3455729-1-dongcheng.yan@intel.com>
 <aAClUxNhOhcPl9zX@kekkonen.localdomain>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
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

Do you mean use the ar0144 driver to support the ar0234? two sensors
share the same driver code? Or do I implement the similar
"programmatically sets the register values" in the ar0234 driver?

Thanks,
Dongcheng

> Sensor configuration independent MSRs are totally fine, I presume there are
> some the ar0234 benefits from.
> 
> My apologies for telling you this now, after 5 versions of this driver, but
> I only learned of this very recently.
> 
> I expect Laurent to send v3 of his driver by early next week.
> 


