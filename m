Return-Path: <linux-media+bounces-9081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5DC8A0A6A
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 09:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B841B2AB71
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 07:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CFF13E408;
	Thu, 11 Apr 2024 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/vbWAe1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AD813FD66
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712821535; cv=none; b=RRVGOHvgq84XCud2sqyHhJlGcvoUd1tpssScZJl7jEYWGxNK0jREehJZnier5UMRzLSShcxgb6EaeALOVZ2AfoqdqWRuOetcfEVc9rZM1iF0d4j2oWn0JU1eve2rHD8VQK3qqZyCv69s2ffkyo1PDH71RivYbbeV4vzWU0y+TRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712821535; c=relaxed/simple;
	bh=+GZfTLy6qZvxB/+pfU1TF/pVwPhdpZh3VwP5Jy/Erek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEh6Ifvh/Q/oWzHps+UBc+TMSXqs7kTqhTl748Ylgt1dGrp3zQpuuslxiTjpAaA3sEa0o9Fpv9zx6takLbVCBBNacaggaGebqIsKjDpEzkTJQIKtWfFGCGSIpGn/HGZ7zCd+PV50ZBN9bxyvUEWP825JEv22hacYFqjUyhrTGD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/vbWAe1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712821533; x=1744357533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+GZfTLy6qZvxB/+pfU1TF/pVwPhdpZh3VwP5Jy/Erek=;
  b=B/vbWAe1Lpesnw3ICwXlZbXDeI11Vi4Q2lXo6JdePVDm5aQTpXQgSYqt
   uS9+OEffU71QNhSBqFacM8rP6xvRKo8mUmqIdukh+JFAA8B9GaKMwtUlS
   m7fnhQHcx84xmMI0SgGP7Gtdzx6GC72XD07G6VyO9uFNT7XRtampPD1QN
   hH/1xIFbZtVvfbt7Ea7y7pnquzlnn5z7Ew2ZWss1qnJF02biX6ylVQ3X0
   kCzqTMq9dv6emlCirZVpMizqKm/Im3r+JmGJ58tYKjLqFn4W8PIywczW5
   Mupa+8U+yWq4KaHkyR7U6BwajVH+Ryu2fIWAkCR4h6pZbVius5fxNCwtw
   w==;
X-CSE-ConnectionGUID: GH6hundOT1i2MCz0Uzazxg==
X-CSE-MsgGUID: fQvMYFGRQEaLEgQq+Inr8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8070169"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8070169"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 00:45:32 -0700
X-CSE-ConnectionGUID: eQN9qGppQ0qlDB/68yKyiQ==
X-CSE-MsgGUID: OhcaDXwHQjewcMT2GRS9dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20878359"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 00:45:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DA7AB12035C;
	Thu, 11 Apr 2024 10:45:28 +0300 (EEST)
Date: Thu, 11 Apr 2024 07:45:28 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH 1/1] media: staging: ipu3-imgu: Update firmware path
Message-ID: <ZheVGP4b4Sdsh-K3@kekkonen.localdomain>
References: <20240411065639.417134-1-sakari.ailus@linux.intel.com>
 <79079812-fdd2-c712-6442-73bd5a40ba4c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79079812-fdd2-c712-6442-73bd5a40ba4c@linux.intel.com>

Hi Bingbu,

On Thu, Apr 11, 2024 at 03:35:25PM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 4/11/24 2:56 PM, Sakari Ailus wrote:
> > Use the current firmware path in linux-firmware repository. Check the
> > older paths still in order to avoid causing issues to the users.
> 
> We also meet similiar issues for IPU6(github driver), I am wondering
> as the WHENCE file create link and do we still need such patch for IPU6?

Good question. This was still never found in the upstream Linux kernel.

I don't have a strong opinion about it though. Something like that was done
to the ipu3-cio2 driver, too. So perhaps we could just take Hao Yao's patch
and get it to linux-firmware (with a bit more elaborate commit message)?

> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/staging/media/ipu3/ipu3-css-fw.c | 4 +++-
> >  drivers/staging/media/ipu3/ipu3-css-fw.h | 2 ++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
> > index 2b659b0ccca1..37482b626c3c 100644
> > --- a/drivers/staging/media/ipu3/ipu3-css-fw.c
> > +++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
> > @@ -117,7 +117,9 @@ int imgu_css_fw_init(struct imgu_css *css)
> >  	unsigned int i, j, binary_nr;
> >  	int r;
> >  
> > -	r = request_firmware(&css->fw, IMGU_FW_NAME_20161208, css->dev);
> > +	r = request_firmware(&css->fw, IMGU_FW_NAME_IPU_20161208, css->dev);
> > +	if (r == -ENOENT)
> > +		r = request_firmware(&css->fw, IMGU_FW_NAME_20161208, css->dev);
> >  	if (r == -ENOENT)
> >  		r = request_firmware(&css->fw, IMGU_FW_NAME, css->dev);
> >  	if (r)
> > diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
> > index f9403da75785..c956aa21df25 100644
> > --- a/drivers/staging/media/ipu3/ipu3-css-fw.h
> > +++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
> > @@ -9,6 +9,8 @@
> >  #define IMGU_FW_NAME		"intel/ipu3-fw.bin"
> >  #define IMGU_FW_NAME_20161208	\
> >  	"intel/irci_irci_ecr-master_20161208_0213_20170112_1500.bin"
> > +#define IMGU_FW_NAME_IPU_20161208	\
> > +	"intel/ipu/irci_irci_ecr-master_20161208_0213_20170112_1500.bin"
> >  
> >  typedef u32 imgu_fw_ptr;
> >  
> > 
> 

-- 
Regards,

Sakari Ailus

