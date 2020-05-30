Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8F61E8D56
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 05:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbgE3DDa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 23:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgE3DD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 23:03:29 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A062C03E969;
        Fri, 29 May 2020 20:03:28 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u5so783396pgn.5;
        Fri, 29 May 2020 20:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lD81mgG/12hqGQg2aqU3rSKCdgjuziiyCs+2dP2qbOo=;
        b=ityY1Ou5U0JYYPc9su4dmvgyxPHl+4KRZEEUcOGyG7/Wk+a2vYXxgq2wW20UDKgiC5
         fXrXJkCpBoGec4P/BYCH/CrWKvnLYsPdrLJmOYQHvgCCDc7HC9YTQH/VgB0jdNNzhj8g
         q3JnOqYABqpvEp3bnMgF+g6FeaV2LkqPmyvZaoqCDKw9nmIM5ITMwondHDoYknykBGMs
         OyhikiT5xS87XVjVvUPX49ztKl9eDK1OXUxFY0TaNeiApjsM8TSItbPGDBvSuI+tNeR3
         MgwYpDnZObsf7rBVFjGGCZnWtDO1DBZbde3Iw+dQDomAAaIhJk7nxd8sH0H36Bfu1erW
         0WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lD81mgG/12hqGQg2aqU3rSKCdgjuziiyCs+2dP2qbOo=;
        b=O1X54EDpJZo8oXUtER1oPawJTLopQev70vLT4A5VJIFTYBGfqHu96/WlZTR/rW7Pd8
         wVK9LrlLUB8MA0jarybm0AQk+fIgIM/G7egZyKE0EEzFz606xvONr7EQwjkumKEQ6q/w
         x6SPr4kUyKs+GtYo9Iv35ErEupWxi2w07EmkIkGCkDU3jDa8+WHTULT+BnhmNZ3wevIo
         LLH4HTIxQxfj9snl1IaVosRNfqPi9Yxr3zv9ilQzGJYAT+CvWRip1/T3DEhOv6KD8gjQ
         DzqLLkRQ6g6agGRu39Oeaov8fJuWKE+WLJLSIYBoQNFSnwX3m3Vw05Rlu+wWET3g/Xmu
         bEMA==
X-Gm-Message-State: AOAM532wLHcLWw+EquvYncS0cHQ6eeu0ibbLWCSL8i4CSNbSQm7QRO+Q
        jSlYeuB731stgIq8TA4Dd8s=
X-Google-Smtp-Source: ABdhPJyNWwxM3/2LAqCuRV+dyq6JiviqHnMEX14ZqdM1pdy7feq+oOMYehiBKKSZFBwo1kgplIwDmA==
X-Received: by 2002:a63:e54d:: with SMTP id z13mr8836678pgj.78.1590807807646;
        Fri, 29 May 2020 20:03:27 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id m18sm669003pjl.14.2020.05.29.20.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 20:03:27 -0700 (PDT)
Date:   Fri, 29 May 2020 20:03:25 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 8/9] staging: media: atomisp: disable all custom formats
Message-ID: <20200530030325.GE1367069@ubuntu-s3-xlarge-x86>
References: <20200529200031.4117841-1-arnd@arndb.de>
 <20200529200031.4117841-8-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529200031.4117841-8-arnd@arndb.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 10:00:30PM +0200, Arnd Bergmann wrote:
> clang points out the usage of an incorrect enum type in the
> list of supported image formats:
> 
> drivers/staging/media/atomisp/pci/atomisp_subdev.c:49:65: error: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Werror,-Wenum-conversion]
>         { V4L2_MBUS_FMT_CUSTOM_NV21, 12, 12, CSS_FRAME_FORMAT_NV21, 0, CSS_FRAME_FORMAT_NV21 },
> drivers/staging/media/atomisp/pci/atomisp_subdev.c:49:39: error: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Werror,-Wenum-conversion]
>         { V4L2_MBUS_FMT_CUSTOM_NV21, 12, 12, CSS_FRAME_FORMAT_NV21, 0, CSS_FRAME_FORMAT_NV21 },
>         { V4L2_MBUS_FMT_CUSTOM_NV12, 12, 12, CSS_FRAME_FORMAT_NV12, 0, CSS_FRAME_FORMAT_NV12 },
>         { MEDIA_BUS_FMT_JPEG_1X8, 8, 8, CSS_FRAME_FORMAT_BINARY_8, 0, ATOMISP_INPUT_FORMAT_BINARY_8 },
> 
> Checking the git history, I found a commit that disabled one such case
> because it did not work. It seems likely that the incorrect enum was
> part of the original problem and that the others do not work either,
> or have never been tested.
> 
> Disable all the ones that cause a warning.
> 
> Fixes: cb02ae3d71ea ("media: staging: atomisp: Disable custom format for now")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I have this patch in my local tree and debated sending it myself. I
think that this is the right fix for now, as the driver is being cleaned
up. Maybe add a FIXME like the rest of this driver?

Regardless of that last point:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> index 46590129cbe3..8bce466cc128 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -44,9 +44,11 @@ const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[] = {
>  	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, CSS_BAYER_ORDER_RGGB, CSS_FORMAT_RAW_12 },
>  	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, 8, ATOMISP_INPUT_FORMAT_YUV422_8, 0, ATOMISP_INPUT_FORMAT_YUV422_8 },
>  	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, 8, ATOMISP_INPUT_FORMAT_YUV422_8, 0, ATOMISP_INPUT_FORMAT_YUV422_8 },
> +#if 0
>  	{ MEDIA_BUS_FMT_JPEG_1X8, 8, 8, CSS_FRAME_FORMAT_BINARY_8, 0, ATOMISP_INPUT_FORMAT_BINARY_8 },
>  	{ V4L2_MBUS_FMT_CUSTOM_NV12, 12, 12, CSS_FRAME_FORMAT_NV12, 0, CSS_FRAME_FORMAT_NV12 },
>  	{ V4L2_MBUS_FMT_CUSTOM_NV21, 12, 12, CSS_FRAME_FORMAT_NV21, 0, CSS_FRAME_FORMAT_NV21 },
> +#endif
>  	{ V4L2_MBUS_FMT_CUSTOM_YUV420, 12, 12, ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY, 0, ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY },
>  #if 0
>  	{ V4L2_MBUS_FMT_CUSTOM_M10MO_RAW, 8, 8, CSS_FRAME_FORMAT_BINARY_8, 0, ATOMISP_INPUT_FORMAT_BINARY_8 },
> -- 
> 2.26.2
> 
