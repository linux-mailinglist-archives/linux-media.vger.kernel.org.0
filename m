Return-Path: <linux-media+bounces-3191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A32E822E16
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 14:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC251B22EFA
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 13:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01A51947A;
	Wed,  3 Jan 2024 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwqPqtgr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B6019473
	for <linux-media@vger.kernel.org>; Wed,  3 Jan 2024 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704287704; x=1735823704;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=hnG8MCSpB8uAjxohsVqNHGLdDdAWSQ35LQR7VGt+GaY=;
  b=LwqPqtgryCGeAASbycBumfBiGrns7h5w+CUwa254+tRbngLaCqpicNyW
   rwT2f36mmjDL9pAqNM00iYw0VmryuKH+GiRK2WmG3gZmn9LjIQ+OIHG94
   plnmqNvNgBhpmZWBiXtj+DWT+W4xJlC2do3E+WwabLLmzk2R4F3OeDMbR
   1gubmRqJ2kIcTRjsFUYKkj2f5bRx08+4eDBqj9UYtqOH6B7kkFKJ5Ncb5
   y8sa746JPY96BN2Ss1rdMfdkjQc0n9r6oIVeqRLjxrnZt29bDQw6NxzXX
   sEocUtJohOLVCTrN3NE7DTtKHIEZgEWFVzERZ1oVi6qqpx5yf3eyJtAzo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3776728"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3776728"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 05:15:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="779984509"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="779984509"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orsmga002.jf.intel.com with ESMTP; 03 Jan 2024 05:14:58 -0800
Subject: Re: [PATCH v2 03/15] media: intel/ipu6: add IPU6 buttress interface
 driver
To: Andreas Helbech Kleist <andreaskleist@gmail.com>, bingbu.cao@intel.com,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org, senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
 hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-4-bingbu.cao@intel.com>
 <25b34fe6327dbb59ee485a8b5d411b73ffd29392.camel@gmail.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <a6d1ed67-1d2c-3700-fe74-5697d4217bea@linux.intel.com>
Date: Wed, 3 Jan 2024 21:11:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <25b34fe6327dbb59ee485a8b5d411b73ffd29392.camel@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Andreas,

On 1/3/24 5:22 PM, Andreas Helbech Kleist wrote:
> Hi Bingbu,
> 
> On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> The IPU6 buttress is the interface between IPU device (input system
>> and processing system) with rest of the SoC. It contains overall IPU
>> hardware control registers, these control registers are used as the
>> interfaces with the Intel Converged Security Engine and Punit to do
>> firmware authentication and power management.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
> 
> ...
> 
>> +static irqreturn_t ipu6_buttress_call_isr(struct ipu6_bus_device *adev)
>> +{
>> +	irqreturn_t ret = IRQ_WAKE_THREAD;
>> +
>> +	if (!adev || !adev->auxdrv || !adev->auxdrv_data)
>> +		return IRQ_NONE;
>> +
>> +	if (adev->auxdrv_data->isr)
>> +		ret = adev->auxdrv_data->isr(adev);
>> +
>> +	if (ret == IRQ_WAKE_THREAD && !adev->auxdrv_data->isr_threaded)
>> +		ret = IRQ_NONE;
>> +
>> +	return ret;
>> +}
>> +
>> +irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>> +{
>> +	struct ipu6_device *isp = isp_ptr;
>> +	struct ipu6_bus_device *adev[] = { isp->isys, isp->psys };
>> +	struct ipu6_buttress *b = &isp->buttress;
>> +	u32 reg_irq_sts = BUTTRESS_REG_ISR_STATUS;
>> +	irqreturn_t ret = IRQ_NONE;
>> +	u32 disable_irqs = 0;
>> +	u32 irq_status;
>> +	u32 i, count = 0;
>> +
>> +	pm_runtime_get_noresume(&isp->pdev->dev);
>> +
>> +	irq_status = readl(isp->base + reg_irq_sts);
>> +	if (!irq_status) {
>> +		pm_runtime_put_noidle(&isp->pdev->dev);
>> +		return IRQ_NONE;
>> +	}
>> +
>> +	do {
>> +		writel(irq_status, isp->base + BUTTRESS_REG_ISR_CLEAR);
>> +
>> +		for (i = 0; i < ARRAY_SIZE(ipu6_adev_irq_mask); i++) {
>> +			irqreturn_t r = ipu6_buttress_call_isr(adev[i]);
>> +
>> +			if (!(irq_status & ipu6_adev_irq_mask[i]))
>> +				continue;
>> +
>> +			if (r == IRQ_WAKE_THREAD) {
>> +				ret = IRQ_WAKE_THREAD;
>> +				disable_irqs |= ipu6_adev_irq_mask[i];
>> +			} else if (ret == IRQ_NONE && r == IRQ_HANDLED) {
>> +				ret = IRQ_HANDLED;
>> +			}
>> +		}
> 
> It seems wrong to call the ISR for a adev[i] before checking the
> corresponding IRQ mask. If the mask is not set, the ISR is still
> called, but the result is thrown away.
> 
> I started investigating this because I'm seeing "general protection
> fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b" in this
> function when unbinding the IPU4 driver.
> 
> How do you ensure that the ISR is not called on a ipu6-bus device that
> has been deleted? Specifically in ipu6_pci_remove, ipu6_bus_del_devices
> is called before ipu6_buttress_exit (which disables buttress IRQs).
> Perhaps the above for loop should really be a "for each ipu6-bus
> device" loop?

You are right, the buttress_exit() should be called before
ipu6_bus_del_devices().

Even with this, driver cannot guarantee that hardware irq was actually
disabled on IPU4. In some error cases, HW could report unmasked errors on
IPU4 (no such case on IPU6), if I remember correctly.

Have you check whether devm_free_irq() in ipu6_pci_remove() can help you?

> 
>> +
>> +		if ((irq_status & BUTTRESS_EVENT) && ret == IRQ_NONE)
>> +			ret = IRQ_HANDLED;
>> +
>> +		if (irq_status & BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING) {
>> +			dev_dbg(&isp->pdev->dev,
>> +				"BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING\n");
>> +			ipu6_buttress_ipc_recv(isp, &b->cse, &b->cse.recv_data);
>> +			complete(&b->cse.recv_complete);
>> +		}
>> +
>> +		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
>> +			dev_dbg(&isp->pdev->dev,
>> +				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
>> +			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
>> +			complete(&b->ish.recv_complete);
>> +		}
>> +
>> +		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
>> +			dev_dbg(&isp->pdev->dev,
>> +				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
>> +			complete(&b->cse.send_complete);
>> +		}
>> +
>> +		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH) {
>> +			dev_dbg(&isp->pdev->dev,
>> +				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
>> +			complete(&b->ish.send_complete);
>> +		}
>> +
>> +		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
>> +		    ipu6_buttress_get_secure_mode(isp))
>> +			dev_err(&isp->pdev->dev,
>> +				"BUTTRESS_ISR_SAI_VIOLATION\n");
>> +
>> +		if (irq_status & (BUTTRESS_ISR_IS_FATAL_MEM_ERR |
>> +				  BUTTRESS_ISR_PS_FATAL_MEM_ERR))
>> +			dev_err(&isp->pdev->dev,
>> +				"BUTTRESS_ISR_FATAL_MEM_ERR\n");
>> +
>> +		if (irq_status & BUTTRESS_ISR_UFI_ERROR)
>> +			dev_err(&isp->pdev->dev, "BUTTRESS_ISR_UFI_ERROR\n");
>> +
>> +		if (++count == BUTTRESS_MAX_CONSECUTIVE_IRQS) {
>> +			dev_err(&isp->pdev->dev, "too many consecutive IRQs\n");
>> +			ret = IRQ_NONE;
>> +			break;
>> +		}
>> +
>> +		irq_status = readl(isp->base + reg_irq_sts);
>> +	} while (irq_status);
>> +
>> +	if (disable_irqs)
>> +		writel(BUTTRESS_IRQS & ~disable_irqs,
>> +		       isp->base + BUTTRESS_REG_ISR_ENABLE);
>> +
>> +	pm_runtime_put(&isp->pdev->dev);
>> +
>> +	return ret;
>> +}
> 
> ...
> 
> /Andreas
> 

-- 
Best regards,
Bingbu Cao

