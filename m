Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C9A17D5D
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 17:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfEHPeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 11:34:25 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42516 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfEHPeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 May 2019 11:34:25 -0400
Received: by mail-lj1-f196.google.com with SMTP id y10so11353343lji.9
        for <linux-media@vger.kernel.org>; Wed, 08 May 2019 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ya6765I7eRj8Rx/DaT0VUYdAp2NnJ3zmVyvErjY22Ig=;
        b=qXPDYZK+JFCcNTkBdxsbPmQ9pn4aDMqc0A+/wE4LRK3qkU3ALSbN7sII3E38HGVwXl
         3JF1AJPI1s06sVFTF8X6vzTcv63Im24+L3UPzUm3YAD6Ej4R9F7ycIN60YIPkpaaLipb
         owV4S/VyQ8BSj5fhSdWMUiBrOdwqT0Cf8nDLZKYpFZ/50HCjgcRtzCelBGTrGx+g/JaH
         9HB06T+JcNi7KgQp+3lqxAvOLxQdoTsogwv6sn9kYlIsOcybDxeJnxqSicea0rsaUF+B
         HmGi6myHu38UxGQa5Rr8KaGi93B6TDZnfmSG+b+p1RYVg8CRfzAMnNQB41Irhl+c4s6g
         V79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ya6765I7eRj8Rx/DaT0VUYdAp2NnJ3zmVyvErjY22Ig=;
        b=YqzuV+GIlzSTVRXsb8hgAGZJxBjXBF/+pcD5yebDL59s6ExfYeq16G4qh1kGqNq2EX
         lD9vVNvo/UGx0UA+pov5FUTu0+vFrAibP67JdkdNBFmNDb8bvJY/Qqjrn/2LGrBsVR4i
         LqgpAWPfNBysuvLNPyb/kyKw+rtmJjymhgA1/HqTN0nM9XRe6valM+KNeRXNP8sEnkja
         oRRh6jxOjqJfWEHUoaTtjlkkFuXQd50tnwvIer7LRW0dQQHQA4HM3gqvG5vNycPkANiq
         I6xlO8j/amaRRUQVmI3iJ/A4jcjy9MLR1d6RXanGxpE8rgsxrg3nCXDEakYzBt7SXL7A
         GtIA==
X-Gm-Message-State: APjAAAUiNagS4RmStMwFVX9GIIZVOv2mhrRDW9IBO7LMCaJZNFJIwcgG
        VY6IXipJUMy8Gsz1cyCIHkI6Pg==
X-Google-Smtp-Source: APXvYqwtO1LWOvX3zaMVyJoeq3eC0U9SOppwQWkjW6TGjcYs03jFKjHOXIXN8w0H4dJXhZne0ghATA==
X-Received: by 2002:a2e:3c06:: with SMTP id j6mr19493500lja.99.1557329663115;
        Wed, 08 May 2019 08:34:23 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id u11sm3689552lfb.60.2019.05.08.08.34.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 08:34:22 -0700 (PDT)
Subject: Re: [PATCH v2] v4l: Add source event change for bit-depth
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20190508113759.19168-1-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d6dcee9a-0308-855c-9819-3e7413cb617d@linaro.org>
Date:   Wed, 8 May 2019 18:34:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508113759.19168-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 5/8/19 2:37 PM, Stanimir Varbanov wrote:
> This event indicate that the source bit-depth is changed during
> run-time. The client must get the new format and re-allocate buffers
> for it. This can usually happens with video decoder (encoders) when
> the bit-stream depth is changed from 8 to 10bits or vice versa.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
> Change since v1: s/BITDEPTH/BIT_DEPTH
> 
>  Documentation/media/uapi/v4l/vidioc-dqevent.rst | 7 +++++++
>  Documentation/media/videodev2.h.rst.exceptions  | 1 +
>  include/uapi/linux/videodev2.h                  | 1 +
>  3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> index dea9c0cc00ab..f7782cbddc5f 100644
> --- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> @@ -397,6 +397,13 @@ call.
>  	that many devices are not able to recover from a temporary loss of
>  	signal and so restarting streaming I/O is required in order for the
>  	hardware to synchronize to the video signal.
> +    * - ``V4L2_EVENT_SRC_CH_BIT_DEPTH``

I started to wonder isn't COLOR_DEPTH more appropriate? Bit-depth
doesn't describe what is actually deep.

-- 
regards,
Stan
