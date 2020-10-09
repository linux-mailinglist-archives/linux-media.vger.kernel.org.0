Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D824E288F9D
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 19:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389952AbgJIRLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 13:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389944AbgJIRLo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 13:11:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58200C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 10:11:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2950C539;
        Fri,  9 Oct 2020 19:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602263500;
        bh=oqHRkL+TyN1WXoMolOzDRUv2HWXxnoTrhilh0viiH9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZYWIR0sTpbvtWjsApaXlja8MonTolU1Zk9YpzWvBmAZYBORg8MDRa/cwd/ctIQtnI
         HUYMgkNe8K0HJW9YVnxp5xp6Jto+fo98EomZ4ujUEFBEBajDOAUcaFHN1c4AywehML
         VbKCY8HrMjAP/KiUqn4G8VWtdOiW5nCyNDI4RqXI=
Date:   Fri, 9 Oct 2020 20:10:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tsuchiya Yuto <kitakar@gmail.com>,
        bingbu.cao@intel.com, Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH 5/5] ipu3-cio2: Make the field on subdev format
 V4L2_FIELD_NONE
Message-ID: <20201009171057.GB3935@pendragon.ideasonboard.com>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
 <20201009150756.3397-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201009150756.3397-6-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Oct 09, 2020 at 06:07:56PM +0300, Sakari Ailus wrote:
> The ipu3-cio2 doesn't make use of the field and this is reflected in V4L2
> buffers as well as the try format. Do this in active format, too.
> 
> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 9726091c9985..a821c40627f9 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1284,6 +1284,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
>  
>  	fmt->format.width = min(fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
>  	fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_LENGTH);
> +	fmt->format.field = V4L2_FIELD_NONE;
>  
>  	mutex_lock(&q->subdev_lock);
>  	*mbus = fmt->format;

-- 
Regards,

Laurent Pinchart
