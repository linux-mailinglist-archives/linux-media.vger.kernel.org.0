Return-Path: <linux-media+bounces-20663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFEB9B8A40
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 05:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B92928311F
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 04:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFA11482E1;
	Fri,  1 Nov 2024 04:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbOs5eFt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4582E38FA3
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 04:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730435400; cv=none; b=idnzGHIyVufkdhDaXBHNqmbxy1BXUU6ziH/+M56Q6kDJcA1DC94dAcYWbTXt5aFqX9cUfxR6yOqTQUbDFEtPYvOwY63MGWRORegLsmSFtCCKc/wO9wT3YMNt8O+ho4toJWavCUaiC/WC6wlgbTya67FpW/NjDyoLcq5AmTcu1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730435400; c=relaxed/simple;
	bh=OLc8ExDOnfHAB04aJpFGbQUuigLp0mzgOsu1Vw5Ra48=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sXykVOS3uznkhp/YtGtO35Z0vgw1RMK1g6MFE3Z77q0sFTN+xEu+iXhOYXSm39PpSS7XdDSQYbxBFIIfakGfhnFji51Jdgbm4nikx0bDwtSF/8ifbYAKIkP5TDia3GuphSk1WznnSzaqToQ+g0nETT9jTYd2aOoQtYo03SayDGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbOs5eFt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730435398; x=1761971398;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=OLc8ExDOnfHAB04aJpFGbQUuigLp0mzgOsu1Vw5Ra48=;
  b=GbOs5eFt13sB493EX8Es2RgHL5JI/akA+PLlLi1fnpRbXjl4JxjQhBhk
   SpBLrJsoQIkfdW+9jIeASdj+XBvLk5a7heaJ5+KLALQtBA0bXZCSJM+UN
   FkiiYw1iLCz10Y3sJOJLErNEkk6pFJCsX9h7gxxFtJpF8FX5CEtabbUdl
   6rG3qjcbOTSERWLgGLS+rLxGbJIUDELh6XZSgwm1oOaR4TB7g/bZKOdcT
   6RgbYjtTBffWJWM6LcCTFb++ODvhrJA0cDwLCbCi/jIN0DjAEChZ7MM1+
   YdABppPq1k/MPvjHl0BjI6S8Iu8P6bX/KX2x1smHR2/ELyd3n7ir70/FX
   Q==;
X-CSE-ConnectionGUID: +eCtsfhgR/6KQf1HegwFKw==
X-CSE-MsgGUID: v9KpIAfeQRWD+6v0P8bBlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30157998"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30157998"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:29:57 -0700
X-CSE-ConnectionGUID: AzJP+KxPR4iBbiwfynHx7w==
X-CSE-MsgGUID: gRPscGaQT/mY/h/1yVf1ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="106179946"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:29:56 -0700
Subject: Re: [PATCH v2] media: intel/ipu6: remove buttress ish structure
From: Bingbu Cao <bingbu.cao@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>
References: <20241031130622.430308-1-stanislaw.gruszka@linux.intel.com>
 <f6e4a8b9-1ee5-04f2-069a-cf2541cca6bd@linux.intel.com>
Message-ID: <2251d433-ecf0-6300-3598-82438befb456@linux.intel.com>
Date: Fri, 1 Nov 2024 12:26:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <f6e4a8b9-1ee5-04f2-069a-cf2541cca6bd@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 11/1/24 12:22 PM, Bingbu Cao wrote:
> Stanislaw,
> 
> Thanks for the patch, this is what I intended to do.
> 
> On 10/31/24 9:06 PM, Stanislaw Gruszka wrote:
>> The buttress ipc ish structure is not effectively used on IPU6 - data
>> is nullified on init. Remove it to cleanup the code a bit.
>>
>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>> ---
>> v2: fix formatting: use media: prefix in topic and white space alignment
>> to match open parenthesis
>>
>>  drivers/media/pci/intel/ipu6/ipu6-buttress.c | 27 ++++++--------------
>>  drivers/media/pci/intel/ipu6/ipu6-buttress.h |  6 -----
>>  2 files changed, 8 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
>> index edaa285283a1..6644fd4c3d91 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
>> @@ -214,20 +214,17 @@ static void ipu6_buttress_ipc_recv(struct ipu6_device *isp,
>>  }
>>  
>>  static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
>> -				       enum ipu6_buttress_ipc_domain ipc_domain,
>>  				       struct ipu6_ipc_buttress_bulk_msg *msgs,
>>  				       u32 size)
>>  {
>>  	unsigned long tx_timeout_jiffies, rx_timeout_jiffies;
>>  	unsigned int i, retry = BUTTRESS_IPC_CMD_SEND_RETRY;
>>  	struct ipu6_buttress *b = &isp->buttress;
>> -	struct ipu6_buttress_ipc *ipc;
>> +	struct ipu6_buttress_ipc *ipc = &b->cse;
>>  	u32 val;
>>  	int ret;
>>  	int tout;
>>  
>> -	ipc = ipc_domain == IPU6_BUTTRESS_IPC_CSE ? &b->cse : &b->ish;
>> -
>>  	mutex_lock(&b->ipc_mutex);
>>  
>>  	ret = ipu6_buttress_ipc_validity_open(isp, ipc);
>> @@ -305,7 +302,6 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
>>  
>>  static int
>>  ipu6_buttress_ipc_send(struct ipu6_device *isp,
>> -		       enum ipu6_buttress_ipc_domain ipc_domain,
>>  		       u32 ipc_msg, u32 size, bool require_resp,
>>  		       u32 expected_resp)
>>  {
>> @@ -316,7 +312,7 @@ ipu6_buttress_ipc_send(struct ipu6_device *isp,
>>  		.expected_resp = expected_resp,
>>  	};
>>  
>> -	return ipu6_buttress_ipc_send_bulk(isp, ipc_domain, &msg, 1);
>> +	return ipu6_buttress_ipc_send_bulk(isp, &msg, 1);
>>  }
>>  
>>  static irqreturn_t ipu6_buttress_call_isr(struct ipu6_bus_device *adev)
>> @@ -386,10 +382,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>>  		}
>>  
>>  		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
>> -			dev_dbg(&isp->pdev->dev,
>> -				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
>> -			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
>> -			complete(&b->ish.recv_complete);
>> +			dev_warn(&isp->pdev->dev,
>> +				 "BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
> 
> I think this is a unrelated change, right?

I mean the change from dev_dbg() to dev_warn().
> 
>>  		}
>>  
>>  		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
>> @@ -399,9 +393,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>>  		}
>>  
>>  		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH) {
>> -			dev_dbg(&isp->pdev->dev,
>> -				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
>> -			complete(&b->ish.send_complete);
>> +			dev_warn(&isp->pdev->dev,
>> +				 "BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
> 
> Ditto.
> 
>>  		}
>>  
>>  		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
>> @@ -655,7 +648,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
>>  	 */
>>  	dev_info(&isp->pdev->dev, "Sending BOOT_LOAD to CSE\n");
>>  
>> -	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
>> +	ret = ipu6_buttress_ipc_send(isp,
>>  				     BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD,
>>  				     1, true,
>>  				     BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
>> @@ -697,7 +690,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
>>  	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
>>  	 */
>>  	dev_info(&isp->pdev->dev, "Sending AUTHENTICATE_RUN to CSE\n");
>> -	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
>> +	ret = ipu6_buttress_ipc_send(isp,
>>  				     BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN,
>>  				     1, true,
>>  				     BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
>> @@ -838,9 +831,7 @@ int ipu6_buttress_init(struct ipu6_device *isp)
>>  	mutex_init(&b->auth_mutex);
>>  	mutex_init(&b->cons_mutex);
>>  	mutex_init(&b->ipc_mutex);
>> -	init_completion(&b->ish.send_complete);
>>  	init_completion(&b->cse.send_complete);
>> -	init_completion(&b->ish.recv_complete);
>>  	init_completion(&b->cse.recv_complete);
>>  
>>  	b->cse.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
>> @@ -852,8 +843,6 @@ int ipu6_buttress_init(struct ipu6_device *isp)
>>  	b->cse.data0_in = BUTTRESS_REG_CSE2IUDATA0;
>>  	b->cse.data0_out = BUTTRESS_REG_IU2CSEDATA0;
>>  
>> -	/* no ISH on IPU6 */
>> -	memset(&b->ish, 0, sizeof(b->ish));
>>  	INIT_LIST_HEAD(&b->constraints);
>>  
>>  	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
>> index 9b6f56958be7..482978c2a09d 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
>> @@ -46,18 +46,12 @@ struct ipu6_buttress_ipc {
>>  struct ipu6_buttress {
>>  	struct mutex power_mutex, auth_mutex, cons_mutex, ipc_mutex;
>>  	struct ipu6_buttress_ipc cse;
>> -	struct ipu6_buttress_ipc ish;
>>  	struct list_head constraints;
>>  	u32 wdt_cached_value;
>>  	bool force_suspend;
>>  	u32 ref_clk;
>>  };
>>  
>> -enum ipu6_buttress_ipc_domain {
>> -	IPU6_BUTTRESS_IPC_CSE,
>> -	IPU6_BUTTRESS_IPC_ISH,
>> -};
>> -
>>  struct ipu6_ipc_buttress_bulk_msg {
>>  	u32 cmd;
>>  	u32 expected_resp;
>>
> 
> Besides minor comment:
> 
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> 

-- 
Best regards,
Bingbu Cao

