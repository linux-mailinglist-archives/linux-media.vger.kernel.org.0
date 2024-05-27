Return-Path: <linux-media+bounces-11930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C68CFF9E
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 14:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DDE3B22CD4
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB6115DBC8;
	Mon, 27 May 2024 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtNgbdQa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211251581E2
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716811875; cv=none; b=J0Fvdc5Ye+ADWb5GwHGQ0i20qR1EcxMQurBpLLFL8jHJPzvQIdtbBUGjEQnL16ADQNkusjTvmO2Y3EEs9fW/Kwg/lYO8TMYXBCMqGl48eCxcuzKL9DmCtwvyDCvMtnpbqWlZOJ2jWJM3rcPoR9EunTiKDkLDx7oyuYzKNxjLodI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716811875; c=relaxed/simple;
	bh=8XCTaoMsgkJdoy/FTPxx9koN/WDCr/EoEqjjcs6V/RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3cYKBnxeDK70I7QpMZbBx6xSJMFnyR0H7DFRCQQCWecfn56D9pazF5JyB/NJ+GsqmfFXhtnqTxeDawfB3nVviQQvWjzFV6yO1hqGCGIirHL4YHYyiVU8PUgs8WTigYGBIW+UKxIREC8su0PDI0R6zDx2aAYxI4KCaVwh1XGJc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtNgbdQa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716811873; x=1748347873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8XCTaoMsgkJdoy/FTPxx9koN/WDCr/EoEqjjcs6V/RQ=;
  b=AtNgbdQaz9cV8GZkxhHuE1uhBb+5Mi0cuyrY2B1qbfaiU/O0FsbSrLyl
   F/RyjNFdfzKKsr8s5iw8HF6RNDLjtrQc+9Xq+WkOx7djcdwSJPV9zUSHh
   FcpyE69sv9b2heELUw0YoTOOOxLiqpagvW/1CNQCPWCGR2TH4mlu5stq2
   eXexvh+yEg7jckLqxqP5bF6YF9aFSgztuGMik38cbtvYfQsv+psNIPvD3
   g4MQvS7DOzUZV9daCqfE7jXoSW4cMcsM/qQzAatYpVMBoy0jD6PZ1zU6i
   +7PD6Qmr2x6qMHXv4dAChVM2k7xUz2TH6ixBKBK/W28GPdUpAyGrhUOc+
   Q==;
X-CSE-ConnectionGUID: 2FhHcQa3RduZiLT0MVKTEQ==
X-CSE-MsgGUID: i+y7eQc7T+itcien6c91+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16915123"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="16915123"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 05:11:12 -0700
X-CSE-ConnectionGUID: nUko1dE5RjuC37w6KlPS8Q==
X-CSE-MsgGUID: OES2OZbpRPWWnYMJiTKJBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="65526798"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 05:11:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E186B11FB89;
	Mon, 27 May 2024 15:11:08 +0300 (EEST)
Date: Mon, 27 May 2024 12:11:08 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Samuel Wein <sam@samwein.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2] media: Fix examples in ipu6-isys admin-guide
Message-ID: <ZlR4XMhAqeChUdD3@kekkonen.localdomain>
References: <20240522114656.30472-1-sam@samwein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522114656.30472-1-sam@samwein.com>

Hi Samuel,

Thanks for the update.

On Wed, May 22, 2024 at 11:47:26AM +0000, Samuel Wein wrote:
> Fix flags in X1 Yoga example. MEDIA_LNK_FL_DYNAMIC (0x4 in the link flag)
> was removed in V4 Intel IPU6 and IPU6 input system drivers.
> Added -V flag to media-ctl commands for X1 Yoga, lower-case v only makes it verbose
> upper-case V sets the format.
> 
> Signed-off-by: Samuel Wein <sam@samwein.com>
> ---
>  Documentation/admin-guide/media/ipu6-isys.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/admin-guide/media/ipu6-isys.rst
> index 0721e920b5e6..ac7595a876f1 100644
> --- a/Documentation/admin-guide/media/ipu6-isys.rst
> +++ b/Documentation/admin-guide/media/ipu6-isys.rst
> @@ -135,16 +135,16 @@ sensor ov2740 on Lenovo X1 Yoga laptop.
>  .. code-block:: none
>  
>      media-ctl -l "\"ov2740 14-0036\":0 -> \"Intel IPU6 CSI2 1\":0[1]"
> -    media-ctl -l "\"Intel IPU6 CSI2 1\":1 -> \"Intel IPU6 ISYS Capture 0\":0[5]"
> -    media-ctl -l "\"Intel IPU6 CSI2 1\":2 -> \"Intel IPU6 ISYS Capture 1\":0[5]"
> +    media-ctl -l "\"Intel IPU6 CSI2 1\":1 -> \"Intel IPU6 ISYS Capture 0\":0[1]"
> +    media-ctl -l "\"Intel IPU6 CSI2 1\":2 -> \"Intel IPU6 ISYS Capture 1\":0[1]"
>  
>      # set routing
>      media-ctl -v -R "\"Intel IPU6 CSI2 1\" [0/0->1/0[1],0/1->2/1[1]]"

This -v should be dropped, too. I missed that earlier.

V3 might be the easiest way to do that.

>  
> -    media-ctl -v "\"Intel IPU6 CSI2 1\":0/0 [fmt:SGRBG10/1932x1092]"
> -    media-ctl -v "\"Intel IPU6 CSI2 1\":0/1 [fmt:GENERIC_8/97x1]"
> -    media-ctl -v "\"Intel IPU6 CSI2 1\":1/0 [fmt:SGRBG10/1932x1092]"
> -    media-ctl -v "\"Intel IPU6 CSI2 1\":2/1 [fmt:GENERIC_8/97x1]"
> +    media-ctl -V "\"Intel IPU6 CSI2 1\":0/0 [fmt:SGRBG10/1932x1092]"
> +    media-ctl -V "\"Intel IPU6 CSI2 1\":0/1 [fmt:GENERIC_8/97x1]"
> +    media-ctl -V "\"Intel IPU6 CSI2 1\":1/0 [fmt:SGRBG10/1932x1092]"
> +    media-ctl -V "\"Intel IPU6 CSI2 1\":2/1 [fmt:GENERIC_8/97x1]"
>  
>      CAPTURE_DEV=$(media-ctl -e "Intel IPU6 ISYS Capture 0")
>      ./yavta --data-prefix -c100 -n5 -I -s1932x1092 --file=/tmp/frame-#.bin \

-- 
Regards,

Sakari Ailus

