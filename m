Return-Path: <linux-media+bounces-49830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA12CED517
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 20:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E68793007EC9
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 19:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27902BE7C6;
	Thu,  1 Jan 2026 19:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giBSQAnv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E15242D70
	for <linux-media@vger.kernel.org>; Thu,  1 Jan 2026 19:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767297086; cv=none; b=BfAqk40wwqaQOE5RDveLgazkHAZQPsVEcLIh7/Vn+o+8imcc/x2zFV3J7TOsWsvuOym27BRcasmnclmeY4k5Cb6WgbuxKz/J2hzim6xzs1oBHsrKIDpudmgZB1uADFKjb2WVvk9ptDTS1WEUQluCU/AVVnaUS419J0Yro3mE+2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767297086; c=relaxed/simple;
	bh=IqucdwWIlHPEH3w9jT/qYHcDkcQxWrcPmabsHIwYWw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLqqlkdX770xbcT8uP8OUBP5N9efFJ7uwmglkqDW038uAUWwZ/R1g7XkyMfovXkVi5lwHl3rtSZaHgTchWXO0SfWUY1FE6U4jGl5ej+1+7by2ilyDHxqijX/YPRuSVgNV9yxQ9IfWEfMizvj+R1YvIKLceUrro9sFHkJfrdcipY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giBSQAnv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767297084; x=1798833084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IqucdwWIlHPEH3w9jT/qYHcDkcQxWrcPmabsHIwYWw8=;
  b=giBSQAnvy7ocVhpY3krm/7yN9Q+i9pOvHEb0SJN5t8mXIfWjwhfkzZ0a
   uIxS40/ytz5I+s+hu8/wbCuJcOJrywD8XXU+y7LPjLQ+H7EN2eLRkIDyM
   p23Lb/U8wSToUudh6Ik6GZtMmIZZASeEtaIdiYWceAg4STaLeg7TdrqRO
   90y7aLFxXrd6fM1LipdRbKqmBZoBbleljbZMWznmrFzdzQRj26jG4zlN/
   x70rbEFuGV+lfFzonZJD0bTX+9IhtfoVjiYTRaSjScF2wAOKC+TU32yVk
   GwOPIFsQ4O9cxA0rvVyWHPL/y6SpEZJ5Xu9861URndVFk+1bp5K2C+Hw9
   w==;
X-CSE-ConnectionGUID: 4+cqfUX4QTar/vu9M+eRXA==
X-CSE-MsgGUID: 8nBQzdB9S4+qnAAoT4+wOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68805233"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="68805233"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 11:51:23 -0800
X-CSE-ConnectionGUID: yASfTnGKRmSwaUduUaMqzQ==
X-CSE-MsgGUID: ZFMYVPF3S4SaVZpoXc9SnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="206208624"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.249])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 11:51:23 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 71D4F11F87B;
	Thu, 01 Jan 2026 21:51:32 +0200 (EET)
Date: Thu, 1 Jan 2026 21:51:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
Subject: Re: [PATCH v3 05/13] media: ipu6: Remove redundant streaming start
 via buffer queueing
Message-ID: <aVbQRDgTsChf0VAk@kekkonen.localdomain>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-6-sakari.ailus@linux.intel.com>
 <d76a022b-4971-6228-4ec3-8a31b4a9a34b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d76a022b-4971-6228-4ec3-8a31b4a9a34b@linux.intel.com>

Hi Bingbu,

On Wed, Dec 31, 2025 at 02:01:14PM +0800, Bingbu Cao wrote:
> Hi, Sakari,
> 
> On 12/30/25 9:10 PM, Sakari Ailus wrote:
> > The videobuf2 framework will ensure buffers are queued before streaming is
> > started.
> 
> The logic is only applicable for !start_streaming_called, right?
> I am not sure it work for multiplex streams like metadata + frame
> capture case.

The start_streaming() callback is only called after the minimum number of
buffers specified for the queue (1 in this case) have been queued. So in
case of multiple streams from the same CSI-2 receiver, it's a
start_streaming() callback on one of the queues that triggers starting
streaming from the source -- not the buf_queue() callback.

FWIW, multiple streams don't work with the driver right now anyway -- this
is addressed by the streaming series I hope I'll be able to post soon,
after addressing some more review feedback.

> 
> >Remove support for starting starting streaming via the
> 
> double 'starting' here.

Fixed for v4.

> 
> > buf_queue() callback.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > index 8f05987cdb4e..fdf41b3cf60e 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > @@ -408,13 +408,6 @@ static void buf_queue(struct vb2_buffer *vb)
> >  	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
> >  	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
> >  
> > -	if (!stream->streaming) {
> > -		ret = ipu6_isys_stream_start(av, &bl, true);
> > -		if (ret)
> > -			dev_err(dev, "stream start failed.\n");
> > -		goto out;
> > -	}
> > -
> >  	/*
> >  	 * We must queue the buffers in the buffer list to the
> >  	 * appropriate video buffer queues BEFORE passing them to the
> > 
> 

-- 
Regards,

Sakari Ailus

