Return-Path: <linux-media+bounces-43469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D4EBB042D
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 14:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B726194040F
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 12:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AAB2E7F3E;
	Wed,  1 Oct 2025 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjE0QNHe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716A2DE715;
	Wed,  1 Oct 2025 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759319995; cv=none; b=nPlRS7nfrJUXQa4QPY1iVQ+5r924mo5OjkKWyKeclZKcHfr6xrQWGvHET/EQ/QTeky2ePpqKn7rI/o5u2hFn9NJZ8C1VW6Yhfpk8Nb2EHQnAhQG7l5cYkE0wI7ltNQhbVPGd66gykHIEk4xRdGhCoVekoipKyI6MifAWP3YZ9ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759319995; c=relaxed/simple;
	bh=yasRxt5QP0TubpGRVpMM60tA67T2lNp2t5aBrR0AQ7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKwrxzj2o9GqqyIVaWgKTSvCEzZ+ktTpY7LJ66ZfdwlN3iUA+Kauln1iWOlyx32yIl5tW9bMtEo2RifZ0XeHo56W3/TTuH3WXnu5YXJTxferJjRp9G902UFtI1kyfEkAGdbybLneuoapaKnHFeYtE6fa2Vg85PGO9HdQQEfM1y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjE0QNHe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759319993; x=1790855993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yasRxt5QP0TubpGRVpMM60tA67T2lNp2t5aBrR0AQ7s=;
  b=WjE0QNHeDgu3DWW/736EDcERF2VYglZm2LSa45y4YwfwWk8RdJpvJDJn
   4QU5tqkEFvdkyhOiHhz23kHB/uljsqHkYVXkdUK+lO0UxVzHdJ6shdL/P
   92u6tbe7Z0vRoYzVThat+UoIZazyVWsIcviJJHTJ/+fjdqkxqzwsckVU9
   N+3x/1GdrxNJU+R5IrlfrfzqXFBUFlRnutIF/lAxNEkOC3GvlBXDkBRs7
   sWRgxRzbZQmr2p4GaiBdVsh26X6GKRCtBTDfyjh9Wfr6irU9tKNIRYBFN
   bmKg82c6J9s6VMhHxG+dR05j8XslEEFRpFKXbhgfHOn9GdjLipLAwHPra
   Q==;
X-CSE-ConnectionGUID: zLIszrsvRBG4C3XJ1+wuJg==
X-CSE-MsgGUID: Jk9pcgKrT6WATkL1OAbSGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60804574"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="60804574"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 04:59:53 -0700
X-CSE-ConnectionGUID: nERQSJBORcKpxb9lx/DIGQ==
X-CSE-MsgGUID: /UxpTlybTf24alL71cqoqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="178819207"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 04:59:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0B133121163;
	Wed, 01 Oct 2025 14:59:47 +0300 (EEST)
Date: Wed, 1 Oct 2025 14:59:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: bingbu.cao@intel.com, lixu.zhang@intel.com,
	stanislaw.gruszka@linux.intel.com, mchehab@kernel.org,
	wentong.wu@intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Subject: Re: [PATCH v5] media: pci: intel: ivsc: improve device reference
 counting in mei_ace driver
Message-ID: <aN0XszBNLZPjoRfg@kekkonen.localdomain>
References: <20250929013007.1920-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929013007.1920-1-make24@iscas.ac.cn>

Hi Ma,

Thanks for the update.

On Mon, Sep 29, 2025 at 09:30:07AM +0800, Ma Ke wrote:
> The device reference counting in mei_ace_setup_dev_link() was
> incomplete, as the reference acquired by device_find_child_by_name()
> was not released immediately on the success path. Add put_device() to
> properly balance the reference count. Additionally, the redundant
> put_device() in mei_ace_remove() is removed.
> 
> Found by code review.

The patch seems fine but the commit message is a bit more dramatic than
what reality justifies. I'll use this:

Put the reference to csi_dev acquired during driver probe in
mei_ace_setup_dev_link() inside the same function, instead of during driver
unbind in mei_ace_remove(). This can be done as device_link_add() already
takes a reference to csi_dev.

> 
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v5:
> - jumped to err instead of err_put to avoid calling put_device() again in err_put as reviewer's instructions;
> Changes in v4:
> - updated the subject as suggestions;
> Changes in v3:
> - deleted the tag of Fixes and CC, and moved put_device() to immediately after device_link_add() as suggestions;
> Changes in v2:
> - modified the put_device() operations and the patch title as suggestions.
> ---
>  drivers/media/pci/intel/ivsc/mei_ace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
> index 98310b8511b1..b306a320b70f 100644
> --- a/drivers/media/pci/intel/ivsc/mei_ace.c
> +++ b/drivers/media/pci/intel/ivsc/mei_ace.c
> @@ -414,10 +414,11 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
>  	/* setup link between mei_ace and mei_csi */
>  	ace->csi_link = device_link_add(csi_dev, dev, DL_FLAG_PM_RUNTIME |
>  					DL_FLAG_RPM_ACTIVE | DL_FLAG_STATELESS);
> +	put_device(csi_dev);
>  	if (!ace->csi_link) {
>  		ret = -EINVAL;
>  		dev_err(dev, "failed to link to %s\n", dev_name(csi_dev));
> -		goto err_put;
> +		goto err;
>  	}
>  
>  	ace->csi_dev = csi_dev;
> @@ -522,7 +523,6 @@ static void mei_ace_remove(struct mei_cl_device *cldev)
>  	cancel_work_sync(&ace->work);
>  
>  	device_link_del(ace->csi_link);
> -	put_device(ace->csi_dev);
>  
>  	pm_runtime_disable(&cldev->dev);
>  	pm_runtime_set_suspended(&cldev->dev);

-- 
Regards,

Sakari Ailus

