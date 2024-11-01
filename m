Return-Path: <linux-media+bounces-20664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 192219B8C30
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 08:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E2B01F22653
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 07:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545D61537A8;
	Fri,  1 Nov 2024 07:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7OHMIwW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B51134BD
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 07:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447173; cv=none; b=gvnpyzkSTMzJG5jj36mNxanqbbwfWH4IEjGiMpML0jjJPKx8ixRc1VUoP/MUQPnfyshTa12iOdqxYC48Bodu68dTrP5gmy27BDUjItC/+1Ih8dJm9QEz+i5qztl6Foiit8YSILpt9goLt0geBE2BhekmbZI3AvlX+n4MZbpduvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447173; c=relaxed/simple;
	bh=40dvnP6xKCcXl9l5QsDfEGHqAQxjtcW9kNNicLdw9/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vF2JeDDe9U0W/Y2EJLon/ANfcd07JiF/u/w+DiWEsYhi3trrE+RnLABL1W+tyx6IDM8jipYRM5oG3HUCuq7VXn7D2+ZS3NdHtel6u1nJVfeIyIf8UyxJk8BWSCxwz4maus2Ihl99QRIQO58Gpn571iPvK+aGjMzO4+qcyXBr1yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7OHMIwW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730447171; x=1761983171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=40dvnP6xKCcXl9l5QsDfEGHqAQxjtcW9kNNicLdw9/w=;
  b=F7OHMIwWtVOnYrEMekAsFz4yA1dHLb4KS9BsWnfMoEZa2NALIdWYkYqQ
   g7tF7AmYo+ghGZfM6SI6uT62SHM2Sg12xKqm3cj+BobcBIr6rpZrOdbU6
   ZbimgS294CVHowlYlJRZ2Kh2UC+QeNVPZg90bYFuHMU6KtnBiitkScRSY
   Yfm9CjnU5TlbY6l0N5XYTmpBfuvMHpEIdYI93fPVsN7jd8SylIPdCjEid
   n9+tP4uGFHqlMON9elgfOlfYiWo01U7oqhfV9WHCbcQWrPbioZUnSxkxx
   JzvnJzB8fq9wTVBQtd/Ft2QJiZB9HpEjotc+BfxMALL93XZlZFl9KzNVs
   Q==;
X-CSE-ConnectionGUID: +B4uYbSdSgSSb1u5xBdejA==
X-CSE-MsgGUID: VoqkqTjOSEukux84M3RcDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30167144"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30167144"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 00:46:10 -0700
X-CSE-ConnectionGUID: JWIp5e7wRbqdM6jqsIi3Mw==
X-CSE-MsgGUID: kGuC5753TvCwj7V3g+ipxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="82806735"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 00:46:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8976F11FA28;
	Fri,  1 Nov 2024 09:46:06 +0200 (EET)
Date: Fri, 1 Nov 2024 07:46:06 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v2] media: intel/ipu6: remove buttress ish structure
Message-ID: <ZySHPtECRXNTSN2d@kekkonen.localdomain>
References: <20241031130622.430308-1-stanislaw.gruszka@linux.intel.com>
 <f6e4a8b9-1ee5-04f2-069a-cf2541cca6bd@linux.intel.com>
 <2251d433-ecf0-6300-3598-82438befb456@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2251d433-ecf0-6300-3598-82438befb456@linux.intel.com>

Hi Bingbu, Stanislaw,

On Fri, Nov 01, 2024 at 12:26:52PM +0800, Bingbu Cao wrote:
> 
> On 11/1/24 12:22 PM, Bingbu Cao wrote:
> > Stanislaw,
> > 
> > Thanks for the patch, this is what I intended to do.
> > 
> > On 10/31/24 9:06 PM, Stanislaw Gruszka wrote:
> >> The buttress ipc ish structure is not effectively used on IPU6 - data
> >> is nullified on init. Remove it to cleanup the code a bit.
> >>
> >> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> >> ---
> >> v2: fix formatting: use media: prefix in topic and white space alignment
> >> to match open parenthesis
> >>
> >>  drivers/media/pci/intel/ipu6/ipu6-buttress.c | 27 ++++++--------------
> >>  drivers/media/pci/intel/ipu6/ipu6-buttress.h |  6 -----
> >>  2 files changed, 8 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> >> index edaa285283a1..6644fd4c3d91 100644
> >> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> >> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> >> @@ -214,20 +214,17 @@ static void ipu6_buttress_ipc_recv(struct ipu6_device *isp,
> >>  }
> >>  
> >>  static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
> >> -				       enum ipu6_buttress_ipc_domain ipc_domain,
> >>  				       struct ipu6_ipc_buttress_bulk_msg *msgs,
> >>  				       u32 size)
> >>  {
> >>  	unsigned long tx_timeout_jiffies, rx_timeout_jiffies;
> >>  	unsigned int i, retry = BUTTRESS_IPC_CMD_SEND_RETRY;
> >>  	struct ipu6_buttress *b = &isp->buttress;
> >> -	struct ipu6_buttress_ipc *ipc;
> >> +	struct ipu6_buttress_ipc *ipc = &b->cse;
> >>  	u32 val;
> >>  	int ret;
> >>  	int tout;
> >>  
> >> -	ipc = ipc_domain == IPU6_BUTTRESS_IPC_CSE ? &b->cse : &b->ish;
> >> -
> >>  	mutex_lock(&b->ipc_mutex);
> >>  
> >>  	ret = ipu6_buttress_ipc_validity_open(isp, ipc);
> >> @@ -305,7 +302,6 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
> >>  
> >>  static int
> >>  ipu6_buttress_ipc_send(struct ipu6_device *isp,
> >> -		       enum ipu6_buttress_ipc_domain ipc_domain,
> >>  		       u32 ipc_msg, u32 size, bool require_resp,
> >>  		       u32 expected_resp)
> >>  {
> >> @@ -316,7 +312,7 @@ ipu6_buttress_ipc_send(struct ipu6_device *isp,
> >>  		.expected_resp = expected_resp,
> >>  	};
> >>  
> >> -	return ipu6_buttress_ipc_send_bulk(isp, ipc_domain, &msg, 1);
> >> +	return ipu6_buttress_ipc_send_bulk(isp, &msg, 1);
> >>  }
> >>  
> >>  static irqreturn_t ipu6_buttress_call_isr(struct ipu6_bus_device *adev)
> >> @@ -386,10 +382,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
> >>  		}
> >>  
> >>  		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
> >> -			dev_dbg(&isp->pdev->dev,
> >> -				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
> >> -			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
> >> -			complete(&b->ish.recv_complete);
> >> +			dev_warn(&isp->pdev->dev,
> >> +				 "BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
> > 
> > I think this is a unrelated change, right?
> 
> I mean the change from dev_dbg() to dev_warn().

We're not handling these interrupts anymore in any way.

I wonder if the ipu6_buttress_ipc_recv() call should still remain in place,
even if we really do nothing with these. It looks like some kind of an
acknowledgement mechanism.

> > 
> >>  		}
> >>  
> >>  		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
> >> @@ -399,9 +393,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
> >>  		}
> >>  
> >>  		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH) {
> >> -			dev_dbg(&isp->pdev->dev,
> >> -				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
> >> -			complete(&b->ish.send_complete);
> >> +			dev_warn(&isp->pdev->dev,
> >> +				 "BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
> > 
> > Ditto.
> > 
> >>  		}
> >>  
> >>  		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
> >> @@ -655,7 +648,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
> >>  	 */
> >>  	dev_info(&isp->pdev->dev, "Sending BOOT_LOAD to CSE\n");
> >>  
> >> -	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
> >> +	ret = ipu6_buttress_ipc_send(isp,
> >>  				     BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD,
> >>  				     1, true,
> >>  				     BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
> >> @@ -697,7 +690,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
> >>  	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
> >>  	 */
> >>  	dev_info(&isp->pdev->dev, "Sending AUTHENTICATE_RUN to CSE\n");
> >> -	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
> >> +	ret = ipu6_buttress_ipc_send(isp,
> >>  				     BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN,
> >>  				     1, true,
> >>  				     BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
> >> @@ -838,9 +831,7 @@ int ipu6_buttress_init(struct ipu6_device *isp)
> >>  	mutex_init(&b->auth_mutex);
> >>  	mutex_init(&b->cons_mutex);
> >>  	mutex_init(&b->ipc_mutex);
> >> -	init_completion(&b->ish.send_complete);
> >>  	init_completion(&b->cse.send_complete);
> >> -	init_completion(&b->ish.recv_complete);
> >>  	init_completion(&b->cse.recv_complete);
> >>  
> >>  	b->cse.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
> >> @@ -852,8 +843,6 @@ int ipu6_buttress_init(struct ipu6_device *isp)
> >>  	b->cse.data0_in = BUTTRESS_REG_CSE2IUDATA0;
> >>  	b->cse.data0_out = BUTTRESS_REG_IU2CSEDATA0;
> >>  
> >> -	/* no ISH on IPU6 */
> >> -	memset(&b->ish, 0, sizeof(b->ish));
> >>  	INIT_LIST_HEAD(&b->constraints);
> >>  
> >>  	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
> >> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
> >> index 9b6f56958be7..482978c2a09d 100644
> >> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
> >> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
> >> @@ -46,18 +46,12 @@ struct ipu6_buttress_ipc {
> >>  struct ipu6_buttress {
> >>  	struct mutex power_mutex, auth_mutex, cons_mutex, ipc_mutex;
> >>  	struct ipu6_buttress_ipc cse;
> >> -	struct ipu6_buttress_ipc ish;
> >>  	struct list_head constraints;
> >>  	u32 wdt_cached_value;
> >>  	bool force_suspend;
> >>  	u32 ref_clk;
> >>  };
> >>  
> >> -enum ipu6_buttress_ipc_domain {
> >> -	IPU6_BUTTRESS_IPC_CSE,
> >> -	IPU6_BUTTRESS_IPC_ISH,
> >> -};
> >> -
> >>  struct ipu6_ipc_buttress_bulk_msg {
> >>  	u32 cmd;
> >>  	u32 expected_resp;
> >>
> > 
> > Besides minor comment:
> > 
> > Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> > 
> 

-- 
Kind regards,

Sakari Ailus

