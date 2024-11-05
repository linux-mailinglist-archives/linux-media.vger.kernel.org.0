Return-Path: <linux-media+bounces-20822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD89BC366
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 03:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD73B1C21CF0
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 02:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01BD52F9E;
	Tue,  5 Nov 2024 02:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIv/Boqg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221E4D9FB
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 02:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730775133; cv=none; b=QxORW3X9mQmOFyuAQRNQRBO4aYtOIe7G6LYBTZP7MU8zkKInWm2VZeU4Tjn7LuGzV42MnwHvra+a0KMORpv+h1z9RTykTh4pREvWnBJv10iHq3JPW7mrnzoN4NCzWq7/IgAJazPmx00z9sViDBINL1hRECtvaYd7Y1SascChsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730775133; c=relaxed/simple;
	bh=1VpQKAl82BFbXCUscLrrcuWmm3n5bPL8FlaMQjbzFRk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Ia863cDqTyr0zjDGS4ALCDr6/OdcPlvVNwRVGKRxtK+mBVnUM7a4tnpqPb0avN1jEA+FkOW4LOWx56YXOdRn7cl5FoDklIndeiU61hDU35tIiU+aKSlFyw4aKwss5lbojC+86J6k0WBC6b826syLJltSfRtm1nw5LP+48uFYhMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIv/Boqg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730775130; x=1762311130;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=1VpQKAl82BFbXCUscLrrcuWmm3n5bPL8FlaMQjbzFRk=;
  b=IIv/BoqgTMuyW61NvEiBYJJ/v31nf/EOi51otqnntMigStKKBH3GkMcT
   NjG72rDBkaD3thOQIow6gnD996R6fEC3gq/79a45Bm/heyYR9gCV19PYu
   oBwncC+ZUg78yzwm/TgGkt2dBAsuc31IWBKprc7HCiipi18IDVMJ+AHn3
   yUxETIHUCeRtf7AdSJ39hcqIEloRvfqiegLa6mLPl1dzeZ8DSMxY0D5zV
   DK1g5B366gvxn+n0LreUoFgsZTXm9AVuQJOqziynKWICNblFaV/DFZ61C
   EgMUFUsQ4574//Wz7P4qvem/GThfZbJxTm5GI7Gc8HCU8EVbVO0aTFVFP
   A==;
X-CSE-ConnectionGUID: 0/A99QbMQCCPuIJSr7JnEQ==
X-CSE-MsgGUID: yZqRunh/RqaSFEy0MZIfzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30452384"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30452384"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 18:52:10 -0800
X-CSE-ConnectionGUID: LwfHfSlaT92UkqzsjIRNXg==
X-CSE-MsgGUID: NJLxmLyiQtqNWb+73NDp/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="114644994"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 18:50:05 -0800
Subject: Re: [PATCH v2] media: intel/ipu6: remove buttress ish structure
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 Bingbu Cao <bingbu.cao@intel.com>
References: <20241031130622.430308-1-stanislaw.gruszka@linux.intel.com>
 <f6e4a8b9-1ee5-04f2-069a-cf2541cca6bd@linux.intel.com>
 <2251d433-ecf0-6300-3598-82438befb456@linux.intel.com>
 <ZySHPtECRXNTSN2d@kekkonen.localdomain>
 <34bb5ca1-8c7c-316e-5886-378c8660f7f1@linux.intel.com>
 <ZySO_J1xDkcSY4sZ@kekkonen.localdomain>
 <7ad30743-58c5-7004-9eed-4f1d8589c7f7@linux.intel.com>
 <ZyiRhk/LejVGSUKL@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <bd427dd4-d22c-9a8a-a6d6-ea17efc03e1e@linux.intel.com>
Date: Tue, 5 Nov 2024 10:47:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZyiRhk/LejVGSUKL@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/4/24 5:19 PM, Stanislaw Gruszka wrote:
> On Fri, Nov 01, 2024 at 05:07:25PM +0800, Bingbu Cao wrote:
>>
>> On 11/1/24 4:19 PM, Sakari Ailus wrote:
>>> Hi Bingbu,
>>>
>>> On Fri, Nov 01, 2024 at 03:47:54PM +0800, Bingbu Cao wrote:
>>>> Sakari and Stanislaw,
>>>>
>>>> On 11/1/24 3:46 PM, Sakari Ailus wrote:
>>>>>>>> @@ -386,10 +382,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>>>>>>>>  		}
>>>>>>>>  
>>>>>>>>  		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
>>>>>>>> -			dev_dbg(&isp->pdev->dev,
>>>>>>>> -				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
>>>>>>>> -			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
>>>>>>>> -			complete(&b->ish.recv_complete);
>>>>>>>> +			dev_warn(&isp->pdev->dev,
>>>>>>>> +				 "BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
>>>>>>>
>>>>>>> I think this is a unrelated change, right?
>>>>>>
>>>>>> I mean the change from dev_dbg() to dev_warn().
>>>>>
>>>>> We're not handling these interrupts anymore in any way.
>>>>>
>>>>> I wonder if the ipu6_buttress_ipc_recv() call should still remain in place,
>>>>> even if we really do nothing with these. It looks like some kind of an
>>>>> acknowledgement mechanism.
>>>>
>>>> I just confirm that IPC_FROM_ISH_IS_WAITING and IPC_EXEC_DONE_BY_ISH are
>>>> not valid anymore from IPU6, I think the handling here and below could be
>>>> removed.
>>>
>>> Do you know which IPU version still needed it?
>>>
>>> There are folks who'd like to add IPU4 support to the driver but they can
>>> add it back if it's needed.
>>>
>>
>> I know that ISH IPC was added from IPU4, but I am not sure IPU4 really
>> need that now.
> 
> Ok, I think on v3, I'll remove handling of BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING
> and BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH from isr, but will keep the BIT's 
> definitions just in case.

Thanks!

> 
> Regards
> Stanislaw
> 

-- 
Best regards,
Bingbu Cao

