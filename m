Return-Path: <linux-media+bounces-3702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F38D82D8CC
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 13:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF8DA1F2216E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 12:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243CD2C6A2;
	Mon, 15 Jan 2024 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvnpzOv4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297B52C695
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705321052; x=1736857052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ILQoNbpnZo8GGG3qyHO8PuCw39P5FUSHqonqRdYV1EI=;
  b=BvnpzOv4YTiNdU2HVD2lTzE53A9fh04vV8YZGEV7DvRsnHNU+Ot4XPBk
   VIJ9RhE2iUm3d3BxCgsgPZhPZpp17kVKBjNjMCfYLnwLpJd+C/4Iy63Rq
   MD6nva420CHzij45crthSjlfQ0rdB/Yt+Pd4cr1B/iyzvgXdP+v0U7g4q
   5mZQkmlMuW0Mgk2ioA/Wq9ZON+EJmbdGbYmkcCMDTOpiAw79eaAw9iPTm
   j9COm8mvR8bbTN/mLpDtLBvx8TQSTxABOpPUMTzPmM0dT/hAXjtB59bS6
   i82ZGnHyw14d/pBOwbIuDsjiXbhJlHHCtnOFos3qrZGyJM3226/0xVTp6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="463883166"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="463883166"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 04:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="32122516"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 04:17:28 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D4CA911F816;
	Mon, 15 Jan 2024 14:17:24 +0200 (EET)
Date: Mon, 15 Jan 2024 12:17:24 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
	senozhatsky@chromium.org, andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v3 07/17] media: intel/ipu6: input system ABI between
 firmware and driver
Message-ID: <ZaUiVGB3nzg71H8Z@kekkonen.localdomain>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <20240111065531.2418836-8-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111065531.2418836-8-bingbu.cao@intel.com>

Hi Bingbu,

Just a small comment...

On Thu, Jan 11, 2024 at 02:55:21PM +0800, bingbu.cao@intel.com wrote:
> +int ipu6_fw_isys_close(struct ipu6_isys *isys)
> +{
> +	struct device *dev = &isys->adev->auxdev.dev;
> +	int retry = IPU6_ISYS_CLOSE_RETRY;
> +	unsigned long flags;
> +	void *fwcom;
> +	int ret;
> +
> +	/*
> +	 * Stop the isys fw. Actual close takes
> +	 * some time as the FW must stop its actions including code fetch
> +	 * to SP icache.
> +	 * spinlock to wait the interrupt handler to be finished
> +	 */
> +	spin_lock_irqsave(&isys->power_lock, flags);
> +	ret = ipu6_fw_com_close(isys->fwcom);
> +	fwcom = isys->fwcom;
> +	isys->fwcom = NULL;
> +	spin_unlock_irqrestore(&isys->power_lock, flags);
> +	if (ret)
> +		dev_err(dev, "Device close failure: %d\n", ret);
> +
> +	/* release probably fails if the close failed. Let's try still */
> +	do {
> +		usleep_range(400, 500);
> +		ret = ipu6_fw_com_release(fwcom, 0);
> +		retry--;
> +	} while (ret && retry);

This can be written as:

	ret = read_poll_timeout(ipu6_fw_com_release, ret, !ret, 400,
				2000000, true, fwcom, 0);

Other similar constructs, too, should be replaced.

-- 
Sakari Ailus

