Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACE3C70564
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 18:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730257AbfGVQZb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 12:25:31 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37125 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730116AbfGVQZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 12:25:31 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so19414476plr.4
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2019 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nelint-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0xov5xCWoyMJjvfdeeH5jTfYxH36JzW9nh1b9Lz5GCI=;
        b=scywFhsWAHs4bbMQs9q7Ro/1+yY+FZRdSAyDICEsVOgIof92UT3nhbBNDhZ33jKZlq
         ABB/mThCO4l/OgQG9XFTeduKe/vNFBYDPkE21SB3LPoE6OhkgUmYi8hHU0/GXq7F+zc3
         g633WBCgjxtCfyXxGaLXc69hOhJyuSr9NTVgdff9+mCGBjTVsm9X/9HPIYtgoJI0L6xG
         ezu5znXonWweO4bqKZm0e0D5M+A37fFNUgvsDipZhFCTMbMEGgXd7HFqO89RYp1yte87
         YGb/YZYSs7A4KbA8efxDZgU3VXzBh8adzrxsSnO2X1xvNjjmv4K0M8uwwmBM6QYXxjL1
         2GKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0xov5xCWoyMJjvfdeeH5jTfYxH36JzW9nh1b9Lz5GCI=;
        b=TFKGC8rM7c2MTpz1yylq5DBowTO7dOljQ6vZf9DUytFdI3FkrSbayCYHg8lDh/4SEh
         jdJe6vrAlh2yj5VCzXIFqBCL7PDe9iBSieYQJ0h0uM5F1knFSQjVJlvXKEOgDu7bZ/k6
         qDzMAP1R9vq2fEANG8xUTMGEBTK5rG1pTq1nXhYriLlvhcMHNIsw992rKe1jHE0zItWz
         YYlm9u2THHfyYUT+maMlzpK/sRD1HfA7e3f9QWJwTlpAXmAGJ/tOs3/Rd2s6royaAy6O
         scfLeU8ismBpFjitt+N/VXtdc1FYOJhIhaTxFv5FtQT+S4qO7EhGEuiLnTs8cc7k0ihX
         AGOA==
X-Gm-Message-State: APjAAAUEbwrM2OWygGV5dFGgqruPpfFJ9DwLpdd9pRd++QY9YIVy1671
        x6VkMmCBEJrF/b865HUp1HIjxG3r
X-Google-Smtp-Source: APXvYqxYnUbAA6HNjEwhb40JydSpiJ9M6dUXwfEROUpoHKETZVAHAwvGkfKZh9LLXUUaOzbeolsGLw==
X-Received: by 2002:a17:902:b28b:: with SMTP id u11mr72824633plr.11.1563812730533;
        Mon, 22 Jul 2019 09:25:30 -0700 (PDT)
Received: from ?IPv6:2600:8800:1300:1920:e022:5d93:c8b0:4502? ([2600:8800:1300:1920:e022:5d93:c8b0:4502])
        by smtp.gmail.com with ESMTPSA id r1sm45265818pfq.100.2019.07.22.09.25.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 09:25:30 -0700 (PDT)
Subject: Re: Issues with ov5640 camera on i.MX6Q
To:     Laura Nao <laura.nao@kynetics.com>,
        Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     loic.poulain@linaro.org, linux-media <linux-media@vger.kernel.org>
References: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
 <CAOMZO5B3GV8fPLAdsxx2F+dyH68xPn6MN5rehEvwDvjJmirZrg@mail.gmail.com>
 <9785bc82-b741-b60c-ccd7-efdd2b507c6f@kynetics.com>
From:   Eric Nelson <eric@nelint.com>
Message-ID: <913336b5-c2a1-5c2c-f893-6a28ccfedd63@nelint.com>
Date:   Mon, 22 Jul 2019 09:25:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9785bc82-b741-b60c-ccd7-efdd2b507c6f@kynetics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laura,

On 7/22/19 8:50 AM, Laura Nao wrote:
> Thanks Fabio!
> 
> I tried tweaking the PLL configuration in the driver and did some 
> further tests on 5.2 kernel.
> 
> I was finally able to capture RAW frames that match the test pattern for 
> 1280x720 and 1920x1080 resolutions. The 2592x1944 frame is still not 
> perfectly aligned, but it looks much closer to the test pattern.
> 
> I uploaded the images here:
> 
> https://imgur.com/a/ywHokMf
> 
> The changes I made in the driver are below. Not sure these changes make 
> much sense, but they seem to fix 1280x720 and 1920x1080 frames.
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 759d60c6..cfa678e 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -795,13 +795,13 @@ static int ov5640_mod_reg(struct ov5640_dev 
> *sensor, u16 reg,
>    * FIXME: to be re-calcualted for 1 data lanes setups
>    */
>   #define OV5640_MIPI_DIV_PCLK    2
> -#define OV5640_MIPI_DIV_SCLK    1
> +#define OV5640_MIPI_DIV_SCLK    2
> 
>   /*
>    * This is supposed to be ranging from 1 to 2, but the value is always
>    * set to 2 in the vendor kernels.
>    */
> -#define OV5640_PLL_ROOT_DIV            2
> +#define OV5640_PLL_ROOT_DIV            1
>   #define OV5640_PLL_CTRL3_PLL_ROOT_DIV_2        BIT(4)
> 
>   /*
> @@ -836,8 +836,8 @@ static unsigned long ov5640_compute_sys_clk(struct 
> ov5640_dev *sensor,
>       unsigned long sysclk = sensor->xclk_freq / pll_prediv * pll_mult;
> 
>       /* PLL1 output cannot exceed 1GHz. */
> -    if (sysclk / 1000000 > 1000)
> -        return 0;
> +    // if (sysclk / 1000000 > 1000)
> +    //     return 0;
> 
>       return sysclk / sysdiv;
>   }
> @@ -1818,7 +1824,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
>        * All the formats we support have 16 bits per pixel, seems to 
> require
>        * the same rate than YUV, so we can just use 16 bpp all the time.
>        */
> -    rate = mode->vtot * mode->htot * 16;
> +    rate = mode->vtot * mode->htot * 8;
>       rate *= ov5640_framerates[sensor->current_fr];
>       if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
>           rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
> 

How many frames per second are you getting out of this?

If I'm reading this right, the change to ov5640_set_mode is reducing
the frame rate (to 7.5 fps?), but I don't follow how the changes
to OV5640_MIPI_DIV_SCLK and OV5640_PLL_ROOT_DIV are affecting things
and the data sheet isn't very clear.
