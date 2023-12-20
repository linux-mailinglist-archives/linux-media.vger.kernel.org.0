Return-Path: <linux-media+bounces-2724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CFC819B69
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90C51C25779
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 09:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E6D1EA8A;
	Wed, 20 Dec 2023 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUm8Riou"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F071F5F4
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703064579; x=1734600579;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=i8E8ZunS3A6EWXpsZX/LXS+iTPhhmcr3VUJCODeKcN8=;
  b=BUm8Rioupaxiw9Y7Hqy2OpY5GAgx2OfvjPjrqHx0KgAKxlPNJ8N26ICY
   g6P7tbWAlRQjhKXqm0wrS3/zz4Jlq3dPDc38kfWo5Lzx2zo0FKsoYbMh8
   NsWj/CSJN/xPtx7VVFtQIlJfZTlQ/rRjLgdbv9kVEtYVxeTfCRZEdS9CC
   eHhqI4Dbpe9mrABuxufh/C4MM8pseC1so+PUNoTPjMhISVIrMwlVzyzhX
   hohHcpcTH7VkwxEbosrrabCFHLY2OiR+fRfR6TMeR6b3OGRxfLrRUURXw
   ONWNnJ19QpQAw7LBWseEC3N80NH07NyYNLifel3rsaKzMoA4fdBHYPh3o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="3008411"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="3008411"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 01:29:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="726012178"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="726012178"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orsmga003.jf.intel.com with ESMTP; 20 Dec 2023 01:29:34 -0800
Subject: Re: [PATCH 11/15] media: intel/ipu6: input system video capture nodes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
 linux-media@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 tfiga@chromium.org, senozhatsky@chromium.org,
 andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-12-bingbu.cao@intel.com>
 <7ed5642c-cb3e-a931-dc83-ed9c6241aa69@linux.intel.com>
 <20231220065127.GD29638@pendragon.ideasonboard.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <c21fafd0-71c6-0f00-7602-14aa6f6f7b80@linux.intel.com>
Date: Wed, 20 Dec 2023 17:25:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231220065127.GD29638@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Laurent,

On 12/20/23 2:51 PM, Laurent Pinchart wrote:
> Hi Bingbu,
> 
> On Wed, Dec 20, 2023 at 11:42:47AM +0800, Bingbu Cao wrote:
>> On 7/27/23 3:15 PM, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> Register v4l2 video device and setup the vb2 queue to
>>> support basic video capture. Video streaming callback
>>> will trigger the input system driver to construct a
>>> input system stream configuration for firmware based on
>>> data type and stream ID and then queue buffers to firmware
>>> to do capture.
>>>
>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>> ---
>>>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  864 ++++++++++++
>>>  .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   97 ++
>>>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1237 +++++++++++++++++
>>>  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  133 ++
>>>  4 files changed, 2331 insertions(+)
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
>>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>>> new file mode 100644
>>> index 000000000000..c683a1b7c91f
>> --snip--
>>
>>> +static const struct vb2_ops ipu6_isys_queue_ops = {
>>> +	.queue_setup = queue_setup,
>>> +	.wait_prepare = vb2_ops_wait_prepare,
>>> +	.wait_finish = vb2_ops_wait_finish,
>>> +	.buf_prepare = buf_prepare,
>>> +	.start_streaming = start_streaming,
>>> +	.stop_streaming = stop_streaming,
>>> +	.buf_queue = buf_queue,
>>> +};
>>> +
>>> +int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
>>> +{
>>> +	struct ipu6_isys *isys = ipu6_isys_queue_to_video(aq)->isys;
>>> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
>>> +	int ret;
>>> +
>>> +	/* no support for userptr */
>>> +	if (!aq->vbq.io_modes)
>>> +		aq->vbq.io_modes = VB2_MMAP | VB2_DMABUF;
>>
>>
>> There are some improvement and bug fixing in vb2 USERPTR in the past
>> months, I remember someone told me the userptr is buggy, I remove the
>> USERPTR support from current IPU6 ISYS driver. However, there is some
>> userspace application still need the USERPTR, so I am not sure whether
>> I should add it back. Do you have any suggestion?
> 
> Modern applications should really not use USERPTR, so I wouldn't add it
> back. It's still a deprecated interface.
> 
> In the vast majority of cases, the PSYS will be used through libcamera,
> which doesn't use USERPTR. I expect the remaining use cases to be very
> specialized and not rely on pre-existing code that would require
> USERPTR.

Ack, thanks.

> 

-- 
Best regards,
Bingbu Cao

