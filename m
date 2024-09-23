Return-Path: <linux-media+bounces-18456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168B397E78B
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40E3B1C21224
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 08:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B441885B9;
	Mon, 23 Sep 2024 08:30:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAA22F2D;
	Mon, 23 Sep 2024 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727080254; cv=none; b=EYuWw2HsY/dMKik9dM2EH6xH8jLTAZD2rFKJJtolnTyDHbZU3Sl93w62xXrHhJj1tGKDkoEzsRllw+mIdnd46OOnTnlEGo1mArd7jxsQ0OSR+qxplvNkOjHH82N14/+8CID0NeZoGgT3lpPkdYh6IL40S8CUtWhvI+XxA9M+hcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727080254; c=relaxed/simple;
	bh=hBkmiKO56GSLzeHh5tObT3WSpCFOeVe3N/No72Lx6Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Awu/7JxiWI283MgrgyLNqRuhxUG7v7ynX9Bx3zEW0iVYfwU1fxjvjhVS9qD6szLtWV41VuAQfWQrT0yUok6z/iJwvyLE4SOshAW9QBeqnGIRxuxcVwMve02JVGStmZ0e4P0g0UTCrv/3hjPoGKX3xzYMO5wYVGMacCMWCo6Hda4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 2G+NJ+JVSTCvVXi1CRXvoQ==
X-CSE-MsgGUID: S0/G4IsKRJ61GirlmtZxjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26108606"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26108606"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:30:52 -0700
X-CSE-ConnectionGUID: 9ar9/5IQQ/Gy+RDyv+CTyA==
X-CSE-MsgGUID: lN3nIR6rTWmtH4IocQH0KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71017545"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:30:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sseSz-0000000BtRR-28Hk;
	Mon, 23 Sep 2024 11:30:45 +0300
Date: Mon, 23 Sep 2024 11:30:45 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
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
Message-ID: <ZvEnNXHV9ZnnQswd@smile.fi.intel.com>
References: <20240923033032.2420839-1-yujiaoliang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923033032.2420839-1-yujiaoliang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 23, 2024 at 11:30:23AM +0800, Yu Jiaoliang wrote:
> Corrected typos:
> componnet->component,
> cofiguration->configuration,
> doubtfull->doubtful,
> consisit->consist,
> coppied->copied.
> 
> These changes fix the typos in the comment,
> without affecting the functionality.

...

>  	//config.acq_allocated_ib_mem_words		 = 0;
>  
> -	// Set the start of the session cofiguration.
> +	// Set the start of the session configuration.

While at it, the comment style can be changed to C-like

	/* Set the start of the session configuration */

(no need to resend unless Hans asks for that, otherwise he might fix whilst
 applying).

-- 
With Best Regards,
Andy Shevchenko



