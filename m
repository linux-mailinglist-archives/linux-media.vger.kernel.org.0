Return-Path: <linux-media+bounces-12725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF51900401
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 14:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BA8D1C214A7
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A831940B1;
	Fri,  7 Jun 2024 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMvGhzvT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271191E4A6
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764349; cv=none; b=PQU7d/w26zIyaMna9XbLzOD1b79qRQsB83bA3y3ylT91kgLYUZxLWdh6nP1caqLYEar7s3mwjKDBmmbZyC0SefNdlqcnRKPnUY0fIXQpzHmeT6lMMFrSvocE9kEwq4gYR/OvoUWStGZ/MyiUACPzE7WpY/6qy4+FA6mCRfFYUfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764349; c=relaxed/simple;
	bh=6cWDxk6ryVQO9v6kAsYZw6czjJKG5PrAJOPbyJE8bvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVXltOOicucy6+udkF8E2ygqQh8kJVyjj81m1omopqF0R5rpBVSlEFceMXtuQAV59tnUsmJfB6bOzRZyUaJWyoKcVQQN/s5hIYF8m6TtT+CnkHd02hAWpeA9hpDVphDQfOx1MppP9HTf0NIWa7A9nS8ldoyGSpfmxuNCOBXrskM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMvGhzvT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717764348; x=1749300348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6cWDxk6ryVQO9v6kAsYZw6czjJKG5PrAJOPbyJE8bvs=;
  b=cMvGhzvTjxKMLElZHoOfMoI/NQ8oGwqy2nRuq+4L09Vho8aNMkgIXKyt
   wSGRKCAs6bFokIhD6rM2V8ay/0LwvFxyRH6vdWUU4maBPBRp7x/lEn4hC
   MIdel5bUf0m0lEuq1dm1HMBwIKsd/IWiFAwD0BmQrZRY68abNwA2F5gkH
   2swgthTjJ1WtuJwLiNLWFOD/CvJk8ucTBhTVlO5AiuVu/vKa2RsdIBodI
   J7adIh7V0N8xSMjknkYeu4bk+0XU3dCI98ImfCIbr5xLi2JHf0VjIfkL8
   3SIiWehQ15Xv4cXHntH7MzpuhbKU/5CBEsxUHcWNCS5PVHYgXitUOO5xx
   w==;
X-CSE-ConnectionGUID: /3HnjFKQQFS5Jaeh+G5wtg==
X-CSE-MsgGUID: MPrzMpvcSBuUodHeJ6uLeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14663835"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14663835"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:45:48 -0700
X-CSE-ConnectionGUID: SXF+SmqLToeOQ2/hJihxBg==
X-CSE-MsgGUID: v01DXFyRTbuNLqgUHD00Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="43242843"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:45:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1420F11FA94;
	Fri,  7 Jun 2024 15:45:44 +0300 (EEST)
Date: Fri, 7 Jun 2024 12:45:44 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wentong Wu <wentong.wu@intel.com>
Cc: linux-media@vger.kernel.org, hao.yao@intel.com,
	Jason Chen <jason.z.chen@intel.com>
Subject: Re: [PATCH 1/3] media: ivsc: csi: don't count privacy on as error
Message-ID: <ZmMA-G5Dr68AEwbx@kekkonen.localdomain>
References: <20240603082614.1567712-1-wentong.wu@intel.com>
 <20240603082614.1567712-2-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603082614.1567712-2-wentong.wu@intel.com>

Hi Wentong,

On Mon, Jun 03, 2024 at 04:26:12PM +0800, Wentong Wu wrote:
> Prior to the ongoing command privacy is on, it would return -1 to
> indicate the current privacy status, and the ongoing command would
> be well executed by firmware as well, so this is not error. This
> patch changes its behavior to notify privacy on directly by V4L2
> privacy control instead of reporting error.
> 
> Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
> Reported-by: Hao Yao <hao.yao@intel.com>
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Tested-by: Jason Chen <jason.z.chen@intel.com>
> ---
>  drivers/media/pci/intel/ivsc/mei_csi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
> index 89b582a221ab..004ebab0b814 100644
> --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> @@ -190,7 +190,11 @@ static int mei_csi_send(struct mei_csi *csi, u8 *buf, size_t len)
>  
>  	/* command response status */
>  	ret = csi->cmd_response.status;
> -	if (ret) {
> +	if (ret == -1) {
> +		/* notify privacy on instead of reporting error */
> +		ret = 0;
> +		v4l2_ctrl_s_ctrl(csi->privacy_ctrl, CSI_PRIVACY_ON);

s/CSI_PRIVACY_ON/1/

> +	} else if (ret) {
>  		ret = -EINVAL;
>  		goto out;
>  	}

-- 
Kind regards,

Sakari Ailus

