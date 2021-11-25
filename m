Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D1A45D64A
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 09:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353336AbhKYIjk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 03:39:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235766AbhKYIhj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 03:37:39 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2841C061758
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 00:34:28 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id s13so9907258wrb.3
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 00:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WgM9c+Na5LfNqszduHladCBUnf2W3uVEto3G/yVaWeE=;
        b=llz7KOs7elRTFRKScRMPPNwHaMq4XeuUOhYr4PWeYWZBh7FeW27hdngVmQoeZXWhZ2
         z5DDeiAIV2h/bxhvDAgIxEAcD/AqDW+9zvq9Culab9mcGBtYBrjDBNhBbdwNb0FGDKhI
         RZVoSVvKPxEoGWFF1zna7mZbfaxKIv1y9gnpizoQaRjVnqF+bVp/w4RxgdAqV8CCbclM
         XP+Oj+sef/Or2sxkXG/ypzeNwnBrrF6UdtlrPGjVgP5YNwLpE0GSDFhmqFALJKeewtMH
         p7Zo0whhduCWPRCCO9tR5ylBugG5PnNF5eoYWkMy5/Q2ozYKLBWln6VlV2OHoasMRbCx
         gcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WgM9c+Na5LfNqszduHladCBUnf2W3uVEto3G/yVaWeE=;
        b=D3dAR7urXdVHNGcqKkl3ispXLmPSpPbhUIsLwSV3Bjc85ayOUiWYSwg+9B75hjt+tA
         4CUmDtK3YU/FfgSEVBeR8jCLJ9BXKE2RblfTNOhVqpEPuc/jF+Q3+6/MYUh8Bt+hrXFh
         /Xujn0sTKtlVB18MM6iyTzmBHIyPpwPFRDvGsrSt5KM0jP0F0U5sZ8tN0nj65a/oY5g2
         WgFRMZV3NsKzkrQK6GvBv2CAyzzhtv7lvGRcj0F0AAhhJpCSG/dxa/Qp9/VqdWzvC2eT
         qQc1BJ5o/fpm2uHZYu6GeccOCduywR9sOHH6VCxs2g0b9WXWkSACzwEFPnK8aZwlLSTg
         gUzg==
X-Gm-Message-State: AOAM532oMxr+s6DEc1eCg3VOncu4QamIkeDaeBuTBgySMvb+pXj7h/QI
        5dcrIzeD/gdO1GRtA94wfWXVITxRhJ5hDJ6J
X-Google-Smtp-Source: ABdhPJwpB0C/YODC7O6O22Ej7YDbCgiDFOAaHasYI6kgnyhaFoXabjO7N/2/fmt9vjTtD7HrBNEXOQ==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr4446188wri.439.1637829267287;
        Thu, 25 Nov 2021 00:34:27 -0800 (PST)
Received: from localhost (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.gmail.com with ESMTPSA id 4sm2715088wrz.90.2021.11.25.00.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 00:34:26 -0800 (PST)
Date:   Thu, 25 Nov 2021 09:34:26 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] max96712: Select VIDEO_V4L2
Message-ID: <YZ9Kkodn831YQsSC@bismarck.dyn.berto.se>
References: <20211101132502.700505-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211101132502.700505-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

I noticed this patch is marked as Rejected in patchwork, but it's still 
needed. Will you resurrect this patch?

On 2021-11-01 15:25:02 +0200, Sakari Ailus wrote:
> Select VIDEO_V4L2 for the driver actually depends on it, failing to
> compile otherwise.
> 
> Fixes: 51758f8b32134bacbf30bd217f7c2074e9b4b51e ("media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/staging/media/max96712/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
> index 258d47644cbd..492a7ff70dd8 100644
> --- a/drivers/staging/media/max96712/Kconfig
> +++ b/drivers/staging/media/max96712/Kconfig
> @@ -6,6 +6,7 @@ config VIDEO_MAX96712
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
>  	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2
>  	help
>  	  This driver supports the Maxim MAX96712 Quad GMSL2 Deserializer.
>  
> -- 
> 2.30.2
> 

-- 
Kind Regards,
Niklas Söderlund
