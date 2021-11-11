Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E2844D4A6
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 11:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbhKKKG4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 05:06:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26448 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232881AbhKKKGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 05:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636625042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JOFY/pMl+gjqRrbEsS2cQzbRdYFmPaLIFRLa+9x1Qv0=;
        b=TFc1XdiNAfrXjsB40VIXBXkeh3VdIVlYNqJU/J1lxRnfJVMJHRlcyOlj58zJ4pWTCG2O73
        VN6FmxzbttPVhA3RwM+wfScRqi9B7vAWnpcOtLATt+hUbHm/fPGJ71V0eVLy2sJVMjwB7o
        RsodBCTfkB4D0yHUzB1DQDn+Hr1LoPU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-xH-d02T0NkSOruBMve1nPw-1; Thu, 11 Nov 2021 05:04:01 -0500
X-MC-Unique: xH-d02T0NkSOruBMve1nPw-1
Received: by mail-ed1-f70.google.com with SMTP id y20-20020a056402359400b003e28c9bc02cso4994193edc.9
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 02:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JOFY/pMl+gjqRrbEsS2cQzbRdYFmPaLIFRLa+9x1Qv0=;
        b=PKtgeXVmlY92DWVCy7VIokfEw3G/UemvcGjSl3xDEaWPsr2b+wEgzUItKicUdlx3rn
         SIDZdkmr+sCD9PmRZfn+hlASXJAXD8h3j1PLYOQtCD/J++m9k1iPUcilCpDgZ/TQ3nMj
         MYqJdVXQkJD232xOXv+bbUpDueD3lDESK6BEdutFldA4/xv6q8Rqum09DonMyu6fUlnX
         XBXJcL98OO8sY7GBqzPwTar4eXPEjzDpa/UGpmjtkA3pQ3P5MVjelM3gUtsCuP2rFxzm
         qPRjEA2L8yyVg07g1qNoB8jQke2T7b9Lp5mfsS2MJ0ZCnFeJPT4GBOPE8RY3mYS3VvRW
         7K4w==
X-Gm-Message-State: AOAM533aqvdWCZT73lts/ywlNfThApjysmbNwkZBPECJ/acN2Lo4BGPg
        Mptc8xxhVogfXUbMV2sztGEmefoWijI5Dqc5FSFW6BB3QryKZ/ChDc1O+RmrB3OWNBRvQe3oNMT
        eGF3j1QNFzM/LjlygH4ryJ3s=
X-Received: by 2002:aa7:c34d:: with SMTP id j13mr8132451edr.308.1636625040074;
        Thu, 11 Nov 2021 02:04:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJhwFGPJX1mI/fdmn9cabI9oViHdWx0uRivYkQqKgPiKUWPDCWy8I2w9AdrRKsp9cxc2CKeg==
X-Received: by 2002:aa7:c34d:: with SMTP id j13mr8132397edr.308.1636625039743;
        Thu, 11 Nov 2021 02:03:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u16sm1237510edr.43.2021.11.11.02.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 02:03:59 -0800 (PST)
Message-ID: <f38e8b72-bc55-312f-ebd0-95c27b2daa8d@redhat.com>
Date:   Thu, 11 Nov 2021 11:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] media: atomisp-ov2680: uncomment other resolutions
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <440a1ecd3e1ef3a58bff40cde2ae57a32e5b0f60.1636624633.git.mchehab+huawei@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <440a1ecd3e1ef3a58bff40cde2ae57a32e5b0f60.1636624633.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/11/21 10:57, Mauro Carvalho Chehab wrote:
> There are several resolutions defined for this sensor, but just
> two are currently uncommented. Change the driver to allow other
> resolutions to also be used.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks, series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

> ---
>  drivers/staging/media/atomisp/i2c/ov2680.h | 159 ++++++++++++++++++++-
>  1 file changed, 153 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index e53be612a1e4..ed68510bb0b9 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -282,7 +282,6 @@ static struct ov2680_reg const ov2680_global_setting[] = {
>  	{}
>  };
>  
> -#if 0 /* None of the definitions below are used currently */
>  /*
>   * 176x144 30fps  VBlanking 1lane 10Bit (binning)
>   */
> @@ -442,7 +441,7 @@ static struct ov2680_reg const ov2680_656x496_30fps[] = {
>  };
>  
>  /*
> - * 800x600 30fps  VBlanking 1lane 10Bit (binning)
> + * 720x592 30fps  VBlanking 1lane 10Bit (binning)
>   */
>  static struct ov2680_reg const ov2680_720x592_30fps[] = {
>  	{0x3086, 0x01},
> @@ -637,7 +636,6 @@ static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
>  	// {0x5090, 0x0c},
>  	{}
>  };
> -#endif
>  
>  /*
>   *1616x916  30fps  VBlanking 1lane 10bit
> @@ -680,9 +678,8 @@ static struct ov2680_reg const ov2680_1616x916_30fps[] = {
>  };
>  
>  /*
> - * 1612x1212 30fps VBlanking 1lane 10Bit
> + * 1616x1082 30fps VBlanking 1lane 10Bit
>   */
> -#if 0
>  static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
>  	{0x3086, 0x00},
>  	{0x370a, 0x21},
> @@ -718,7 +715,7 @@ static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
>  	{0x5081, 0x41},
>  	{}
>  };
> -#endif
> +
>  /*
>   * 1616x1216 30fps VBlanking 1lane 10Bit
>   */
> @@ -774,6 +771,21 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.skip_frames = 3,
>  		.regs = ov2680_1616x1216_30fps,
>  	},
> +	{
> +		.desc = "ov2680_1616x1082_30fps",
> +		.width = 1616,
> +		.height = 1082,
> +		.pix_clk_freq = 66,
> +		.fps = 30,
> +		.used = 0,
> +		.pixels_per_line = 1698,//1704,
> +		.lines_per_frame = 1294,
> +		.bin_factor_x = 0,
> +		.bin_factor_y = 0,
> +		.bin_mode = 0,
> +		.skip_frames = 3,
> +		.regs = ov2680_1616x1082_30fps,
> +	},
>  	{
>  		.desc = "ov2680_1616x916_30fps",
>  		.width = 1616,
> @@ -789,6 +801,141 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.skip_frames = 3,
>  		.regs = ov2680_1616x916_30fps,
>  	},
> +	{
> +		.desc = "ov2680_1456x1096_30fps",
> +		.width = 1456,
> +		.height = 1096,
> +		.fps = 30,
> +		.pix_clk_freq = 66,
> +		.used = 0,
> +		.pixels_per_line = 1698,//1704,
> +		.lines_per_frame = 1294,
> +		.bin_factor_x = 0,
> +		.bin_factor_y = 0,
> +		.bin_mode = 0,
> +		.skip_frames = 3,
> +		.regs = ov2680_1456x1096_30fps,
> +	},
> +	{
> +		.desc = "ov2680_1296x976_30fps",
> +		.width = 1296,
> +		.height = 976,
> +		.fps = 30,
> +		.pix_clk_freq = 66,
> +		.used = 0,
> +		.pixels_per_line = 1698,//1704,
> +		.lines_per_frame = 1294,
> +		.bin_factor_x = 0,
> +		.bin_factor_y = 0,
> +		.bin_mode = 0,
> +		.skip_frames = 3,
> +		.regs = ov2680_1296x976_30fps,
> +	},
> +	{
> +		.desc = "ov2680_720p_30fps",
> +		.width = 1280,
> +		.height = 720,
> +		.fps = 30,
> +		.pix_clk_freq = 66,
> +		.used = 0,
> +		.pixels_per_line = 1698,//1704,
> +		.lines_per_frame = 1294,
> +		.bin_factor_x = 0,
> +		.bin_factor_y = 0,
> +		.bin_mode = 0,
> +		.skip_frames = 3,
> +		.regs = ov2680_720p_30fps,
> +	},
> +	{
> +		.desc = "ov2680_800x600_30fps",
> +		.width = 800,
> +		.height = 600,
> +		.fps = 30,
> +		.pix_clk_freq = 66,
> +		.used = 0,
> +		.pixels_per_line = 1698,//1704,
> +		.lines_per_frame = 1294,
> +		.bin_factor_x = 0,
> +		.bin_factor_y = 0,
> +		.bin_mode = 0,
> +		.skip_frames = 3,
> +		.regs = ov2680_800x600_30fps,
> +	},
> +	{
> +		.desc = "ov2680_720x592_30fps",
> +		.width = 720,
> +		.height = 592,
> +		.fps = 30,
> +		.pix_clk_freq = 66,
> +		.used = 0,
> +		.pixels_per_line = 1698,//1704,
> +		.lines_per_frame = 1294,
> +		.bin_factor_x = 0,
> +		.bin_factor_y = 0,
> +		.bin_mode = 0,
> +		.skip_frames = 3,
> +		.regs = ov2680_720x592_30fps,
> +	},
> +	{
> +		.desc = "ov2680_656x496_30fps",
> +		.width = 656,
> +		.height = 496,
> +		.fps = 30,
> +		.pix_clk_freq = 66,
> +		.used = 0,
> +		.pixels_per_line = 1698,//1704,
> +		.lines_per_frame = 1294,
> +		.bin_factor_x = 0,
> +		.bin_factor_y = 0,
> +		.bin_mode = 0,
> +		.skip_frames = 3,
> +		.regs = ov2680_656x496_30fps,
> +	},
> +	{
> +		.desc = "ov2680_QVGA_30fps",
> +		.width = 336,
> +		.height = 256,
> +		.fps = 30,
> +		.pix_clk_freq = 66,
> +		.used = 0,
> +		.pixels_per_line = 1698,//1704,
> +		.lines_per_frame = 1294,
> +		.bin_factor_x = 0,
> +		.bin_factor_y = 0,
> +		.bin_mode = 0,
> +		.skip_frames = 3,
> +		.regs = ov2680_QVGA_30fps,
> +	},
> +	{
> +		.desc = "ov2680_CIF_30fps",
> +		.width = 352,
> +		.height = 288,
> +		.fps = 30,
> +		.pix_clk_freq = 66,
> +		.used = 0,
> +		.pixels_per_line = 1698,//1704,
> +		.lines_per_frame = 1294,
> +		.bin_factor_x = 0,
> +		.bin_factor_y = 0,
> +		.bin_mode = 0,
> +		.skip_frames = 3,
> +		.regs = ov2680_CIF_30fps,
> +	},
> +	{
> +		.desc = "ov2680_QCIF_30fps",
> +		.width = 176,
> +		.height = 144,
> +		.fps = 30,
> +		.pix_clk_freq = 66,
> +		.used = 0,
> +		.pixels_per_line = 1698,//1704,
> +		.lines_per_frame = 1294,
> +		.bin_factor_x = 0,
> +		.bin_factor_y = 0,
> +		.bin_mode = 0,
> +		.skip_frames = 3,
> +		.regs = ov2680_QCIF_30fps,
> +	},
>  };
>  
>  #define N_RES_PREVIEW (ARRAY_SIZE(ov2680_res_preview))
> 

