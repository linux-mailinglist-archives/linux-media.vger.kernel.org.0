Return-Path: <linux-media+bounces-20666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD29B8C5C
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 08:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3B7C1F226D5
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 07:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E5C1553A3;
	Fri,  1 Nov 2024 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKqxwmMt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78394155352
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447462; cv=none; b=LLUMSW9yGyrYy4NVyIMxvc/HGia8nN0dU7Ipu4fugxkBaoRBak+P3AkgYzj8KZgEjVnLzqljRJdnZxA4pwClEiWnPrVHdu0eA0u4VRQ+S6lF+qG8eIBzAd/hdb2dVYl5xxUjr2l7QRf7LbTpLTls5quOko2jX0Jtftv308DP/Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447462; c=relaxed/simple;
	bh=b/4k6GIn1xlOz7zNgWgFqWSkLcs+Ts1yGbj8VM4FdQw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sueJhRecW4EsMIRnlrUL9hFRveMRJmNCqJESymk/2rmW/DMcd5tlFII3+QzH1xsl7NrD4SgYY3ONDhRb89UesTxeFB3kQ2vgdTJRD842nRhjL9PZSH/eGtWzoc6PEencTalBv+2qFcdLVVB3+YvyVt7QKxMAiEOaZzuimVOEkCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKqxwmMt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730447461; x=1761983461;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=b/4k6GIn1xlOz7zNgWgFqWSkLcs+Ts1yGbj8VM4FdQw=;
  b=JKqxwmMtkvw15AMN04JgCL7OV7eMYx8E++avXJW2aCaA7s+NCD/xuKwg
   8XsAL3/LoW4xg0Uuz05mb30KjE5zplsHsBBfOBqX2Ol23xXVKI/kk19/K
   /mHUW8s7nAz137kUEdsfodkL5ueuF7SUT6RzDxmVNRV9iZy0sTr9aApLq
   ozrAzOSuU4NOSeVidfYovoMDYxx2wgi/S9H3HmAoAKKBNKrcthGwHUwpe
   Q3TTsUq/vRZRxZcitS8z1knsEPupGTo0gtW0UgqqxyVH3BFuTXw3U2TE+
   mnDTw5Im2ExTsqfaAbkTV+DXBvFRsODgxve/IGuLTvLoizfqzle3qcFlX
   A==;
X-CSE-ConnectionGUID: I9nU0oQIQzayh6MMIH15qQ==
X-CSE-MsgGUID: 0sEKI+hTQ4y2VVIQ7KedBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29981021"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29981021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 00:51:00 -0700
X-CSE-ConnectionGUID: Su8ix9LHRi6mhbsTGEF22w==
X-CSE-MsgGUID: ayWby0abQKap/M9k3kDrjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83001326"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 00:50:58 -0700
Subject: Re: [PATCH v2] media: intel/ipu6: remove buttress ish structure
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
References: <20241031130622.430308-1-stanislaw.gruszka@linux.intel.com>
 <f6e4a8b9-1ee5-04f2-069a-cf2541cca6bd@linux.intel.com>
 <2251d433-ecf0-6300-3598-82438befb456@linux.intel.com>
 <ZySHPtECRXNTSN2d@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <34bb5ca1-8c7c-316e-5886-378c8660f7f1@linux.intel.com>
Date: Fri, 1 Nov 2024 15:47:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZySHPtECRXNTSN2d@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari and Stanislaw,

On 11/1/24 3:46 PM, Sakari Ailus wrote:
> Hi Bingbu, Stanislaw,
> 
> On Fri, Nov 01, 2024 at 12:26:52PM +0800, Bingbu Cao wrote:
>>
>> On 11/1/24 12:22 PM, Bingbu Cao wrote:
>>> Stanislaw,
>>>
>>> Thanks for the patch, this is what I intended to do.
>>>
>>> On 10/31/24 9:06 PM, Stanislaw Gruszka wrote:
>>>> The buttress ipc ish structure is not effectively used on IPU6 - data
>>>> is nullified on init. Remove it to cleanup the code a bit.
>>>>
>>>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>>> ---
>>>> v2: fix formatting: use media: prefix in topic and white space alignment
>>>> to match open parenthesis
>>>>
>>>>  drivers/media/pci/intel/ipu6/ipu6-buttress.c | 27 ++++++--------------
>>>>  drivers/media/pci/intel/ipu6/ipu6-buttress.h |  6 -----
>>>>  2 files changed, 8 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
>>>> index edaa285283a1..6644fd4c3d91 100644
>>>> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
>>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
>>>> @@ -214,20 +214,17 @@ static void ipu6_buttress_ipc_recv(struct ipu6_device *isp,
>>>>  }
>>>>  
>>>>  static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
>>>> -				       enum ipu6_buttress_ipc_domain ipc_domain,
>>>>  				       struct ipu6_ipc_buttress_bulk_msg *msgs,
>>>>  				       u32 size)
>>>>  {
>>>>  	unsigned long tx_timeout_jiffies, rx_timeout_jiffies;
>>>>  	unsigned int i, retry = BUTTRESS_IPC_CMD_SEND_RETRY;
>>>>  	struct ipu6_buttress *b = &isp->buttress;
>>>> -	struct ipu6_buttress_ipc *ipc;
>>>> +	struct ipu6_buttress_ipc *ipc = &b->cse;
>>>>  	u32 val;
>>>>  	int ret;
>>>>  	int tout;
>>>>  
>>>> -	ipc = ipc_domain == IPU6_BUTTRESS_IPC_CSE ? &b->cse : &b->ish;
>>>> -
>>>>  	mutex_lock(&b->ipc_mutex);
>>>>  
>>>>  	ret = ipu6_buttress_ipc_validity_open(isp, ipc);
>>>> @@ -305,7 +302,6 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
>>>>  
>>>>  static int
>>>>  ipu6_buttress_ipc_send(struct ipu6_device *isp,
>>>> -		       enum ipu6_buttress_ipc_domain ipc_domain,
>>>>  		       u32 ipc_msg, u32 size, bool require_resp,
>>>>  		       u32 expected_resp)
>>>>  {
>>>> @@ -316,7 +312,7 @@ ipu6_buttress_ipc_send(struct ipu6_device *isp,
>>>>  		.expected_resp = expected_resp,
>>>>  	};
>>>>  
>>>> -	return ipu6_buttress_ipc_send_bulk(isp, ipc_domain, &msg, 1);
>>>> +	return ipu6_buttress_ipc_send_bulk(isp, &msg, 1);
>>>>  }
>>>>  
>>>>  static irqreturn_t ipu6_buttress_call_isr(struct ipu6_bus_device *adev)
>>>> @@ -386,10 +382,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>>>>  		}
>>>>  
>>>>  		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
>>>> -			dev_dbg(&isp->pdev->dev,
>>>> -				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
>>>> -			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
>>>> -			complete(&b->ish.recv_complete);
>>>> +			dev_warn(&isp->pdev->dev,
>>>> +				 "BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
>>>
>>> I think this is a unrelated change, right?
>>
>> I mean the change from dev_dbg() to dev_warn().
> 
> We're not handling these interrupts anymore in any way.
> 
> I wonder if the ipu6_buttress_ipc_recv() call should still remain in place,
> even if we really do nothing with these. It looks like some kind of an
> acknowledgement mechanism.

I just confirm that IPC_FROM_ISH_IS_WAITING and IPC_EXEC_DONE_BY_ISH are
not valid anymore from IPU6, I think the handling here and below could be
removed.

> 
>>>
>>>>  		}
>>>>  
>>>>  		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
>>>> @@ -399,9 +393,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>>>>  		}
>>>>  
>>>>  		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH) {
>>>> -			dev_dbg(&isp->pdev->dev,
>>>> -				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
>>>> -			complete(&b->ish.send_complete);
>>>> +			dev_warn(&isp->pdev->dev,
>>>> +				 "BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
>>>
>>> Ditto.
>>>
>>>>  		}
>>>>  
>>>>  		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
>>>> @@ -655,7 +648,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
>>>>  	 */
>>>>  	dev_info(&isp->pdev->dev, "Sending BOOT_LOAD to CSE\n");
>>>>  
>>>> -	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
>>>> +	ret = ipu6_buttress_ipc_send(isp,
>>>>  				     BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD,
>>>>  				     1, true,
>>>>  				     BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
>>>> @@ -697,7 +690,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
>>>>  	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
>>>>  	 */
>>>>  	dev_info(&isp->pdev->dev, "Sending AUTHENTICATE_RUN to CSE\n");
>>>> -	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
>>>> +	ret = ipu6_buttress_ipc_send(isp,
>>>>  				     BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN,
>>>>  				     1, true,
>>>>  				     BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
>>>> @@ -838,9 +831,7 @@ int ipu6_buttress_init(struct ipu6_device *isp)
>>>>  	mutex_init(&b->auth_mutex);
>>>>  	mutex_init(&b->cons_mutex);
>>>>  	mutex_init(&b->ipc_mutex);
>>>> -	init_completion(&b->ish.send_complete);
>>>>  	init_completion(&b->cse.send_complete);
>>>> -	init_completion(&b->ish.recv_complete);
>>>>  	init_completion(&b->cse.recv_complete);
>>>>  
>>>>  	b->cse.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
>>>> @@ -852,8 +843,6 @@ int ipu6_buttress_init(struct ipu6_device *isp)
>>>>  	b->cse.data0_in = BUTTRESS_REG_CSE2IUDATA0;
>>>>  	b->cse.data0_out = BUTTRESS_REG_IU2CSEDATA0;
>>>>  
>>>> -	/* no ISH on IPU6 */
>>>> -	memset(&b->ish, 0, sizeof(b->ish));
>>>>  	INIT_LIST_HEAD(&b->constraints);
>>>>  
>>>>  	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
>>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
>>>> index 9b6f56958be7..482978c2a09d 100644
>>>> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
>>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
>>>> @@ -46,18 +46,12 @@ struct ipu6_buttress_ipc {
>>>>  struct ipu6_buttress {
>>>>  	struct mutex power_mutex, auth_mutex, cons_mutex, ipc_mutex;
>>>>  	struct ipu6_buttress_ipc cse;
>>>> -	struct ipu6_buttress_ipc ish;
>>>>  	struct list_head constraints;
>>>>  	u32 wdt_cached_value;
>>>>  	bool force_suspend;
>>>>  	u32 ref_clk;
>>>>  };
>>>>  
>>>> -enum ipu6_buttress_ipc_domain {
>>>> -	IPU6_BUTTRESS_IPC_CSE,
>>>> -	IPU6_BUTTRESS_IPC_ISH,
>>>> -};
>>>> -
>>>>  struct ipu6_ipc_buttress_bulk_msg {
>>>>  	u32 cmd;
>>>>  	u32 expected_resp;
>>>>
>>>
>>> Besides minor comment:
>>>
>>> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>
> 

-- 
Best regards,
Bingbu Cao

