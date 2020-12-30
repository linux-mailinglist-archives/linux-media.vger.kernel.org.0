Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194AB2E7C98
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 22:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgL3VVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 16:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgL3VVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 16:21:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F0CC061573;
        Wed, 30 Dec 2020 13:20:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6D243E;
        Wed, 30 Dec 2020 22:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609363221;
        bh=FzFPXZYwcTCYXVGfwAKemFzBPJlkDh8ZhIQZqZzJjVU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q4z6r/TQp6gZHFP9t3UB5xELh5lTXNlc+QaldjORLKZ93lbgtY1+/DZh9aJfNLG0u
         7QZSTECowBlpWUNtYKv8xL9IQSt44ml95u02EHSlW772eM7Miv39+xfIVHGoDjQzR9
         7oezsDE2tIMw1qx3MiPB2K/54UMXZDhHAqekyeQs=
Date:   Wed, 30 Dec 2020 23:20:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     sakari.ailus@linux.intel.com, andy.shevchenko@gmail.com,
        mchehab+huawei@kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu3-cio2: Fix mbus_code processing in
 cio2_subdev_set_fmt()
Message-ID: <X+zvCZefnwfiTqoO@pendragon.ideasonboard.com>
References: <20201230125550.GA14074@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201230125550.GA14074@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

Thank you for the patch.

On Wed, Dec 30, 2020 at 01:55:50PM +0100, Pavel Machek wrote:
> Loop was useless as it would always exit on the first iteration. Fix
> it with right condition. 
> 
> Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
> Fixes: a86cf9b29e8b ("media: ipu3-cio2: Validate mbus format in setting subdev format")

Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> index 36e354ecf71e..e8ea69d30bfd 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1269,7 +1269,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
>  	fmt->format.code = formats[0].mbus_code;
>  
>  	for (i = 0; i < ARRAY_SIZE(formats); i++) {
> -		if (formats[i].mbus_code == fmt->format.code) {
> +		if (formats[i].mbus_code == mbus_code) {
>  			fmt->format.code = mbus_code;
>  			break;
>  		}
> 

-- 
Regards,

Laurent Pinchart
