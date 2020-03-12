Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34AB5182630
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 01:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731569AbgCLAVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 20:21:21 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43831 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgCLAVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 20:21:21 -0400
Received: by mail-pg1-f195.google.com with SMTP id u12so2089588pgb.10
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 17:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2obNWDF+xkr9HkTN7HUtXipI3zE1fXflio6MHvT0eo4=;
        b=Tcyz4rdMo1rKGZZEJjZ7+9B7BuyZ2yL7dwcoiS86BL9H9T1syRttf3vCewB5QrZV0x
         tLcODu226iuL49hzxqBuEZvK7YyUI7sXAprOts2eEVpejMewVEXbYsxQSjJfnEtulydO
         i7XdPowMGfZa+fSCZOtk2z69yvDgbPQEYETU15oEjnkKvgCb0cLhdwMtOEssDvzLVf2t
         w+YDycJQlB5miRlTJF+Gt+X2pJDc/aa7Zgryp5rQlbCnQbWFXjv+L0jkkcKFcmQNn7qD
         2ruZPughbT6hgzj00IQXuFOCQ1VEZRZTU+UK95a0ZCam17b+VZTqoxTg2/3gf4B1550j
         KG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2obNWDF+xkr9HkTN7HUtXipI3zE1fXflio6MHvT0eo4=;
        b=pSAaBSDJMWDc1t8T9sU3gXefPahWxgbbWW4Bxt/IjlJjYoKLMtsW4DEe1CdiTy0kIf
         3YssW1JsJr6iOQENkYQBeQNUpYMibQ6RGaQot6RlnJXWSKehLGoXxtm0wZU1EbR6shT4
         9GoriHw801bnMFoZLYJSSxn528kmdT1zBuFNXBlOl5WN79ybY71Nk9llkV9ArXL48K68
         W/lcINuk+O5202wIjjkoCQFnQ0y5/CjheXlDu/BAnjARrv3AontxRJR7/1rWQ+TtFYX7
         i1gULaYtKL+So8BZynGpd3sxJfrODdB8Q6AYPfKZsflQktD0p5d82ZzITsfKXqSOvT1/
         OxWw==
X-Gm-Message-State: ANhLgQ0qA1auB/WdfVKHmt334eQzRinbidRF8i9KNzFw7USjiPAhTsWe
        OhY3q3rPN7nkfLIlSCfP1SI=
X-Google-Smtp-Source: ADFU+vukZOpRLf5dye79H/zoYDRPYUky3WLL3eEyDrvi8+Zkvmkj7eut3F4cY3ZGLEh6QUUSkC4UMw==
X-Received: by 2002:a62:7c82:: with SMTP id x124mr3386266pfc.280.1583972479801;
        Wed, 11 Mar 2020 17:21:19 -0700 (PDT)
Received: from ?IPv6:2605:e000:d445:6a00:a54b:c8f0:3b71:1a5b? ([2605:e000:d445:6a00:a54b:c8f0:3b71:1a5b])
        by smtp.gmail.com with ESMTPSA id ce13sm6811475pjb.1.2020.03.11.17.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 17:21:19 -0700 (PDT)
Subject: Re: [PATCH v2 07/10] media: imx: imx6-media-csi: Replace Y16 with Y10
 and Y12
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
 <20200310160633.950-8-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <2f0dc64f-53d3-ddb4-cc51-f2de662a6753@gmail.com>
Date:   Wed, 11 Mar 2020 17:21:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310160633.950-8-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/10/20 9:06 AM, Laurent Pinchart wrote:
> The driver doesn't really support V4L2_PIX_FMT_Y16, as there's no 16-bit
> greyscale media bus code defined by the kernel. It (ab)uses the format
> to capture 10-bit and 12-bit greyscale formats. Fix it to properly
> support MEDIA_BUS_FMT_Y10_1X10 and MEDIA_BUS_FMT_Y12_1X12 instead.

I thought this might need a Fixes: e30681bc19bf ("media: imx: add 16-bit 
grayscale support"), but on closer look, V4L2_PIX_FMT_Y10 and 
V4L2_PIX_FMT_Y12 were not added until after. In any case,

Acked-by: Steve Longerbeam <slongerbeam@gmail.com>

>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
>   drivers/staging/media/imx/imx-media-csi.c   |  3 ++-
>   drivers/staging/media/imx/imx-media-utils.c | 13 ++++++++-----
>   2 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index b60ed4f22f6d..f4abac93c0e4 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -457,7 +457,8 @@ static int csi_idmac_setup_channel(struct csi_priv *priv)
>   	case V4L2_PIX_FMT_SGBRG16:
>   	case V4L2_PIX_FMT_SGRBG16:
>   	case V4L2_PIX_FMT_SRGGB16:
> -	case V4L2_PIX_FMT_Y16:
> +	case V4L2_PIX_FMT_Y10:
> +	case V4L2_PIX_FMT_Y12:
>   		burst_size = 8;
>   		passthrough_bits = 16;
>   		break;
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 0788a1874557..bc20fcc88267 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -166,11 +166,14 @@ static const struct imx_media_pixfmt rgb_formats[] = {
>   		.bpp    = 8,
>   		.bayer  = true,
>   	}, {
> -		.fourcc = V4L2_PIX_FMT_Y16,
> -		.codes = {
> -			MEDIA_BUS_FMT_Y10_1X10,
> -			MEDIA_BUS_FMT_Y12_1X12,
> -		},
> +		.fourcc = V4L2_PIX_FMT_Y10,
> +		.codes = {MEDIA_BUS_FMT_Y10_1X10},
> +		.cs     = IPUV3_COLORSPACE_RGB,
> +		.bpp    = 16,
> +		.bayer  = true,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_Y12,
> +		.codes = {MEDIA_BUS_FMT_Y12_1X12},
>   		.cs     = IPUV3_COLORSPACE_RGB,
>   		.bpp    = 16,
>   		.bayer  = true,

