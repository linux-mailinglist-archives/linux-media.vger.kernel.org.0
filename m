Return-Path: <linux-media+bounces-3281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B5826797
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 05:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E429D281BB1
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 04:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555D328F2;
	Mon,  8 Jan 2024 04:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3Z7DzmR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E840E79CC
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 04:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704687841; x=1736223841;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=UmE1TW67yUyMu32IMepUtNZJA28ECtU4Fld8UZ6nC4s=;
  b=R3Z7DzmRdl5HofCry37TAbAmnbT7MpYq1XU3xkh0bt3fp4rR2OEN9vQq
   g5kN7A0zr46t+/WtZU4Lm9IL9pMumk2WTvFek8bfq2icRUB+HescB9WYN
   +5/AJZqDYTlzRr4s742DixMuHynOllJu44tTsWxyQFjgUqdrP/UEjd7Wt
   8UnKO9N6CfLfSZQH0RtmoGKFIE3+oA98xD/uJXtfDwpS335y75GwOssB1
   mTqrID31EiZkNCg1XHVT/wVcYYmkZzt0X3Nd24IqJjnqNBBXSDiE40dLo
   woTDm6NU35hvgpsd0X3Qbj+PaCYG1rHaNeF9Sz06nGiTkYNZaYX/1LhPr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="5162124"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="5162124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 20:23:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="23047709"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa002.jf.intel.com with ESMTP; 07 Jan 2024 20:23:34 -0800
Subject: Re: [PATCH v2 06/15] media: intel/ipu6: add syscom interfaces between
 firmware and driver
To: Andreas Helbech Kleist <andreaskleist@gmail.com>, bingbu.cao@intel.com,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org, senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
 hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-7-bingbu.cao@intel.com>
 <c8ad7da6ea24b31aab2eead0d822f8dc897a105e.camel@gmail.com>
 <36bb9aee-409c-88d0-30e3-a34de23c8577@linux.intel.com>
 <d0c7365f1fbb13d7c79e05d7280d4405fc317414.camel@gmail.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <561a0a0e-fbec-288b-3c38-64ae9f5970d8@linux.intel.com>
Date: Mon, 8 Jan 2024 12:19:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <d0c7365f1fbb13d7c79e05d7280d4405fc317414.camel@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Andreas,

On 1/3/24 5:25 PM, Andreas Helbech Kleist wrote:
> Hi, 
> 
> On Thu, 2023-12-28 at 14:39 +0800, Bingbu Cao wrote:
>> Andreas,
>>
>> On 11/23/23 5:33 PM, Andreas Helbech Kleist wrote:
>>> Hi,
>>>
>>> On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
>>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>>
>>>> Syscom is an inter-process(or) communication mechanism between an IPU
>>>> and host. Syscom uses message queues for message exchange between IPU
>>>> and host. Each message queue has its consumer and producer, host
>>>> queue
>>>> messages to firmware as the producer and then firmware to dequeue the
>>>> messages as consumer and vice versa. IPU and host use shared
>>>> registers
>>>> or memory to reside the read and write indices which are updated by
>>>> consumer and producer.
>>>>
>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>>> ---
>>>>  drivers/media/pci/intel/ipu6/ipu6-fw-com.c | 411
>>>> +++++++++++++++++++++
>>>>  drivers/media/pci/intel/ipu6/ipu6-fw-com.h |  47 +++
>>>>  2 files changed, 458 insertions(+)
>>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
>>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
>>> ...
>>>> +struct ipu6_fw_com_context {
>>>> +       struct ipu6_bus_device *adev;
>>>> +       void __iomem *dmem_addr;
>>>> +       int (*cell_ready)(struct ipu6_bus_device *adev);
>>>> +       void (*cell_start)(struct ipu6_bus_device *adev);
>>>
>>> Why are cell_ready and cell_start function pointers? They seem to
>>> always be set to query_sp and start_sp.
>>>
>>>> +
>>>> +       void *dma_buffer;
>>>> +       dma_addr_t dma_addr;
>>>> +       unsigned int dma_size;
>>>> +       unsigned long attrs;
>>>> +
>>>> +       struct ipu6_fw_sys_queue *input_queue;  /* array of host to
>>>> SP queues */
>>>> +       struct ipu6_fw_sys_queue *output_queue; /* array of SP to
>>>> host */
>>>> +
>>>> +       u32 config_vied_addr;
>>>> +
>>>> +       unsigned int buttress_boot_offset;
>>>> +       void __iomem *base_addr;
>>>> +};
>>>> +
>>>> +#define FW_COM_WR_REG 0
>>>> +#define FW_COM_RD_REG 4
>>>> +
>>>> +#define REGMEM_OFFSET 0
>>>> +#define TUNIT_MAGIC_PATTERN 0x5a5a5a5a
>>>> +
>>>> +enum regmem_id {
>>>> +       /* pass pkg_dir address to SPC in non-secure mode */
>>>> +       PKG_DIR_ADDR_REG = 0,
>>>> +       /* Tunit CFG blob for secure - provided by host.*/
>>>> +       TUNIT_CFG_DWR_REG = 1,
>>>> +       /* syscom commands - modified by the host */
>>>> +       SYSCOM_COMMAND_REG = 2,
>>>> +       /* Store interrupt status - updated by SP */
>>>> +       SYSCOM_IRQ_REG = 3,
>>>> +       /* first syscom queue pointer register */
>>>> +       SYSCOM_QPR_BASE_REG = 4
>>>> +};
>>>> +
>>>> +enum message_direction {
>>>> +       DIR_RECV = 0,
>>>> +       DIR_SEND
>>>> +};
>>>
>>> Not used?
>>
>> Ack, will remove.
>>
>>>
>>>
>>> ...
>>>> +struct ipu6_fw_com_cfg {
>>>> +       unsigned int num_input_queues;
>>>> +       unsigned int num_output_queues;
>>>> +       struct ipu6_fw_syscom_queue_config *input;
>>>> +       struct ipu6_fw_syscom_queue_config *output;
>>>> +
>>>> +       unsigned int dmem_addr;
>>>> +
>>>> +       /* firmware-specific configuration data */
>>>> +       void *specific_addr;
>>>> +       unsigned int specific_size;
>>>> +       int (*cell_ready)(struct ipu6_bus_device *adev);
>>>> +       void (*cell_start)(struct ipu6_bus_device *adev);
>>>> +
>>>> +       unsigned int buttress_boot_offset;
>>>
>>> This seems to always be 0 (set by ipu6-fw-isys.c), seems to be trivial
>>> to remove.
>>
>> All these fields are all used to extend for psys driver.
> 
> Then I suppose they can be added if a psys driver is submitted upstream
> at some point.

For IPU subsystem, the fwcom interface (IPU6 driver) is a common
interface for both isys and psys. It makes sense that making the
common interface scalable even it is only set by isys driver now.

> 
> Is is it the intention to submit a psys driver as well?

Yes, we are going to submit a IPU6 psys driver, but it will take more
time to get ready.

> 
> /Andreas
> 
> 

-- 
Best regards,
Bingbu Cao

