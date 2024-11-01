Return-Path: <linux-media+bounces-20662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E419B8A3B
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 05:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A95F1F21EAF
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 04:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E0D1474A7;
	Fri,  1 Nov 2024 04:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fk4PQxg+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE914658D
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 04:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730435150; cv=none; b=rAMqmRPnSJroUZLwEk7kNu2orQ8WKEBWGW4vmO27nbWz30bZoPKJEfjbvl23OZyoLehlBSCaWLo70j0MOMyOlURZPo4ISXFvxh/trOvsDIOc/sHwBa1Tq1K496I4QffIJjmFpo/rqHrV35clC3bXeSVHRpFo1WYcHPNrsBSUzLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730435150; c=relaxed/simple;
	bh=mVnUvgLUfNHWK1fBg77N+nUIxDJKjKqPHz/tl4augUs=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IqaVsAMGD4tcZvFntpmuoJSTFkGF0VoDsb6JIXS9Y96Pc9pTOROrepDScKEVPhnTWcF2XfoBvq1AaI4PY4X3ybN7SOgahGWuc107u5XkFFbEv0wSeqAR3LXDO1FBEac3Ih/yv+uGSoO3vJ4GQDnlt7O/7ou1Q66XtlRQzPJQgi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fk4PQxg+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730435148; x=1761971148;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=mVnUvgLUfNHWK1fBg77N+nUIxDJKjKqPHz/tl4augUs=;
  b=Fk4PQxg+0IVRBJ5AV2TZ9uqShEcY5SY8SflKTPCOVxQZO5XX/YIBW/Ay
   XhwOtzK4jqEiu7+ZryombW+iYP2PS7vz6R+DVFhrB5Jw3wmzB58YW2NxT
   eFBV88lScRhnl6t3lv5txA0nrzg1yzUHT63IcXkQ+waFfL++k759FaC+u
   nqHbKS5pZBWOvu96Qj9qVXivY8zHGyXz/XRvm0NY2ERPNXaXK53ftFwjO
   SbHO4zhGjScWHODt6GoDaEB1yzm3OewznflyneFJ6igFGWUQQbIsJ9uT1
   qXoAplS13otzTgP0Qn8qcQKt4CyjAU8f0bmIuG67Fwdo6j5Nauyyvt3L6
   Q==;
X-CSE-ConnectionGUID: NE5IHy7GRxa7bgSGsR2m+g==
X-CSE-MsgGUID: uyTumuLDRkyaNvgPEcNkRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30387049"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30387049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:25:48 -0700
X-CSE-ConnectionGUID: PgdLE+zsQTyEJrBGoG8TFQ==
X-CSE-MsgGUID: ObgGLAjBQmKf8q9NhQK+vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="83000947"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:25:47 -0700
Subject: Re: [PATCH v2] media: intel/ipu6: remove buttress ish structure
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>
References: <20241031130622.430308-1-stanislaw.gruszka@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <f6e4a8b9-1ee5-04f2-069a-cf2541cca6bd@linux.intel.com>
Date: Fri, 1 Nov 2024 12:22:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241031130622.430308-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Stanislaw,

Thanks for the patch, this is what I intended to do.

On 10/31/24 9:06 PM, Stanislaw Gruszka wrote:
> The buttress ipc ish structure is not effectively used on IPU6 - data
> is nullified on init. Remove it to cleanup the code a bit.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
> v2: fix formatting: use media: prefix in topic and white space alignment
> to match open parenthesis
> 
>  drivers/media/pci/intel/ipu6/ipu6-buttress.c | 27 ++++++--------------
>  drivers/media/pci/intel/ipu6/ipu6-buttress.h |  6 -----
>  2 files changed, 8 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> index edaa285283a1..6644fd4c3d91 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> @@ -214,20 +214,17 @@ static void ipu6_buttress_ipc_recv(struct ipu6_device *isp,
>  }
>  
>  static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
> -				       enum ipu6_buttress_ipc_domain ipc_domain,
>  				       struct ipu6_ipc_buttress_bulk_msg *msgs,
>  				       u32 size)
>  {
>  	unsigned long tx_timeout_jiffies, rx_timeout_jiffies;
>  	unsigned int i, retry = BUTTRESS_IPC_CMD_SEND_RETRY;
>  	struct ipu6_buttress *b = &isp->buttress;
> -	struct ipu6_buttress_ipc *ipc;
> +	struct ipu6_buttress_ipc *ipc = &b->cse;
>  	u32 val;
>  	int ret;
>  	int tout;
>  
> -	ipc = ipc_domain == IPU6_BUTTRESS_IPC_CSE ? &b->cse : &b->ish;
> -
>  	mutex_lock(&b->ipc_mutex);
>  
>  	ret = ipu6_buttress_ipc_validity_open(isp, ipc);
> @@ -305,7 +302,6 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
>  
>  static int
>  ipu6_buttress_ipc_send(struct ipu6_device *isp,
> -		       enum ipu6_buttress_ipc_domain ipc_domain,
>  		       u32 ipc_msg, u32 size, bool require_resp,
>  		       u32 expected_resp)
>  {
> @@ -316,7 +312,7 @@ ipu6_buttress_ipc_send(struct ipu6_device *isp,
>  		.expected_resp = expected_resp,
>  	};
>  
> -	return ipu6_buttress_ipc_send_bulk(isp, ipc_domain, &msg, 1);
> +	return ipu6_buttress_ipc_send_bulk(isp, &msg, 1);
>  }
>  
>  static irqreturn_t ipu6_buttress_call_isr(struct ipu6_bus_device *adev)
> @@ -386,10 +382,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>  		}
>  
>  		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
> -			dev_dbg(&isp->pdev->dev,
> -				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
> -			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
> -			complete(&b->ish.recv_complete);
> +			dev_warn(&isp->pdev->dev,
> +				 "BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");

I think this is a unrelated change, right?

>  		}
>  
>  		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
> @@ -399,9 +393,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>  		}
>  
>  		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH) {
> -			dev_dbg(&isp->pdev->dev,
> -				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
> -			complete(&b->ish.send_complete);
> +			dev_warn(&isp->pdev->dev,
> +				 "BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");

Ditto.

>  		}
>  
>  		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
> @@ -655,7 +648,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
>  	 */
>  	dev_info(&isp->pdev->dev, "Sending BOOT_LOAD to CSE\n");
>  
> -	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
> +	ret = ipu6_buttress_ipc_send(isp,
>  				     BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD,
>  				     1, true,
>  				     BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
> @@ -697,7 +690,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
>  	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
>  	 */
>  	dev_info(&isp->pdev->dev, "Sending AUTHENTICATE_RUN to CSE\n");
> -	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
> +	ret = ipu6_buttress_ipc_send(isp,
>  				     BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN,
>  				     1, true,
>  				     BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
> @@ -838,9 +831,7 @@ int ipu6_buttress_init(struct ipu6_device *isp)
>  	mutex_init(&b->auth_mutex);
>  	mutex_init(&b->cons_mutex);
>  	mutex_init(&b->ipc_mutex);
> -	init_completion(&b->ish.send_complete);
>  	init_completion(&b->cse.send_complete);
> -	init_completion(&b->ish.recv_complete);
>  	init_completion(&b->cse.recv_complete);
>  
>  	b->cse.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
> @@ -852,8 +843,6 @@ int ipu6_buttress_init(struct ipu6_device *isp)
>  	b->cse.data0_in = BUTTRESS_REG_CSE2IUDATA0;
>  	b->cse.data0_out = BUTTRESS_REG_IU2CSEDATA0;
>  
> -	/* no ISH on IPU6 */
> -	memset(&b->ish, 0, sizeof(b->ish));
>  	INIT_LIST_HEAD(&b->constraints);
>  
>  	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
> index 9b6f56958be7..482978c2a09d 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
> @@ -46,18 +46,12 @@ struct ipu6_buttress_ipc {
>  struct ipu6_buttress {
>  	struct mutex power_mutex, auth_mutex, cons_mutex, ipc_mutex;
>  	struct ipu6_buttress_ipc cse;
> -	struct ipu6_buttress_ipc ish;
>  	struct list_head constraints;
>  	u32 wdt_cached_value;
>  	bool force_suspend;
>  	u32 ref_clk;
>  };
>  
> -enum ipu6_buttress_ipc_domain {
> -	IPU6_BUTTRESS_IPC_CSE,
> -	IPU6_BUTTRESS_IPC_ISH,
> -};
> -
>  struct ipu6_ipc_buttress_bulk_msg {
>  	u32 cmd;
>  	u32 expected_resp;
>

Besides minor comment:

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao

