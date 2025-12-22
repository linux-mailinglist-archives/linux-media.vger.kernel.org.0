Return-Path: <linux-media+bounces-49331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59871CD576F
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 11:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3446630456C3
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831023115B1;
	Mon, 22 Dec 2025 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgvw0Zwe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFF82FE04E
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397904; cv=none; b=LZujyvlXbgeim43Tc3kD7sVkTbWndfDs2qo76oJCUb9gUqMtRhd8bNPq62eeK0ArA2H2yTAxc49BTFn9yNI1B1kwTA9rfxKlKI7IHxf2ZcXQ5s+aBpZoxLjNP/NbigQWz5V7jArzfPTZ44wBAzlbVvlbPYf+sR02nT6UdylnoS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397904; c=relaxed/simple;
	bh=TnVIu1G583zix3qS76hXzhAhRv2T1aMP8Tr2wtuwX6s=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ulAMHjl5O+rBvXWoVc0rqdVw8ljmx04/a4SSOMFXosrdvTHC6rAljLWLb1CjDyMJp+FmhrRFnND6sAv9vIXz9fmeYJs+QAWsRzABVUG5T4Gig+ynXUraa9Zd5DKvIlcL0XxOY/lefPDB9HJqRj+M0MY1rhpGl7wFj9o7Y74gjK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgvw0Zwe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766397902; x=1797933902;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=TnVIu1G583zix3qS76hXzhAhRv2T1aMP8Tr2wtuwX6s=;
  b=bgvw0ZwehsFZL7EdwVXG0tsl+liM2HuGG4oJBTQjjG/gtPeNu7qpU72Q
   +kGStrp3Vy5SI1Jiii96qf80YxSyuYCpezJGpx9QaznmsZX6Eb/SrBLZF
   JpkxuAjhBZPypeYeb9unI85YgsJXKe/QCRHUl4MrkySdaaOSbeHHR1tt/
   jz4Cv+C99F0FMQJjz4q9S/Awc3npLtHX6n7t+yqhvfns3d8ZH+li5SI0d
   g0i8uoPJcdoTXE0IAWTS+IMeNJIeIoqxki0zA8C86vCzYneoeAtP7Jtw4
   JWrEPKVs0zzGk0Je/vsrV3ZHQ3TppgBtWSFHQ3btyetNM6u6v2so2/cib
   g==;
X-CSE-ConnectionGUID: 5431kgw0SBu2GgChZqKIsw==
X-CSE-MsgGUID: 8s1SgPzuS8WEPaT1oSFBSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68296116"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68296116"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:05:02 -0800
X-CSE-ConnectionGUID: meL5y6FJT0Gk8XuFAkxEUA==
X-CSE-MsgGUID: Db2esa7bSCiZVc/XTy1hZA==
X-ExtLoop1: 1
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:05:00 -0800
Subject: Re: [PATCH v2 1/4] media: staging/ipu7: ignore interrupts when device
 is suspended
To: Sakari Ailus <sakari.ailus@linux.intel.com>, bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20251222070629.2018807-1-bingbu.cao@intel.com>
 <20251222070629.2018807-2-bingbu.cao@intel.com>
 <aUkEvwTNjfcNtysn@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <fc34210b-9c55-618b-5fbe-9fd98ea46fb5@linux.intel.com>
Date: Mon, 22 Dec 2025 17:56:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aUkEvwTNjfcNtysn@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the review.

On 12/22/25 4:43 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Mon, Dec 22, 2025 at 03:06:26PM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> IPU7 devices have shared interrupts with others. In some case when
>> IPU7 device is suspended, driver get unexpected interrupt and invalid
>> irq status 0xffffffff from ISR_STATUS and PB LOCAL_STATUS
>> registers as interrupt is triggered from other device on shared
>> irq line.
>>
>> In order to avoid this issue use pm_runtime_get_if_active() to check
>> if IPU7 device is resumed, ignore the invalid irq status and use
>> synchronize_irq() in suspend.
>>
>> Cc: Stable@vger.kernel.org
>> Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/staging/media/ipu7/ipu7-buttress.c | 12 ++++++++++--
>>  drivers/staging/media/ipu7/ipu7.c          |  4 ++++
>>  2 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
>> index e5707f5e300b..e4328cafe91d 100644
>> --- a/drivers/staging/media/ipu7/ipu7-buttress.c
>> +++ b/drivers/staging/media/ipu7/ipu7-buttress.c
>> @@ -342,14 +342,22 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
>>  	u32 disable_irqs = 0;
>>  	u32 irq_status;
>>  	unsigned int i;
>> +	int active;
>>  
>> -	pm_runtime_get_noresume(dev);
>> +	active = pm_runtime_get_if_active(dev);
>> +	if (active <= 0)
>> +		return IRQ_NONE;
>>  
>>  	pb_irq = readl(isp->pb_base + INTERRUPT_STATUS);
>>  	writel(pb_irq, isp->pb_base + INTERRUPT_STATUS);
>>  
>>  	/* check btrs ATS, CFI and IMR errors, BIT(0) is unused for IPU */
>>  	pb_local_irq = readl(isp->pb_base + BTRS_LOCAL_INTERRUPT_MASK);
>> +	if (WARN_ON_ONCE(pb_local_irq == 0xffffffff)) {
>> +		pm_runtime_put_noidle(dev);
>> +		return IRQ_NONE;
>> +	}
>> +
>>  	if (pb_local_irq & ~BIT(0)) {
>>  		dev_warn(dev, "PB interrupt status 0x%x local 0x%x\n", pb_irq,
>>  			 pb_local_irq);
>> @@ -365,7 +373,7 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
>>  	}
>>  
>>  	irq_status = readl(isp->base + BUTTRESS_REG_IRQ_STATUS);
>> -	if (!irq_status) {
>> +	if (!irq_status || WARN_ON_ONCE(irq_status == 0xffffffff)) {
>>  		pm_runtime_put_noidle(dev);
>>  		return IRQ_NONE;
> 
> Doesn't this apply to the ipu6 driver as well? E.g. on my Alder lake system
> the interrupt is shared with i801_smbus and processor_thermal_device_pci.
> It may be no interrupts are generated by those devices at inconvenient
> times for ipu6, but the ipu driver can't assume that.

I remember that Stanislaw made a fix for IPU6.
> 
> Is the WARN_ON_ONCE() necessary? I'd use dev_warn_once() here if you'd like
> to write a message to the log.
>
I will update that, dev_warn_once() makes more sense.

>>  	}
>> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
>> index 5cddc09c72bf..6c8c3eea44ac 100644
>> --- a/drivers/staging/media/ipu7/ipu7.c
>> +++ b/drivers/staging/media/ipu7/ipu7.c
>> @@ -2684,6 +2684,10 @@ static void ipu7_pci_reset_done(struct pci_dev *pdev)
>>   */
>>  static int ipu7_suspend(struct device *dev)
>>  {
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +
>> +	synchronize_irq(pdev->irq);
>> +
>>  	return 0;
>>  }
>>  
> 

-- 
Best regards,
Bingbu Cao

