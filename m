Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2DB510E707
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 09:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfLBIsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 03:48:06 -0500
Received: from retiisi.org.uk ([95.216.213.190]:37180 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725977AbfLBIsF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Dec 2019 03:48:05 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 6503D634C87;
        Mon,  2 Dec 2019 10:47:21 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1ibhMX-0001GV-0i; Mon, 02 Dec 2019 10:47:21 +0200
Date:   Mon, 2 Dec 2019 10:47:21 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        bingbu.cao@intel.com
Subject: Re: [PATCH 1/1] intel-ipu3: Align struct ipu3_uapi_awb_fr_config_s
 to 32 bytes
Message-ID: <20191202084720.GN833@valkosipuli.retiisi.org.uk>
References: <20191202083820.15639-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191202083820.15639-1-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 02, 2019 at 10:38:20AM +0200, Sakari Ailus wrote:
> A struct that needs to be aligned to 32 bytes has a size of 28. Increase
> the size to 32.
> 
> This makes elements of arrays of this struct aligned to 32 as well, and
> other structs where members are aligned to 32 mixing
> ipu3_uapi_awb_fr_config_s as well as other types.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Bingbu Cao <bingbu.cao@intel.com>

The tags should have included:

Fixes: commit dca5ef2aa1e6 ("media: staging/intel-ipu3: remove the unnecessary compiler flags")

> ---
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index 08eaa0bad0de..1c9c3ba4d518 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -449,7 +449,7 @@ struct ipu3_uapi_awb_fr_config_s {
>  	__u16 reserved1;
>  	__u32 bayer_sign;
>  	__u8 bayer_nf;
> -	__u8 reserved2[3];
> +	__u8 reserved2[7];
>  } __attribute__((aligned(32))) __packed;
>  
>  /**
> -- 
> 2.20.1
> 

-- 
Sakari Ailus
