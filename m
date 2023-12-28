Return-Path: <linux-media+bounces-3047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC2681F525
	for <lists+linux-media@lfdr.de>; Thu, 28 Dec 2023 07:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF0F21C21CBD
	for <lists+linux-media@lfdr.de>; Thu, 28 Dec 2023 06:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F8D3C07;
	Thu, 28 Dec 2023 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfnj5Bo6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5236FA2
	for <linux-media@vger.kernel.org>; Thu, 28 Dec 2023 06:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703745784; x=1735281784;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=oVTfNKYL4oaoIqTGEpLXHLuczER5g3nWPHrlh+6BYUA=;
  b=cfnj5Bo6ywEnUcCGpvh+HgO5U2htxKPQEOVy0dh85PTguFx7jOTf26cm
   13DFudej9YS8JowXCHUDhmWdG9oYQy8tiTERAfD8Rve1LA9N35FjyzdVY
   fnwlrF9IZRrR7CrMIHVIHOXLOSPN4EzVEDBs2ygm53+uRZAiMM5Ncq7RN
   7FF94++xz4asxsYDlZp8tNBmt1YuZv4JYzmVEyg4khgFBC687XF8TZKLN
   WjYHLmPyXsFWfh4FfoxRsdTstClZf1xYnHOc3lahdwyJhJDzhYvPkzbl0
   /c+NVzWc9vwj81DOfCbbHBZYGgJfEWfa6isAzAsr/RaV25OAqfx5a+PKN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="427689790"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="427689790"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="771645692"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="771645692"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orsmga007.jf.intel.com with ESMTP; 27 Dec 2023 22:42:59 -0800
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
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <36bb9aee-409c-88d0-30e3-a34de23c8577@linux.intel.com>
Date: Thu, 28 Dec 2023 14:39:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <c8ad7da6ea24b31aab2eead0d822f8dc897a105e.camel@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Andreas,

On 11/23/23 5:33 PM, Andreas Helbech Kleist wrote:
> Hi,
> 
> On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Syscom is an inter-process(or) communication mechanism between an IPU
>> and host. Syscom uses message queues for message exchange between IPU
>> and host. Each message queue has its consumer and producer, host
>> queue
>> messages to firmware as the producer and then firmware to dequeue the
>> messages as consumer and vice versa. IPU and host use shared
>> registers
>> or memory to reside the read and write indices which are updated by
>> consumer and producer.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/media/pci/intel/ipu6/ipu6-fw-com.c | 411
>> +++++++++++++++++++++
>>  drivers/media/pci/intel/ipu6/ipu6-fw-com.h |  47 +++
>>  2 files changed, 458 insertions(+)
>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
> ...
>> +struct ipu6_fw_com_context {
>> +       struct ipu6_bus_device *adev;
>> +       void __iomem *dmem_addr;
>> +       int (*cell_ready)(struct ipu6_bus_device *adev);
>> +       void (*cell_start)(struct ipu6_bus_device *adev);
> 
> Why are cell_ready and cell_start function pointers? They seem to
> always be set to query_sp and start_sp.
> 
>> +
>> +       void *dma_buffer;
>> +       dma_addr_t dma_addr;
>> +       unsigned int dma_size;
>> +       unsigned long attrs;
>> +
>> +       struct ipu6_fw_sys_queue *input_queue;  /* array of host to
>> SP queues */
>> +       struct ipu6_fw_sys_queue *output_queue; /* array of SP to
>> host */
>> +
>> +       u32 config_vied_addr;
>> +
>> +       unsigned int buttress_boot_offset;
>> +       void __iomem *base_addr;
>> +};
>> +
>> +#define FW_COM_WR_REG 0
>> +#define FW_COM_RD_REG 4
>> +
>> +#define REGMEM_OFFSET 0
>> +#define TUNIT_MAGIC_PATTERN 0x5a5a5a5a
>> +
>> +enum regmem_id {
>> +       /* pass pkg_dir address to SPC in non-secure mode */
>> +       PKG_DIR_ADDR_REG = 0,
>> +       /* Tunit CFG blob for secure - provided by host.*/
>> +       TUNIT_CFG_DWR_REG = 1,
>> +       /* syscom commands - modified by the host */
>> +       SYSCOM_COMMAND_REG = 2,
>> +       /* Store interrupt status - updated by SP */
>> +       SYSCOM_IRQ_REG = 3,
>> +       /* first syscom queue pointer register */
>> +       SYSCOM_QPR_BASE_REG = 4
>> +};
>> +
>> +enum message_direction {
>> +       DIR_RECV = 0,
>> +       DIR_SEND
>> +};
> 
> Not used?

Ack, will remove.

> 
> 
> ...
>> +struct ipu6_fw_com_cfg {
>> +       unsigned int num_input_queues;
>> +       unsigned int num_output_queues;
>> +       struct ipu6_fw_syscom_queue_config *input;
>> +       struct ipu6_fw_syscom_queue_config *output;
>> +
>> +       unsigned int dmem_addr;
>> +
>> +       /* firmware-specific configuration data */
>> +       void *specific_addr;
>> +       unsigned int specific_size;
>> +       int (*cell_ready)(struct ipu6_bus_device *adev);
>> +       void (*cell_start)(struct ipu6_bus_device *adev);
>> +
>> +       unsigned int buttress_boot_offset;
> 
> This seems to always be 0 (set by ipu6-fw-isys.c), seems to be trivial
> to remove.

All these fields are all used to extend for psys driver.

> 
> /Andreas
> 

-- 
Best regards,
Bingbu Cao

