Return-Path: <linux-media+bounces-31557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E26CCAA6E62
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 11:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0A5A1BA1592
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 09:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF9122F155;
	Fri,  2 May 2025 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOn9JeJm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E11C9DE5
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179101; cv=none; b=dy9UbAvsa74E607GJmZ0lLfKN92vGitBM9KduZSRFLuqYN6JFta0WNFcaX98m5sqaan7gHHE+/QVrXl6Kbcr0qxV8AUR97hC9o5nW3spIcJN/MC4wGFQX5y4PNLJni8WXlnWRaTJnQoi4kjGT1mWP/s/XgOVwKV978Woe+mlY8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179101; c=relaxed/simple;
	bh=LHq/iqNS1AmkuZDlSYiqelcT8GV+Y5dnC01Hd//pqHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D263nnRaOkgYDLvx06bBaI66mkjTZ5ZV8nEWJ7Kh54CxUn292gQ7ZHm+AYLcK7280FiGhpiK2BsEH35WL3wv5GWpcouOCNCSeNF6vXiJbbMNFhONO56WJerwQI75+lYdXqHIvCCk66qm47LTgMTUVQ2/4SE3YJuwrETNMxnf+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOn9JeJm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746179099; x=1777715099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LHq/iqNS1AmkuZDlSYiqelcT8GV+Y5dnC01Hd//pqHA=;
  b=MOn9JeJmDAgS+5bH7payeJGGlt7rO03Vs23WFftETdVevOg+X9uImFur
   StgBoLiMV+2zExr0VcYUm2FTTEIh7+OO1qALQH3KzIX/Yq+SaLo1NS/nY
   /QALp/l/6UdQWMWYMbgeX0LGdGhdrLIClbBCMhHzPl+2Xahz7WQ/P5w3R
   AFiz+gfsdYKEventf65m+6yNfybt+OOO2QU/Ne+Wu7K6wL9xJF8IcvbgY
   07PWDw9gxsiU7hqPYple9aFIugmQ/UlDDXEUdH/6Byhcw3kOHouQm1SxQ
   gWpZGwUY9hdExEjMSyUWfVX3fLNo5Q9cNKYBMfdbXTmjOgSq2Sz4XBLse
   A==;
X-CSE-ConnectionGUID: 1cRTfvKuR/O/iDp21xBnHQ==
X-CSE-MsgGUID: s3/NE3C8QRmeiFPtnZv/Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="65390355"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="65390355"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:44:58 -0700
X-CSE-ConnectionGUID: 03iQscE9SLC5ZNSyR60g1w==
X-CSE-MsgGUID: ZficTKUpQymasRHMshxxVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139778995"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:44:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 06AF211F995;
	Fri,  2 May 2025 12:44:54 +0300 (EEST)
Date: Fri, 2 May 2025 09:44:53 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v2 3/5] media: intel/ipu6: Remove deprecated lock comment
Message-ID: <aBSUFQQaBAMJbC6m@kekkonen.localdomain>
References: <20250430115350.506460-1-stanislaw.gruszka@linux.intel.com>
 <20250430115350.506460-4-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430115350.506460-4-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

On Wed, Apr 30, 2025 at 01:53:48PM +0200, Stanislaw Gruszka wrote:
> pre_streamon_queued is no longer used, remove comment about it.

It looks like that the field names to which access is serialised by using
this lock are now called active and incoming. How about instead updating
the comment instead of removing it? Having locks without documenting what
they're for isn't nice.

> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> index b865428a0fce..6b8dec55f200 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> @@ -20,9 +20,6 @@ struct ipu6_isys_stream;
>  struct ipu6_isys_queue {
>  	struct vb2_queue vbq;
>  	struct list_head node;
> -	/*
> -	 * @lock: serialise access to queued and pre_streamon_queued
> -	 */
>  	spinlock_t lock;
>  	struct list_head active;
>  	struct list_head incoming;

-- 
Regards,

Sakari Ailus

