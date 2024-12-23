Return-Path: <linux-media+bounces-23993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2429FAA47
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 07:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2100D18844A3
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 06:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3858B188917;
	Mon, 23 Dec 2024 06:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXFtZHJ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BBE3987D
	for <linux-media@vger.kernel.org>; Mon, 23 Dec 2024 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734934940; cv=none; b=YiugpoP4KW9BEQKjcbKpI82r7E2wZAXJvSvR2Qs1/FC0UeD6+iKveN1lhM+tanodOQLLYzxhrapBFj+0vzyGgqlzRKnjCGmYseqLFDUF8iZRYV1Z2l1jvbUmk9VAksLKtnLeGJMHRgPnR5+Zad/qS6OkGd6MIC0/5FYJMxQ9nMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734934940; c=relaxed/simple;
	bh=r23S72CijYsiia0qpUnrw13LCnFp2Odvwm10KZKMqk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+0pAWkQatDT1P/+6EBjXS8x5vXOfZgpQvnqpzcky9jYTMFetDbjiMm6R8oVdcimnlLbD6mpdzR9neOz/Dr5ybFH3PMNWDbnKVTEvdWcGm4fxeF4lqa3TfnLku+aBjdGXbjEURp5DEcF85HKTG1eWCE6e7QusadyIrSE0ulYIfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXFtZHJ2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734934939; x=1766470939;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=r23S72CijYsiia0qpUnrw13LCnFp2Odvwm10KZKMqk0=;
  b=eXFtZHJ2oH4t6/MtWG5KEUlk3qykbZlIkT/Km3UP+0wRhE0aDGi+oB30
   QaHDzh1zUWjV6JLEDDh/XTgaUQ6BBvpjJTjo3ZB/mxp0+BPxy/mLg7IqY
   XxowYkCtR/PMBWC0as1ELz60BwXx5GLg+obQsNGZeOFIDPPLxL3MDjqvT
   RUDfvPIdRfXuUC3lcTdg33wGjRJJJ9pXZtEC/3kpAhkQRKhP+Qc3D+2+8
   wi/7lx/7S3EpCM4xGlX43i7SWh5910aJHShsV/fc230bvFIILDwRx1nGX
   SwXNyDFRsn9B/sITe7j9w0Q+Ibv4iuslW4Fh/WQXhLR9bBS/iOosQctJl
   w==;
X-CSE-ConnectionGUID: 9tgHsysBQoCI0fk+3Bes4A==
X-CSE-MsgGUID: Lf7fGd2ZQXODD2cDEFHEcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="45887672"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="45887672"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 22:22:11 -0800
X-CSE-ConnectionGUID: xEHUn/anRxmL0gnaYTypZw==
X-CSE-MsgGUID: eXlCDmKITI63teiuNMXH1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="98983157"
Received: from chengt5x-mobl.ccr.corp.intel.com (HELO [10.238.224.230]) ([10.238.224.230])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 22:22:07 -0800
Message-ID: <9782b615-3ed0-4c99-aabd-2a7f4e6cd041@linux.intel.com>
Date: Mon, 23 Dec 2024 14:22:03 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: i2c: add lt6911uxe hdmi bridge driver
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
 tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 daxing.li@intel.com, ong.hock.yu@intel.com, balamurugan.c@intel.com,
 wei.a.fu@intel.com
References: <20241129061546.2237511-1-dongcheng.yan@intel.com>
 <Z1hOBpwLfB_wfRwL@kekkonen.localdomain>
 <66e2d69c-9413-48dc-9dcc-1df7576ddf2d@intel.com>
 <Z1oAGfRs28hgo-sc@kekkonen.localdomain>
 <e48e0778-7911-47ec-b8f2-d4b6e95484c1@intel.com>
 <Z1qbrkRTzqnzHtgz@kekkonen.localdomain>
 <7b690b8e-2fff-46ec-9f61-d46360ed9213@xs4all.nl>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
In-Reply-To: <7b690b8e-2fff-46ec-9f61-d46360ed9213@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi hans,

On 12/12/2024 4:54 PM, Hans Verkuil wrote:
> Sakari, Dongcheng,
> 
> On 12/12/2024 09:15, Sakari Ailus wrote:
>> Hi Dongcheng,
>>
>> On Thu, Dec 12, 2024 at 03:24:16PM +0800, Yan, Dongcheng wrote:
>>> Hi Sakari,
>>>
>>> Since you are planning to PR this patch, I will continue to use
> 
> Please note that I still need to review v4. I hope to do that tomorrow
> before my Christmas vacation starts.
> 
> Regards,
> 
> 	Hans
> 
>>> CUR_LINK_FREQ to initialize the link_freq v4l2_ctl.
>>>
>>> Besides, I see your patch in intel/ipu6 that obtains the link frequency from
>>> the sub-device instead of a control handler.
>>>
>>> Maybe I don't need init link_freq v4l2_ctl anymore?
>>
>> Please use get_mbus_config() operation.
>>
> 
> 

Wishing you a happy Christmas holiday in advance! I wonder if you
have some new comments on patch v4?

Thanks,
Dongcheng

