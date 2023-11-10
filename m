Return-Path: <linux-media+bounces-15-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3157E7ED0
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AAC5B2129A
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F4C3AC3A;
	Fri, 10 Nov 2023 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NlXzwwL7"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6363A260
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:37 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4156639777
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 06:44:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A01B649E;
	Fri, 10 Nov 2023 15:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699627431;
	bh=GBOASXUMqR8qdWlOc7hDYCgRfnD9gpWiEzL8H8/dDyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlXzwwL7VqVUnIJU5vjNFF1Uz/BFE/Rf9xfaBnXOcoz9ZYD9pLr8lzbuGoJEPlnQi
	 VCy4n5le8Y+pSWBSrVdzNPUXcC79vga/K4/qnSMujp/Ix9PtwzPQ4OMvUBfbpGcpqP
	 EvJAVst+Py42YpMRYqW+rhc8+erC/B4lz9Sov4UA=
Date: Fri, 10 Nov 2023 16:44:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 1/6] media: v4l: cci: Include linux/bits.h
Message-ID: <20231110144421.GB21167@pendragon.ideasonboard.com>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231110094705.1367083-2-sakari.ailus@linux.intel.com>

On Fri, Nov 10, 2023 at 11:47:00AM +0200, Sakari Ailus wrote:
> linux/bits.h is needed for GENMASK(). Include it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/v4l2-cci.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> index 0f6803e4b17e..f2c2962e936b 100644
> --- a/include/media/v4l2-cci.h
> +++ b/include/media/v4l2-cci.h
> @@ -7,6 +7,7 @@
>  #ifndef _V4L2_CCI_H
>  #define _V4L2_CCI_H
>  
> +#include <linux/bits.h>
>  #include <linux/types.h>
>  
>  struct i2c_client;

-- 
Regards,

Laurent Pinchart

