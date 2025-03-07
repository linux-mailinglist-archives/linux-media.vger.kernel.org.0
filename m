Return-Path: <linux-media+bounces-27794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D597A561FD
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 08:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B8381894E0B
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 07:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577ED1AA1D8;
	Fri,  7 Mar 2025 07:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaqIOExf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016601A5B8C
	for <linux-media@vger.kernel.org>; Fri,  7 Mar 2025 07:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741333509; cv=none; b=STAWrsgSO1ToCOnEWExpSXXBMUJSjTQHsp2ijdY5uGt4gp6xxcB1RRw0dC6giokWbPC+DBksycgBQRt69NCfz55m5geMFXdNJvAbzbSbK6ivfT6jqbpJvkbC0ogunVSSh4z0MAFU0KTVEe7iNVS50RXLGsa4SMjMW3sgLY1ir0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741333509; c=relaxed/simple;
	bh=RQhdooPtxUPTzpxTsl9JjUX8OVjweXN2lU4sACB6Kk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOTlDyrOdpwJxfgSexokCAd7Vw+pu1H3fXbnFe8sS/uIH25o2UeXLrRgW+v1J/yUd2EslXjEWw9YQzVdtUoLPRrZa5ACy8xzebg7ymWhSS7+UvahuvHro88sJ8RUc6xweSnvb6ZLSvjeMI52mtfFxUMgGO0X/ioXtibwSUnppcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaqIOExf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741333508; x=1772869508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RQhdooPtxUPTzpxTsl9JjUX8OVjweXN2lU4sACB6Kk4=;
  b=AaqIOExfXq5GAMIESJUKDxErwPe+eG5xr0ISt5u9xpO/KU9XF99iPJeY
   pUjPiL6SQkB4AjpE7zcGMt7w6aZ3LzTdrfzy/Z+oK1DQ65ifaY6iDAX+r
   YzTEnxbMAIyTQ5MpUaRrP2wVOYk6XpCVW0vMSJPS+2Pjs47wfX2XHWW0d
   j7lUqXCSAj0XEhzqNOmjz97qiLV7ojUv+DS++PKaIXCn3q5+1rEpzsYDl
   Gs9qpu2AlthLNLhuVGWOFni64jDegkl4oUreKgGamij7/3R2kUqp5Ky7x
   sWXWzt4YVIWCvWZj24HLFpVLC8jtjaaSQRyPKcjVSedm5T/DVljt0Txu0
   g==;
X-CSE-ConnectionGUID: LsYFyAj9TluX50DwmZSURw==
X-CSE-MsgGUID: JQMWbd4ZSbWc40LQcEWmwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59779723"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="59779723"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 23:45:08 -0800
X-CSE-ConnectionGUID: cD56qb3yTwqS3+dOACCyYQ==
X-CSE-MsgGUID: EAJKhSmKQDKF+ZpFLdR27A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119257152"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 23:45:06 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A22FC11F7F2;
	Fri,  7 Mar 2025 09:45:03 +0200 (EET)
Date: Fri, 7 Mar 2025 07:45:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v1 3/3] media: intel/ipu6: Constify ipu6_buttress_ctrl
 structure
Message-ID: <Z8qj_2RJpuff42Sd@kekkonen.localdomain>
References: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
 <20250306130629.885163-4-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306130629.885163-4-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

Thanks for the set. A few minor comments below.

On Thu, Mar 06, 2025 at 02:06:29PM +0100, Stanislaw Gruszka wrote:
> Make ipu6_buttress_ctrl constant since it is not modified
> any longer.

Fits on previous line.

> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-bus.c      | 2 +-
>  drivers/media/pci/intel/ipu6/ipu6-bus.h      | 4 ++--
>  drivers/media/pci/intel/ipu6/ipu6-buttress.c | 2 +-
>  drivers/media/pci/intel/ipu6/ipu6-buttress.h | 3 ++-
>  4 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.c b/drivers/media/pci/intel/ipu6/ipu6-bus.c
> index 37d88ddb6ee7..5cee2748983b 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-bus.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-bus.c
> @@ -82,7 +82,7 @@ static void ipu6_bus_release(struct device *dev)
>  
>  struct ipu6_bus_device *
>  ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
> -			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
> +			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,
>  			   char *name)
>  {
>  	struct auxiliary_device *auxdev;
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/intel/ipu6/ipu6-bus.h
> index ebf470806a74..b790f9cc37e3 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-bus.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
> @@ -25,7 +25,7 @@ struct ipu6_bus_device {
>  	void *pdata;
>  	struct ipu6_mmu *mmu;
>  	struct ipu6_device *isp;
> -	struct ipu6_buttress_ctrl *ctrl;
> +	const struct ipu6_buttress_ctrl *ctrl;
>  	u64 dma_mask;
>  	const struct firmware *fw;
>  	struct sg_table fw_sgt;
> @@ -48,7 +48,7 @@ struct ipu6_auxdrv_data {
>  
>  struct ipu6_bus_device *
>  ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
> -			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
> +			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,

pdata should be const, too, btw.

>  			   char *name);
>  int ipu6_bus_add_device(struct ipu6_bus_device *adev);
>  void ipu6_bus_del_devices(struct pci_dev *pdev);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> index 787fcbd1df09..f8fdc07a953c 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> @@ -443,7 +443,7 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
>  	return ret;
>  }
>  
> -int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
> +int ipu6_buttress_power(struct device *dev, const struct ipu6_buttress_ctrl *ctrl,
>  			bool on)

But this is over 80.

>  {
>  	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
> index 4b9763acdfdd..cb008964f870 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
> @@ -65,7 +65,8 @@ int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
>  			       struct sg_table *sgt);
>  void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
>  				  struct sg_table *sgt);
> -int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
> +int ipu6_buttress_power(struct device *dev,
> +			const struct ipu6_buttress_ctrl *ctrl,
>  			bool on);

And this fits on the previous line, too.

>  bool ipu6_buttress_get_secure_mode(struct ipu6_device *isp);
>  int ipu6_buttress_authenticate(struct ipu6_device *isp);

-- 
Regards,

Sakari Ailus

