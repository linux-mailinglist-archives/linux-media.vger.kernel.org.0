Return-Path: <linux-media+bounces-35337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B73B9AE0764
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5E685A79FE
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 13:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EC42698BF;
	Thu, 19 Jun 2025 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fUC0Ucxw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2677226F44C
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 13:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339684; cv=none; b=Z58NGuH8DtQ6FUYpfiCwLgOwe5GYWqNRKV2XnPfDVDFTcc480yH8rCcbGBM7aPUC0um0x/3nVzToba25x4s3HLlY70i5e1/HASDa+ihBqu9wJFXwhMli+WQ3xsvr8FV3zXbgETjPrLaGBWAMqzFrUCwWyb2ZBJ0+fooYz0JU9uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339684; c=relaxed/simple;
	bh=enshmvz8KJRgeA2vJnl7Axg2TUYCMlfHWbyw5phQsNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcOVfVZjxmKG5t+xV068aXcGM3Q256eHivPG7Hn0Pxq983Q0Jo7iWQltMakxC9C/LS62at9ojcD7jkaDe1CDJv1DA0cQXCct6isPQbB4NI1W8Ry3MVgx/cV0hej9+6y3BCAHM2ILrEWYl/Uc+UP5zLcHabjE0q7fuP55jwriMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fUC0Ucxw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE5CA2EC;
	Thu, 19 Jun 2025 15:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750339668;
	bh=enshmvz8KJRgeA2vJnl7Axg2TUYCMlfHWbyw5phQsNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUC0UcxwgBh6pBj7uVrCabERWfiweR8N8Cd4J/xPA0cBf6Rq2LoZAiPXlFNPkPbyq
	 8S1dJJj0VLr3DL1xQ+i3SkGR7AvQZrYffgJiecJZYYb+gWpHuDpJnstcDnHh7OmQgo
	 hJH5BX0YvqzBs2lmUJCoaEJS1dpalIh+kEvSN78g=
Date: Thu, 19 Jun 2025 16:27:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 02/13] media: ipu6: Set minimum height to 1
Message-ID: <20250619132744.GD32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Jun 19, 2025 at 11:15:35AM +0300, Sakari Ailus wrote:
> For image data generally 2 seems like a minimum height that surely won't
> cause any issues, but some sensors have metadata the height of which is
> just one line. Set the minimum height to 1.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> index f488e782c26e..0e2c8b71edfc 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> @@ -40,7 +40,7 @@ struct ipu6_bus_device;
>  #define IPU6_ISYS_NUM_RECV_QUEUE 1
>  
>  #define IPU6_ISYS_MIN_WIDTH		2U
> -#define IPU6_ISYS_MIN_HEIGHT		2U
> +#define IPU6_ISYS_MIN_HEIGHT		1U
>  #define IPU6_ISYS_MAX_WIDTH		4672U
>  #define IPU6_ISYS_MAX_HEIGHT		3416U
>  

-- 
Regards,

Laurent Pinchart

