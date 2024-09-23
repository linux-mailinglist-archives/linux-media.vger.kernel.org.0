Return-Path: <linux-media+bounces-18457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9521D97E795
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2094CB2165D
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 08:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2198D19341D;
	Mon, 23 Sep 2024 08:32:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9F42AA2;
	Mon, 23 Sep 2024 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727080338; cv=none; b=XckhkcDPFeHx4pJV1sfiuGoLTneoBpMiIgCFTI88k1iQMct5MBNeRcAshqCCibLqzreG6tinVrsk1PC3e5Btd5ftVUXxOOMWnekheiFP2sbWIqFjTbzAwCIyW90YCMh3iBwAvUxnYPgphTXHZCtoLlnm6pKtntV0guvKkarDuCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727080338; c=relaxed/simple;
	bh=52uAVmOApUfjRh4MlWipBn758kGSrRrb58U9Nag8qes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RavnQ1BYOQ7dRmCV0hn1lWUvcLZCcHPH2sk5Nw8Jfn7jBqRTunbX/kY8Jdg6YINbi49WmsJ+hG9CN7V44p1SgzgNE6rZhQwmiES7WcFQ7BsXOH5ABKLzShbhsGAS8BXqdt+r5AtW1bJ8xDtra7472LMZlH91WZwmNLDSA/+ncHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: Pawct6RyTOubr9S3PFl2zw==
X-CSE-MsgGUID: O1lGyQLCQy2edAknrvelAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25535149"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="25535149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:32:16 -0700
X-CSE-ConnectionGUID: Gh8T6FOPTzS7oIdCWeZhaA==
X-CSE-MsgGUID: 487F/ZSISwCAgOggRQ/D+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="94327257"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:32:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sseUM-0000000BtSc-2OGD;
	Mon, 23 Sep 2024 11:32:10 +0300
Date: Mon, 23 Sep 2024 11:32:10 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Yu Jiaoliang <yujiaoliang@vivo.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jonathan Bergh <bergh.jonathan@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] media: atomisp: Fix typos in comment
Message-ID: <ZvEniiAeBjZKkyjd@smile.fi.intel.com>
References: <20240923033032.2420839-1-yujiaoliang@vivo.com>
 <84c96000-e198-4502-b37d-0ca15c311968@gmail.com>
 <ZvEmUWD75Huv7vwy@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvEmUWD75Huv7vwy@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 23, 2024 at 11:26:57AM +0300, Andy Shevchenko wrote:
> On Mon, Sep 23, 2024 at 07:57:00AM +0200, Philipp Hortmann wrote:
> > On 9/23/24 5:30 AM, Yu Jiaoliang wrote:

...

> > I cannot apply your patch:
> 
> >   Fetch URL:
> > git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> 
> You used the wrong branch.
> AtomISP has it's own tree/branch for development:
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Talking about this, Yu may use --base next time, so everyone, including CIs,
will know exactly what should be used as a base.

-- 
With Best Regards,
Andy Shevchenko



