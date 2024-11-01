Return-Path: <linux-media+bounces-20673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C47E19B8D74
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E30EB23655
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1429F158208;
	Fri,  1 Nov 2024 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Taxbj4bW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6F33FF1
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730452233; cv=none; b=P/ypIANPKv9iUuFpjy5QmsU6N2keuwS2tYQXbxy4C3ZeoXX/t83g5XJOHCpOxzG77punFg4k+8rBRh8GQGyMNYCdKoeGCDrHaMB4sKEv/9wDJ6p+vxzjvfuct3vmHobpPH7OiaRifIN3wcYhpu4wdFis9yrVxDt5XCOIgy9BmdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730452233; c=relaxed/simple;
	bh=sE2CfawKZwkY944W6NyXFVyarwn0Vv4kjkESI8tkexQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=tvOCcqByZ3J9Mc8Ok1kuFmCd8e1SRzfadGwNsUSFGAZ3A1UNWxfZryNTv3uL9FpGmzgw2ZQ4CCAbyIDV+yDgndzGEzTGENE6kUsmohGe3E1X2xiQx4t4AGHW3tYExv5XuhyaLpLPJPepgoSAdmUUZ6SmVLQrc+Mvfi/TiBPc1aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Taxbj4bW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730452232; x=1761988232;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=sE2CfawKZwkY944W6NyXFVyarwn0Vv4kjkESI8tkexQ=;
  b=Taxbj4bWDVEAi1trKSEaGxjKB6XQT2GbajhO6jUXVpVfhuLm9y5EUG3m
   AECoUD5hUtdLuPXX5Otkz92u8mpzjRB8Gf3kBTEyVk0HbcJLiG6ihckWm
   1qVW43YA2nRtzJP7QU5tQTHJ61EWhVy3uDbWY6c57OUippU5ldTegmUHc
   oXvxfwJvdDBgYPbbPQgu0Crv2dB4j7EYQxr6H0XptqDCxgMvJv6nnwoaK
   waVYlfBbQzl/H+uKBBTAt03RMgmt6MsXw7G8QGnSmiJsNIAqQk0zX1H8N
   EQu9BTOnuiNLav1pUGkXfICfWe9bcNne+haR0Fp9IWTD/5R6B0hehhJXH
   w==;
X-CSE-ConnectionGUID: CYYoAItZTd2MhQ/b9fXzhQ==
X-CSE-MsgGUID: wScZ87T3Q/uDHIXoCAy5xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30171465"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30171465"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 02:10:31 -0700
X-CSE-ConnectionGUID: ey8ZU9sCSWWHpSg5UdyHEA==
X-CSE-MsgGUID: UC9qet99RQ21uLoUJHRcfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83248219"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 02:10:29 -0700
Subject: Re: [PATCH v2] media: intel/ipu6: remove buttress ish structure
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
References: <20241031130622.430308-1-stanislaw.gruszka@linux.intel.com>
 <f6e4a8b9-1ee5-04f2-069a-cf2541cca6bd@linux.intel.com>
 <2251d433-ecf0-6300-3598-82438befb456@linux.intel.com>
 <ZySHPtECRXNTSN2d@kekkonen.localdomain>
 <34bb5ca1-8c7c-316e-5886-378c8660f7f1@linux.intel.com>
 <ZySO_J1xDkcSY4sZ@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <7ad30743-58c5-7004-9eed-4f1d8589c7f7@linux.intel.com>
Date: Fri, 1 Nov 2024 17:07:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZySO_J1xDkcSY4sZ@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 11/1/24 4:19 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Fri, Nov 01, 2024 at 03:47:54PM +0800, Bingbu Cao wrote:
>> Sakari and Stanislaw,
>>
>> On 11/1/24 3:46 PM, Sakari Ailus wrote:
>>>>>> @@ -386,10 +382,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>>>>>>  		}
>>>>>>  
>>>>>>  		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
>>>>>> -			dev_dbg(&isp->pdev->dev,
>>>>>> -				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
>>>>>> -			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
>>>>>> -			complete(&b->ish.recv_complete);
>>>>>> +			dev_warn(&isp->pdev->dev,
>>>>>> +				 "BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
>>>>>
>>>>> I think this is a unrelated change, right?
>>>>
>>>> I mean the change from dev_dbg() to dev_warn().
>>>
>>> We're not handling these interrupts anymore in any way.
>>>
>>> I wonder if the ipu6_buttress_ipc_recv() call should still remain in place,
>>> even if we really do nothing with these. It looks like some kind of an
>>> acknowledgement mechanism.
>>
>> I just confirm that IPC_FROM_ISH_IS_WAITING and IPC_EXEC_DONE_BY_ISH are
>> not valid anymore from IPU6, I think the handling here and below could be
>> removed.
> 
> Do you know which IPU version still needed it?
> 
> There are folks who'd like to add IPU4 support to the driver but they can
> add it back if it's needed.
>

I know that ISH IPC was added from IPU4, but I am not sure IPU4 really
need that now.

-- 
Best regards,
Bingbu Cao

