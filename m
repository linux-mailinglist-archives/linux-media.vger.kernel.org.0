Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2151194B00
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 22:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbgCZV4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 17:56:17 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:37700 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgCZV4R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 17:56:17 -0400
Received: by mail-il1-f196.google.com with SMTP id a6so6917016ilr.4
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B4eUj1VJNe32redVDC5bFOpW5fSi/T9854EMg72WAbo=;
        b=U/8eWq97Wny3wgOUhSrhlUv3catkWD+4C3Iy+KOP71/3XGwAQaCuGhPEpOhjv5yj6t
         xPX40/sj2Ba+7Uru9MCCtQ609V/8BOtT+8iLrKBDWgCu6C6AA/wM1X+MQtYj673IptBA
         /oePRCdXoVDTaGT4RPd33HLz0agt39cNYKaCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B4eUj1VJNe32redVDC5bFOpW5fSi/T9854EMg72WAbo=;
        b=gQ8H5igFQn8tgJWUxQuKFngFiA6VFSr0Num1WsU98CWdLolYfMo/fnpiLCWiiQZU8U
         RALQcP9W8BJK+vEp+2afCxKrERAh+ZucXPHBJuUZ7ahGDDm2ne922SukohiafERy77jT
         hg973ubSl7lG7n4ZnaqEdCv7EFDww5Af++ubLj51oDat/n1xCznZoUF/Isu2i3W3SBfk
         jKjs3xXLI3qw6kfBwO6HnjNcMuKMDqlcvZRn5fs7V9306HP084ab72kGUSWHmtsZa9V6
         8HBGdMTA75txzXD+eFmnni9oLtItJJ51vABnMjKlBpqwBy8yonpfknP9jwWLVA4quqOA
         569A==
X-Gm-Message-State: ANhLgQ3bu7pnrsVlK+CyQMH92d8S/J6K9FqFHuzwM6g9DFn2uTv8GV6b
        +ty9ZFkxon7DFRGD8sfNtE6vmg==
X-Google-Smtp-Source: ADFU+vtExdO8eMcT48/u+xZDt1+AcEbZl4LYEe9K22SOyNimecH+1TWpOrqIXKhkdGvA3tStj4aWVA==
X-Received: by 2002:a92:8f91:: with SMTP id r17mr9911502ilk.97.1585259774247;
        Thu, 26 Mar 2020 14:56:14 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id s25sm1201672ilb.37.2020.03.26.14.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 14:56:13 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] media: vimc: Add missing {RGB,BGR,GBR}888 media
 bus codes
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200326214730.2449707-1-nfraprado@protonmail.com>
 <20200326214730.2449707-3-nfraprado@protonmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <47dec848-dd66-9b5a-d7e6-38f6ea050b2e@linuxfoundation.org>
Date:   Thu, 26 Mar 2020 15:56:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200326214730.2449707-3-nfraprado@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/26/20 3:47 PM, Nícolas F. R. A. Prado wrote:
> Add missing RGB888_*, BGR888_* and GBR888_* media bus codes in the
> vimc_pix_map_list. Since there is no GBR24 pixelformat, use the RGB24
> pixelformat for MEDIA_BUS_FMT_GBR888_1X24.
> 
> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
> 
> Changes in v2:
> - Fix array formatting
> - Change commit message to reflect v2 changes
> - Change code array size
> - Add other BGR888 and RGB888 formats to BGR24 and RGB24 pixelformats
> 
>   drivers/media/platform/vimc/vimc-common.c | 16 ++++++++++++++--
>   drivers/media/platform/vimc/vimc-common.h |  2 +-
>   2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index 119846f3eaa5..11489334cff7 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -19,13 +19,25 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>   
>   	/* RGB formats */
>   	{
> -		.code = { MEDIA_BUS_FMT_BGR888_1X24 },
> +		.code = {
> +			MEDIA_BUS_FMT_BGR888_1X24,
> +			MEDIA_BUS_FMT_BGR888_3X8
> +		},
>   		.pixelformat = V4L2_PIX_FMT_BGR24,
>   		.bpp = 3,
>   		.bayer = false,
>   	},
>   	{
> -		.code = { MEDIA_BUS_FMT_RGB888_1X24 },
> +		.code = {
> +			MEDIA_BUS_FMT_RGB888_1X24,
> +			MEDIA_BUS_FMT_RGB888_2X12_BE,
> +			MEDIA_BUS_FMT_RGB888_2X12_LE,
> +			MEDIA_BUS_FMT_RGB888_3X8,
> +			MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +			MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> +			MEDIA_BUS_FMT_RGB888_1X32_PADHI,
> +			MEDIA_BUS_FMT_GBR888_1X24
> +		},
>   		.pixelformat = V4L2_PIX_FMT_RGB24,
>   		.bpp = 3,
>   		.bayer = false,
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 585441694c86..d5e0e8d32542 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -69,7 +69,7 @@ do {									\
>    * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
>    */
>   struct vimc_pix_map {
> -	unsigned int code[1];

> +	unsigned int code[8];
Please add a define for this instead of hard coded value.


>   	unsigned int bpp;
>   	u32 pixelformat;
>   	bool bayer;
> 

