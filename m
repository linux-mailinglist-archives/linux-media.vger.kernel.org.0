Return-Path: <linux-media+bounces-7385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9EC880BB1
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 08:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FABA1F2435F
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 07:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058D61EB20;
	Wed, 20 Mar 2024 07:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cgk+WyFT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35F122338
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 07:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710918478; cv=none; b=YCIMZpI5Yrg/pVym3BtxIx8wYL2UAAM02UqweNBmNoKu4sV8X3i6rM/h5eTMX4R/iBJmsLgJ3SS9WNGM7xFjiM/BwrARR0G0/Y7EXDqwV+ol1YRpsJ5tIoeUC5w3HQ87SSyytMZv/5+FPV3GbW05fBqQA2qW6ildzMhFmx4cWDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710918478; c=relaxed/simple;
	bh=rCnTmJZpjaQOQeytMAnPDu3NTv8MW7cJchGgwfWQpZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dB/cE9PqJg6JGGnPx+8vwjX7x2zxzmbBDY8W3q8omG9FMyGoGhqr2sn4V7550XqzQs9vCe/oUNs945ybIi3TIy7+DzK/r7cIsRzJryCDQq0mJ27632J0wW0OE27Nqche/oqekmtTVBSDbQX93C/L8pT9LTJ5IUwDECwvqiQDF58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cgk+WyFT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710918476; x=1742454476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rCnTmJZpjaQOQeytMAnPDu3NTv8MW7cJchGgwfWQpZQ=;
  b=Cgk+WyFTm9aK3QOCAzi/tfKhajYb++0RbEMybnGU6geRb5ibKErVybSP
   Kye31Ink0j5Ahrl1IewBcmVWKOGRdGEu0C9iopyz8Kdu2CHNII/RaCbr8
   r5PSFb3ug7g2IBPzoPoVc9e8qbeuYAHOHOMKpe0MQ2GEnUUZOvS2vUNzG
   C1Kg16j7rBvGRmtNKykeIKtNUXlCCzLlVqWxnINbByQSQ+GmFsnGh/Ujy
   AhUyXI7BOUsT79xC106sHD8TDX3P+cTqSBW5rHEh3NZfy7k4rJufHXLEf
   KyRFxym0/iYMcVG00Gjiy6NCHbOhk5LcStaguuYWm44OX16tfGXxvGLj+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5674069"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5674069"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 00:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="18526492"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 00:07:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 502AE11F853;
	Wed, 20 Mar 2024 09:07:51 +0200 (EET)
Date: Wed, 20 Mar 2024 07:07:51 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 2/2] media: v4l: async: Properly check for a notifier
 initialised or registered
Message-ID: <ZfqLRxUOwmh60gq1@kekkonen.localdomain>
References: <20240311121741.1249976-1-sakari.ailus@linux.intel.com>
 <20240311121741.1249976-3-sakari.ailus@linux.intel.com>
 <8691787.DvuYhMxLoT@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8691787.DvuYhMxLoT@steina-w>

Hi Alexander,

On Thu, Mar 14, 2024 at 03:04:44PM +0100, Alexander Stein wrote:
> Hi Sakari,
> 
> I suppose on of your intentions of this series is to replace my patch, no?

No, these are somewhat unrelated issues.

> 
> Am Montag, 11. März 2024, 13:17:41 CET schrieb Sakari Ailus:
> > Properly check that a notifier was never initialised or register. This can
> > now be done by looking at the entry in the notifier list, not the V4L2
> > device or sub-device that are set in the initialiser now.
> > 
> > Fixes: b8ec754ae4c5 ("media: v4l: async: Set v4l2_device and subdev in async notifier init")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 2ff35d5d60f2..3b43d6285dfe 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -630,12 +630,14 @@ EXPORT_SYMBOL(v4l2_async_nf_register);
> >  static void
> >  __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
> >  {
> > -	if (!notifier || (!notifier->v4l2_dev && !notifier->sd))
> > +	/* Return here if the notifier is never initialised or registered. */
> > +	if (!notifier->notifier_entry.next ||
> 
> I don't like the idea checking the next pointer of a list.
> Despite that it's not even necessary.

Actually I think we can drop the above change. But the list_del_init()
below is still necessary.

> 
> Best regards,
> Alexander
> 
> > +	    list_empty(&notifier->notifier_entry))
> >  		return;
> >  
> >  	v4l2_async_nf_unbind_all_subdevs(notifier);
> >  
> > -	list_del(&notifier->notifier_entry);
> > +	list_del_init(&notifier->notifier_entry);
> >  }
> >  
> >  void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
> > 
> 
> 

-- 
Regards,

Sakari Ailus

