Return-Path: <linux-media+bounces-18679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D594988203
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 11:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8C33286F05
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 09:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6499F1BB6B3;
	Fri, 27 Sep 2024 09:56:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF891BB692;
	Fri, 27 Sep 2024 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431001; cv=none; b=EbDlx3GwprkH+0a4hTDNAZ8TjEhQPWA0Q73HnSMCyMg4bkjxDqVpUBN5rPGmyoZ9QSzGOlbID0R40Ml7EHChPfA2E3flvYikHBYXWSPuunkBgYzM43H0sATVOFcUIdWEeLbJnP73ktjGg8CEos/t703lmzBU/5GLc22uY9INMZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431001; c=relaxed/simple;
	bh=ubLJ/01eZPUNKmqlmt4+u+gpdCBcyH/lXFA7EMubI5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3WqOd5By3kAo+VXN/UPvsKhmXsYlI5EZ/cAFKbRs1r2eutAXn9jo/SiTF85QNXH4yJ3KOTOMb7do+btHlbSD0lwmzrw0rK3ehKY2z/tKeAODdE1118zjTFIB2EAStrLI+bJw3Ms0b8/VAdgn5hFdV6mE9X58mdZwQqvj5kRdM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: DlYPob+nR42a/MrSK3gw8Q==
X-CSE-MsgGUID: khRn5AmnQBSI/kGtZpSwZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37241910"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="37241910"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:56:39 -0700
X-CSE-ConnectionGUID: j0pcyrElSMK1xZZKr5PENw==
X-CSE-MsgGUID: WZDmNds9Tvauv0QID5VPlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72381646"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:56:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1su7iC-0000000DWl0-3D35;
	Fri, 27 Sep 2024 12:56:32 +0300
Date: Fri, 27 Sep 2024 12:56:32 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Benoit Parrot <bparrot@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: ti: cal: Use str_up_down()
Message-ID: <ZvaBUJCPpCAHY8GC@smile.fi.intel.com>
References: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
 <20240927-cocci-6-12-v1-1-a318d4e6a19d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-cocci-6-12-v1-1-a318d4e6a19d@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 27, 2024 at 09:42:13AM +0000, Ricardo Ribalda wrote:
> The str_up_down() helper simplifies the code and fixes the following cocci
> warning:
> 
> drivers/media/platform/ti/cal/cal-camerarx.c:194:3-9: opportunity for str_up_down(enable)

...

>  	if (i == 10)
>  		phy_err(phy, "Failed to power %s complexio\n",
> -			enable ? "up" : "down");
> +			str_up_down(enable);

Now can fit one line

		phy_err(phy, "Failed to power %s complexio\n", str_up_down(enable));

But have you compiled it?

>  }

-- 
With Best Regards,
Andy Shevchenko



