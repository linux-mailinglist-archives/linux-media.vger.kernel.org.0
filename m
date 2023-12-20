Return-Path: <linux-media+bounces-2678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC6819741
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 04:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F387B1F26923
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 03:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDE28F41;
	Wed, 20 Dec 2023 03:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edD8N4o1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F1A1A582
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 03:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703044018; x=1734580018;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Dvy1dgcBizUtMce5mbPm25F0EyoK1a3NkkWdHrNugLc=;
  b=edD8N4o1v8eZW+7FQsI7C3+xhZqhP+d2Rp3CqGhiWCEAsvvZrrjeSDx9
   YY6mM85mi07q8xMSEumb3BvfFX+TK9w3i5YS0P+EwXjTiQy2JTapNtZJr
   KyIaLMvPdCkuo8nS7BGr7VBMNsmujB0rBv8Xnc1o44Of/ghM0ULFFPZ7k
   ind7n/MRky4qbAPKFxxCyF8ywn8nbqgs16ujCi9Uxy5z1L/nsxPTE5XD7
   u/LeLJfES2dfysxDZxpLRlvl1CVr79yCFygvyRR6qRQKr8xJtCqpQ548S
   iCV7aBhfiSLCuD5gKGP691ITTZbF91VAHaF/wq6a4fCbglDPD87vpLrwv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2611321"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="2611321"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 19:46:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="949394117"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="949394117"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orsmga005.jf.intel.com with ESMTP; 19 Dec 2023 19:46:53 -0800
Subject: Re: [PATCH 11/15] media: intel/ipu6: input system video capture nodes
To: bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
 senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
 hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-12-bingbu.cao@intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <7ed5642c-cb3e-a931-dc83-ed9c6241aa69@linux.intel.com>
Date: Wed, 20 Dec 2023 11:42:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230727071558.1148653-12-bingbu.cao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Sakari and Laurent,


On 7/27/23 3:15 PM, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Register v4l2 video device and setup the vb2 queue to
> support basic video capture. Video streaming callback
> will trigger the input system driver to construct a
> input system stream configuration for firmware based on
> data type and stream ID and then queue buffers to firmware
> to do capture.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  864 ++++++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   97 ++
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1237 +++++++++++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  133 ++
>  4 files changed, 2331 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> new file mode 100644
> index 000000000000..c683a1b7c91f
--snip--

> +static const struct vb2_ops ipu6_isys_queue_ops = {
> +	.queue_setup = queue_setup,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.buf_prepare = buf_prepare,
> +	.start_streaming = start_streaming,
> +	.stop_streaming = stop_streaming,
> +	.buf_queue = buf_queue,
> +};
> +
> +int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
> +{
> +	struct ipu6_isys *isys = ipu6_isys_queue_to_video(aq)->isys;
> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +	int ret;
> +
> +	/* no support for userptr */
> +	if (!aq->vbq.io_modes)
> +		aq->vbq.io_modes = VB2_MMAP | VB2_DMABUF;


There are some improvement and bug fixing in vb2 USERPTR in the past
months, I remember someone told me the userptr is buggy, I remove the
USERPTR support from current IPU6 ISYS driver. However, there is some
userspace application still need the USERPTR, so I am not sure whether
I should add it back. Do you have any suggestion?


--snip--
-- 
Best regards,
Bingbu Cao

