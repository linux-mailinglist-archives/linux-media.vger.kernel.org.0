Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A584441BBF
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 14:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhKANcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 09:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhKANcq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 09:32:46 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FD4C061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 06:30:12 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u21so36336943lff.8
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 06:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CyUOu1mxVjBL3zzC4Bo6zlVEE7judTp5CT7Y7DHgDi8=;
        b=4NpGg6GGOenWuXdG7RXg0TgnVcqszAIsBPxLO1dW5RTRhKUWksUT6a3lj7AlPK9yfF
         ztd+EG2dPHkJ4r7PieWgy7cQjSZVhFH5iwSq2b3swmhXBMm6jx8SKvH9kBgfUrwrpuiq
         ojJ/uSAFN8D67S8mD/Fz/Q6k/W621FAJMNEYp/ZoP+WMB08rlsQJvWHq1B8+UYogHUxV
         kEj1F4hd24Auk42/nuFULuHn0gLYoye4Mg6rdBJUBcV/71GN4VnethwKiOPW8rmeGVwQ
         DLFmxUPyjNgUCyU6bWTLbUs6AvHnz7W918CzKVPPb5Wop1HG0jcZwYAyhRP5aSbTFkSt
         xHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CyUOu1mxVjBL3zzC4Bo6zlVEE7judTp5CT7Y7DHgDi8=;
        b=rs59JH4FOGtEwNYBa2mXzMDX8iuRNdZMdcMTzyj9AWuqzSrgxmVrJHXOgBzh1BVtf8
         L4D9YF4sTphaoOUY8Ax/fEe86Xyp7nnZoKrvm3sLPEv7bBboGAgnPv4Nn+cp4sen3rCS
         OTBpcS2r9rBrfnY44W47wtvYXFOR1x3JNYNt754+f+glhH6VYhCB3XMQCdpjnuliM5tw
         HQ5uNiwB3KzZYn/DfVJRtUFIi0MQcVgM2JnxWwKjvHKI4Hk3L5xua/yWamY2M0lyeHIX
         80b0fkVMHE87HeIZbXsH/nAtdhcKii07pj4ZWfNQ0a9IrRCvmTkGztix6zFVjeJYFkZT
         JJwA==
X-Gm-Message-State: AOAM532FhOaaEE2lB/okvfFwxpGFWB1hT1fChQglEm/yKgBIYLiyDpcK
        1WBJDyJXu4sggeEnISeVNgqWZg==
X-Google-Smtp-Source: ABdhPJxtFDQURpm5Q+f9ATJuYH04J6QS8afL0jcy0I2OGJC70kwzYd4ka698SWzw3SPYARzHOCXEpg==
X-Received: by 2002:a05:6512:32a3:: with SMTP id q3mr11750341lfe.434.1635773410905;
        Mon, 01 Nov 2021 06:30:10 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id m3sm541322lfr.7.2021.11.01.06.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 06:30:10 -0700 (PDT)
Date:   Mon, 1 Nov 2021 14:30:09 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] max96712: Select VIDEO_V4L2
Message-ID: <YX/r4QwpG2vQ28Km@oden.dyn.berto.se>
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

Thanks for your patch.

On 2021-11-01 15:25:02 +0200, Sakari Ailus wrote:
> Select VIDEO_V4L2 for the driver actually depends on it, failing to
> compile otherwise.
> 
> Fixes: 51758f8b32134bacbf30bd217f7c2074e9b4b51e ("media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

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
Regards,
Niklas Söderlund
