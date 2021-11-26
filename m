Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3270F45ED0F
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 12:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376777AbhKZL60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 06:58:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237917AbhKZL4Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 06:56:25 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF90C08E9B5
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 03:21:17 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id f18so23461137lfv.6
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 03:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=O64Mt0uVxt2B1sG8hxiWMnIyUcVXEJk7Ql+kKL9Kunw=;
        b=2Z6tNCLyWZO+P4HyXEKMY+dzkouF91WtG72yJCQmz+Zkt4bZImFkuNk6PK9jGKG3lr
         0QmSoVGWn0iNIlqw3wbI/qRJvMCkVrDeb53+uWNmHws8mbetWnFwlAG5m1955jj2M3FK
         4jrUADJS3clVmsO/UguVOPQwjwPOmgJc68OLEC+OMW3khcGlgJSzle8COR5/zWQHLdkd
         J5kGbBqlfqTvCXvq0GouA16X3Yl78ZHldGYmv5aBVwWa3nadtD/Oi0WyxEoUM26kul+V
         RkyASz4cu/Odrx6ty/iyKIz+G7aKD9WTiORWNyUNT5IfetPpTxChMMXgjSRgNVTXfbkz
         Z5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=O64Mt0uVxt2B1sG8hxiWMnIyUcVXEJk7Ql+kKL9Kunw=;
        b=LRHe6wIW98V+uRCIKlDCDxXBu6bPoYqajd4a8BvummQlF97DRJVte7WIRkvGadRPAM
         z0vXEQdlw0jp6YHyaUjxGHZpwlrug6MlgovaBs+ut/bBbIXbn3Wfr0JMASyW0HSFXXyD
         9W+byORK3IEY9toXnPGQ185Cb5880XXxsH8OmA8CvbCvI08SaHMVuGOjRr/hKk4Y4Cbx
         T+9LB9BNVLIOiXyX4J1TMPqQz4OOOLUXNyuTQgHqwy+bclr0N2jLJNeOmuXsJEK+qrya
         f8WceFkBr7I7p8WskqfHfW3g7Y4UTEY3dBgP17e2q3Lvr4zJobUZeWpoy8jo+8OEsvFt
         HDKA==
X-Gm-Message-State: AOAM533DEBUOjlqe/bFPm8BFubyL3XLNJUuN3er1dxMgtDxdEIdABWm4
        bARaSPTNwygI5XVFHCVqlUDy9+xuvwRMBq6O
X-Google-Smtp-Source: ABdhPJxRHFUVT3ZuE/AcWbSb1YkYD2kYb/SLGmM+Zb3CgaOHKQef8JUJPabf3yzWORVOeRRjQMiU3g==
X-Received: by 2002:a05:6512:30d:: with SMTP id t13mr28717868lfp.322.1637925675762;
        Fri, 26 Nov 2021 03:21:15 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id a24sm540235ljq.18.2021.11.26.03.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 03:21:15 -0800 (PST)
Date:   Fri, 26 Nov 2021 12:21:14 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] max96712: Depend on VIDEO_V4L2
Message-ID: <YaDDKvecdZD7RvFd@oden.dyn.berto.se>
References: <20211126080623.1587610-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211126080623.1587610-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your work.

On 2021-11-26 10:06:23 +0200, Sakari Ailus wrote:
> Depend on VIDEO_V4L2 for the driver actually depends on it, failing to
> compile otherwise.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/staging/media/max96712/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
> index 258d47644cbd..acde14fd5c4d 100644
> --- a/drivers/staging/media/max96712/Kconfig
> +++ b/drivers/staging/media/max96712/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_MAX96712
>  	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
>  	depends on I2C
>  	depends on OF_GPIO
> +	depends on VIDEO_V4L2
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
>  	select MEDIA_CONTROLLER
> -- 
> 2.30.2
> 

-- 
Kind Regards,
Niklas Söderlund
