Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E3C497B0A
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 10:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242587AbiAXJID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 04:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236331AbiAXJH7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 04:07:59 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0039BC06173B
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 01:07:58 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id j14so9986949lja.3
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 01:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xahs77V1zSWe2dEjva0X5ydOD5m9oUKZCdmXSfViIKs=;
        b=SQZh7OTdHqZIuZ9VBOdMLX/Ne204t0MqokX1o1WvvJo2ENBV+VAbJhVaabL3wwro2o
         w7giAyXygJIg0hl9J5DEeUwyjcAFOn1mLCkyjL9WJKK6kY7SVWaDKW4DqD/EceqStJ1w
         bbSWhEs97vreO+ga6aCGoYgus380X5lh9QKCbUCqSQmnHyEUttaMZmczFT+UCq5JFrYI
         5UxE+FcIU61bXYcKEkDzIgQ2aUZrsogeFGRimjc5yEHGmhY60AHk6yrNSt0WjIizZa3W
         jbPNKSjb+mgFirp/niu4NLNfUOQliqnc3GK3X+OKyaF+SRx9ewPGEelGpjlQEGi4CV+I
         Il9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xahs77V1zSWe2dEjva0X5ydOD5m9oUKZCdmXSfViIKs=;
        b=LHiWxZWlRhMq1APoXp0ymKRl5gwrI7as3MJF7vBznsgsyuxZipdVBqxIVSNexAHUCX
         DqbDDF380X2JnDXKmxqd0kcDXnfu/+Y/EmXZimF5Tiwd9rkf8mYRovIMn1XuuhAc+cOx
         fFVKhWcnHT1M1bsGpNqdyDH8cxon5HGaHptX7gxhy1g6nOxckEL7GhOA1u6zC5ruJTwp
         erer1rW2svkepBoYHGaEIXaQuJ9+birieoLt+mQVPSVRYBUQJwRhfxYMQmngPjCBRy27
         A6nxvpt1D0CD/Ej6nN+zD30jdfdvDi2+IEJ8QescLcJQrh2UGophcVzUS7JCiRMsERBN
         oXwA==
X-Gm-Message-State: AOAM533r0sHHJ1kz/WRr3DfIYvm86tAH3FDvu4/MN3t0+2eX/SVaR+oo
        k0aLdI5yGqU/Cc//fCUk0/IvHQ==
X-Google-Smtp-Source: ABdhPJx/ahKD+QkkV2taHZ5cuo+bgzrwOj8o30e2K/i+k5epfL4faE3fAAR2XnQarjePyhUuz8zmfg==
X-Received: by 2002:a05:651c:160c:: with SMTP id f12mr10697625ljq.462.1643015277377;
        Mon, 24 Jan 2022 01:07:57 -0800 (PST)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id s9sm807987ljh.116.2022.01.24.01.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 01:07:57 -0800 (PST)
Date:   Mon, 24 Jan 2022 10:07:56 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 3/6] media: rcar-isp: Use mipi-csi2.h
Message-ID: <Ye5sbAXiXb9CBkE6@oden.dyn.berto.se>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220123160857.24161-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220123160857.24161-4-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your patch.

On 2022-01-23 18:08:54 +0200, Laurent Pinchart wrote:
> Replace the hardcoded MIPI CSI-2 data types with macros from
> mipi-csi2.h.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-isp.c | 32 +++++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-isp.c b/drivers/media/platform/rcar-isp.c
> index 2ffab30bc011..10b3474f93a4 100644
> --- a/drivers/media/platform/rcar-isp.c
> +++ b/drivers/media/platform/rcar-isp.c
> @@ -17,6 +17,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-subdev.h>
>  
>  #define ISPINPUTSEL0_REG				0x0008
> @@ -51,12 +52,31 @@ struct rcar_isp_format {
>  };
>  
>  static const struct rcar_isp_format rcar_isp_formats[] = {
> -	{ .code = MEDIA_BUS_FMT_RGB888_1X24,	.datatype = 0x24, .procmode = 0x15 },
> -	{ .code = MEDIA_BUS_FMT_Y10_1X10,	.datatype = 0x2b, .procmode = 0x10 },
> -	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
> -	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
> -	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .procmode = 0x0c },
> -	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .procmode = 0x0c },
> +	{
> +		.code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.datatype = MIPI_CSI2_DT_RGB888,
> +		.procmode = 0x15
> +	}, {
> +		.code = MEDIA_BUS_FMT_Y10_1X10,
> +		.datatype = MIPI_CSI2_DT_RAW10,
> +		.procmode = 0x10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +		.procmode = 0x0c,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +		.procmode = 0x0c,
> +	}, {
> +		.code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +		.procmode = 0x0c,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV10_2X10,
> +		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +		.procmode = 0x0c,
> +	},
>  };
>  
>  static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas Söderlund
