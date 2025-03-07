Return-Path: <linux-media+bounces-27839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A8A5690C
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 14:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3C503A24BC
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 13:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23376219E82;
	Fri,  7 Mar 2025 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5+jQteu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3946EBE
	for <linux-media@vger.kernel.org>; Fri,  7 Mar 2025 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741354599; cv=none; b=SV5xe7ArILDOrEnZ5LoWfvELOccB4sv/89kZrxiK1RKyI0rNnkUm1/7kUGrA9bpzNtyX71BE7fJ4stwrfFD/Ojd3P5/FNxqMuO3OGDaHvxKNas5OgWrqwk2o6QcQaU7sSH/6MzHCTh1dPOCAa4MQNRNqLkCsbXxsLuTkQeFiJ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741354599; c=relaxed/simple;
	bh=OZt+d436vgWpErCasgSzXjEueulSHTP3Aw6tVwQxmPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3K1MfcVloGIHJH5l3xkSjFJS22IrNOgf0p41OsMPtSPpkyEqw1VqWsSRLDnCsElxQEvAgUYc9qbm710QWXajblVMovpD2L3VO8f9+ZzG8MMvPIgOwKv9FYafj7u1T0YBKj7+sCk24oV+4L3NB77yMPLdyBEiaLIFZqn9qQPx+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5+jQteu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741354597; x=1772890597;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OZt+d436vgWpErCasgSzXjEueulSHTP3Aw6tVwQxmPA=;
  b=c5+jQteuoDo+qraoRoXU77EHCdkef1SIxuw5t5c7MyE1BmtGkK+mXCBP
   7XglVZ0Nz1WN2zpu4BTt9+2orNYVeZXUgM2x5LaaZLV76nx1OGK3C/WLv
   eegwkLT5IbWdV70da8twXteusZ9PLDqtexKMEBwvLdG26EFOA1N54IZwu
   rNlajzO/Dd47BfJ1BY/SUCPVTQv8MsJ1rRvfyhxHxZFE/I/8qhDQ6wL+u
   WmzqSt67ywMlAOppGA+uw6vPgPbT1fFBOeIReiG9BOEuK0N/wRtz/H1t8
   Bp0JEbP7mv9/ziBd63hIHn+58BM8fRta9xcccjaEP0VZ3amjBwAq/2EE8
   w==;
X-CSE-ConnectionGUID: Jd2jmaZESW2yuzOG3YU7GA==
X-CSE-MsgGUID: Fi+mw8O9Qo6l+wyDWXyDfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42313324"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42313324"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 05:36:37 -0800
X-CSE-ConnectionGUID: v5RLjkMrSgOZ7tfyKq1V0g==
X-CSE-MsgGUID: c2s/Jn/FTB6NY/AUSuJkEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124355964"
Received: from yandongc-mobl1.ccr.corp.intel.com (HELO [10.124.249.20]) ([10.124.249.20])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 05:36:33 -0800
Message-ID: <f1dec7e7-b2ee-4746-b266-5927faf36c61@intel.com>
Date: Fri, 7 Mar 2025 21:36:30 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] media: i2c: add lt6911uxe hdmi bridge driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
 tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 daxing.li@intel.com, dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
 balamurugan.c@intel.com, wei.a.fu@intel.com, xiaohong.zou@intel.com
References: <20250306060427.859679-1-dongcheng.yan@intel.com>
 <Z8q-zqzAXPUzkUmP@kekkonen.localdomain>
 <c20e68e2-11ef-4f35-a3ca-45d0435e2e22@intel.com>
 <Z8rQp2OCPZbvSnjH@kekkonen.localdomain>
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Content-Language: en-US
In-Reply-To: <Z8rQp2OCPZbvSnjH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sakari,

On 3/7/2025 6:55 PM, Sakari Ailus wrote:
> Hi Dongcheng,
> 
> On Fri, Mar 07, 2025 at 06:00:56PM +0800, Yan, Dongcheng wrote:
>>>> +		/* MIPI Clock Rate = ByteClock × 4, defined in lt6911uxe spec */
>>>
>>> What does the byte clock actually signify? Bytes per second on CSI-2?
>>>
>>
>> This is more like a DSI related calculation, I think lontium uses the
>> expression related to HDMI and DSI in the video field.
>> dsi_clk = Bitclk / 2 = Byteclk * 4, dsi_clk is mipi clk, which is used
>> as link_freq.
>> Here Bitclk = HTS * VTS * fps * bpp / lanes.
> 
> The PHY for CSI-2 and DSI is the same, so the same formula is applicable.
> The chip is HDMI/CSI-2 (isn'it it?), so I wonder how DSI is related to
> this. How many HDMI lanes are in use?
> 

My expression misunderstood you. I am just explaining why ByteClock is
used here to name. Yes, ByteClock is Bytes per second on CSI-2, and
because CSI-2 uses DDR(Double Data Rate), here link_freq = bitclk / 2 =
ByteClock * 4.

Thanks,
Dongcheng

