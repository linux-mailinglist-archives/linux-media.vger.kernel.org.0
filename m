Return-Path: <linux-media+bounces-49418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D188CD97AB
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7B35300E3FC
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 13:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B8C24A069;
	Tue, 23 Dec 2025 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbdoRun/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5E4233134
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766497660; cv=none; b=mZNGrKY0qC+NLmgVnuQ6fJX0EMQdy+ej952pp1tc9nI8SryFStQiWTrAYUwGajgjzmvo0IAwDLz1r6UFmhIMteec/tQSdqpdlomnoXH+qtUFbY2UbBtDvQFIw5yQ72KvmyqQfB9MReHK9h8N2cmO2QKrY0k0xa4cm6QKt7mNIQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766497660; c=relaxed/simple;
	bh=uJOn7aANRa1FepC8edQufQN0+q3AdpV7VlTe9k71wtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeQc2pngqoboQ0xUeVPKjdOEkmHzvDDroNbm+akOHT7dfTaj+W0H6rPJUjcK5uH298BC0DKYdVWRVGm7Rij8Rk10l9eWnFp56KXtRRmsecnfpGGpCOrFS4IRxK2Yy4UNhcypGO9mtT+yyyVVh38wSJ3ILIK2gh/x7SKyFeVcLXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbdoRun/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766497659; x=1798033659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uJOn7aANRa1FepC8edQufQN0+q3AdpV7VlTe9k71wtE=;
  b=TbdoRun/HXRA/B3/ddlR+1pwWtEfZJP3wqvxPjS/AFzoha+IrmRLaIXN
   4vQuu4Zd504QO3uFrZpk0HM/viYF18p8F68m+XJ3WncjdybYGJ0dvLrB1
   tuXNMqkCyTrhwuN6Bp8CyWtTCIAkBJ68b9Y8i5zgHEVmDgLoyfiU6YkBb
   jNQRNYw9IBlO7oHjCgq6pYGKPF9MQcw7YxgFgodZF9DsGCKMVvVWfNouG
   oYu/faiAMC2Yr3cDkMPnoIFkC81fqTuANzw5hIRvq6aLyb47760P2JGr3
   FYzMEHNV+9TT0z05ddzDi9o49AQrk/1WycSEQ8mIzIvsbkFdH1cF6KFes
   w==;
X-CSE-ConnectionGUID: nln8DkA1QACsgxWKsFFLYw==
X-CSE-MsgGUID: towMnfjzT9OyxvW4jmBDvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79708603"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79708603"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:47:38 -0800
X-CSE-ConnectionGUID: 5iZyw1YFSMe5Pp+fNBXM+Q==
X-CSE-MsgGUID: +Y/xsbAzTDeulWj+LuJ8ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="204716532"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.87])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:47:36 -0800
Date: Tue, 23 Dec 2025 14:47:10 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com, 
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH 08/13] media: ipu6: Drop error argument from
 ipu6_isys_stream_start()
Message-ID: <gnvl3gi7dgwghfzmyt34lzhojqtgkw2h7evlgbcx565d7amfus@3nzkxci5otnd>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
 <20251219095829.2830843-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219095829.2830843-9-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch!

On Fri, Dec 19, 2025 at 11:58:24AM +0200, Sakari Ailus wrote:
> error argument for ipu6_isys_stream_start() is always false, remove the
> argument.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index dcad6aafee29..db533d45d994 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -290,7 +290,7 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
>  
>  /* Start streaming for real. The buffer list must be available. */
>  static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
> -				  struct ipu6_isys_buffer_list *bl, bool error)
> +				  struct ipu6_isys_buffer_list *bl)
>  {
>  	struct ipu6_isys_stream *stream = av->stream;
>  	struct device *dev = &stream->isys->adev->auxdev.dev;
> @@ -336,10 +336,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
>  out_requeue:
>  	if (bl && bl->nbufs)
>  		ipu6_isys_buffer_list_queue(bl,
> -					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING |
> -					    (error ?
> -					    IPU6_ISYS_BUFFER_LIST_FL_SET_STATE :
> -					     0), error ? VB2_BUF_STATE_ERROR :
> +					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING,

is IPU6_ISYS_BUFFER_LIST_FL_SET_STATE still needed after this patch ?

--
Kind Regards
Mehdi Djait

