Return-Path: <linux-media+bounces-2548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2D5816BFB
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 12:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E29FB2329F
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 11:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DCB1944E;
	Mon, 18 Dec 2023 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXrmI7zE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5ED1B270
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702897782; x=1734433782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ubmW14FlDYuP1NCNtEtFU/ShQizfIEcGZYccitS3rV0=;
  b=dXrmI7zEWbvFnmQs2vmaN7T55xB/XA3ezOMJAp4Au3s0En1GoEz9Xs/J
   YAcwezYoTCUsJEO2hTlWmgiCGm2ALoV81Mr7+gBqSDetaBfotXRwEvmwE
   xZQL77rK9Af12s0K5MGhB6jUB9Y1xkoavh25bp8zusLnmCo1ibOxHjxbN
   +EYJREK8YbBHIDDcvD+ltaENxV6J3bambweyo2z2NHhvR+AuPlzviAuOw
   SFj2hnhhZJNEdPF8fMIFzcb5rUzaCZvG5mBBxrwU2057cwdhdc6/tmG5/
   5JIOabvOHByfd33vfdjXxY1ONaNEnKf0BEorKx47y9/R3RYtCvN9cW+AI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="394364709"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="394364709"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 03:09:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="898929495"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="898929495"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 03:09:39 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 02C8E11F7E4;
	Mon, 18 Dec 2023 13:09:36 +0200 (EET)
Date: Mon, 18 Dec 2023 11:09:36 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: j-luthra@ti.com, mchehab@kernel.org, mripard@kernel.org,
	kernel@collabora.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: cadence: csi2rx: use match fwnode for
 media link
Message-ID: <ZYAocHzVwMrLDFI2@kekkonen.localdomain>
References: <20231218095604.1950737-1-julien.massot@collabora.com>
 <20231218095604.1950737-2-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218095604.1950737-2-julien.massot@collabora.com>

Hi Julien,

Thanks for the patch.

On Mon, Dec 18, 2023 at 10:56:00AM +0100, Julien Massot wrote:
> On some subdev the fwnode is the device node and not the endpoint node.
> Using the subdev fwnode doesn't allow to fetch the subdev
> pad we are connected to when the remote subdev has multiple
> output pads.

I'd change the commit message, endpoint-to-endpoint matching used to be the
preferred way to do things not long ago.

> 
> Fixes: 1fc3b37f34f69 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")

I think the driver was originally fine but I missed making the below change
when changing async matching. Instead I think you should have here:

Fixes: 1029939b3782 ("media: v4l: async: Simplify async sub-device fwnode matching")

IOW applying your patch without 1029939b3782 will also break cdns-csi2rx
driver.

> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> Reviewed-by: Jai Luthra <j-luthra@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 91ef22e9109a..e83b877c48da 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -467,7 +467,7 @@ static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
>  	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>  
>  	csi2rx->source_pad = media_entity_get_fwnode_pad(&s_subdev->entity,
> -							 s_subdev->fwnode,
> +							 asd->match.fwnode,
>  							 MEDIA_PAD_FL_SOURCE);
>  	if (csi2rx->source_pad < 0) {
>  		dev_err(csi2rx->dev, "Couldn't find output pad for subdev %s\n",

-- 
Regards,

Sakari Ailus

