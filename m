Return-Path: <linux-media+bounces-20764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF59BAD7F
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F5381F22452
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 07:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C035619A297;
	Mon,  4 Nov 2024 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFbvF+da"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BE9189F45
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730707018; cv=none; b=cED3DP3JWYOaERJUnMAPxo/3W05wJmQIUInqqPl2JXCjLVq2OXKZjIS/wPdUmKPRSr0gDITS2m/zCXPlUwnNfIRc8xWnwQVTHqGiw/EpIuLknm5WcK12e3QxwTkLXhAX3rHHuQJPQ1ljmE8QmBFPFUV6EVeXPLzxoY6KkjE4REE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730707018; c=relaxed/simple;
	bh=QI5+O8lkWZluQhn85Jj58DLHwoqBT6NblxA2qFQvcNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM798ZA6LgxgYTWqPnq4x98WVVFiRKKisOTDNRDIiXpdF9T1sx4NzQAspmNV8MS4DyGOZs8tMkBt+nYMD9Na0SXnQv4huIOH+JUafAhDVBW29MbnEQFPxwsUtruFKVV5MY51TcmSeRGPYHwBdnq1yLIvhAzGTYOM+7OwPCoa4sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFbvF+da; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730707017; x=1762243017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QI5+O8lkWZluQhn85Jj58DLHwoqBT6NblxA2qFQvcNw=;
  b=FFbvF+daVOq6O0vczp75YHZn3NEF9zXzTw46uFF/Eo5jhbmBGO/HnQLY
   lMa8c1xBlQ1JRMYoy3bf9uovEMqOLit1j7TlJurbaNpEjBzm1QXw3Fk12
   pm9vm1CzsbqBKE++XfKwWdkOav72d+MTGidRsELKYjz6PpjQu5+QMEumS
   r9yNPIcn4mPj2sgrgolzk5Zr08YhDNXS4ysNTW+LiKN3t4NNWjJ8d4ekf
   RHqh8dOEtzoLlrvGgOzYPAIdWNV1/gkIar7wxbl6s0DNCZTrKDRfMUqpO
   zg2uEvd3TKyn39q+PAg26snAW738NV5bcZcMKsdBbN8/wofCXvqL6oggz
   Q==;
X-CSE-ConnectionGUID: GFPkCJoCQcWejAYJe7wTHA==
X-CSE-MsgGUID: eSmMe1vKTZGO/6XJz1WSlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="40973231"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="40973231"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 23:56:55 -0800
X-CSE-ConnectionGUID: +R8eOLZIR96pX3CZ1o22yw==
X-CSE-MsgGUID: LAdv13B0RBm6G56WWoZu3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88157389"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 23:56:53 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 708D011F984;
	Mon,  4 Nov 2024 09:56:51 +0200 (EET)
Date: Mon, 4 Nov 2024 07:56:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Wang, Hongju" <hongju.wang@intel.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	hverkuil@xs4all.nl
Subject: Re: [PATCH] media: intel/ipu6: Set the VC of the stream as the SOF
 event id
Message-ID: <Zyh-Q7P2szvQxJ5z@kekkonen.localdomain>
References: <20241024032201.3867638-1-hongju.wang@intel.com>
 <Zxoh36bkJaDQIvME@kekkonen.localdomain>
 <CY8PR11MB7171773036C246F09DC2756EEF512@CY8PR11MB7171.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY8PR11MB7171773036C246F09DC2756EEF512@CY8PR11MB7171.namprd11.prod.outlook.com>

Hi Hongju,

On Mon, Nov 04, 2024 at 03:07:58AM +0000, Wang, Hongju wrote:
> Hi Sakari
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Thursday, October 24, 2024 6:31 PM
> > To: Wang, Hongju <hongju.wang@intel.com>
> > Cc: linux-media@vger.kernel.org; bingbu.cao@linux.intel.com
> > Subject: Re: [PATCH] media: intel/ipu6: Set the VC of the stream as the
> > SOF event id
> > 
> > Hi Hongju,
> > 
> > On Thu, Oct 24, 2024 at 11:22:01AM +0800, Hongju Wang wrote:
> > > In the virtual channel case, they should use v4l2_event.id to
> > > distinguish SOF events of different streams. Therefore, we set the
> > > virtual channel number of the stream as the SOF event ID. This number is
> > unique.
> > >
> > > Signed-off-by: Hongju Wang <hongju.wang@intel.com>
> > > ---
> > >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > index 051898ce53f4..5ad426afa0f0 100644
> > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > @@ -578,6 +578,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct
> > ipu6_isys_stream *stream)
> > >  		.type = V4L2_EVENT_FRAME_SYNC,
> > >  	};
> > >
> > > +	ev.id = stream->vc;
> > >  	ev.u.frame_sync.frame_sequence = atomic_fetch_inc(&stream->sequence);
> > >  	v4l2_event_queue(vdev, &ev);
> > >
> > 
> > The id field in struct v4l2_event isn't used for the FRAME_SYNC event and
> > also the virtual channel isn't communicated to the user space currently.
> 	
>   How to use the id field? User space should use SOF to do FRAME_SYNC,
>   but the v4l2_event doesn't distinguish different streams. Do you have
>   any good suggestions?

Ah, now I think I do understand the problem. The events are produced by the
CSI-2 receiver sub-device but there are multiple streams and the event
isn't stream-aware?

It's nice that the id field of the FRAME_SYNC event isn't in use for any
other purpose. This should be taken into account in event subscription,
too.

I'll add a patch documenting this in the metadata series. Any thoughts?

Cc Laurent and Hans.

-- 
Kind regards,

Sakari Ailus

