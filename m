Return-Path: <linux-media+bounces-20775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA78E9BAF75
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 10:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EB832818D1
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 09:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14FC1AAE39;
	Mon,  4 Nov 2024 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuoB6wXU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F686FC5
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 09:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730711948; cv=none; b=nOg8CPMtfgkGjXpvcrhhNXzh2HEtyotiAo7NnqLpNs4dkK5z6euCo4S6UpemHOmUsyYv5o/mmPKmL4XB4G7PRdeu0DR8CqNgC+Fd6z8y+Os0pmwJ+37kA7yOuyN51yZNK2CDF0O7Hc6lm8tHtPNRwa1XVL5tnte75LldC8wezn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730711948; c=relaxed/simple;
	bh=TzLQvmHtYnUkxVn8nKKUpRl/JdeQlYmhfiDFINT3i0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EorZ4Ag7hCn9qJCA6uJMOjxJkezHt0vZzi3gIk5a+3SlG8N2vGPi1ayysTTv5l12D1JiEGaOlXT4WXX1o0ircttLNfl+E9rn4ChClEp5jC6Q/cT6IYnS+uxkEyT8wVhHusudenWkQO43Mn3BRvgBpqgu6VGYqQCfwE7+pdqpMaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuoB6wXU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730711946; x=1762247946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TzLQvmHtYnUkxVn8nKKUpRl/JdeQlYmhfiDFINT3i0w=;
  b=YuoB6wXUWEv/bhQSPxV0vGhO/4EylqMuVYQ5JtJ75osXYwXMJs6gBVa7
   NTzuaonEtYSqZXHvOqMTOU14lFjgUmvgqUIJLjJELaQAXUP/Wt+5PxJna
   uunwCeHtMAjPe9ERMDZA0X4W71kI1SQPecw2Ob+Z/oju0VtzyhRQJR6AF
   aHPbL1S0dG/7/eXzq5Bjqil7RWPwbbgeKY7sZFOfHXHpJ3iwPVGHEyr0F
   1mXfQ33lngLgFxcNgVE8AvcekqJdIP/luK7EOAsQ9FRdwgno4r9ovMwN0
   Wtf4xH531D9nZijh9em1sfQP6S1Cvlhfduh0XhhsB4w+Ggp+l+Kt2sdoM
   A==;
X-CSE-ConnectionGUID: Cpe3rseWR8iHyXQN5ZakXA==
X-CSE-MsgGUID: xSexX/zxTBGxnkU8PNsG5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30576012"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30576012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:19:06 -0800
X-CSE-ConnectionGUID: qNJRMdquQvaZbxDPayoRWw==
X-CSE-MsgGUID: 59n0ZDRrR0Oyv4Gy9Q+8Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="114381985"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.97.183])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:19:04 -0800
Date: Mon, 4 Nov 2024 10:19:02 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v2] media: intel/ipu6: remove buttress ish structure
Message-ID: <ZyiRhk/LejVGSUKL@linux.intel.com>
References: <20241031130622.430308-1-stanislaw.gruszka@linux.intel.com>
 <f6e4a8b9-1ee5-04f2-069a-cf2541cca6bd@linux.intel.com>
 <2251d433-ecf0-6300-3598-82438befb456@linux.intel.com>
 <ZySHPtECRXNTSN2d@kekkonen.localdomain>
 <34bb5ca1-8c7c-316e-5886-378c8660f7f1@linux.intel.com>
 <ZySO_J1xDkcSY4sZ@kekkonen.localdomain>
 <7ad30743-58c5-7004-9eed-4f1d8589c7f7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ad30743-58c5-7004-9eed-4f1d8589c7f7@linux.intel.com>

On Fri, Nov 01, 2024 at 05:07:25PM +0800, Bingbu Cao wrote:
> 
> On 11/1/24 4:19 PM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > On Fri, Nov 01, 2024 at 03:47:54PM +0800, Bingbu Cao wrote:
> >> Sakari and Stanislaw,
> >>
> >> On 11/1/24 3:46 PM, Sakari Ailus wrote:
> >>>>>> @@ -386,10 +382,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
> >>>>>>  		}
> >>>>>>  
> >>>>>>  		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
> >>>>>> -			dev_dbg(&isp->pdev->dev,
> >>>>>> -				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
> >>>>>> -			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
> >>>>>> -			complete(&b->ish.recv_complete);
> >>>>>> +			dev_warn(&isp->pdev->dev,
> >>>>>> +				 "BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
> >>>>>
> >>>>> I think this is a unrelated change, right?
> >>>>
> >>>> I mean the change from dev_dbg() to dev_warn().
> >>>
> >>> We're not handling these interrupts anymore in any way.
> >>>
> >>> I wonder if the ipu6_buttress_ipc_recv() call should still remain in place,
> >>> even if we really do nothing with these. It looks like some kind of an
> >>> acknowledgement mechanism.
> >>
> >> I just confirm that IPC_FROM_ISH_IS_WAITING and IPC_EXEC_DONE_BY_ISH are
> >> not valid anymore from IPU6, I think the handling here and below could be
> >> removed.
> > 
> > Do you know which IPU version still needed it?
> > 
> > There are folks who'd like to add IPU4 support to the driver but they can
> > add it back if it's needed.
> >
> 
> I know that ISH IPC was added from IPU4, but I am not sure IPU4 really
> need that now.

Ok, I think on v3, I'll remove handling of BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING
and BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH from isr, but will keep the BIT's 
definitions just in case.

Regards
Stanislaw


